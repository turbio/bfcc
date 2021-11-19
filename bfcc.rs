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
	Right(usize),
	Left(usize),

	AddI(usize, u8), // *a + n -> *a : a must be less than 255
	SubI(usize, u8), // *a - n -> *a : a msut be greater than 0
	Dup(usize, usize, usize), // *a -> *b, *c : a will be zeroed, b and c must be zero

	// the only architecture with a real mov instruction
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

	let mut out2 = String::from("");

	let mut root: Vec<BfOp> = vec![];

	let stack_width = 30;

	root.push(BfOp::Right(stack_width));
	root.push(BfOp::Comment("runtime init:".to_string()));
	root.push(BfOp::Tag(0, "__FRAME__ENTRY__".to_string()));
	root.push(BfOp::AddI(0, 1));


	root.push(BfOp::Tag(1+mainfid, "main".to_string()));
	root.push(BfOp::AddI(1+mainfid, 1));
	root.push(BfOp::Tag(1+funcns, "main/b0".to_string()));
	root.push(BfOp::AddI(1+funcns, 1));
	root.push(BfOp::Comment("".to_string()));

	let mut mainloop: Vec<BfOp> = vec![];

	for (fid, func) in module.functions.iter().enumerate() {
		mainloop.push(BfOp::Tag(1+fid, func.name.clone()));
		let mut funcloop: Vec<BfOp> = vec![];

		let blockns = func.basic_blocks.len();

		let fntop = 1+funcns;
		let ftop = 1+funcns+blockns;

		// live for the lifetime of the function
		let mut allocs: Vec<usize> = vec![];

		for block in func.basic_blocks.iter() {
			for instr in block.instrs.iter() {
				match instr {
					llvm_ir::Instruction::Alloca(a) => {
						allocs.push(n2usize(&a.dest));
					},
					_ => {},
				}
			}
		}

		let allocs = allocs; // un-mut

		// live registers available on the stack produced by an instruction and
		// yet to be consumed by a following instruction. Used as a map for
		// allocations where each cell holds a llvm register name.
		//
		// TODO(turbio): for now onstack registers only live between the
		// instruction producing them and the instruction consuming them.
		// Multiple uses is unimplemented.
		let mut onstack = Vec::<Option<usize>>::new();

		// available names is a combination of all the living registers:
		// onstack + allocs
		let take_reg = |st: &mut Vec::<Option<usize>>, name: &llvm_ir::Name| -> usize {
			//println!("take {}: {:?}", name, st);
			let at = st
				.iter()
				.position(|&n| n.is_some() && n.unwrap() == n2usize(name))
				.unwrap();
			st[at] = None;
			at + ftop + allocs.len()
		};

		// have to promise to give registers before you take them otherwise
		// you could end up giving a register you've just taken.
		let give_reg = |st: &mut Vec::<Option<usize>>, name: &llvm_ir::Name| -> usize {
			//println!("give {}: {:?}", name, st);
			let slot = st.iter().position(|&n| n.is_none());
			ftop +  allocs.len() + if slot.is_some() {
				let slot = slot.unwrap();
				st[slot] = Some(n2usize(name));
				slot
			} else {
				st.push(Some(n2usize(name)));
				st.len() - 1
			}
		};

		// TODO(turbio): not optimal to double copy the args. The calling
		// function puts them right before our stack then we copy them right
		// into our stack registers.
		for (i, p) in func.parameters.iter().enumerate() {
			let pdest = give_reg(&mut onstack, &p.name);
			funcloop.push(BfOp::Tag(pdest, format!("arg_{}", p.name)));

			// so basically spooky ops to reach before the stack top
			funcloop.push(BfOp::Left(i+1));
			funcloop.push(BfOp::Mov(0, pdest+i+1));
			funcloop.push(BfOp::Right(i+1));
		}

		for (bid, block) in func.basic_blocks.iter().enumerate() {
			let blockn = n2usize(&block.name);
			funcloop.push(BfOp::Tag(fntop+bid, format!("{}/{}", func.name, blockn)));
			let mut blockloop: Vec<BfOp> = vec![];

			blockloop.push(BfOp::SubI(fntop+bid, 1));


			let mut handle_call = false;

			let scratch = 30;

			for (iid, instr) in block.instrs.iter().enumerate() {
				blockloop.push(BfOp::Comment(instr.to_string()));

				let mut borrowed_reg = Vec::<usize>::new();

				// borrow a register for scratch space.you just have to reallyt
				// really really promise to not leave any junk beyond the life
				// of the instruction. Otherwise absolute chaos ensues since
				// this borrows control flow regs.
				//
				// TODO(turbio): also also this needs to be used after all gives/takes
				let mut borrow_reg = |st: &mut Vec::<Option<usize>>| -> usize {
					for i in 0..func2id[func.name.as_str()].blks.len() {
						let i = fntop+i;
						if !borrowed_reg.contains(&i) {
							borrowed_reg.push(i);
							return i;
						}
					}

					panic!("ee");

					for (i, v) in st.iter().enumerate() {
						let i = allocs.len()+ftop+i;
						if v.is_none() && !borrowed_reg.contains(&i) {
							borrowed_reg.push(i);
							return i;
						}
					}

					let mut i = allocs.len()+st.len()+ftop;
					while borrowed_reg.contains(&i) {
						i += 1;
					}

					borrowed_reg.push(i);
					i
				};

				let release_reg = |st: &mut Vec::<Option<usize>>, r: usize| {
					// TODO allow reuse
				};

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

							_ => unimplemented!("ohnoes wtf?? {:?}", c.function.as_ref().unwrap_right().as_constant().unwrap()),
						};

						// TODO(turbio): even an instric call will end in a branch lol
						// that needs to be handled

						let brto = func2id[func.name.as_str()].blks[&br];


						blockloop.push(BfOp::Comment("enable next".to_string()));
						blockloop.push(BfOp::Tag(fntop+brto, format!("{}/{}", func.name, br)));
						blockloop.push(BfOp::AddI(fntop+brto, 1));

						// intrinsics lol
						if fnn == "putchar" {
							assert!(c.dest.is_none(), "putchar returns nothing");
							assert!(c.arguments.len() == 1, "putchar expects one argument");


							//let val = uncop(&c.arguments[0].0);

							blockloop.push(BfOp::Comment("putchar intrinsic".to_string()));

							let reg = match &c.arguments[0].0 {
								llvm_ir::Operand::LocalOperand { name, .. } => take_reg(&mut onstack, &name),
								llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
									llvm_ir::constant::Constant::Int { value, .. } => {	
										let temp0 = borrow_reg(&mut onstack);
										blockloop.push(BfOp::AddI(temp0, *value as u8));
										temp0
									},
									_ => unimplemented!("how tf we gonna store that"),
								},

								_ => unimplemented!("ignoring meta?"),
							};

							blockloop.push(BfOp::Putch(reg));
							blockloop.push(BfOp::Zero(reg));

						} else {
							for (i, ar) in c.arguments.iter().enumerate() {
								// TODO(turbio): copy up those args yikers
								match &ar.0 {
									llvm_ir::Operand::LocalOperand { name, .. } => {
										let src = take_reg(&mut onstack, &name);
										blockloop.push(BfOp::Mov(src, stack_width-1-i));
									}
									llvm_ir::Operand::ConstantOperand(c) => {
										let v = uncop(&ar.0);
										blockloop.push(BfOp::AddI(stack_width-1-i, v as u8));
									},

									_ => unimplemented!("ignoring meta?"),
								}
							}

							blockloop.push(BfOp::Comment("next frame".to_string()));
							blockloop.push(BfOp::Goto(0));
							blockloop.push(BfOp::Right(stack_width));
							blockloop.push(BfOp::Tag(0, format!("__FRAME_{}__", fnn)));
							blockloop.push(BfOp::AddI(0, 1));
							blockloop.push(BfOp::Tag(1+func2id[fnn.as_str()].fid, format!("{}", fnn)));
							blockloop.push(BfOp::AddI(1+func2id[fnn.as_str()].fid, 1));
							blockloop.push(BfOp::Tag(fntop+0, format!("{}/b0", fnn)));
							blockloop.push(BfOp::AddI(fntop+0, 1));
						}

					}
					llvm_ir::Instruction::Alloca(c) => { // yep
						let dest = ftop+allocs
							.iter()
							.position(|x| *x == n2usize(&c.dest))
							.unwrap();

						match c.allocated_type.deref() {
							llvm_ir::Type::IntegerType { .. } => {
								blockloop.push(BfOp::Tag(dest, format!("alloca_{}", c.dest)));


								//assert!(*bits == 8, "ohno {} bits", bits) lolz
							}
							_ => unimplemented!("those types arent welcome here"),
						};
					}
					llvm_ir::Instruction::Store(s) => { // yep
						let dest = ftop+allocs
							.iter()
							.position(|x| *x == n2usize(&unlop(&s.address)))
							.unwrap();

						match &s.value {
							llvm_ir::Operand::LocalOperand { name, ty: _ } => {

								// zero %dest (even tho probably just alloca)
								blockloop.push(BfOp::Zero(dest));

								// move name to %dest
								blockloop.push(BfOp::Mov(take_reg(&mut onstack, name), dest));

							}
							llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
								llvm_ir::constant::Constant::Int { value, .. } => {
									let val = *value;

									blockloop.push(BfOp::Zero(dest));
									blockloop.push(BfOp::AddI(dest, val as u8));
								}
								_ => unimplemented!("how tf we gonna store that"),
							},

							_ => unimplemented!("how tf we gonna store that"),
						};
					}
					llvm_ir::Instruction::Load(l) => { // yep
						let dest = give_reg(&mut onstack, &l.dest);
						let addr = ftop+allocs
							.iter()
							.position(|x| *x == n2usize(&unlop(&l.address)))
							.unwrap();


						blockloop.push(BfOp::Tag(dest, format!("load_%{}_to_%{}", n2usize(unlop(&l.address)), n2usize(&l.dest))));

						let temp0 = borrow_reg(&mut onstack);

						blockloop.push(BfOp::Tag(temp0, format!("tmp0_for_load"),));
						blockloop.push(BfOp::Dup(addr, temp0, dest));
						blockloop.push(BfOp::Mov(temp0, addr));

						// dup addr -> temp0 + dest

						// move temp0 -> addr

						//println!("\t\tload {} to {}", addr, dest);
						//println!("\t\tload {:?} ", l);
					}
					llvm_ir::Instruction::ICmp(i) => { // nopalmost
						let dest = give_reg(&mut onstack, &i.dest);
						let op0 = take_reg(&mut onstack, &unlop(&i.operand0));

						let op1 = match &i.operand1 {
							llvm_ir::Operand::LocalOperand { name, .. } => {
								take_reg(&mut onstack, &name)
							}
							llvm_ir::Operand::ConstantOperand(c) => {
								let cto = borrow_reg(&mut onstack);
								let v = uncop(&i.operand1);
								blockloop.push(BfOp::AddI(cto, v as u8));
								cto
							},

							_ => unimplemented!("ignoring meta?"),
						};

						let temp0 = scratch + 1;
						let temp1 = scratch + 2; // and scratch + 3, scratch + 4


						blockloop.push(BfOp::Tag(ftop+temp0, format!("temp0")));
						blockloop.push(BfOp::Tag(ftop+temp1, format!("temp1_a")));
						blockloop.push(BfOp::Tag(ftop+temp1+1, format!("temp1_b")));
						blockloop.push(BfOp::Tag(ftop+temp1+2, format!("temp1_c")));
						blockloop.push(BfOp::Tag(dest, format!("%{}_icmp_%{}_lt_{}", n2usize(&i.dest), i.operand0, i.operand1)));


						blockloop.push(BfOp::Mov(op0, dest));

						match i.predicate {
							llvm_ir::IntPredicate::SLT => {
								blockloop.push(BfOp::AddI(ftop+temp1+1, 1));

								// y[temp0+ temp1+ y-]
								// x[temp0+ x-]+
								blockloop.push(BfOp::Dup(op1, ftop+temp0, ftop+temp1+0));
								blockloop.push(BfOp::Mov(ftop+temp0, op1));

								blockloop.push(BfOp::Mov(dest, ftop+temp0));
								blockloop.push(BfOp::AddI(dest, 1));

								// temp1[>-]> [< x- temp0[-] temp1>->]<+<
								blockloop.push(BfOp::Goto(ftop+temp1+0)); blockloop.push(BfOp::Literal("[>-]> [<".to_string()));
								blockloop.push(BfOp::Goto(dest)); blockloop.push(BfOp::Literal("-".to_string()));
								blockloop.push(BfOp::Goto(ftop+temp0)); blockloop.push(BfOp::Literal("[-]".to_string()));
								blockloop.push(BfOp::Goto(ftop+temp1+0)); blockloop.push(BfOp::Literal(">->]<+<".to_string()));

								// temp0[temp1- [>-]> [< x- temp0[-]+ temp1>->]<+< temp0-]
								blockloop.push(BfOp::Goto(ftop+temp0)); blockloop.push(BfOp::Literal("[".to_string()));
								blockloop.push(BfOp::Goto(ftop+temp1+0)); blockloop.push(BfOp::Literal("- [>-]> [<".to_string()));
								blockloop.push(BfOp::Goto(dest)); blockloop.push(BfOp::Literal("-".to_string()));
								blockloop.push(BfOp::Goto(ftop+temp0)); blockloop.push(BfOp::Literal("[-]+".to_string()));
								blockloop.push(BfOp::Goto(ftop+temp1+0)); blockloop.push(BfOp::Literal(">->]<+<".to_string()));
								blockloop.push(BfOp::Goto(ftop+temp0)); blockloop.push(BfOp::Literal("-]".to_string()));

								blockloop.push(BfOp::Zero(op1));
								blockloop.push(BfOp::Zero(op0));
								blockloop.push(BfOp::Zero(ftop+temp0));

								blockloop.push(BfOp::Zero(ftop+temp1+0));
								blockloop.push(BfOp::Zero(ftop+temp1+1));
								blockloop.push(BfOp::Zero(ftop+temp1+2));
							}
							_ => unimplemented!("ohlort predicate {}", i.predicate),
						}
					}
					llvm_ir::Instruction::Add(a) => { // yep
						let dest = give_reg(&mut onstack, &a.dest);

						let op0 = take_reg(&mut onstack, &unlop(&a.operand0));
						let op1 = match &a.operand1 {
							llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
								llvm_ir::constant::Constant::Int { value, .. } => {
									let op1_tmp = borrow_reg(&mut onstack);
									blockloop.push(BfOp::AddI(op1_tmp, *value as u8));
									op1_tmp
								},
								_ => unimplemented!("eek"),
							},
							llvm_ir::Operand::LocalOperand { name, .. } => take_reg(&mut onstack, &name),
							_ => unimplemented!("nani?"),
						};

						blockloop.push(BfOp::Tag(dest, format!("%{}_add_%{}_c{}", a.dest, a.operand0, a.operand1)));

						blockloop.push(BfOp::Mov(op0, dest));
						blockloop.push(BfOp::Mov(op1, dest));
					}
					llvm_ir::Instruction::ZExt(i) => { // yep
						// big lies! it's actually a nop
						let dest = give_reg(&mut onstack, &i.dest);
						let src = take_reg(&mut onstack, &unlop(&i.operand));


						blockloop.push(BfOp::Tag(dest, format!("%{}_zext_%{}", i.dest, i.operand)));
						// move src -> dest
						blockloop.push(BfOp::Mov(src, dest));

					}
					llvm_ir::Instruction::Trunc(i) => { // yep
						// big lies! it's actually a nop
						let dest = give_reg(&mut onstack, &i.dest);
						let src = take_reg(&mut onstack, &unlop(&i.operand));


						blockloop.push(BfOp::Tag(dest, format!("%{}_trunc_%{}", i.dest, i.operand)));
						blockloop.push(BfOp::Mov(src, dest));

						// move src -> dest
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
				blockloop.push(BfOp::Comment(block.term.to_string()));

				match &block.term {
					llvm_ir::Terminator::Br(br) => {
						let to = n2usize(&br.dest);
						let toblock = func2id[func.name.as_str()].blks[&to];

						
						blockloop.push(BfOp::Tag(fntop+toblock, format!("{}/{}", func.name, to)));
						blockloop.push(BfOp::AddI(fntop+toblock, 1));
					}

					llvm_ir::Terminator::CondBr(cbr) => {
						let cond = take_reg(&mut onstack, &unlop(&cbr.condition));


						let tru = n2usize(&cbr.true_dest);
						let tru = func2id[func.name.as_str()].blks[&tru];

						let fals = n2usize(&cbr.false_dest);
						let fals = func2id[func.name.as_str()].blks[&fals];

						let temp0 = scratch + 0;
						blockloop.push(BfOp::AddI(ftop+temp0, 1));


						blockloop.push(BfOp::Goto(cond));
						blockloop.push(BfOp::Literal("[-".to_string()));
						blockloop.push(BfOp::Goto(ftop+temp0));
						blockloop.push(BfOp::Literal("-".to_string()));

						blockloop.push(BfOp::AddI(fntop+tru, 1));
						blockloop.push(BfOp::Tag(fntop+tru, format!("{}/{}_true", func.name, n2usize(&cbr.true_dest))));

						blockloop.push(BfOp::Goto(cond));
						blockloop.push(BfOp::Literal("]".to_string()));

						blockloop.push(BfOp::Goto(ftop+temp0));
						blockloop.push(BfOp::Literal("[-".to_string()));

						blockloop.push(BfOp::AddI(fntop+fals, 1));
						blockloop.push(BfOp::Tag(fntop+fals, format!("{}/{}_false", func.name, n2usize(&cbr.false_dest))));

						blockloop.push(BfOp::Goto(ftop+temp0));
						blockloop.push(BfOp::Literal("]".to_string()));
					}

					llvm_ir::Terminator::Ret(_) => {
						for al in 0..allocs.len() {
							blockloop.push(BfOp::Zero(ftop+al));
						}

						blockloop.push(BfOp::SubI(0, 1));
						blockloop.push(BfOp::Tag(0, "dead_frame".to_string()));
						blockloop.push(BfOp::SubI(1+func2id[func.name.as_str()].fid, 1));

						blockloop.push(BfOp::Goto(0));
						blockloop.push(BfOp::Left(stack_width));
					}
					_ => unimplemented!("soon? {:?}", block.term),
				};
			}

			funcloop.push(BfOp::Loop(fntop+bid, blockloop))
		}

		mainloop.push(BfOp::Loop(1+fid, funcloop))
	}

	root.push(BfOp::Loop(0, mainloop));

	printast(&mut out2, root);

	out2
}

fn printast(out: &mut String, ast: Vec<BfOp>) {
	printasti(out, ast, 0, 0);
}

fn printasti(out: &mut String, ast: Vec<BfOp>, cstart: usize, i: usize) -> usize{
	let mut cursor = cstart;
	for ins in ast {
		cursor = printinstri(out, ins, cursor, i);
	}

	cursor
}

fn printinstri(out: &mut String, ins: BfOp, cstart: usize, i: usize) -> usize {
	let mut cursor = cstart;

	let ind = "\t".repeat(i);

	let cmov = |from: usize, to: usize| {
		if to > from {
			">".repeat(to-from)
		} else {
			"<".repeat(from-to)
		}
	};

	write!(out, "{}", ind);

	match ins {
		BfOp::Right(n) => {
			write!(out, "{}", ">".repeat(n)).unwrap();
		},

		BfOp::Left(n) => {
			write!(out, "{}", "<".repeat(n)).unwrap();
		},

		BfOp::Zero(a) => {
			write!(out, "{}[-]", cmov(cursor, a)).unwrap();
			cursor = a;
		},

		BfOp::Putch(a) => {
			write!(out, "{}.", cmov(cursor, a)).unwrap();
			cursor = a;
		},

		BfOp::AddI(a, n) => {
			write!(out, "{}{}", cmov(cursor, a), "+".repeat(n as usize)).unwrap();
			cursor = a;
		},
		BfOp::SubI(a, n) => {
			write!(out, "{}{}", cmov(cursor, a), "-".repeat(n as usize)).unwrap();
			cursor = a;
		},

		BfOp::Tag(a, s) => {
			let s: String = s
				.chars()
				.map(|x| match x {
					'+' | '-' | '<' | '>' | '.' | ',' | '[' | ']' | ' ' => '_',
					_ => x,
				}).collect();
			write!(out, "{}#{}", cmov(cursor, a), s).unwrap();
			cursor = a;	
		},
		BfOp::Mov(from_a, to_a) => {
			write!(
				out,"{}[-{}+{}]",
				cmov(cursor, from_a),
				cmov(from_a, to_a),
				cmov(to_a, from_a),
			).unwrap();
			cursor = from_a;
		}
		BfOp::Goto(a) => {
			write!(out,"{}", cmov(cursor, a)).unwrap();
			cursor = a;
		}
		BfOp::Literal(s) => {
			write!(out,"{}", s).unwrap();
		},
		BfOp::Dup(from_a, to_a1, to_a2) => {
			// TODO(turbio): should probably order to_a1 and to_a2 for lower travel
			write!(out,
				"{}[-{}+{}+{}]",
				cmov(cursor, from_a),
				cmov(from_a, to_a1),
				cmov(to_a1, to_a2),
				cmov(to_a2, from_a),
			).unwrap();
			cursor = from_a;
		}
		BfOp::Comment(s) => {
			write!(out,"{}", bfsan(s)).unwrap();
		},

		BfOp::Loop(a, ops) => {
			let m = cmov(cursor, a);
			cursor = a;

			write!(out,"{}[\n", m).unwrap();
			cursor = printasti(out, ops, cursor, i+1);

			let m = cmov(cursor, a);
			cursor = a;

			write!(out,"{}{}]", ind, m).unwrap();
		},
	}

	write!(out, "\n");

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
fn unlop(op: &llvm_ir::Operand) -> &llvm_ir::Name {
	match op {
		llvm_ir::Operand::LocalOperand { name, .. } => name,
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
