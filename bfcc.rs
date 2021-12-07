extern crate llvm_ir;

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

				let nextn = llvm_ir::Name::Name(Box::new(format!("call_term_for_{}", block)));

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

		let nextn = llvm_ir::Name::Name(Box::new(format!("call_never_first_for{}", func.name)));

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

	// debug
	Tag(Addr, String), // tag address with name in debugger
	Comment(String),   // if you see something say something

	Nop,
}

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
// theres an optinal underflow address if a subtraction to the minuend would
// cause the cell to go negative then this address will be the difference..
fn subnu(
	borrow_reg: &mut dyn FnMut(&mut Layout, usize) -> Addr,
	layout: &mut Layout,

	minuend: Addr,
	subtractend: Addr,
	underflow: Option<Addr>,
) -> (Vec<BfOp>, Addr) {
	let tmps = borrow_reg(layout, 3);
	let tmpb = tmps;
	let tmp0 = tmps + 1;
	let tmp1 = tmps + 2;

	(
		vec![
			BfOp::Tag(tmpb, format!("subnu_tmpb")),
			BfOp::Tag(tmp0, format!("subnu_tmp0")),
			BfOp::Tag(tmp1, format!("subnu_tmp1")),
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
			BfOp::SubI(tmp1, 1),
		],
		tmpb,
	)
}

fn build_icmp(
	borrow_reg: &mut dyn FnMut(&mut Layout, usize) -> Addr,
	layout: &mut Layout,
	pred: llvm_ir::IntPredicate,
	op0: usize,
	op1: usize,
	dest: usize,
) -> Vec<BfOp> {
	let mut icmp_out = Vec::<BfOp>::new();

	match pred {
		llvm_ir::IntPredicate::SLT | llvm_ir::IntPredicate::ULT => {
			let (mut ops, diff) = subnu(borrow_reg, layout, op1, op0, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::Loop(
				diff,
				vec![BfOp::Zero(diff), BfOp::AddI(dest, 1)],
			));
		}

		llvm_ir::IntPredicate::NE => {
			let underflow = borrow_reg(layout, 1);

			let (mut ops, diff) = subnu(borrow_reg, layout, op0, op1, Some(underflow));

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
			let (mut ops, diff) = subnu(borrow_reg, layout, op0, op1, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::AddI(dest, 1));
			icmp_out.push(BfOp::Loop(diff, vec![BfOp::Zero(diff), BfOp::Zero(dest)]));
		}

		llvm_ir::IntPredicate::SGE | llvm_ir::IntPredicate::UGE => {
			let (mut ops, diff) = subnu(borrow_reg, layout, op1, op0, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::AddI(dest, 1));
			icmp_out.push(BfOp::Loop(diff, vec![BfOp::Zero(diff), BfOp::Zero(dest)]));
		}

		llvm_ir::IntPredicate::EQ => {
			let underflow = borrow_reg(layout, 1);

			let (mut ops, diff) = subnu(borrow_reg, layout, op1, op0, Some(underflow));
			icmp_out.append(&mut ops);

			icmp_out.push(BfOp::AddI(dest, 1));

			icmp_out.push(BfOp::Loop(diff, vec![BfOp::Zero(diff), BfOp::Zero(dest)]));
			icmp_out.push(BfOp::Loop(
				underflow,
				vec![BfOp::Zero(underflow), BfOp::Zero(dest)],
			));
		}

		llvm_ir::IntPredicate::SGT | llvm_ir::IntPredicate::UGT => {
			let (mut ops, diff) = subnu(borrow_reg, layout, op0, op1, None);
			icmp_out.append(&mut ops);

			icmp_out.push(BfOp::Loop(
				diff,
				vec![BfOp::Zero(diff), BfOp::AddI(dest, 1)],
			));
		}
	}

	icmp_out
}

#[derive(Debug, Clone)]
enum Cell {
	Args,
	StackPtr,
	MainLoop,

	FuncMask(String),
	BlockMask(llvm_ir::Name),

	Borrowed(Box<Cell>),
	Taken(Box<Cell>),

	Reg(llvm_ir::Name),
	Alloc(llvm_ir::Name),
	Ptr(llvm_ir::Name),

	Free,
}

type Layout = Vec<Cell>;

const STACK_PTR_W: usize = 1;

// pointer trains are how non statically unresolved pointers are loaded and
// stored.
fn build_ptr_train(
	borrow_reg: &mut dyn FnMut(&mut Layout, usize) -> Addr,
	layout: &mut Layout,

	addr: Addr,          // the actual address to visit
	store: Option<Addr>, // if set the value at `store` is taken and stored at `addr`
	load: Option<Addr>,  // if set the value at `addr` is copied put in `load`
) -> Vec<BfOp> {
	let mut routine = Vec::<BfOp>::new();

	// this is pretty hairy. The generalidea is to copy the pointer value into a
	// small region then move each cell forward while moving cells in front to the
	// back decrementing the pointer every step. We will end up moving the number
	// of steps dictated by the pointer.
	//
	// for example: say we have the tape:
	//                               +------------+
	//                               |            |
	//                               |            v
	// | tmp | ret | ptr | ? | ? | value | ptr | dest |
	//                               ^      |
	//                               |      |
	//                               +------+
	//
	// Where we want to deref `ptr`, which points to `value`, and store the value in
	// dest. `ptr` and `dest` are at known offsets from the current tape address. In
	// this example the `ptr` would have value 5.
	//
	// copying `ptr` to the train would load 2 in the ptr cell since the trains own
	// location in memory must be accounted for.
	//
	// | 0 | 0 | 2 | ? | ? | value | ptr | dest |
	//
	// and then just repeatedly move one cell forward... ptr copy is
	// decremented and a return counter is incremented.
	//
	// | ? | 0 | 1 | 1 | ? | value | ptr | dest |
	//
	// until ptr is zero.
	//
	// | ? | ? | 0 | 2 | 0 | value | ptr | dest |
	//
	// then the cell right after the train aka `value` is loaded in and we drive
	// back using ret.
	//
	// | ? | ? | 0 | 2 | value | value | ptr | dest |
	//
	// | ? | 0 | 1 | value | ? | value | ptr | dest |
	//
	// | 0 | 0 | value | ? | ? | value | ptr | dest |
	//
	// it's like a train! choo choo

	// layout of a train is:
	// to store:   <before> | tmp | ret | ptr   | cargo | <after>
	// from store: <before> | tmp | ret | 0     | 0     | <after>
	// to load:    <before> | tmp | ret | ptr   | <after>
	// from load:  <before> | tmp | ret | cargo | <after>

	let train_len = if store.is_some() { 4 } else { 3 };

	let train = borrow_reg(layout, train_len);

	let train_tmp = train + 0;
	let train_ret = train + 1;
	let train_ptr = train + 2;

	let train_cargo = train + 3; // this is only valid when storing

	let before_train = train - 1;
	let behind_train = train + train_len; // train_cargo + 1;

	// while driving forward train is layed out like:
	// <in front> | tmp | ret | ptr | cargo |

	routine.append(&mut vec![
		BfOp::Tag(train_tmp, format!("train_tmp")),
		BfOp::Tag(train_ret, format!("train_ret")),
		BfOp::Tag(train_ptr, format!("train_ptr")),
		if store.is_some() {
			BfOp::Tag(train_cargo, format!("train_cargo"))
		} else {
			BfOp::Nop
		},
	]);

	// this is all just concerned with getting the right value into the train's ptr
	{
		// so when moving left really we want to calculate the equivalent of:
		// stack_pointer - addr + train_address
		//
		// first we sub addr from stackpointer, a negative result indicating the
		// address is to the left of the current stack frame
		//
		// moving &train to train_ptr
		// routine.push(BfOp::AddI(train_ptr, train as u8));

		let stackptr_tmp = borrow_reg(layout, 1);
		let stackptr = borrow_reg(layout, 1);

		routine.push(BfOp::Tag(stackptr, format!("stackptr")));
		routine.push(BfOp::Tag(stackptr_tmp, format!("stackptr_tmp")));

		// grab the stackptr
		routine.append(&mut vec![
			BfOp::Left(1),
			BfOp::Dup(0, stackptr_tmp + 1, stackptr + 1),
			BfOp::Mov(stackptr_tmp + 1, 0),
			BfOp::Right(1),
		]);

		let neg = borrow_reg(layout, 1);
		routine.push(BfOp::Tag(neg, format!("ptr_underflow")));

		let (mut ops, to) = subnu(borrow_reg, layout, stackptr, addr, Some(neg));
		routine.append(&mut ops);

		routine.push(BfOp::Tag(to, format!("subnu_to")));

		routine.append(&mut vec![
			// if pos
			// train_ptr = &train + abs(stackptr - addr)
			BfOp::Loop(
				to,
				vec![BfOp::Mov(to, train_ptr), BfOp::AddI(train_ptr, train as u8)],
			),
			// if neg
			// train_ptr = &train + abs(stackptr - addr)
			BfOp::Loop(
				neg,
				vec![
					BfOp::AddI(train_ptr, train as u8),
					BfOp::Loop(neg, vec![BfOp::SubI(neg, 1), BfOp::SubI(train_ptr, 1)]),
				],
			),
		]);

		// routine.push(BfOp::Loop(to));

		// move addr to train_tmp
		// routine.push(BfOp::Mov(addr, train_tmp));

		// now we should have: | ptr | stackptr | &train |
		// so sub stackptr from ptr and then sub the result of
		// that from &train
		// routine.append(&mut vec![
		// 	BfOp::Loop(
		// 		train_ret,
		// 		vec![BfOp::SubI(train_ret, 1), BfOp::SubI(train_tmp, 1)],
		// 	),
		// 	BfOp::Loop(
		// 		train_tmp,
		// 		vec![BfOp::SubI(train_tmp, 1), BfOp::SubI(train_ptr, 1)],
		// 	),
		// ]);
	}

	if store.is_some() {
		// load in the cargo hehe
		routine.push(BfOp::Mov(store.unwrap(), train_cargo));
	}

	routine.push(BfOp::Comment(format!("drive left! choo choo")));

	// time to drive! choo choo!
	routine.append(&mut vec![BfOp::Loop(
		train_ptr,
		vec![
			BfOp::Mov(train_ret, train_tmp),
			BfOp::Mov(train_ptr, train_ret),
			if store.is_some() {
				BfOp::Mov(train_cargo, train_ptr)
			} else {
				BfOp::Nop
			},
			BfOp::Mov(before_train, behind_train - 1),
			BfOp::Left(1),
			BfOp::SubI(train_ptr, 1),
			BfOp::AddI(train_ret, 1),
		],
	)]);

	if store.is_some() {
		// unload the cargo
		routine.push(BfOp::Zero(before_train));
		routine.push(BfOp::Mov(train_cargo, before_train));
	} else if load.is_some() {
		routine.push(BfOp::Comment(format!("get our bag")));
		routine.push(BfOp::Dup(before_train, train_tmp, train_ptr));
		routine.push(BfOp::Mov(train_tmp, before_train));
	}

	// reverse outta there dude
	routine.append(&mut vec![BfOp::Loop(
		train_ret,
		vec![
			BfOp::Mov(behind_train, train_tmp),
			if load.is_some() {
				BfOp::Mov(train_ptr, behind_train)
			} else {
				BfOp::Nop
			},
			BfOp::Mov(train_ret, train_ptr),
			BfOp::Right(1),
			BfOp::SubI(train_ret, 1),
		],
	)]);

	if load.is_some() {
		routine.push(BfOp::Mov(train_ptr, load.unwrap()));
	}

	routine
}

fn build_func(
	layout: &Layout,
	ret_pad_width: usize,
	stack_width: usize,
	func: &llvm_ir::Function,
) -> (Vec<BfOp>, usize) {
	// returns the stack width too
	let ret_landing_pad = llvm_ir::Name::Number(69420);

	let mut layout: Layout = layout.clone();

	for (i, block) in func.basic_blocks.iter().enumerate() {
		if i == 1 {
			// block at index 1 is always reserved for the ret landing pad
			layout.push(Cell::BlockMask(ret_landing_pad.clone()));
		}
		layout.push(Cell::BlockMask(block.name.clone()));
	}

	// if we didn't push one in while walking through the bblocks (since there's
	// only an entry) push one in now
	if func.basic_blocks.len() == 1 {
		layout.push(Cell::BlockMask(ret_landing_pad.clone()));
	}

	for block in func.basic_blocks.iter() {
		for instr in block.instrs.iter() {
			match instr {
				llvm_ir::Instruction::Alloca(a) => {
					layout.push(Cell::Alloc(a.dest.clone()));
				}
				_ => {}
			}
		}
	}

	let fid = layout
		.iter()
		.position(|c| match c {
			Cell::FuncMask(n) => n == &func.name,
			_ => false,
		})
		.unwrap();

	// available names is a combination of all the living registers:
	// onstack + allocs
	let take_reg = |layout: &mut Layout, name: &llvm_ir::Name| -> Addr {
		let found = layout.iter().position(|c| match c {
			Cell::Reg(n) => n == name,
			_ => false,
		});

		assert!(found.is_some(), "can't take a non existant register");

		let found = found.unwrap();

		// lmao rust
		let prev = std::mem::replace(&mut layout[found], Cell::Free);
		layout[found] = Cell::Taken(Box::new(prev));

		found
	};

	// have to promise to give registers before you take them otherwise
	// you could end up giving a register you've just taken.
	let give_reg = |layout: &mut Layout, name: &llvm_ir::Name| -> Addr {
		let slot = layout.iter().position(|c| match c {
			Cell::Free => true,
			_ => false,
		});

		if slot.is_some() {
			let slot = slot.unwrap();
			layout[slot] = Cell::Reg(name.clone());
			slot
		} else {
			let slot = layout.len();
			layout.push(Cell::Reg(name.clone()));
			slot
		}
	};

	let give_ptr = |layout: &mut Layout, name: &llvm_ir::Name| -> Addr {
		let slot = layout.iter().position(|c| match c {
			Cell::Free => true,
			_ => false,
		});

		if slot.is_some() {
			let slot = slot.unwrap();
			layout[slot] = Cell::Ptr(name.clone());
			slot
		} else {
			let slot = layout.len();
			layout.push(Cell::Ptr(name.clone()));
			slot
		}
	};

	let mut first_block_ops = Vec::<BfOp>::new();

	// TODO(turbio): not optimal to double copy the args. The calling
	// function puts them right before our stack then we copy them right
	// into our stack registers.
	for (i, p) in func.parameters.iter().enumerate() {
		let pdest = give_reg(&mut layout, &p.name);
		first_block_ops.push(BfOp::Tag(pdest, format!("arg_{}", p.name)));

		// so basically spooky ops to reach before the stack top
		first_block_ops.push(BfOp::Left(i + STACK_PTR_W + 1));
		first_block_ops.push(BfOp::Mov(0, pdest + i + 1 + STACK_PTR_W));
		first_block_ops.push(BfOp::Right(i + STACK_PTR_W + 1));
	}

	// worth noting everone's ret pad and first block have the same address
	let retpad_addr = layout
		.iter()
		.position(|c| match c {
			Cell::BlockMask(n) => n == &ret_landing_pad,
			_ => false,
		})
		.unwrap();
	let entry_block_addr = layout
		.iter()
		.position(|c| match c {
			Cell::BlockMask(n) => n == &func.basic_blocks[0].name,
			_ => false,
		})
		.unwrap();

	let mut funcloop: Vec<BfOp> = vec![];

	// the ret landing pad needs to be before any ret instructions so we
	// can't fall into our own landing pad.
	funcloop.push(BfOp::Tag(
		retpad_addr,
		format!("{}/RET_LANDING_PAD", func.name),
	));

	// lil block to move left. kill mainloop, func, block and then skedaddle.
	funcloop.push(BfOp::Loop(
		retpad_addr,
		vec![
			BfOp::SubI(0, 1),
			BfOp::Tag(0, "dead_frame".to_string()),
			BfOp::SubI(
				layout
					.iter()
					.position(|c| match c {
						Cell::FuncMask(n) => n == &func.name,
						_ => false,
					})
					.unwrap(),
				1,
			),
			BfOp::Tag(0, format!("dead_fn_pad/{}", func.name)),
			BfOp::SubI(retpad_addr, 1),
			BfOp::Left(stack_width),
		],
	));

	for (i, block) in func.basic_blocks.iter().enumerate() {
		let bid = layout
			.iter()
			.position(|c| match c {
				Cell::BlockMask(n) => n == &block.name,
				_ => false,
			})
			.unwrap();

		funcloop.push(BfOp::Tag(bid, format!("B:{}/{}", func.name, &block.name)));
		let mut blockloop: Vec<BfOp> = vec![];

		blockloop.push(BfOp::SubI(bid, 1));

		// first block gets prepended with some fancy stuff
		if i == 0 {
			blockloop.append(&mut first_block_ops);
		}

		let mut handle_call = false;

		for (iid, instr) in block.instrs.iter().enumerate() {
			blockloop.push(BfOp::Comment(instr.to_string()));

			//println!("\n{}", instr);

			// borrow a register for scratch space.you just have to reallyt
			// really really promise to not leave any junk beyond the life
			// of the instruction. Otherwise absolute chaos ensues since
			// this borrows control flow regs.
			//
			// TODO(turbio): also also this needs to be used after all gives/takes
			let mut borrow_reg = |layout: &mut Layout, contig: usize| -> Addr {
				for i in 0..(layout.len() - contig) {
					for j in 0..contig {
						let c = &layout[i + j];

						if !match c {
							Cell::Free => true,
							_ => false,
						} {
							break;
						}

						if j == contig - 1 {
							for c in 0..contig {
								let prev = std::mem::replace(&mut layout[i + c], Cell::Free);
								layout[i + c] = Cell::Borrowed(Box::new(prev));
							}
							return i;
						}
					}
				}

				let slot = layout.len();
				for _ in 0..contig {
					layout.push(Cell::Borrowed(Box::new(Cell::Free)));
				}
				slot
			};

			let _release_reg = |_st: &mut Vec<Option<usize>>, _r: usize| {
				// TODO allow reuse
			};

			// so like take an instruction operand and do the right thing
			// - constants will reserve a temp register and store the value there
			// - registers return said register
			// - pointers will reserve a temp and store the pointer value
			// the returned reg MUST be consumed
			let mut op_to_reg = |layout: &mut Layout, op: &llvm_ir::Operand| -> Addr {
				match op {
					llvm_ir::Operand::LocalOperand { name, ty } => match ty.deref() {
						llvm_ir::Type::IntegerType { .. } => take_reg(layout, name),

						llvm_ir::Type::PointerType {
							pointee_type: _,
							addr_space: _,
						} => {
							let from_alloc = layout.iter().position(|c| match c {
								Cell::Alloc(n) => n == name,
								_ => false,
							});

							if from_alloc.is_some() {
								let from_alloc = from_alloc.unwrap();

								let pasi = borrow_reg(layout, 1);

								blockloop.push(BfOp::Tag(pasi, format!("tmp_allocptr_{}", name)));

								let tmp = borrow_reg(layout, 1);

								// basically reach back to the stack pointer and add it to
								// our destination int. This way the initified pointer
								// be basically be:
								// the address of the stack register position
								// +
								// the current stack's position
								blockloop.push(BfOp::Left(1));
								blockloop.push(BfOp::Dup(0, pasi + 1, tmp + 1));
								blockloop.push(BfOp::Mov(tmp + 1, 0));
								blockloop.push(BfOp::Right(1));

								blockloop.push(BfOp::AddI(pasi, from_alloc as u8 + 1));

								pasi
							} else {
								let from_ptr = layout
									.iter()
									.position(|c| match c {
										Cell::Ptr(n) => n == name,
										_ => false,
									})
									.unwrap();

								let prev = std::mem::replace(&mut layout[from_ptr], Cell::Free);
								layout[from_ptr] = Cell::Taken(Box::new(prev));

								from_ptr
							}
						}

						_ => unimplemented!("meta?"),
					},
					llvm_ir::Operand::ConstantOperand(_) => {
						let tmp = borrow_reg(layout, 1);
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
					handle_call = true;
					let br = match &block.term {
						llvm_ir::Terminator::Br(br) => &br.dest,
						_ => unreachable!("terminator of call block must be branch"),
					};

					assert!(block.instrs.len() - 1 == iid);

					let callee_name =
						match c.function.as_ref().unwrap_right().as_constant().unwrap() {
							llvm_ir::Constant::GlobalReference { name, .. } => n2nam(&name),

							_ => unimplemented!(
								"ohnoes wtf?? {:?}",
								c.function.as_ref().unwrap_right().as_constant().unwrap()
							),
						};

					// TODO(turbio): even an instric call will end in a branch lol
					// that could be a lil better

					// after the call returns branch to this block. Earlier we
					// made sure all calls are at the end of a block which
					// always ends in an unconditional branch.
					let brto = layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == br,
							_ => false,
						})
						.unwrap();

					blockloop.push(BfOp::Comment("enable next".to_string()));
					blockloop.push(BfOp::Tag(brto, format!("{}/{}", func.name, br)));
					blockloop.push(BfOp::AddI(brto, 1));

					// intrinsics lol
					if callee_name == "putchar" {
						assert!(c.dest.is_none(), "putchar returns nothing");
						assert!(c.arguments.len() == 1, "putchar expects one argument");

						//let val = uncop(&c.arguments[0].0);

						blockloop.push(BfOp::Comment("putchar intrinsic".to_string()));

						let reg = match &c.arguments[0].0 {
							llvm_ir::Operand::LocalOperand { name, .. } => {
								take_reg(&mut layout, &name)
							}
							llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
								llvm_ir::constant::Constant::Int { value, .. } => {
									let temp0 = borrow_reg(&mut layout, 1);
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
							blockloop.push(BfOp::Comment(format!("copy up arg {}", i)));

							let arg_at =
								stack_width + ret_pad_width + 1 + (c.arguments.len() - 1 - i);

							blockloop.push(BfOp::Tag(arg_at, format!("arg_{}", i)));

							// TODO(turbio): copy up those args yikers
							match &ar.0 {
								llvm_ir::Operand::LocalOperand { name, .. } => {
									let src = take_reg(&mut layout, &name);
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

						blockloop.push(BfOp::Comment(format!("give callee a stack pointer")));
						blockloop.push(BfOp::Tag(callee_st_ptr, format!("stack_ptr")));
						blockloop.push(BfOp::AddI(
							callee_st_ptr,
							(stack_width + ret_pad_width + 3) as u8,
						));
						blockloop.push(BfOp::Left(1)); // forbidden territory
						blockloop.push(BfOp::Dup(0, callee_st_ptr + 1, callee_st_ptr + 2));
						blockloop.push(BfOp::Mov(callee_st_ptr + 2, 0));
						blockloop.push(BfOp::Right(1));

						// setup the jump pad

						blockloop.push(BfOp::Right(stack_width));

						blockloop.push(BfOp::Tag(0, format!("JUMP_PAD")));
						blockloop.push(BfOp::AddI(0, 1));

						blockloop.push(BfOp::Tag(fid, format!("{}", func.name)));
						blockloop.push(BfOp::AddI(fid, 1));

						blockloop.push(BfOp::Tag(
							retpad_addr,
							format!("{}/jump_pad_blk", func.name),
						));
						blockloop.push(BfOp::AddI(retpad_addr, 1));

						// move to callee's frame loc

						blockloop.push(BfOp::Right(
							c.arguments.len() + ret_pad_width + 1 + STACK_PTR_W,
						));

						// setup the callee's frame

						blockloop.push(BfOp::Tag(0, format!("__FRAME_{}__", callee_name)));
						blockloop.push(BfOp::AddI(0, 1));

						let callee_fid = layout
							.iter()
							.position(|c| match c {
								Cell::FuncMask(n) => n == &callee_name,
								_ => false,
							})
							.unwrap();

						blockloop.push(BfOp::Tag(callee_fid, format!("{}", callee_name)));
						blockloop.push(BfOp::AddI(callee_fid, 1));
						blockloop.push(BfOp::Tag(entry_block_addr, format!("{}/b0", callee_name)));
						blockloop.push(BfOp::AddI(entry_block_addr, 1));
					}
				}

				llvm_ir::Instruction::Alloca(c) => {
					let dest = layout
						.iter()
						.position(|cell| match cell {
							Cell::Alloc(n) => n == &c.dest,
							_ => false,
						})
						.unwrap();

					blockloop.push(BfOp::Tag(dest, format!("alloca_{}", c.dest)));
				}

				llvm_ir::Instruction::Store(s) => {
					let dest = layout.iter().position(|cell| match cell {
						Cell::Alloc(n) => n == unlop(&s.address),
						_ => false,
					});

					let value = op_to_reg(&mut layout, &s.value);

					if dest.is_some() {
						let dest = dest.unwrap();

						blockloop.push(BfOp::Zero(dest));
						blockloop.push(BfOp::Mov(value, dest));
					} else {
						let addr = layout
							.iter()
							.position(|c| match c {
								Cell::Ptr(n) => n == unlop(&s.address),
								Cell::Reg(n) => n == unlop(&s.address),
								_ => false,
							})
							.unwrap();

						// take that ptr
						let prev = std::mem::replace(&mut layout[addr], Cell::Free);
						layout[addr] = Cell::Taken(Box::new(prev));

						blockloop.append(&mut build_ptr_train(
							&mut borrow_reg,
							&mut layout,
							addr,
							Some(value),
							None,
						));

						// unimplemented!("store to non-alloca");
					}
				}

				llvm_ir::Instruction::Load(l) => {
					let dest = give_reg(&mut layout, &l.dest);

					let addr = layout.iter().position(|c| match c {
						Cell::Alloc(n) => n == unlop(&l.address),
						_ => false,
					});

					if addr.is_some() {
						let addr = addr.unwrap();

						blockloop.push(BfOp::Tag(
							dest,
							format!(
								"load_%{}_to_%{}",
								n2usize(unlop(&l.address)),
								n2usize(&l.dest)
							),
						));

						let tmp = borrow_reg(&mut layout, 1);

						blockloop.push(BfOp::Tag(tmp, format!("tmp0_for_load")));
						blockloop.push(BfOp::Dup(addr, tmp, dest));
						blockloop.push(BfOp::Mov(tmp, addr));
					} else {
						// ohno it's actually a pointer!?

						let addr = layout
							.iter()
							.position(|c| match c {
								Cell::Ptr(n) => n == unlop(&l.address),
								Cell::Reg(n) => n == unlop(&l.address),
								_ => false,
							})
							.unwrap();

						// take that ptr
						let prev = std::mem::replace(&mut layout[addr], Cell::Free);
						layout[addr] = Cell::Taken(Box::new(prev));

						blockloop.append(&mut build_ptr_train(
							&mut borrow_reg,
							&mut layout,
							addr,
							None,
							Some(dest),
						));
					}
				}

				llvm_ir::Instruction::ICmp(i) => {
					let op0 = op_to_reg(&mut layout, &i.operand0);
					let op1 = op_to_reg(&mut layout, &i.operand1);

					let dest = give_reg(&mut layout, &i.dest);

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
						&mut layout,
						i.predicate,
						op0,
						op1,
						dest,
					));
				}

				llvm_ir::Instruction::Add(i) => {
					let op0 = op_to_reg(&mut layout, &i.operand0);
					let op1 = op_to_reg(&mut layout, &i.operand1);

					let dest = give_reg(&mut layout, &i.dest);

					blockloop.push(BfOp::Tag(
						dest,
						format!("%{}_add_%{}_c{}", i.dest, i.operand0, i.operand1),
					));

					blockloop.push(BfOp::Mov(op0, dest));
					blockloop.push(BfOp::Mov(op1, dest));
				}

				llvm_ir::Instruction::Sub(i) => {
					let op0 = op_to_reg(&mut layout, &i.operand0);
					let op1 = op_to_reg(&mut layout, &i.operand1);

					let dest = give_reg(&mut layout, &i.dest);

					blockloop.push(BfOp::Tag(
						dest,
						format!("%{}_sub_%{}_c{}", i.dest, i.operand0, i.operand1),
					));

					blockloop.append(&mut vec![
						BfOp::Mov(op0, dest),
						BfOp::Loop(op1, vec![BfOp::SubI(op1, 1), BfOp::SubI(dest, 1)]),
					]);
				}

				// these are all lies and actually nops
				llvm_ir::Instruction::ZExt(i) => {
					let src = op_to_reg(&mut layout, &i.operand);
					let dest = give_reg(&mut layout, &i.dest);
					blockloop.push(BfOp::Tag(dest, format!("{}_zext_{}", i.dest, i.operand)));
					blockloop.push(BfOp::Mov(src, dest));
				}
				llvm_ir::Instruction::Trunc(i) => {
					let src = op_to_reg(&mut layout, &i.operand);
					let dest = give_reg(&mut layout, &i.dest);
					blockloop.push(BfOp::Tag(dest, format!("{}_trunc_{}", i.dest, i.operand)));
					blockloop.push(BfOp::Mov(src, dest));
				}
				llvm_ir::Instruction::SExt(i) => {
					let src = op_to_reg(&mut layout, &i.operand);
					let dest = give_reg(&mut layout, &i.dest);
					blockloop.push(BfOp::Tag(dest, format!("{}_sext_{}", i.dest, i.operand)));
					blockloop.push(BfOp::Mov(src, dest));
				}

				llvm_ir::Instruction::PtrToInt(i) => {
					let dest = give_reg(&mut layout, &i.dest);

					blockloop.push(BfOp::Tag(
						dest,
						format!("%{}_ptrtoi_%{}", i.dest, i.operand),
					));

					let ptr = layout
						.iter()
						.position(|c| match c {
							Cell::Alloc(n) => n == unlop(&i.operand),
							_ => false,
						})
						.unwrap();

					let tmp = borrow_reg(&mut layout, 1);

					// basically reach back to the stack pointer and add it to
					// our destination int. This way the initified pointer
					// be basically be:
					// the address of the stack register position
					// +
					// the current stack's position
					blockloop.push(BfOp::Left(1));
					blockloop.push(BfOp::Dup(0, tmp + 1, dest + 1));
					blockloop.push(BfOp::Mov(tmp + 1, 0));
					blockloop.push(BfOp::Right(1));

					// plus 1 since the stack pointer is 1 before main loop
					blockloop.push(BfOp::AddI(dest, ptr as u8 + 1));
				}

				llvm_ir::Instruction::IntToPtr(i) => {
					let src = op_to_reg(&mut layout, &i.operand);
					let dest = give_ptr(&mut layout, &i.dest);
					blockloop.push(BfOp::Tag(dest, format!("{}_itoptr_{}", i.dest, i.operand)));
					blockloop.push(BfOp::Mov(src, dest));
				}

				_ => {
					unimplemented!("instruction? {}", instr);
				}
			}

			layout = layout
				.into_iter()
				.map(|c| match c {
					Cell::Borrowed(c2) => *c2,
					_ => c,
				})
				.collect();

			layout = layout
				.into_iter()
				.map(|c| match c {
					Cell::Taken(_) => Cell::Free,
					_ => c,
				})
				.collect();
		}

		// if it handled a call we know that: the block ended in a call and
		// the terminator was a unconditional branch. These are both
		// rolled into the call instruction generator.
		if !handle_call {
			blockloop.push(BfOp::Comment(block.term.to_string()));

			match &block.term {
				llvm_ir::Terminator::Br(br) => {
					let brto = layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &br.dest,
							_ => false,
						})
						.unwrap();

					blockloop.push(BfOp::Tag(brto, format!("{}/{}", func.name, br.dest)));
					blockloop.push(BfOp::AddI(brto, 1));
				}

				llvm_ir::Terminator::CondBr(cbr) => {
					let cond = take_reg(&mut layout, &unlop(&cbr.condition));

					let tru = layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &cbr.true_dest,
							_ => false,
						})
						.unwrap();

					let fals = layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &cbr.false_dest,
							_ => false,
						})
						.unwrap();

					// TODO(turbio): hacky but well we're using the ret pad
					// block mask as scratch cause like we'll never need it lol.
					let temp0 = retpad_addr;
					blockloop.push(BfOp::AddI(temp0, 1));

					blockloop.append(&mut vec![
						// if truethy
						BfOp::Loop(
							cond,
							vec![
								BfOp::SubI(cond, 1),
								BfOp::SubI(temp0, 1),
								BfOp::AddI(tru, 1),
								BfOp::Tag(
									tru,
									format!("{}/{}_true", func.name, n2usize(&cbr.true_dest)),
								),
							],
						),
						// if falsey
						BfOp::Loop(
							temp0,
							vec![
								BfOp::SubI(temp0, 1),
								BfOp::AddI(fals, 1),
								BfOp::Tag(
									fals,
									format!("{}/{}_false", func.name, n2usize(&cbr.false_dest)),
								),
							],
						),
					]);
				}

				llvm_ir::Terminator::Ret(r) => {
					if r.return_operand.is_some() {
						// TODO(turbio): figure out where to put ret args
						match &r.return_operand.as_ref().unwrap() {
							llvm_ir::Operand::LocalOperand { name, .. } => {
								take_reg(&mut layout, &name);
								// blockloop.push(BfOp::Mov(0, 0));
							}
							llvm_ir::Operand::ConstantOperand(_) => {
								// blockloop.push(BfOp::AddI(0, v as u8));
							}

							_ => unimplemented!("ignoring meta?"),
						};
					}

					for (i, c) in layout.iter().enumerate() {
						match c {
							Cell::Alloc(_) => {
								blockloop.push(BfOp::Zero(i));
							}
							_ => {}
						}
					}

					blockloop.push(BfOp::SubI(0, 1));
					blockloop.push(BfOp::Tag(0, "dead_frame".to_string()));

					blockloop.push(BfOp::SubI(fid, 1));

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

		funcloop.push(BfOp::Loop(bid, blockloop))
	}

	return (
		vec![BfOp::Tag(fid, func.name.clone()), BfOp::Loop(fid, funcloop)],
		layout.len(),
	);
}

const RET_LANDING_PAD: usize = 1;

pub fn compile(path: &Path) -> String {
	let path = path.canonicalize().unwrap();
	let mut module = llvm_ir::Module::from_bc_path(path).unwrap();

	calls_terminate_blocks(&mut module);
	calls_never_in_first_block(&mut module);

	let funcns = module.functions.len();

	let mut root: Vec<BfOp> = vec![];

	let ret_pad_width = 1 + funcns + RET_LANDING_PAD;

	root.push(BfOp::Right(ret_pad_width + STACK_PTR_W));
	root.push(BfOp::AddI(0, ret_pad_width as u8 + STACK_PTR_W as u8)); // stack base address
	root.push(BfOp::Right(1));
	root.push(BfOp::Comment("runtime init:".to_string()));
	root.push(BfOp::Tag(0, "TOP FRAME".to_string()));
	root.push(BfOp::AddI(0, 1));

	// stacks frames are laid out as:
	// <main loop bit> | <func mask> | <block mask> | <registers> | <scratch>
	// the main loop bit: is always `1` and part of the runtime's flow control
	// func/block masks: control the current block of execution
	//
	// all the allocas live for the lifetime of the function. Sorta are actually
	// memory addresses but like that's tricky.
	// let mut allocs: Vec<&llvm_ir::Name> = vec![];
	//
	// live registers available on the stack produced by an instruction and
	// yet to be consumed by a following instruction. Used as a map for
	// allocations where each cell holds a llvm register name.
	//
	// TODO(turbio): for now onstack registers only live between the
	// instruction producing them and the instruction consuming them.
	// Multiple uses is unimplemented.
	let mut layout: Layout = vec![Cell::MainLoop];
	for func in module.functions.iter() {
		layout.push(Cell::FuncMask(func.name.to_string()))
	}

	let mainfid = layout
		.iter()
		.position(|c| match c {
			Cell::FuncMask(n) => n == "main",
			_ => false,
		})
		.unwrap();

	root.push(BfOp::Tag(mainfid, "main".to_string()));
	root.push(BfOp::AddI(mainfid, 1));
	root.push(BfOp::Tag(1 + funcns, "main/b0".to_string()));
	root.push(BfOp::AddI(1 + funcns, 1));

	let mut mainloop: Vec<BfOp> = vec![];

	// ret pad is always the same width with: main loop + function masks +
	// landing pad mask
	let ret_pad_width = 1 + funcns + RET_LANDING_PAD;

	for func in module.functions.iter() {
		let (_, st_width) = build_func(&layout, ret_pad_width, 0, func);

		mainloop.append(&mut build_func(&layout, ret_pad_width, st_width, func).0);
	}

	root.push(BfOp::Loop(0, mainloop));

	let mut out = String::from("");
	printast(&mut out, root);
	out
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
