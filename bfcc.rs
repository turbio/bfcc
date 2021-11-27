extern crate llvm_ir;

use std::collections::HashMap;
use std::env;
use std::fmt::Write;
use std::ops::Deref;
use std::path::Path;

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
						.unwrap() + 4200,
				);

				if instr == func.basic_blocks[block].instrs.len() - 1 {
					let splitn = llvm_ir::BasicBlock {
						name: nextn.clone(),
						instrs: vec![],
						term: func.basic_blocks[block].term.clone(),
					};
					func.basic_blocks.insert(block + 1, splitn);

					func.basic_blocks[block].term =
						llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
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

					func.basic_blocks[block].term =
						llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
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
			continue;
		}

		let nextn = llvm_ir::Name::Number(
			func.basic_blocks
				.iter()
				.map(|b| n2usize(&b.name))
				.max()
				.unwrap() + 6900,
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

//#[derive(Debug)]
//enum Addr {
//	S(usize),
//}

type Addr = usize;

#[derive(Debug)]
enum BfOp {
	// actual brainfuck
	Right(usize),
	Left(usize),

	AddI(Addr, u8),        // *a + n -> *a : a must be less than 255
	SubI(Addr, u8),        // *a - n -> *a : a msut be greater than 0
	Dup(Addr, Addr, Addr), // *a -> *b, *c : a will be zeroed, b and c must be zero

	// the only architecture with a real mov instruction
	Mov(Addr, Addr), // *a -> *b : a will be zeroed, b must be zero

	Putch(Addr),
	Zero(Addr),
	Loop(Addr, Vec<BfOp>),

	Goto(Addr),
	Literal(String),

	// debug
	Tag(Addr, String), // tag address with name in debugger
	Comment(String),   // if you see something say something

	Nop,
}

fn build_icmp(
	borrow_reg: &mut dyn FnMut(&mut Vec<Option<llvm_ir::Name>>, &mut Vec<Addr>, usize) -> Addr,
	onstack: &mut Vec<Option<llvm_ir::Name>>,
	just_taken: &mut Vec<Addr>,
	pred: llvm_ir::IntPredicate,
	op0: usize,
	op1: usize,
	dest: usize,
) -> Vec<BfOp> {
	let mut icmp_out = Vec::<BfOp>::new();

	let tmps = borrow_reg(onstack, just_taken, 3);

	icmp_out.push(BfOp::Tag(tmps, format!("icmp_tmpb")));
	icmp_out.push(BfOp::Tag(tmps + 1, format!("icmp_tmp0")));
	icmp_out.push(BfOp::Tag(tmps + 2, format!("icmp_tmp1")));

	// these are all based around sub w/o underflow:
	// a | ... | u flag | ... | b | 0 | 1
	//
	// a[- b [->]  |   >   |  [<]  | <  | a]
	//             |       |       |    |
	//          b or 0     |       0    b
	//                  0 or 1
	//
	// Both minuend and subtrahend will be zeroed by this algorithm. The
	// returned usize will be the difference.
	//
	// theres an optinal underflow flag if a subtraction to the minuend would
	// cause the cell to go negative then this address will be >= 1.
	let subnu = |minuend: usize, subtractend: usize, underflow: Option<usize>| {
		let tmpb = tmps;
		// let tmp0 = tmps + 1;
		let tmp1 = tmps + 2;

		(
			vec![
				BfOp::Mov(minuend, tmpb),
				BfOp::AddI(tmp1, 1),
				BfOp::Loop(
					subtractend,
					vec![
						BfOp::SubI(subtractend, 1),
						if underflow.is_some() {
							BfOp::AddI(underflow.unwrap(), 1)
						} else {
							BfOp::Nop
						},
						BfOp::Loop(
							tmpb,
							vec![
								BfOp::SubI(tmpb, 1),
								if underflow.is_some() {
									BfOp::SubI(underflow.unwrap(), 1)
								} else {
									BfOp::Nop
								},
								BfOp::Right(1),
							],
						),
						BfOp::Right(1),
						BfOp::Loop(tmpb, vec![BfOp::Left(1)]),
						BfOp::Left(1),
					],
				),
				BfOp::Zero(tmp1),
			],
			tmpb,
		)
	};

	match pred {
		llvm_ir::IntPredicate::SLT | llvm_ir::IntPredicate::ULT => {
			let (mut ops, diff) = subnu(op1, op0, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::Loop(
				diff,
				vec![BfOp::Zero(diff), BfOp::AddI(dest, 1)],
			));
		}

		llvm_ir::IntPredicate::NE => {
			let underflow = borrow_reg(onstack, just_taken, 1);

			let (mut ops, diff) = subnu(op0, op1, Some(underflow));

			icmp_out.append(&mut ops);

			// don't need to worry about casting to i1 since it'll either
			// underflow xor have a remainter
			icmp_out.push(BfOp::Loop(
				diff,
				vec![BfOp::Zero(diff), BfOp::AddI(dest, 1)],
			));
			icmp_out.push(BfOp::Loop(
				underflow,
				vec![BfOp::Zero(underflow), BfOp::AddI(dest, 1)],
			));
		}

		llvm_ir::IntPredicate::SLE | llvm_ir::IntPredicate::ULE => {
			let (mut ops, diff) = subnu(op0, op1, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::AddI(dest, 1));
			icmp_out.push(BfOp::Loop(diff, vec![BfOp::Zero(diff), BfOp::Zero(dest)]));
		}

		llvm_ir::IntPredicate::SGE | llvm_ir::IntPredicate::UGE => {
			let (mut ops, diff) = subnu(op1, op0, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::AddI(dest, 1));
			icmp_out.push(BfOp::Loop(diff, vec![BfOp::Zero(diff), BfOp::Zero(dest)]));
		}

		llvm_ir::IntPredicate::EQ => {
			let underflow = borrow_reg(onstack, just_taken, 1);

			let (mut ops, diff) = subnu(op1, op0, Some(underflow));
			icmp_out.append(&mut ops);

			icmp_out.push(BfOp::AddI(dest, 1));

			icmp_out.push(BfOp::Loop(diff, vec![BfOp::Zero(diff), BfOp::Zero(dest)]));
			icmp_out.push(BfOp::Loop(
				underflow,
				vec![BfOp::Zero(underflow), BfOp::Zero(dest)],
			));
		}

		llvm_ir::IntPredicate::SGT | llvm_ir::IntPredicate::UGT => {
			let (mut ops, diff) = subnu(op0, op1, None);
			icmp_out.append(&mut ops);

			icmp_out.push(BfOp::Loop(
				diff,
				vec![BfOp::Zero(diff), BfOp::AddI(dest, 1)],
			));
		}
	}

	icmp_out
}

const STACK_PTR_W: usize = 1;

fn build_func<'a>(
	funcns: usize,
	st_width: usize,
	func: &'a llvm_ir::Function,
	func2id: &HashMap<&str, FnFlow>,
) -> (Vec<BfOp>, usize) {
	let mut funcloop: Vec<BfOp> = vec![];

	let fntop = 1 + funcns; // rt loop + function ctrl masks
	let ftop = 1 + funcns + func.basic_blocks.len() + 1; // rt loop + function masks + block masks + ret pad

	// ret pad is always the same width with: main loop + function masks +
	// landing pad mask
	let ret_pad_width = 1 + funcns + RET_LANDING_PAD;

	// all the allocas live for the lifetime of the function. Sorta are actually
	// memory addresses but like that's tricky.
	let mut allocs: Vec<&llvm_ir::Name> = vec![];

	for block in func.basic_blocks.iter() {
		for instr in block.instrs.iter() {
			match instr {
				llvm_ir::Instruction::Alloca(a) => {
					allocs.push(&a.dest);
				}
				_ => {}
			}
		}
	}

	let fid = func2id.get(func.name.as_str()).unwrap().fid;

	let allocs = allocs; // un-mut

	// so like we keep hold of pointers as either:
	// resolved : we know the cell address
	// int : bruh
	#[derive(Copy, Clone)]
	enum PtrSrc<'a> {
		Int(&'a llvm_ir::Name),
		Alloc(Addr),
	}

	let mut live_ptrs: Vec<(&llvm_ir::Name, PtrSrc)> = vec![];

	for (i, a) in allocs.iter().enumerate() {
		live_ptrs.push((a, PtrSrc::Alloc(ftop + i)));
	}

	let addr_of = |lv: &Vec<(&llvm_ir::Name, PtrSrc<'a>)>, name: &llvm_ir::Name| -> PtrSrc {
		lv.iter().find(|n| n.0 == name).unwrap().1.clone()
	};

	// live registers available on the stack produced by an instruction and
	// yet to be consumed by a following instruction. Used as a map for
	// allocations where each cell holds a llvm register name.
	//
	// TODO(turbio): for now onstack registers only live between the
	// instruction producing them and the instruction consuming them.
	// Multiple uses is unimplemented.
	let mut onstack = Vec::<Option<llvm_ir::Name>>::new();

	// available names is a combination of all the living registers:
	// onstack + allocs
	let take_reg = |onstack: &mut Vec<Option<llvm_ir::Name>>,
	                just_taken: &mut Vec<Addr>,
	                name: &llvm_ir::Name|
	 -> Addr {
		let at = onstack
			.iter()
			.position(|n| n.is_some() && n.clone().unwrap() == *name)
			.unwrap();
		onstack[at] = None;
		let yep = ftop + allocs.len() + at;
		just_taken.push(yep);
		yep
	};

	// have to promise to give registers before you take them otherwise
	// you could end up giving a register you've just taken.
	let give_reg = |onstack: &mut Vec<Option<llvm_ir::Name>>,
	                just_taken: &Vec<Addr>,
	                name: &llvm_ir::Name|
	 -> Addr {
		let slot = onstack
			.iter()
			.enumerate()
			.position(|(i, n)| n.is_none() && !just_taken.contains(&(ftop + allocs.len() + i)));

		ftop + allocs.len()
			+ if slot.is_some() {
				let slot = slot.unwrap();
				onstack[slot] = Some(name.clone());
				slot
			} else {
				let mut slot = onstack.len();

				while just_taken.contains(&(ftop + allocs.len() + slot)) {
					onstack.push(None);
					slot += 1;
				}

				onstack.push(Some(name.clone()));

				slot
			}
	};

	let mut first_block_ops = Vec::<BfOp>::new();

	// TODO(turbio): not optimal to double copy the args. The calling
	// function puts them right before our stack then we copy them right
	// into our stack registers.
	for (i, p) in func.parameters.iter().enumerate() {
		let pdest = give_reg(&mut onstack, &vec![], &p.name);
		first_block_ops.push(BfOp::Tag(pdest, format!("arg_{}", p.name)));

		// so basically spooky ops to reach before the stack top
		first_block_ops.push(BfOp::Left(i + STACK_PTR_W + 1));
		first_block_ops.push(BfOp::Mov(0, pdest + i + 1 + STACK_PTR_W));
		first_block_ops.push(BfOp::Right(i + STACK_PTR_W + 1));
	}

	// TODO(turbio): well this should actually be the maximum stack space
	// needed at the instant calls are made.
	let stack_width = st_width;

	// the ret landing pad needs to be before any ret instructions so we
	// can't fall into our own landing pad.
	{
		funcloop.push(BfOp::Tag(
			fntop + RET_LANDING_PAD,
			format!("{}/RET_LANDING_PAD", func.name),
		));
		let mut retblock: Vec<BfOp> = vec![];

		// just a lil block to move left. kill mainloop, func, block and
		// then skedaddle.
		retblock.push(BfOp::SubI(0, 1));
		retblock.push(BfOp::Tag(0, "dead_frame".to_string()));
		retblock.push(BfOp::SubI(1 + func2id[func.name.as_str()].fid, 1));
		retblock.push(BfOp::Tag(0, format!("dead_fn_pad/{}", func.name)));
		retblock.push(BfOp::SubI(fntop + RET_LANDING_PAD, 1));
		retblock.push(BfOp::Goto(0));
		retblock.push(BfOp::Left(stack_width)); // TODO actual stack width

		funcloop.push(BfOp::Loop(fntop + RET_LANDING_PAD, retblock))
	}

	for block in func.basic_blocks.iter() {
		let blockn = n2usize(&block.name);

		let bid = func2id[func.name.as_str()].blks[&blockn];

		funcloop.push(BfOp::Tag(fntop + bid, format!("{}/{}", func.name, blockn)));
		let mut blockloop: Vec<BfOp> = vec![];

		blockloop.push(BfOp::SubI(fntop + bid, 1));

		if bid == 0 {
			blockloop.append(&mut first_block_ops);
		}

		let mut handle_call = false;

		for (iid, instr) in block.instrs.iter().enumerate() {
			blockloop.push(BfOp::Comment(instr.to_string()));

			let mut borrowed_reg = Vec::<Addr>::new();

			// borrow a register for scratch space.you just have to reallyt
			// really really promise to not leave any junk beyond the life
			// of the instruction. Otherwise absolute chaos ensues since
			// this borrows control flow regs.
			//
			// TODO(turbio): also also this needs to be used after all gives/takes
			let mut borrow_reg = |onstack: &mut Vec<Option<llvm_ir::Name>>,
			                      just_taken: &mut Vec<usize>,
			                      contig: usize|
			 -> Addr {
				// go through all the ctrl flow masks we cans steal.
				// so uh benchmarks say this is slower interestingly enough
				// if false {
				// 	for i in (0..func2id[func.name.as_str()].blks.len()).rev() {
				// 		if borrowed_reg.contains(&(fntop + i)) {
				// 			continue;
				// 		}

				// 		for j in (i + 1)..func2id[func.name.as_str()].blks.len() {
				// 			if borrowed_reg.contains(&(fntop + j)) {
				// 				break;
				// 			}

				// 			if j - i == contig {
				// 				for k in 0..contig {
				// 					borrowed_reg.push(fntop + i + k);
				// 				}

				// 				return fntop + i;
				// 			}
				// 		}
				// 	}
				// }

				// TODO(turbio): it's be nice to use parts of the stack bewteen
				// to living values but starting from the and searching
				// backwards is way easier.

				// THIS IS ACTUALLY INVALID SINCE WE COULD ACCIDENTALLY LEND A
				// SLOT WE JUST HANDED TO THE FUNCTION.
				// if false {
				// 	for i in 0..onstack.len() {
				// 		if onstack[i].is_some()
				// 			|| borrowed_reg.contains(&(ftop + i + allocs.len()))
				// 		{
				// 			continue;
				// 		}

				// 		for j in (i + 1)..onstack.len() {
				// 			if borrowed_reg.contains(&(ftop + j + allocs.len())) {
				// 				break;
				// 			}

				// 			if j - i == contig {
				// 				for k in 0..contig {
				// 					borrowed_reg.push(ftop + i + k + allocs.len());
				// 				}

				// 				return ftop + i;
				// 			}
				// 		}
				// 	}
				// }

				let mut i = ftop + allocs.len() + onstack.len();
				while borrowed_reg.contains(&i) || just_taken.contains(&i) {
					i += 1;
				}

				for ch in 0..contig {
					assert!(!borrowed_reg.contains(&(i + ch))); // todo this can fail
					borrowed_reg.push(i + ch);
					just_taken.push(i + ch);
				}

				i
			};

			let _release_reg = |_st: &mut Vec<Option<usize>>, _r: usize| {
				// TODO allow reuse
			};

			let mut just_taken = Vec::<usize>::new();

			// so like take an instruction operand and do the right thing
			// - constants will reserve a temp register and store the value there
			// - registers return said register
			// - pointers will reserve a temp and store the pointer value
			// the returned reg MUST be consumed
			let mut op_to_reg = |onstack: &mut Vec<Option<llvm_ir::Name>>,
			                     just_taken: &mut Vec<usize>,
			                     op: &llvm_ir::Operand|
			 -> Addr {
				match op {
					llvm_ir::Operand::LocalOperand { name, ty } => match ty.deref() {
						llvm_ir::Type::IntegerType { .. } => take_reg(onstack, just_taken, name),

						llvm_ir::Type::PointerType {
							pointee_type: _,
							addr_space: _,
						} => {
							let name = match addr_of(&live_ptrs, name) {
								PtrSrc::Alloc(addr) => addr,
								PtrSrc::Int(name) => take_reg(onstack, just_taken, name),
							};
							let tmp = borrow_reg(onstack, just_taken, 1);
							blockloop.push(BfOp::Tag(tmp, format!("tmp_constptr_{}", name)));
							blockloop.push(BfOp::AddI(tmp, name as u8));
							tmp
						}

						_ => unimplemented!("meta?"),
					},
					llvm_ir::Operand::ConstantOperand(_) => {
						let tmp = borrow_reg(onstack, just_taken, 1);
						let v = uncop(op);
						blockloop.push(BfOp::Tag(tmp, format!("tmp_constop_{}", v)));
						blockloop.push(BfOp::AddI(tmp, v as u8));
						tmp
					}

					_ => unimplemented!("lol cucked"),
				}
			};

			match instr {
				llvm_ir::Instruction::Call(c) => {
					// yep
					handle_call = true;
					let br = match &block.term {
						llvm_ir::Terminator::Br(br) => n2usize(&br.dest),
						_ => unreachable!("terminator of call block must be branch"),
					};

					assert!(block.instrs.len() - 1 == iid);

					let fnn = match c.function.as_ref().unwrap_right().as_constant().unwrap() {
						llvm_ir::Constant::GlobalReference { name, .. } => n2nam(&name),

						_ => unimplemented!(
							"ohnoes wtf?? {:?}",
							c.function.as_ref().unwrap_right().as_constant().unwrap()
						),
					};

					// TODO(turbio): even an instric call will end in a branch lol
					// that could be a lil better

					let brto = func2id[func.name.as_str()].blks[&br];

					blockloop.push(BfOp::Comment("enable next".to_string()));
					blockloop.push(BfOp::Tag(fntop + brto, format!("{}/{}", func.name, br)));
					blockloop.push(BfOp::AddI(fntop + brto, 1));

					// intrinsics lol
					if fnn == "putchar" {
						assert!(c.dest.is_none(), "putchar returns nothing");
						assert!(c.arguments.len() == 1, "putchar expects one argument");

						//let val = uncop(&c.arguments[0].0);

						blockloop.push(BfOp::Comment("putchar intrinsic".to_string()));

						let reg = match &c.arguments[0].0 {
							llvm_ir::Operand::LocalOperand { name, .. } => {
								take_reg(&mut onstack, &mut just_taken, &name)
							}
							llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
								llvm_ir::constant::Constant::Int { value, .. } => {
									let temp0 = borrow_reg(&mut onstack, &mut just_taken, 1);
									blockloop.push(BfOp::AddI(temp0, *value as u8));
									temp0
								}
								_ => unimplemented!("how tf we gonna store that"),
							},

							_ => unimplemented!("ignoring meta?"),
						};

						blockloop.push(BfOp::Putch(reg));
						blockloop.push(BfOp::Zero(reg));
					} else {
						for (i, ar) in c.arguments.iter().enumerate() {
							let arg_at =
								stack_width + ret_pad_width + 1 + (c.arguments.len() - 1 - i);

							// TODO(turbio): copy up those args yikers
							match &ar.0 {
								llvm_ir::Operand::LocalOperand { name, .. } => {
									let src = take_reg(&mut onstack, &mut just_taken, &name);
									blockloop.push(BfOp::Mov(src, arg_at));
								}
								llvm_ir::Operand::ConstantOperand(_) => {
									let v = uncop(&ar.0);
									blockloop.push(BfOp::AddI(arg_at, v as u8));
								}

								_ => unimplemented!("ignoring meta?"),
							}
						}

						// stack pointer always goes right before the main loop and after the
						// args
						// copy our stack ptr into the callee's plus our frame size
						let callee_st_ptr = stack_width + ret_pad_width + 1 + c.arguments.len();

						blockloop.push(BfOp::AddI(
							callee_st_ptr,
							(stack_width + ret_pad_width) as u8,
						));
						blockloop.push(BfOp::Left(1)); // forbidden territory
						blockloop.push(BfOp::Mov(0, callee_st_ptr + 1));
						blockloop.push(BfOp::Right(1));

						// setup the jump pad

						blockloop.push(BfOp::Goto(0));
						blockloop.push(BfOp::Right(stack_width));

						blockloop.push(BfOp::Tag(0, format!("JUMP_PAD")));
						blockloop.push(BfOp::AddI(0, 1));

						blockloop.push(BfOp::Tag(
							1 + func2id[func.name.as_str()].fid,
							format!("{}", func.name),
						));
						blockloop.push(BfOp::AddI(1 + func2id[func.name.as_str()].fid, 1));
						blockloop.push(BfOp::Tag(
							fntop + RET_LANDING_PAD,
							format!("{}/jump_pad_blk", func.name),
						));
						blockloop.push(BfOp::AddI(fntop + RET_LANDING_PAD, 1));

						// move to callee's frame loc

						blockloop.push(BfOp::Right(
							c.arguments.len() + ret_pad_width + 1 + STACK_PTR_W,
						));

						// setup the callee's frame

						blockloop.push(BfOp::Tag(0, format!("__FRAME_{}__", fnn)));
						blockloop.push(BfOp::AddI(0, 1));
						blockloop
							.push(BfOp::Tag(1 + func2id[fnn.as_str()].fid, format!("{}", fnn)));
						blockloop.push(BfOp::AddI(1 + func2id[fnn.as_str()].fid, 1));
						blockloop.push(BfOp::Tag(fntop + 0, format!("{}/b0", fnn)));
						blockloop.push(BfOp::AddI(fntop + 0, 1));
					}
				}
				llvm_ir::Instruction::Alloca(c) => {
					// yep
					let dest = addr_of(&live_ptrs, &c.dest);

					match dest {
						PtrSrc::Alloc(addr) => {
							match c.allocated_type.deref() {
								llvm_ir::Type::IntegerType { .. } => {
									blockloop.push(BfOp::Tag(addr, format!("alloca_{}", c.dest)));
								}

								llvm_ir::Type::PointerType {
									pointee_type: _,
									addr_space: _,
								} => {
									blockloop
										.push(BfOp::Tag(addr, format!("alloca_ptr_{}", c.dest)));
								}

								_ => {
									unimplemented!(
										"those types arent welcome here {:?}",
										c.allocated_type.deref()
									)
								}
							};
						}
						_ => unimplemented!("lol cucked"),
					}
				}
				llvm_ir::Instruction::Store(s) => {
					// yep

					let dest = addr_of(&live_ptrs, &unlop(&s.address));

					match dest {
						PtrSrc::Alloc(dest) => {
							blockloop.push(BfOp::Zero(dest));

							match &s.value {
								llvm_ir::Operand::LocalOperand { name, ty } => {
									match ty.deref() {
										llvm_ir::Type::IntegerType { .. } => {
											blockloop.push(BfOp::Mov(
												take_reg(&mut onstack, &mut just_taken, name),
												dest,
											));
										}

										llvm_ir::Type::PointerType {
											pointee_type: _,
											addr_space: _,
										} => {
											let name = match addr_of(&live_ptrs, name) {
												PtrSrc::Alloc(n) => n,
												_ => unimplemented!("lmao?"),
											};

											blockloop.push(BfOp::AddI(dest, name as u8));
										}

										_ => unimplemented!("meta?"),
									};
								}
								llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
									llvm_ir::constant::Constant::Int { value, .. } => {
										let val = *value;

										blockloop.push(BfOp::AddI(dest, val as u8));
									}
									_ => {
										unimplemented!("how tf we gonna store that")
									}
								},

								_ => unimplemented!("how tf we gonna store that"),
							};
						}
						_ => unimplemented!("lol cucked"),
					}
				}
				llvm_ir::Instruction::Load(l) => {
					let addr = addr_of(&live_ptrs, &unlop(&l.address));

					let dest = give_reg(&mut onstack, &just_taken, &l.dest);

					let addr = match addr {
						PtrSrc::Alloc(n) => n,
						_ => unimplemented!("lmao?"),
					};

					blockloop.push(BfOp::Tag(
						dest,
						format!(
							"load_%{}_to_%{}",
							n2usize(unlop(&l.address)),
							n2usize(&l.dest)
						),
					));

					let tmp = borrow_reg(&mut onstack, &mut just_taken, 1);

					blockloop.push(BfOp::Tag(tmp, format!("tmp0_for_load")));
					blockloop.push(BfOp::Dup(addr, tmp, dest));
					blockloop.push(BfOp::Mov(tmp, addr));
				}

				llvm_ir::Instruction::ICmp(i) => {
					let op0 = op_to_reg(&mut onstack, &mut just_taken, &i.operand0);
					let op1 = op_to_reg(&mut onstack, &mut just_taken, &i.operand1);

					let dest = give_reg(&mut onstack, &just_taken, &i.dest);

					blockloop.push(BfOp::Tag(
						dest,
						format!(
							"%{}_icmp_%{}_{}_{}",
							n2usize(&i.dest),
							i.operand0,
							i.predicate,
							i.operand1
						),
					));

					blockloop.append(&mut build_icmp(
						&mut borrow_reg,
						&mut onstack,
						&mut just_taken,
						i.predicate,
						op0,
						op1,
						dest,
					));
				}

				llvm_ir::Instruction::Add(i) => {
					let op0 = op_to_reg(&mut onstack, &mut just_taken, &i.operand0);
					let op1 = op_to_reg(&mut onstack, &mut just_taken, &i.operand1);

					let dest = give_reg(&mut onstack, &just_taken, &i.dest);

					blockloop.push(BfOp::Tag(
						dest,
						format!("%{}_add_%{}_c{}", i.dest, i.operand0, i.operand1),
					));

					blockloop.push(BfOp::Mov(op0, dest));
					blockloop.push(BfOp::Mov(op1, dest));
				}

				llvm_ir::Instruction::Sub(i) => {
					let op0 = op_to_reg(&mut onstack, &mut just_taken, &i.operand0);
					let op1 = op_to_reg(&mut onstack, &mut just_taken, &i.operand1);

					let dest = give_reg(&mut onstack, &just_taken, &i.dest);

					blockloop.push(BfOp::Tag(
						dest,
						format!("%{}_sub_%{}_c{}", i.dest, i.operand0, i.operand1),
					));

					blockloop.push(BfOp::Mov(op0, dest));

					blockloop.push(BfOp::Goto(op1));
					blockloop.push(BfOp::Literal(format!("[-")));
					blockloop.push(BfOp::Goto(dest));
					blockloop.push(BfOp::Literal(format!("-")));
					blockloop.push(BfOp::Goto(op1));
					blockloop.push(BfOp::Literal(format!("]")));
				}

				// these are all lies and actually nops
				llvm_ir::Instruction::ZExt(i) => {
					let op = op_to_reg(&mut onstack, &mut just_taken, &i.operand);
					let dest = give_reg(&mut onstack, &just_taken, &i.dest);
					blockloop.push(BfOp::Tag(dest, format!("{}_zext_{}", i.dest, i.operand)));
					blockloop.push(BfOp::Mov(op, dest));
				}
				llvm_ir::Instruction::Trunc(i) => {
					let src = op_to_reg(&mut onstack, &mut just_taken, &i.operand);
					let dest = give_reg(&mut onstack, &just_taken, &i.dest);
					blockloop.push(BfOp::Tag(dest, format!("{}_trunc_{}", i.dest, i.operand)));
					blockloop.push(BfOp::Mov(src, dest));
				}
				llvm_ir::Instruction::SExt(i) => {
					let src = op_to_reg(&mut onstack, &mut just_taken, &i.operand);
					let dest = give_reg(&mut onstack, &just_taken, &i.dest);
					blockloop.push(BfOp::Tag(dest, format!("{}_trunc_{}", i.dest, i.operand)));
					blockloop.push(BfOp::Mov(src, dest));
				}

				llvm_ir::Instruction::PtrToInt(i) => {
					let dest = give_reg(&mut onstack, &just_taken, &i.dest);

					let ptr = addr_of(&live_ptrs, &unlop(&i.operand));
					blockloop.push(BfOp::Tag(
						dest,
						format!("%{}_ptrtoi_%{}", i.dest, i.operand),
					));

					let tmp = borrow_reg(&mut onstack, &mut just_taken, 1);

					blockloop.push(BfOp::Left(1));
					blockloop.push(BfOp::Dup(0, tmp + 1, dest + 1));
					blockloop.push(BfOp::Mov(tmp + 1, 0));
					blockloop.push(BfOp::Right(1));

					let ptr = match ptr {
						PtrSrc::Alloc(n) => n,
						_ => unimplemented!("lmao?"),
					};

					blockloop.push(BfOp::AddI(dest, ptr as u8));
				}

				llvm_ir::Instruction::IntToPtr(i) => {
					live_ptrs.push((&i.dest, PtrSrc::Int(&unlop(&i.operand))));
				}

				_ => {
					unimplemented!("instruction? {}", instr);
				}
			}

			for addr in just_taken.iter() {
				assert!(just_taken.iter().filter(|&n| n == addr).count() == 1);
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

					blockloop.push(BfOp::Tag(fntop + toblock, format!("{}/{}", func.name, to)));
					blockloop.push(BfOp::AddI(fntop + toblock, 1));
				}

				llvm_ir::Terminator::CondBr(cbr) => {
					let cond = take_reg(&mut onstack, &mut vec![], &unlop(&cbr.condition));

					let tru = n2usize(&cbr.true_dest);
					let tru = func2id[func.name.as_str()].blks[&tru];

					let fals = n2usize(&cbr.false_dest);
					let fals = func2id[func.name.as_str()].blks[&fals];

					// TODO(turbio): well we're using the ret pad block mask
					// as scratch cause like we'll never need it lol.
					let temp0 = fntop + RET_LANDING_PAD;
					blockloop.push(BfOp::AddI(temp0, 1));

					blockloop.push(BfOp::Goto(cond));
					blockloop.push(BfOp::Literal("[-".to_string()));
					blockloop.push(BfOp::Goto(temp0));
					blockloop.push(BfOp::Literal("-".to_string()));

					blockloop.push(BfOp::AddI(fntop + tru, 1));
					blockloop.push(BfOp::Tag(
						fntop + tru,
						format!("{}/{}_true", func.name, n2usize(&cbr.true_dest)),
					));

					blockloop.push(BfOp::Goto(cond));
					blockloop.push(BfOp::Literal("]".to_string()));

					blockloop.push(BfOp::Goto(temp0));
					blockloop.push(BfOp::Literal("[-".to_string()));

					blockloop.push(BfOp::AddI(fntop + fals, 1));
					blockloop.push(BfOp::Tag(
						fntop + fals,
						format!("{}/{}_false", func.name, n2usize(&cbr.false_dest)),
					));

					blockloop.push(BfOp::Goto(temp0));
					blockloop.push(BfOp::Literal("]".to_string()));
				}

				llvm_ir::Terminator::Ret(r) => {
					if r.return_operand.is_some() {
						// TODO(turbio): figure out where to put ret args
						match &r.return_operand.as_ref().unwrap() {
							llvm_ir::Operand::LocalOperand { name, .. } => {
								take_reg(&mut onstack, &mut vec![], &name);
								// blockloop.push(BfOp::Mov(0, 0));
							}
							llvm_ir::Operand::ConstantOperand(_) => {
								// blockloop.push(BfOp::AddI(0, v as u8));
							}

							_ => unimplemented!("ignoring meta?"),
						};
					}

					for al in 0..allocs.len() {
						blockloop.push(BfOp::Zero(ftop + al));
					}

					blockloop.push(BfOp::SubI(0, 1));
					blockloop.push(BfOp::Tag(0, "dead_frame".to_string()));

					blockloop.push(BfOp::SubI(1 + func2id[func.name.as_str()].fid, 1));

					blockloop.push(BfOp::Goto(0));

					blockloop.push(BfOp::Left(1));
					blockloop.push(BfOp::Zero(0));
					blockloop.push(BfOp::Right(1));

					// TODO(turbio): well relying on fixed arg lengths is prolly not gonna work
					// out. Prolly aught to copy args right into the stack and have an entry
					// block lay em out right.
					blockloop.push(BfOp::Left(
						func.parameters.len() + ret_pad_width + 1 + STACK_PTR_W,
					));
				}
				_ => unimplemented!("soon? {:?}", block.term),
			};
		}

		funcloop.push(BfOp::Loop(fntop + bid, blockloop))
	}

	assert!(onstack.iter().filter(|x| x.is_some()).count() == 0);

	return (
		vec![
			BfOp::Tag(1 + fid, func.name.clone()),
			BfOp::Loop(1 + fid, funcloop),
		],
		ftop + allocs.len() + onstack.len(),
	);
}

const RET_LANDING_PAD: usize = 1;

// stacks frames are laid out as:
// <main loop bit> | <func mask> | <block mask> | <registers> | <scratch>
// the main loop bit: is always `1` and part of the runtime's flow control
// func/block masks: control the current block of execution
struct FnFlow {
	fid: usize,
	blks: HashMap<usize, usize>,
}

pub fn compile(path: &Path) -> String {
	let path = path.canonicalize().unwrap();
	let mut module = llvm_ir::Module::from_bc_path(path).unwrap();

	calls_terminate_blocks(&mut module);
	calls_never_in_first_block(&mut module);

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
						.map(|(i, b)| {
							(
								n2usize(&b.name),
								// block index 1 is always the ret landing pad
								if i >= RET_LANDING_PAD { i + 1 } else { i },
							)
						})
						.collect(),
				},
			)
		})
		.collect::<HashMap<&str, FnFlow>>();

	let mainfid = func2id["main"].fid;

	let mut out2 = String::from("");

	let mut root: Vec<BfOp> = vec![];

	let ret_pad_width = 1 + funcns + RET_LANDING_PAD;

	root.push(BfOp::Right(ret_pad_width + STACK_PTR_W));
	root.push(BfOp::AddI(0, 4)); // stack base address
	root.push(BfOp::Right(1));
	root.push(BfOp::Comment("runtime init:".to_string()));
	root.push(BfOp::Tag(0, "__FRAME__ENTRY__".to_string()));
	root.push(BfOp::AddI(0, 1));

	root.push(BfOp::Tag(1 + mainfid, "main".to_string()));
	root.push(BfOp::AddI(1 + mainfid, 1));
	root.push(BfOp::Tag(1 + funcns, "main/b0".to_string()));
	root.push(BfOp::AddI(1 + funcns, 1));

	let mut mainloop: Vec<BfOp> = vec![];

	for func in module.functions.iter() {
		let (_, st_width) = build_func(funcns, 0, func, &func2id);

		mainloop.append(&mut build_func(funcns, st_width, func, &func2id).0);
	}

	root.push(BfOp::Loop(0, mainloop));

	printast(&mut out2, root);

	out2
}

fn printast(out: &mut String, ast: Vec<BfOp>) {
	printasti(out, ast, 0, 0);
}

fn printasti(out: &mut String, ast: Vec<BfOp>, cstart: usize, i: usize) -> usize {
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
			">".repeat(to - from)
		} else {
			"<".repeat(from - to)
		}
	};

	write!(out, "{}", ind).unwrap();

	match ins {
		BfOp::Right(n) => {
			write!(out, "{}", ">".repeat(n)).unwrap();
		}

		BfOp::Left(n) => {
			write!(out, "{}", "<".repeat(n)).unwrap();
		}

		BfOp::Zero(a) => {
			write!(out, "{}[-]", cmov(cursor, a)).unwrap();
			cursor = a;
		}

		BfOp::Putch(a) => {
			write!(out, "{}.", cmov(cursor, a)).unwrap();
			cursor = a;
		}

		BfOp::AddI(a, n) => {
			write!(out, "{}{}", cmov(cursor, a), "+".repeat(n as usize)).unwrap();
			cursor = a;
		}
		BfOp::SubI(a, n) => {
			write!(out, "{}{}", cmov(cursor, a), "-".repeat(n as usize)).unwrap();
			cursor = a;
		}

		BfOp::Tag(a, s) => {
			let s: String = s
				.chars()
				.map(|x| match x {
					'+' | '-' | '<' | '>' | '.' | ',' | '[' | ']' | ' ' => '_',
					_ => x,
				})
				.collect();
			write!(out, "{}#{}", cmov(cursor, a), s).unwrap();
			cursor = a;
		}
		BfOp::Mov(from_a, to_a) => {
			write!(
				out,
				"{}[-{}+{}]",
				cmov(cursor, from_a),
				cmov(from_a, to_a),
				cmov(to_a, from_a),
			)
			.unwrap();
			cursor = from_a;
		}
		BfOp::Goto(a) => {
			write!(out, "{}", cmov(cursor, a)).unwrap();
			cursor = a;
		}
		BfOp::Literal(s) => {
			write!(out, "{}", s).unwrap();
		}
		BfOp::Dup(from_a, to_a1, to_a2) => {
			// TODO(turbio): should probably order to_a1 and to_a2 for lower travel
			write!(
				out,
				"{}[-{}+{}+{}]",
				cmov(cursor, from_a),
				cmov(from_a, to_a1),
				cmov(to_a1, to_a2),
				cmov(to_a2, from_a),
			)
			.unwrap();
			cursor = from_a;
		}
		BfOp::Comment(s) => {
			write!(out, "{}", bfsan(s)).unwrap();
		}

		BfOp::Loop(a, ops) => {
			let m = cmov(cursor, a);
			cursor = a;

			write!(out, "{}[\n", m).unwrap();
			cursor = printasti(out, ops, cursor, i + 1);

			let m = cmov(cursor, a);
			cursor = a;

			write!(out, "{}{}]", ind, m).unwrap();
		}

		BfOp::Nop => {}
	}

	write!(out, "\n").unwrap();

	cursor
}

fn _pptree(ast: &Vec<BfOp>) {
	_pptreei(ast, 0);
}

fn _pptreei(ast: &Vec<BfOp>, i: usize) {
	for n in ast {
		match n {
			BfOp::Loop(a, ch) => {
				println!("{}Loop({})", "\t".repeat(i), a);
				_pptreei(ch, i + 1);
			}
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
		llvm_ir::Name::Number(_) => {
			unimplemented!("we only deal in names here")
		}
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
