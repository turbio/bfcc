extern crate llvm_ir;

use std::ops::Deref;

use std::env;
use std::path::Path;
use std::fmt::Write;

fn ppmod(module: &llvm_ir::Module) {
	for func in module.functions.iter() {
		println!(
			"{:?} {:?} -> {:?}",
			func.name, func.parameters, func.return_type
		);

		for block in func.basic_blocks.iter() {
			let blockn = n2usize(&block.name);
			println!("\t{}:", blockn);
			for instr in block.instrs.iter() {
				println!("\t\t{}", instr.to_string());
			}
			println!("\t\t<- {}", block.term.to_string());
		}
	}
}

// Split all blocks at calls. This should result in all calls being the last
// instruction of their block before a unconditional branch.
//
// This makes it way easier to generate brainfuck control flow as calls
// use the same control flow mechanism as blocks. A call/branch combo sets
// up the current and next frames then switches to the next frame. Since it
// always makes up the end of a block we'll re-enter the main loop and
// continue into the next frame. Upon returning the branch will have setup
// frame to resume right into the right block.
// what a deal!
fn calls_terminate_blocks(module: &mut llvm_ir::Module) {
	for func in module.functions.iter_mut() {
		let mut block = 0;
		while block < func.basic_blocks.len() {
			let mut instr = 0;
			while instr < func.basic_blocks[block].instrs.len() {
				match &func.basic_blocks[block].instrs[instr] {
					llvm_ir::Instruction::Call(c) => c,
					_ => {
						instr += 1;
						continue;
					}
				};

				let nextn = llvm_ir::Name::Number(
					func.basic_blocks
						.iter()
						.map(|block| n2usize(&block.name))
						.max()
						.unwrap() + 1,
				);

				if instr == func.basic_blocks[block].instrs.len() - 1 {
					let splitn = llvm_ir::BasicBlock {
						name: nextn.clone(),
						instrs: vec![],
						term: func.basic_blocks[block].term.clone(),
					};
					func.basic_blocks.insert(block + 1, splitn);

					func.basic_blocks[block].term = llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
						debugloc: None,
						dest: nextn.clone(),
					});
				} else {
					let splitn = llvm_ir::BasicBlock {
						name: nextn.clone(),
						instrs: func.basic_blocks[block].instrs.split_off(instr + 1),
						term: func.basic_blocks[block].term.clone(),
					};
					func.basic_blocks.insert(block + 1, splitn);

					func.basic_blocks[block].term = llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
						debugloc: None,
						dest: nextn.clone(),
					});
				}
				instr += 1;
			}

			block += 1;
		}
	}
}

// TODO: this isn't really the move imo
// function calls always call into block0. Thing is, if we're making a call
// from block0 into another block0 we'll end up setting everything up but
// then rerunning block0 in the calling function instead of the target.
fn calls_never_in_first_block(module: &mut llvm_ir::Module) {
	for func in module.functions.iter_mut() {
		let hascall = func.basic_blocks[0].instrs.iter().any(|i| match i {
			llvm_ir::Instruction::Call(_) => true,
			_ => false,
		});

		if !hascall {
			continue
		}

		let nextn = llvm_ir::Name::Number(
			func.basic_blocks
				.iter()
				.map(|b| n2usize(&b.name))
				.max()
				.unwrap() + 1,
		);

		func.basic_blocks.insert(
			0,
			llvm_ir::BasicBlock {
				name: nextn,
				instrs: vec![],
				term: llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
					debugloc: None,
					dest: func.basic_blocks[0].name.clone(),
				}),
			},
		);
	}
}

#[derive(Debug)]
enum BfOp {
	// actual brainfuck
	Inc(u8),
	Dec(u8),
	Right(usize),
	Left(usize),

	AddI(usize, u8), // *a + n -> *a : a must be less than 255
	SubI(usize, u8), // *a - n -> *a : a msut be greater than 0
	Dup(usize, usize, usize), // *a -> *b, *c : a will be zeroed, b and c must be zero
	Mov(usize, usize), // *a -> *b : a will be zeroed, b must be zero

	Putch(usize),
	Zero(usize),
	Loop(usize, Vec<BfOp>),

	Goto(usize),
	Literal(String),

	// debug
	Tag(usize, String), // tag address with name in debugger
	Comment(String), // if you see something say something
}

pub fn compile(path: &Path) -> String {
	let path = path.canonicalize().unwrap();
	let mut module = llvm_ir::Module::from_bc_path(path).unwrap();

	calls_terminate_blocks(&mut module);
	calls_never_in_first_block(&mut module);

	// stacks frames are laid out as:
	// <main loop bit> | <func mask> | <block mask> | <registers> | <scratch>
	// the main loop bit: is always `1` and part of the runtime's flow control
	// func/block masks: control the current block of execution
	struct FnFlow {
		fid: usize,
		blks: std::collections::HashMap<usize, usize>,
		intrinsic: Option<String>,
	}

	let funcns = module.functions.len();

	// <function name> -> <function index>
	//					  <block num> -> <block index>
	let func2id = module
		.functions
		.iter()
		.enumerate()
		.map(|(i, f)| {
			(
				f.name.as_str(),
				FnFlow {
					fid: i,
					blks: f
						.basic_blocks
						.iter()
						.enumerate()
						.map(|(i, b)| (n2usize(&b.name), i))
						.collect(),
					intrinsic: None,
				},
			)
		})
		.collect::<std::collections::HashMap<&str, FnFlow>>();

	let mainfid = func2id["main"].fid;

	let mut out = String::from("");

	let mut root: Vec<BfOp> = vec![];

	let stack_width = 30;

	root.push(BfOp::Right(stack_width));
	root.push(BfOp::Comment("runtime init:".to_string()));
	root.push(BfOp::Inc(1));
	root.push(BfOp::Tag(0, "__FRAME__ENTRY__".to_string()));
	write!(out, "{} first frame\n", ">".repeat(stack_width));
	write!(out, "runtime init: \n");
	write!(out, "+ #__FRAME__ENTRY__\n");
	gotofunc(&mut out, 0, mainfid, || format!("+ call #main\n"));
	gotoblock(&mut out, 0, funcns, 0, || format!("+ at #main/b0\n"));
	root.push(BfOp::Tag(mainfid, "main".to_string()));
	root.push(BfOp::AddI(mainfid, 1));
	root.push(BfOp::Tag(funcns, "main/b0".to_string()));
	root.push(BfOp::AddI(funcns, 1));
	root.push(BfOp::Comment("".to_string()));
	write!(out,"\n");

	let mut mainloop: Vec<BfOp> = vec![];

	write!(out,"[\n");

	struct Reg {
		llvm_id: usize,
	}

	for (fid, func) in module.functions.iter().enumerate() {
		mainloop.push(BfOp::Tag(1+fid, func.name.clone()));
		let mut funcloop: Vec<BfOp> = vec![];
		gotofunc(&mut out, 0, fid, || format!("#{} [\n", func.name));

		let mut regmap: Vec<Reg> = Default::default();

		let blockns = func.basic_blocks.len();

		for (bid, block) in func.basic_blocks.iter().enumerate() {
			let blockn = n2usize(&block.name);
			funcloop.push(BfOp::Tag(1+funcns+bid, format!("{}/{}", func.name, blockn)));
			let mut blockloop: Vec<BfOp> = vec![];

			gotoblock(&mut out, 1, funcns, bid, || {
				format!("t#{}/{} [-\n", func.name, blockn)
			});

			let mut handle_call = false;

			let scratch = 30;

			for (iid, instr) in block.instrs.iter().enumerate() {
				blockloop.push(BfOp::Comment(instr.to_string()));
				write!(out,"\t\t{}\n", bfsan(instr.to_string()));

				match instr {
					llvm_ir::Instruction::Call(c) => { // yep
						handle_call = true;
						let br = match &block.term {
							llvm_ir::Terminator::Br(br) => n2usize(&br.dest),
							_ => unreachable!("terminator of call block must be branch"),
						};

						assert!(block.instrs.len() - 1 == iid);

						let fnn = match c.function.as_ref().unwrap_right().as_constant().unwrap() {
							llvm_ir::Constant::GlobalReference { name, .. } => n2nam(&name),

							_ => unimplemented!("ohnoes"),
						};

						// TODO(turbio): even an instric call will end in a branch lol
						// that needs to be handled

						let brto = func2id[func.name.as_str()].blks[&br];

						gotoblock(&mut out, 2, funcns, brto, || {
							format!("\t\t+ enable next #{}/{}\n", func.name, br)
						});

						blockloop.push(BfOp::Comment("enable next".to_string()));
						blockloop.push(BfOp::Tag(1+funcns+brto, format!("{}/{}", func.name, br)));
						blockloop.push(BfOp::AddI(1+funcns+brto, 1));

						// intrinsics lol
						if fnn == "putchar" {
							assert!(c.dest.is_none(), "putchar returns nothing");
							assert!(c.arguments.len() == 1, "putchar expects one argument");

							write!(out,"\t\tputchar intrinsic\n");

							//let val = uncop(&c.arguments[0].0);

							blockloop.push(BfOp::Comment("putchar intrinsic".to_string()));

							let reg = match &c.arguments[0].0 {
								llvm_ir::Operand::LocalOperand { name, .. } => n2usize(&name),
								llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
									llvm_ir::constant::Constant::Int { value, .. } => {
										let temp0 = scratch + 0;
										gotoreg(&mut out, 2, temp0, funcns, blockns, || {
											format!("\t\t{}\n", "+".repeat(*value as usize))
										});
										blockloop.push(BfOp::AddI(1+funcns+blockns+temp0, *value as u8));
										temp0
									},
									_ => unimplemented!("how tf we gonna store that"),
								},

								_ => unimplemented!("ignoring meta?"),
							};

							blockloop.push(BfOp::Putch(1+funcns+blockns+reg));
							blockloop.push(BfOp::Zero(1+funcns+blockns+reg));

							gotoreg(&mut out, 2, reg, funcns, blockns, || {
								format!("\t\t.[-]\n")
							});
						} else {
							blockloop.push(BfOp::Comment("next frame".to_string()));
							blockloop.push(BfOp::Goto(0));
							blockloop.push(BfOp::Right(stack_width));
							blockloop.push(BfOp::Tag(0, format!("__FRAME_{}__", fnn)));
							blockloop.push(BfOp::AddI(0, 1));
							blockloop.push(BfOp::Tag(1+func2id[fnn.as_str()].fid, format!("{}", fnn)));
							blockloop.push(BfOp::AddI(1+func2id[fnn.as_str()].fid, 1));
							blockloop.push(BfOp::Tag(1+funcns+0, format!("{}/b0", fnn)));
							blockloop.push(BfOp::AddI(1+funcns+0, 1));

							write!(out,"\t\t{} next frame\n", ">".repeat(stack_width));
							write!(out,"\t\t+ #__FRAME_{}__\n", fnn);
							gotofunc(&mut out, 2, func2id[fnn.as_str()].fid, || {
								format!("\t\t+ call func #{}\n", fnn)
							});
							gotoblock(&mut out, 2, funcns, 0, || format!("\t\t+ #{}/b0\n", fnn));
						}
					}
					llvm_ir::Instruction::Alloca(c) => { // yep
						match c.allocated_type.deref() {
							llvm_ir::Type::IntegerType { .. } => {
								blockloop.push(BfOp::Tag(1 + n2usize(&c.dest), format!("alloca_{}", c.dest)));

								gotoreg(&mut out, 2, n2usize(&c.dest), funcns, blockns, || {
									format!("\t\t#alloca_{}\n", c.dest)
								});

								//assert!(*bits == 8, "ohno {} bits", bits) lolz
							}
							_ => unimplemented!("those types arent welcome here"),
						};

						//regmap.push(Reg {
						//	  llvm_id: n2usize(&c.dest),
						//})
					}
					llvm_ir::Instruction::Store(s) => { // yep
						let addr = unlop(&s.address);

						match &s.value {
							llvm_ir::Operand::LocalOperand { name, ty } => {
								let name = n2usize(name);

								// zero %addr (probably alloca)
								gotoreg(&mut out, 2, addr, funcns, blockns, || format!("\t\t[-]\n"));

								blockloop.push(BfOp::Zero(1 + funcns + blockns + addr));
								blockloop.push(BfOp::Mov(
										1 + funcns + blockns + name,
										1 + funcns + blockns + addr,
								));

								// move name to %addr
								gotoreg(&mut out, 2, name, funcns, blockns, || format!("\t\t[-\n"));
								gotoreg(&mut out, 2, addr, funcns, blockns, || format!("\t\t+\n"));
								gotoreg(&mut out, 2, name, funcns, blockns, || format!("\t\t]\n"));
							}
							llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
								llvm_ir::constant::Constant::Int { value, .. } => {
									let val = *value;

									blockloop.push(BfOp::Zero(1 + funcns + blockns + addr));
									blockloop.push(BfOp::AddI(1 + funcns + blockns + addr, val as u8));

									gotoreg(&mut out, 2, addr, funcns, blockns, || {
										format!("\t\t[-]{}\n", "+".repeat(val as usize))
									});
								}
								_ => unimplemented!("how tf we gonna store that"),
							},

							_ => unimplemented!("how tf we gonna store that"),
						};
					}
					llvm_ir::Instruction::Load(l) => { // yep
						let addr = unlop(&l.address);
						let dest = n2usize(&l.dest);

						gotoreg(&mut out, 2, dest, funcns, blockns, || {
							format!("\t\t #load_%{}_to_%{}\n", addr, dest)
						});

						blockloop.push(BfOp::Tag(
							1 + funcns + blockns + dest,
							format!("load_%{}_to_%{}", addr, dest),
						));

						let temp0 = scratch + 0;
						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t #load_temp0\n"));

						blockloop.push(BfOp::Tag(
							1 + funcns + blockns + temp0,
							format!("tmp0_for_load"),
						));

						blockloop.push(BfOp::Dup(
							1 + funcns + blockns + addr,
							1 + funcns + blockns + temp0,
							1 + funcns + blockns + dest,
						));

						blockloop.push(BfOp::Mov(
							1 + funcns + blockns + temp0,
							1 + funcns + blockns + addr,
						));

						// dup addr -> temp0 + dest
						gotoreg(&mut out, 2, addr, funcns, blockns, || format!("\t\t[-\n"));
						gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, addr, funcns, blockns, || format!("\t\t]\n"));

						// move temp0 -> addr
						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t[-\n"));
						gotoreg(&mut out, 2, addr, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t]\n"));

						//println!("\t\tload {} to {}", addr, dest);
						//println!("\t\tload {:?} ", l);
					}
					llvm_ir::Instruction::ICmp(i) => { // nope
						let pred = i.predicate;
						let op0 = unlop(&i.operand0);
						let op1 = uncop(&i.operand1);
						let dest = n2usize(&i.dest);

						let temp0 = scratch + 1;
						let temp1 = scratch + 2; // and scratch + 3, scratch + 4

						gotoreg(&mut out, 2, op0, funcns, blockns, || format!("\t\t#op0\n"));
						gotoreg(&mut out, 2, scratch + 0, funcns, blockns, || format!("\t\t#op1\n"));

						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t#temp0\n"));
						gotoreg(&mut out, 2, temp1, funcns, blockns, || format!("\t\t#temp1_a\n"));
						gotoreg(&mut out, 2, temp1 + 1, funcns, blockns, || format!("\t\t#temp1_b\n"));
						gotoreg(&mut out, 2, temp1 + 2, funcns, blockns, || format!("\t\t#temp1_c\n"));

						gotoreg(&mut out, 2, dest, funcns, blockns, || {
							format!("\t\t #%{}_icmp_%{}_lt_{}\n", dest, op0, op1)
						});

						blockloop.push(BfOp::Tag(
							1+funcns+blockns+op0,
							format!("op0"),
						));
						blockloop.push(BfOp::Tag(
							1+funcns+blockns+(scratch+0),
							format!("op1"),
						));
						blockloop.push(BfOp::Tag(
							1+funcns+blockns+temp0,
							format!("temp0"),
						));
						blockloop.push(BfOp::Tag(
							1+funcns+blockns+temp1,
							format!("temp1_a"),
						));
						blockloop.push(BfOp::Tag(
							1+funcns+blockns+temp1+1,
							format!("temp1_b"),
						));
						blockloop.push(BfOp::Tag(
							1+funcns+blockns+temp1+2,
							format!("temp1_c"),
						));
						blockloop.push(BfOp::Tag(
							1+funcns+blockns+dest,
							format!("%{}_icmp_%{}_lt_{}", dest, op0, op1)
						));

						gotoreg(&mut out, 2, op0, funcns, blockns, || format!("\t\t[\n"));
						gotoreg(&mut out, 2, scratch + 0, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, op0, funcns, blockns, || format!("\t\t-]\n"));

						gotoreg(&mut out, 2, scratch + 0, funcns, blockns, || format!("\t\t[\n"));
						gotoreg(&mut out, 2, op0, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, scratch + 0, funcns, blockns, || format!("\t\t-]\n"));

						gotoreg(&mut out, 2, scratch + 0, funcns, blockns, || {
							format!("\t\t{}\n", "+".repeat(op1 as usize))
						});
						let op1 = scratch + 0;

						match pred {
							llvm_ir::IntPredicate::SLT => {
								format!("\t\ticmp: %{} {} {}\n", op0, pred, op1);

								// x and y are unsigned. temp1 is the first of
								// three consecutive temporary cells. The
								// algorithm returns either 0 (false) or 1
								// (true).
								// let stolen = "
								//	   temp0[-]
								//	   temp1[-] >[-]+ >[-] <<
								//	   y[temp0+ temp1+ y-]
								//	   temp0[y+ temp0-]
								//	   x[temp0+ x-]+
								//	   temp1[>-]> [< x- temp0[-] temp1>->]<+<

								//	   temp0[temp1- [>-]> [< x- temp0[-]+ temp1>->]<+< temp0-]
								// ";

								gotoreg(&mut out, 2, temp1, funcns, blockns, || {
									format!("\t\ttemp1 >+ > <<\n")
								});

								// y[temp0+ temp1+ y-]
								gotoreg(&mut out, 2, op1, funcns, blockns, || format!("\t\ty[\n"));
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t+\n"));
								gotoreg(&mut out, 2, temp1, funcns, blockns, || format!("\t\t+\n"));
								gotoreg(&mut out, 2, op1, funcns, blockns, || format!("\t\t-]\n"));

								// temp0[y+ temp0-]
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\ttemp0[\n"));
								gotoreg(&mut out, 2, op1, funcns, blockns, || format!("\t\ty+\n"));
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\ttemp0-]\n"));

								// x[temp0+ x-]+
								gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t[\n"));
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\ttemp0+\n"));
								gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\tx-]+\n"));

								// temp1[>-]> [< x- temp0[-] temp1>->]<+<
								gotoreg(&mut out, 2, temp1, funcns, blockns, || format!("\t\t[>-]> [<\n"));
								gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t-\n"));
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t[-]\n"));
								gotoreg(&mut out, 2, temp1, funcns, blockns, || format!("\t\t>->]<+<\n"));

								// temp0[temp1- [>-]> [< x- temp0[-]+ temp1>->]<+< temp0-]
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t[\n"));
								gotoreg(&mut out, 2, temp1, funcns, blockns, || format!("\t\t- [>-]> [<\n"));
								gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t-\n"));
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t[-]+\n"));
								gotoreg(&mut out, 2, temp1, funcns, blockns, || format!("\t\t>->]<+<\n"));
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t-]\n"));

								gotoreg(&mut out, 2, op1, funcns, blockns, || format!("\t\t[-]\n"));
								gotoreg(&mut out, 2, op0, funcns, blockns, || format!("\t\t[-]\n"));
								gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t[-]\n"));
								gotoreg(&mut out, 2, temp1, funcns, blockns, || format!("\t\t[-]\n"));
								gotoreg(&mut out, 2, temp1 + 1, funcns, blockns, || format!("\t\t[-]\n"));
								gotoreg(&mut out, 2, temp1 + 2, funcns, blockns, || format!("\t\t[-]\n"));
							}
							_ => unimplemented!("ohlort predicate {}", pred),
						}
					}
					llvm_ir::Instruction::Add(a) => { // yep
						let op0 = unlop(&a.operand0);
						let op1 = uncop(&a.operand1);
						let dest = n2usize(&a.dest);

						gotoreg(&mut out, 2, dest, funcns, blockns, || {
							format!("\t\t#%{}_add_%{}_c{}\n", dest, op0, op1)
						});

						blockloop.push(BfOp::Tag(
							1+funcns+blockns+dest,
							format!("%{}_add_%{}_c{}", dest, op0, op1),
						));

						// assume op1 is always constant lol
						gotoreg(&mut out, 2, scratch + 0, funcns, blockns, || {
							format!("\t\t{}\n", "+".repeat(op1 as usize))
						});
						blockloop.push(BfOp::AddI(1+funcns+blockns+(scratch+0), op1 as u8));
						let op1 = scratch + 0;

						blockloop.push(BfOp::Mov(
							1+funcns+blockns+op0,
							1+funcns+blockns+dest,
						));
						blockloop.push(BfOp::Mov(
							1+funcns+blockns+op1,
							1+funcns+blockns+dest,
						));

						// move op0 to dest
						gotoreg(&mut out, 2, op0, funcns, blockns, || format!("\t\t[-\n"));
						gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, op0, funcns, blockns, || format!("\t\t]\n"));

						// move op1 to dest
						gotoreg(&mut out, 2, op1, funcns, blockns, || format!("\t\t[-\n"));
						gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, op1, funcns, blockns, || format!("\t\t]\n"));
					}
					llvm_ir::Instruction::ZExt(i) => { // yep
						// big lies! it's actually a nop
						let src = unlop(&i.operand);
						let dest = n2usize(&i.dest);

						gotoreg(&mut out, 2, dest, funcns, blockns, || {
							format!("\t\t#%{}_zext_{}\n", dest, src)
						});

						blockloop.push(BfOp::Tag(1+funcns+blockns+dest, format!("%{}_zext_{}", dest, src)));
						blockloop.push(BfOp::Mov(
							1+funcns+blockns+src,
							1+funcns+blockns+dest,
						));

						// move src -> dest
						gotoreg(&mut out, 2, src, funcns, blockns, || format!("\t\t[-\n"));
						gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, src, funcns, blockns, || format!("\t\t]\n"));
					}
					llvm_ir::Instruction::Trunc(i) => { // yep
						// big lies! it's actually a nop
						let src = unlop(&i.operand);
						let dest = n2usize(&i.dest);

						gotoreg(&mut out, 2, dest, funcns, blockns, || {
							format!("\t\t#%{}_trunc_{}\n", dest, src)
						});

						blockloop.push(BfOp::Tag(1+funcns+blockns+dest, format!("%{}_trunc_{}", dest, src)));
						blockloop.push(BfOp::Mov(
							1+funcns+blockns+src,
							1+funcns+blockns+dest,
						));

						// move src -> dest
						gotoreg(&mut out, 2, src, funcns, blockns, || format!("\t\t[-\n"));
						gotoreg(&mut out, 2, dest, funcns, blockns, || format!("\t\t+\n"));
						gotoreg(&mut out, 2, src, funcns, blockns, || format!("\t\t]\n"));
					}
					_ => {
						unimplemented!("instruction? {}", instr);
					}
				}
			}

			// if it handled a call we know that: the block ended in a call and
			// the terminator was a unconditional branch. These are both
			// rolled into the call instruction generator.
			if !handle_call {
				write!(out,"\t\tE {}\n", bfsan(block.term.to_string()));
				blockloop.push(BfOp::Comment(block.term.to_string()));

				match &block.term {
					llvm_ir::Terminator::Br(br) => {
						let to = n2usize(&br.dest);
						let toblock = func2id[func.name.as_str()].blks[&to];

						gotoblock(&mut out, 2, funcns, toblock, || {
							format!("\t\t+ #{}/{}\n", func.name, to)
						});
						
						blockloop.push(BfOp::AddI(1+funcns+toblock, 1));
					}

					llvm_ir::Terminator::CondBr(cbr) => {
						let cond = unlop(&cbr.condition);

						//gotoreg(&mut out, 2, cond, funcns, blockns, || write!(out,"\t\t#cond\n"));

						let tru = n2usize(&cbr.true_dest);
						let tru = func2id[func.name.as_str()].blks[&tru];

						let fals = n2usize(&cbr.false_dest);
						let fals = func2id[func.name.as_str()].blks[&fals];

						let temp0 = scratch + 0;
						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t+\n"));
						blockloop.push(BfOp::AddI(1+funcns+blockns+temp0, 1));

						gotoreg(&mut out, 2, cond, funcns, blockns, || format!("\t\t[-\n"));
						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t-\n"));

						blockloop.push(BfOp::Goto(1+funcns+blockns+cond));
						blockloop.push(BfOp::Literal("[-".to_string()));
						blockloop.push(BfOp::Goto(1+funcns+blockns+temp0));
						blockloop.push(BfOp::Literal("-".to_string()));

						gotoblock(&mut out, 2, funcns, tru, || {
							format!("\t\t+ #{}/{}\n", func.name, n2usize(&cbr.true_dest))
						});
						blockloop.push(BfOp::AddI(1+funcns+tru, 1));
						blockloop.push(BfOp::Tag(1+funcns+tru, format!("{}/{}", func.name, n2usize(&cbr.true_dest))));

						gotoreg(&mut out, 2, cond, funcns, blockns, || format!("\t\t]\n"));
						blockloop.push(BfOp::Goto(1+funcns+blockns+cond));
						blockloop.push(BfOp::Literal("]".to_string()));

						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t[-\n"));
						blockloop.push(BfOp::Goto(1+funcns+blockns+temp0));
						blockloop.push(BfOp::Literal("[-".to_string()));

						gotoblock(&mut out, 2, funcns, fals, || {
							format!("\t\t+ #{}/{}\n", func.name, n2usize(&cbr.false_dest))
						});
						blockloop.push(BfOp::AddI(1+funcns+fals, 1));
						blockloop.push(BfOp::Tag(1+funcns+tru, format!("{}/{}", func.name, n2usize(&cbr.false_dest))));

						gotoreg(&mut out, 2, temp0, funcns, blockns, || format!("\t\t]\n"));
						blockloop.push(BfOp::Goto(1+funcns+blockns+temp0));
						blockloop.push(BfOp::Literal("]".to_string()));
					}

					llvm_ir::Terminator::Ret(_) => {
						blockloop.push(BfOp::SubI(0, 1));
						blockloop.push(BfOp::Tag(0, "dead_frame".to_string()));
						write!(out,"\t\t- #ded_func_{}\n", func.name);
						gotofunc(&mut out, 2, func2id[func.name.as_str()].fid, || {
							format!("\t\t- uncall func {}\n", func.name)
						});
						blockloop.push(BfOp::SubI(1+func2id[func.name.as_str()].fid, 1));

						write!(out,"\t\t{} prev frame\n", "<".repeat(stack_width));
						blockloop.push(BfOp::Goto(0));
						blockloop.push(BfOp::Left(stack_width));
					}
					_ => unimplemented!("soon? {:?}", block.term),
				};
			}

			gotoblock(&mut out, 1, funcns, bid, || format!("\t] b{}\n", blockn));

			funcloop.push(BfOp::Loop(1+funcns+bid, blockloop))
		}

		gotofunc(&mut out, 0, fid, || format!("] {}\n", func.name));

		mainloop.push(BfOp::Loop(1+fid, funcloop))
	}

	write!(out,"]\n");

	root.push(BfOp::Loop(0, mainloop));

	printast(root);

	out
}

fn printast(ast: Vec<BfOp>) {
	printasti(ast, 0, 0);
}

fn printasti(ast: Vec<BfOp>, cstart: usize, i: usize) -> usize{
	let mut cursor = cstart;
	for ins in ast {
		cursor = printinstri(ins, cursor, i);
	}

	cursor
}

fn printinstri(ins: BfOp, cstart: usize, i: usize) -> usize {
	let mut cursor = cstart;

	let ind = "\t".repeat(i);

	let cmov = |from: usize, to: usize| {
		if to > from {
			">".repeat(to-from)
		} else {
			"<".repeat(from-to)
		}
	};

	print!("{}", ind);

	match ins {
		BfOp::Inc(n) => println!("{}", "+".repeat(n as usize)),
		BfOp::Dec(n) => println!("{}", "-".repeat(n as usize)),
		BfOp::Right(n) => println!("{}", ">".repeat(n)),
		BfOp::Left(n) => println!("{}", "<".repeat(n)),

		BfOp::Zero(a) => {
			println!("{}[-]", cmov(cursor, a));
			cursor = a;
		},

		BfOp::Putch(a) => {
			println!("{}.", cmov(cursor, a));
			cursor = a;
		},

		BfOp::AddI(a, n) => {
			println!("{}{}", cmov(cursor, a), "+".repeat(n as usize));
			cursor = a;
		},
		BfOp::SubI(a, n) => {
			println!("{}{}", cmov(cursor, a), "-".repeat(n as usize));
			cursor = a;
		},

		BfOp::Tag(a, s) => {
			println!("{}#{}", cmov(cursor, a), s);
			cursor = a;
		},
		BfOp::Mov(from_a, to_a) => {
			println!(
				"{}[-{}+{}]",
				cmov(cursor, from_a),
				cmov(from_a, to_a),
				cmov(to_a, from_a),
			);
			cursor = from_a;
		}
		BfOp::Goto(a) => {
			println!("{}", cmov(cursor, a));
			cursor = a;
		}
		BfOp::Literal(s) => println!("{}", s),
		BfOp::Dup(from_a, to_a1, to_a2) => {
			// TODO(turbio): should probably order to_a1 and to_a2 for lower travel
			println!(
				"{}[-{}+{}+{}]",
				cmov(cursor, from_a),
				cmov(from_a, to_a1),
				cmov(to_a1, to_a2),
				cmov(to_a2, from_a),
			);
			cursor = from_a;
		}
		BfOp::Comment(s) => println!("{}", bfsan(s)),

		BfOp::Loop(a, ops) => {
			let m = cmov(cursor, a);
			cursor = a;

			println!("{}[", m);
			cursor = printasti(ops, cursor, i+1);

			let m = cmov(cursor, a);
			cursor = a;

			println!("{}{}]", ind, m);
		},

		_ => unimplemented!("poggers {:?}", ins),
	}

	cursor
}

fn pptree(ast: Vec<BfOp>) {
	pptreei(ast, 0);
}

fn pptreei(ast: Vec<BfOp>, i: usize) {
	for n in ast {
		match n {
			BfOp::Loop(a, ch) => {
				println!("{}Loop({})", "\t".repeat(i), a);
				pptreei(ch, i+1);
			},
			_ => println!("{}{:?}", "\t".repeat(i), n),
		}
	}
}

// un local operand
fn unlop(op: &llvm_ir::Operand) -> usize {
	match op {
		llvm_ir::Operand::LocalOperand { name, .. } => n2usize(&name),
		_ => unimplemented!("uwu?"),
	}
}

// un constant operand
fn uncop(op: &llvm_ir::Operand) -> u64 {
	match op {
		llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
			llvm_ir::constant::Constant::Int { value, .. } => *value,
			_ => unimplemented!("how tf we gonna store that"),
		},
		_ => {
			unimplemented!("owo what's this")
		}
	}
}

fn gotoreg<F>(out: &mut String, i: usize, reg: usize, funcns: usize, blockns: usize, f: F)
where
	F: FnOnce() -> String,
{
	write!(out,
		"{}{}\n",
		"\t".repeat(i),
		">".repeat(1 + funcns + blockns + reg)
	);
	write!(out, "{}", f());
	write!(out,
		"{}{}\n",
		"\t".repeat(i),
		"<".repeat(1 + funcns + blockns + reg)
	);
}

fn gotoblock<F>(out: &mut String, i: usize, bid: usize, funcns: usize, f: F)
where
	F: FnOnce() -> String,
{
	write!(out,"{}{}\n", "\t".repeat(i), ">".repeat(1 + bid + funcns));
	write!(out, "{}", f());
	write!(out,"{}{}\n", "\t".repeat(i), "<".repeat(1 + bid + funcns));
}

fn gotofunc<F>(out: &mut String, i: usize, fid: usize, f: F)
where
	F: FnOnce() -> String,
{
	write!(out,"{}{}\n", "\t".repeat(i), ">".repeat(1 + fid));
	write!(out, "{}", f());
	write!(out,"{}{}\n", "\t".repeat(i), "<".repeat(1 + fid));
}

fn n2nam(n: &llvm_ir::Name) -> String {
	match n {
		llvm_ir::Name::Name(n) => *n.clone(),
		llvm_ir::Name::Number(_) => unimplemented!("we only deal in names here"),
	}
}

fn n2usize(n: &llvm_ir::Name) -> usize {
	match n {
		llvm_ir::Name::Number(n) => *n,
		_ => unimplemented!("we only deal in usize"),
	}
}

fn bfsan(s: String) -> String {
	s.replace(",", "_")
}

fn main() {
	let mut pathstr = String::new();

	for arg in env::args().skip(1).by_ref() {
		if arg == "-" {
			pathstr = "/dev/stdin".to_owned();
		} else {
			pathstr = arg;
		}
	}

	if pathstr == "" {
		panic!("expected at least one arg");
	}

	let bcfile = Path::new(&pathstr);

	compile(&bcfile);
}
