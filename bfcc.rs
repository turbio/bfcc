extern crate llvm_ir;

use std::fmt;

use std::cell::RefCell;
use std::fmt::Write;
use std::ops::Deref;
use std::path::Path;
use std::rc::Rc;

use std::convert::TryFrom;
use std::convert::TryInto;

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
				if let llvm_ir::Instruction::Call(_) =
					func.basic_blocks[block].instrs[instr]
				{
				} else {
					instr += 1;
					continue;
				}

				// so when we get to a call

				let nextn = llvm_ir::Name::Name(Box::new(format!(
					"call_term_for_{}",
					block
				)));

				let last_instr =
					instr == func.basic_blocks[block].instrs.len() - 1;

				// even if it's the last instr that's a call we still split the
				// block and sprinkle in an uncond br to make things ez
				if last_instr {
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
						instrs: func.basic_blocks[block]
							.instrs
							.split_off(instr + 1),
						term: func.basic_blocks[block].term.clone(),
					};
					func.basic_blocks.insert(block + 1, splitn);

					func.basic_blocks[block].term =
						llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
							debugloc: None,
							dest: nextn.clone(),
						});
				}

				// update all the phi nodes too. Since our block now has a
				// unconditional succ we'll need to rename any phis naming this
				// block to instead name the succ.
				//
				// man... maybe i shoulda done this in cpp cause like... man
				// llvm has all this stufffff
				let orig_block = func.basic_blocks[block].name.clone();
				for bblock in &mut func.basic_blocks {
					for instr in &mut bblock.instrs {
						match instr {
							llvm_ir::Instruction::Phi(phi) => {
								for inval in &mut phi.incoming_values {
									if inval.1 == orig_block {
										inval.1 = nextn.clone();
									}
								}
							}
							_ => {}
						}
					}
				}

				instr += 1;
			}

			block += 1;
		}
	}
}

// TODO: this isn't really the move
// function calls always call into block 0. Thing is, if we're making a call
// from block 0 into another block 0 we could end up end up setting everything
// up for the callee but then then re-entering block 0 in the caller instead of
// the target.
fn calls_never_in_first_block(module: &mut llvm_ir::Module) {
	for func in module.functions.iter_mut() {
		let hascall = func.basic_blocks[0].instrs.iter().any(|i| match i {
			llvm_ir::Instruction::Call(_) => true,
			_ => false,
		});

		if !hascall {
			continue;
		}

		let nextn = llvm_ir::Name::Name(Box::new(format!(
			"no_block0_call_for_{}",
			func.name
		)));

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

#[derive(Debug, Clone)]
struct Addr {
	v: Rc<RefCell<Addrt>>,
}

impl fmt::Display for Addr {
	fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
		write!(f, ".{:?}", self.v.borrow())
	}
}

#[derive(Debug, Clone)]
enum Addrt {
	Fixed(usize),
	Offset(Addr, i64),
	Named(llvm_ir::Name),
}

// type Addr = Rc<RefCell<Addrt>>;

fn offset(s: Addr, i: i64) -> Addr {
	Addr {
		v: Rc::new(RefCell::new(Addrt::Offset(s, i))),
	}
}

fn resaddr(s: Addr) -> usize {
	match s.v.deref().borrow().clone() {
		Addrt::Fixed(u) => u,
		Addrt::Offset(a, o) => (resaddr(a) as i64 + o) as usize,
		Addrt::Named(_) => panic!("named address cant be resolved"),
	}
}

fn fixed_addr(a: usize) -> Addr {
	Addr {
		v: Rc::new(RefCell::new(Addrt::Fixed(a))),
	}
}

#[derive(Debug, Clone)]
enum BfOp {
	// actual brainfuck, these do fucky stuff to the instruction pointer
	Right(usize),
	Left(usize),

	AddI(Addr, u8), // *a + n -> *a : a must be less than 255
	SubI(Addr, u8), // *a - n -> *a : a msut be greater than 0
	Dup(Addr, Addr, Addr), /* *a -> *b, *c : a will be zeroed, b and c must
	                 * be zero */
	//DupThru(Addr, Addr, Addr), /* *a -> *b (c is a tmp) : a will be zeroed,
	//                           * b and c must be zero */

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

// have to promise to give registers before you take them otherwise
// you could end up giving a register you've just taken.
fn give_reg<'a>(
	ctx: &'a mut Ctx,
	name: &llvm_ir::Name,
	multi_use: bool,
) -> Addr {
	assert!(
		!ctx.layout.iter().any(|c| match c {
			Cell::Reg { n, .. } => n == name,
			Cell::Alloc(n) => n == name,
			_ => false,
		}),
		"wtf man, we already have that"
	);

	ctx.layout.push(Cell::Reg {
		n: name.clone(),
		multi_use: multi_use,
	});
	Addr {
		v: Rc::new(RefCell::new(Addrt::Fixed(ctx.layout.len() - 1))),
	}
}

fn op_unwrap_ptr_all(op: &llvm_ir::Operand) -> llvm_ir::Operand {
	let mut op = op.clone();
	while match &op {
		llvm_ir::Operand::LocalOperand { ty, .. } => match ty.deref() {
			llvm_ir::Type::PointerType { .. } => true,
			_ => false,
		},
		_ => false,
	} {
		op = op_unwrap_ptr(&op);
	}

	return op.clone();
}

fn op_unwrap_ptr(op: &llvm_ir::Operand) -> llvm_ir::Operand {
	match op {
		llvm_ir::Operand::LocalOperand { name, ty } => match ty.deref() {
			llvm_ir::Type::PointerType {
				pointee_type: pty,
				addr_space: _,
			} => llvm_ir::Operand::LocalOperand {
				name: name.clone(),
				ty: pty.clone(),
			},
			_ => panic!("no more pointers to unwrap"),
		},
		_ => panic!("no more pointers to unwrap"),
	}
}

// available names is a combination of all the living registers:
// onstack + allocs
fn take_reg(ctx: &Ctx, name: &llvm_ir::Name) -> Addr {
	Addr {
		v: Rc::new(RefCell::new(Addrt::Fixed(
			ctx.layout
				.iter()
				.position(|c| match c {
					Cell::Alloc(n) => n == name,
					Cell::Reg { n, .. } => n == name,
					_ => false,
				})
				.unwrap(),
		))),
	}
}

// get addr of function mask
fn fn_mask(ctx: &mut Ctx, name: &String) -> Addr {
	fixed_addr(
		ctx.layout
			.iter()
			.position(|c| match c {
				Cell::FuncMask(n) => n == name,
				_ => false,
			})
			.unwrap(),
	)
}

// generate the ops to zero all the allocs and fixed regs in a function
fn zero_frame(ctx: &mut Ctx) -> Vec<BfOp> {
	let mut ops = vec![BfOp::Comment(format!("zero all function allocs"))];

	ops.append(
		&mut ctx
			.layout
			.clone()
			.iter()
			.enumerate()
			.filter_map(|(i, c)| match c {
				Cell::Alloc(c) => Some(c),
				Cell::Reg { multi_use: true, n } => Some(n),
				_ => None,
			})
			.map(|a| BfOp::Zero(take_reg(ctx, a)))
			.collect(),
	);

	ops
}

// so like take an instruction operand and do the right thing
// - constant registers (allocas) return said register
// - constants will reserve a temp register and store the value there
// - pointers will reserve a temp and store the pointer's int value
// the returned reg MUST be consumed if it is one of the latter two. the former
// depends on what the producing function expects.
fn op_to_reg<'a>(ctx: &'a mut Ctx, op: &llvm_ir::Operand) -> (Addr, Vec<BfOp>) {
	match op {
		llvm_ir::Operand::LocalOperand { name, ty } => match ty.deref() {
			llvm_ir::Type::IntegerType { .. } => (take_reg(ctx, name), vec![]),

			llvm_ir::Type::PointerType {
				pointee_type: _,
				addr_space: _,
			} => {
				let from_alloc = ctx.layout.iter().position(|c| match c {
					Cell::Alloc(n) => n == name,
					_ => false,
				});

				if from_alloc.is_some() {
					let from_alloc = from_alloc.unwrap();

					let pasi = borrow_reg(ctx, 1);
					let tmp = borrow_reg(ctx, 1);

					(
						pasi.clone(),
						vec![
							// basically reach back to the stack pointer and
							// add it to our destination int. This way the
							// initified pointer be basically be:
							// the address of the stack register position
							// +
							// the current stack's position
							BfOp::Comment(format!(
								"op_to_reg storing pointer value in temp address"
							)),
							BfOp::Tag(
								pasi.clone(),
								format!("tmp_allocptr_{}", name),
							),
							BfOp::Tag(
								tmp.clone(),
								format!("tmp_allocptr_tru_{}", name),
							),
							BfOp::Left(1),
							BfOp::Dup(
								fixed_addr(0),
								offset(pasi.clone(), 1),
								offset(tmp.clone(), 1),
							),
							BfOp::Mov(offset(tmp.clone(), 1), fixed_addr(0)),
							BfOp::Right(1),
							BfOp::AddI(pasi, from_alloc as u8 + 1),
						],
					)
				} else {
					let found =
						ctx.addrs.iter().find(|a| match a.v.borrow().clone() {
							Addrt::Named(n) => &n == name,
							_ => false,
						});

					if found.is_some() {
						return (found.unwrap().clone(), vec![]);
					}

					(
						fixed_addr(
							ctx.layout
								.iter()
								.position(|c| match c {
									Cell::Reg { n, .. } => n == name,
									_ => false,
								})
								.unwrap(),
						),
						vec![],
					)
				}
			}

			_ => unimplemented!("meta?"),
		},
		llvm_ir::Operand::ConstantOperand(_) => {
			let tmp = borrow_reg(ctx, 1);
			let v = uncop(op);
			(
				tmp.clone(),
				vec![
					BfOp::Comment(format!(
						"op_to_reg storing const value in temp address"
					)),
					BfOp::Tag(tmp.clone(), format!("constop_{}", v)),
					BfOp::AddI(tmp.clone(), v as u8),
				],
			)
		}

		_ => unimplemented!("lol cucked"),
	}
}

// borrow a register for scratch space.you just have to really
// really really promise to not leave any junk beyond the lifetime
// of the instruction. Otherwise absolute chaos ensues since
// this potentially borrows control flow regs.
//
// TODO(turbio): also also this needs to be used after all gives/takes
fn borrow_reg(ctx: &mut Ctx, contig: usize) -> Addr {
	for i in 0..(ctx.layout.len() - contig) {
		for j in 0..contig {
			let c = &ctx.layout[i + j];

			if !match c {
				Cell::Free => true,
				_ => false,
			} {
				break;
			}

			if j == contig - 1 {
				for c in 0..contig {
					let prev =
						std::mem::replace(&mut ctx.layout[i + c], Cell::Free);
					ctx.layout[i + c] = Cell::Borrowed(Box::new(prev));
				}
				return fixed_addr(i);
			}
		}
	}

	let slot = ctx.layout.len();
	for _ in 0..contig {
		ctx.layout.push(Cell::Borrowed(Box::new(Cell::Free)));
	}
	fixed_addr(slot)
}

// these are all based around sub w/o underflow:
// a | ... | u flag | ... | b | 0 | 1res
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
// cause the cell to go negative then this address will be the difference.
fn subnu<'a>(
	ctx: &'a mut Ctx,

	minuend: Addr,
	subtractend: Addr,
	underflow: Option<Addr>,
) -> (Vec<BfOp>, Addr) {
	let tmps = borrow_reg(ctx, 3);
	let tmpb = tmps.clone();
	let tmp0 = offset(tmps.clone(), 1);
	let tmp1 = offset(tmps.clone(), 2);

	(
		vec![
			BfOp::Tag(tmpb.clone(), format!("subnu_tmpb")),
			BfOp::Tag(tmp0, format!("subnu_tmp0")),
			BfOp::Tag(tmp1.clone(), format!("subnu_tmp1")),
			BfOp::Mov(minuend, tmpb.clone()),
			BfOp::AddI(tmp1.clone(), 1),
			BfOp::Loop(
				subtractend.clone(),
				vec![
					BfOp::SubI(subtractend.clone(), 1),
					if underflow.is_some() {
						BfOp::AddI(underflow.clone().unwrap(), 1)
					} else {
						BfOp::Nop
					},
					BfOp::Loop(
						tmpb.clone(),
						vec![
							BfOp::SubI(tmpb.clone(), 1),
							if underflow.is_some() {
								BfOp::SubI(underflow.clone().unwrap(), 1)
							} else {
								BfOp::Nop
							},
							BfOp::Right(1),
						],
					),
					BfOp::Right(1),
					BfOp::Loop(tmpb.clone(), vec![BfOp::Left(1)]),
					BfOp::Left(1),
				],
			),
			BfOp::SubI(tmp1.clone(), 1),
		],
		tmpb.clone(),
	)
}

// all the u8 icmp ops built from underflowing subtract.
fn build_icmp<'a>(
	ctx: &'a mut Ctx,
	pred: llvm_ir::IntPredicate,
	op0: Addr,
	op1: Addr,
	dest: Addr,
) -> Vec<BfOp> {
	let mut icmp_out = Vec::<BfOp>::new();

	// So like all the int comparisons are done by subtracting w the underflow
	// flag. So like equality is checked by subnu, if the result is 0 and the
	// underflow is 0 the operands must be equal. From there it's just a matter
	// of setting the dest address to 1 or 0.

	match pred {
		llvm_ir::IntPredicate::SLT | llvm_ir::IntPredicate::ULT => {
			let (mut ops, diff) = subnu(ctx, op1, op0, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::Loop(
				diff.clone(),
				vec![BfOp::Zero(diff.clone()), BfOp::AddI(dest.clone(), 1)],
			));
		}

		llvm_ir::IntPredicate::NE => {
			let underflow = borrow_reg(ctx, 1);

			let (mut ops, diff) = subnu(ctx, op0, op1, Some(underflow.clone()));

			icmp_out.append(&mut ops);

			// don't need to worry about casting to i1 since it'll either
			// underflow xor have a remainter
			icmp_out.push(BfOp::Loop(
				diff.clone(),
				vec![BfOp::Zero(diff.clone()), BfOp::AddI(dest.clone(), 1)],
			));
			icmp_out.push(BfOp::Loop(
				underflow.clone(),
				vec![
					BfOp::Zero(underflow.clone()),
					BfOp::AddI(dest.clone(), 1),
				],
			));
		}

		llvm_ir::IntPredicate::SLE | llvm_ir::IntPredicate::ULE => {
			let (mut ops, diff) = subnu(ctx, op0, op1, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::AddI(dest.clone(), 1));
			icmp_out.push(BfOp::Loop(
				diff.clone(),
				vec![BfOp::Zero(diff.clone()), BfOp::Zero(dest.clone())],
			));
		}

		llvm_ir::IntPredicate::SGE | llvm_ir::IntPredicate::UGE => {
			let (mut ops, diff) = subnu(ctx, op1, op0, None);
			icmp_out.append(&mut ops);
			icmp_out.push(BfOp::AddI(dest.clone(), 1));
			icmp_out.push(BfOp::Loop(
				diff.clone(),
				vec![BfOp::Zero(diff.clone()), BfOp::Zero(dest.clone())],
			));
		}

		llvm_ir::IntPredicate::EQ => {
			let underflow = borrow_reg(ctx, 1);

			let (mut ops, diff) = subnu(ctx, op1, op0, Some(underflow.clone()));
			icmp_out.append(&mut ops);

			icmp_out.push(BfOp::AddI(dest.clone(), 1));

			icmp_out.push(BfOp::Loop(
				diff.clone(),
				vec![BfOp::Zero(diff.clone()), BfOp::Zero(dest.clone())],
			));
			icmp_out.push(BfOp::Loop(
				underflow.clone(),
				vec![BfOp::Zero(underflow.clone()), BfOp::Zero(dest.clone())],
			));
		}

		llvm_ir::IntPredicate::SGT | llvm_ir::IntPredicate::UGT => {
			let (mut ops, diff) = subnu(ctx, op0, op1, None);
			icmp_out.append(&mut ops);

			icmp_out.push(BfOp::Loop(
				diff.clone(),
				vec![BfOp::Zero(diff.clone()), BfOp::AddI(dest.clone(), 1)],
			));
		}
	}

	icmp_out
}

#[derive(Debug, Clone)]
enum Cell {
	//Args,
	//StackPtr,
	MainLoop,

	FuncMask(String),
	BlockMask(llvm_ir::Name),

	Borrowed(Box<Cell>),

	Alloc(llvm_ir::Name),
	Reg { n: llvm_ir::Name, multi_use: bool },

	Free,
}

type Layout = Vec<Cell>;

const STACK_PTR_W: usize = 1;

// How do you deref an address when you're lost in a sea of tape?
fn build_ptr_train(
	ctx: &mut Ctx,

	addr: Addr, // the actual address to visit
	store: Option<Addr>, /* if set the value at `store` is taken and stored
	             * at `addr` */
	load: Option<Addr>, // if set the value at `addr` is copied put in `load`
) -> Vec<BfOp> {
	let mut routine = Vec::<BfOp>::new();

	// The engines don't move the ship at all. The ship stays where it is and
	// the engines move the universe around it

	// this is pretty hairy. The general idea is to copy the pointer value into
	// a region which is then moved as a unit until it reaches the address
	// pointed to.
	//
	// for example: say we have the tape:
	//
	// | tmp | ret | ptr | ? | ? | value | ptr | ? |
	//                               ^      |
	//                               |      |
	//                               +------+
	//
	// Where we want to deref `ptr`, which points to `value`. `ptr` is at a
	// known offset from the current tape address. In this example the `ptr`
	// would have value 5.
	//
	// copying `ptr` to the train would load 2 in the ptr cell since the trains
	// own location in memory must be accounted for.
	//
	// | 0 | 0 | 2 | ? | ? | value | ptr | ? |
	//
	// and then just repeatedly move one cell forward... ptr copy is
	// decremented and a return counter is incremented.
	//
	// | ? | 0 | 1 | 1 | ? | value | ptr | ? |
	//
	// until ptr is zero.
	//
	// | ? | ? | 0 | 2 | 0 | value | ptr | ? |
	//
	// then the cell right after the train aka `value` is loaded in and we drive
	// back using ret.
	//
	// | ? | ? | 0 | 2 | value | value | ptr | ? |
	//
	// | ? | 0 | 1 | value | ? | value | ptr | ? |
	//
	// | 0 | 0 | value | ? | ? | value | ptr | ? |
	//
	// it's like a train! choo choo

	// layout of a train is:
	// to store:   <before> | tmp | ret | ptr   | cargo | <behind>
	// from store: <before> | tmp | ret | 0     | 0     | <behind>
	// to load:    <before> | tmp | ret | ptr   | <behind>
	// from load:  <before> | tmp | ret | cargo | <behind>

	let is_store = store.is_some();

	let train_len = if is_store { 4 } else { 3 };

	let train = borrow_reg(ctx, train_len);

	let train_tmp = offset(train.clone(), 0);
	let train_ret = offset(train.clone(), 1);
	let train_ptr = offset(train.clone(), 2);

	let train_cargo = offset(train.clone(), 3); // this is only valid when storing

	let before_train = offset(train.clone(), -1);
	let behind_train = offset(train.clone(), train_len as i64); // train_cargo + 1;

	// while driving forward train is layed out like:
	// <before> | tmp | ret | ptr | cargo | <behind>

	routine.append(&mut vec![
		BfOp::Tag(train_tmp.clone(), format!("train_tmp")),
		BfOp::Tag(train_ret.clone(), format!("train_ret")),
		BfOp::Tag(train_ptr.clone(), format!("train_ptr")),
		if is_store {
			BfOp::Tag(train_cargo.clone(), format!("train_cargo"))
		} else {
			BfOp::Nop
		},
	]);

	// this is all just concerned with getting the right value into the train's
	// ptr
	{
		// so when moving left really we want to calculate the equivalent of:
		// stack_pointer - addr + train_address
		//
		// first we sub addr from stackpointer, a negative result indicating the
		// address is to the left of the current stack frame
		//
		// moving &train to train_ptr
		// routine.push(BfOp::AddI(train_ptr, train as u8));

		let stackptr_tmp = borrow_reg(ctx, 1);
		let stackptr = borrow_reg(ctx, 1);

		routine.push(BfOp::Tag(stackptr.clone(), format!("stackptr")));
		routine.push(BfOp::Tag(stackptr_tmp.clone(), format!("stackptr_tmp")));

		// grab the stackptr
		routine.append(&mut vec![
			BfOp::Left(1),
			BfOp::Dup(
				fixed_addr(0),
				offset(stackptr_tmp.clone(), 1),
				offset(stackptr.clone(), 1),
			),
			BfOp::Mov(offset(stackptr_tmp.clone(), 1), fixed_addr(0)),
			BfOp::Right(1),
		]);

		let neg = borrow_reg(ctx, 1);
		routine.push(BfOp::Tag(neg.clone(), format!("ptr_underflow")));

		let (mut ops, to) =
			subnu(ctx, stackptr.clone(), addr, Some(neg.clone()));
		routine.append(&mut ops);

		routine.push(BfOp::Tag(to.clone(), format!("subnu_to")));

		routine.append(&mut vec![
			// if pos
			// train_ptr = &train + abs(stackptr - addr)
			BfOp::Loop(
				to.clone(),
				vec![
					BfOp::Comment(format!("if pos")),
					BfOp::Mov(to.clone(), train_ptr.clone()),
					// TODO: would be cool do defer resolution here so we're
					// carrying around resolvable values
					BfOp::AddI(train_ptr.clone(), resaddr(train.clone()) as u8),
				],
			),
			// if neg
			// train_ptr = &train + abs(stackptr - addr)
			BfOp::Loop(
				neg.clone(),
				vec![
					BfOp::Comment(format!("if neg")),
					BfOp::AddI(train_ptr.clone(), resaddr(train.clone()) as u8),
					BfOp::Loop(
						neg.clone(),
						vec![
							BfOp::SubI(neg.clone(), 1),
							BfOp::SubI(train_ptr.clone(), 1),
						],
					),
				],
			),
		]);
	}

	if is_store {
		// load in the cargo hehe
		routine.push(BfOp::Mov(store.clone().unwrap(), train_cargo.clone()));
	}

	routine.push(BfOp::Comment(format!("drive left! choo choo")));

	// time to drive! choo choo!
	routine.append(&mut vec![BfOp::Loop(
		train_ptr.clone(),
		vec![
			BfOp::Mov(train_ret.clone(), train_tmp.clone()),
			BfOp::Mov(train_ptr.clone(), train_ret.clone()),
			if is_store {
				BfOp::Mov(train_cargo.clone(), train_ptr.clone())
			} else {
				BfOp::Nop
			},
			BfOp::Mov(before_train.clone(), offset(behind_train.clone(), -1)),
			BfOp::Left(1),
			BfOp::SubI(train_ptr.clone(), 1),
			BfOp::AddI(train_ret.clone(), 1),
		],
	)]);

	if is_store {
		// unload the cargo
		routine.push(BfOp::Zero(before_train.clone()));
		routine.push(BfOp::Mov(train_cargo.clone(), before_train.clone()));
	} else if load.is_some() {
		routine.push(BfOp::Comment(format!("get our bag")));
		routine.push(BfOp::Dup(
			before_train.clone(),
			train_tmp.clone(),
			train_ptr.clone(),
		));
		routine.push(BfOp::Mov(train_tmp.clone(), before_train.clone()));
	}

	// reverse outta there dude
	routine.append(&mut vec![BfOp::Loop(
		train_ret.clone(),
		vec![
			BfOp::Mov(behind_train.clone(), train_tmp.clone()),
			if load.is_some() {
				BfOp::Mov(train_ptr.clone(), behind_train.clone())
			} else {
				BfOp::Nop
			},
			BfOp::Mov(train_ret.clone(), train_ptr.clone()),
			BfOp::Right(1),
			BfOp::SubI(train_ret.clone(), 1),
		],
	)]);

	if load.is_some() {
		routine.push(BfOp::Mov(train_ptr.clone(), load.unwrap()));
	}

	routine
}

#[derive(Debug)]
struct Ctx {
	layout: Layout,
	addrs: Vec<Addr>,
	ret_pad_width: Option<usize>,
	stack_width: Option<usize>,
	entry_block_addr: Option<usize>,
	retpad_addr: Option<Addr>,
	ownfid: Option<usize>,
}

enum RetMeta {
	Addr,
	InPlace,
	None,
}

#[derive(Debug)]
enum BuilderArgs {
	ConsumedReg(Addr),
	PreservedReg(Addr),
	Alloc(Addr),
	Const(usize),
}

struct InstrMeta<'a> {
	builders: &'a [(
		RetMeta,
		fn(
			&mut Ctx,
			&llvm_ir::Instruction,
			&llvm_ir::BasicBlock,
			&[BuilderArgs],
			Option<Addr>,
		) -> Vec<BfOp>,
	)],
}

fn build_sub(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let (op0, o0) = builder_args_to_consumable_reg(ctx, &args[0]);
	let (op1, o1) = builder_args_to_consumable_reg(ctx, &args[1]);

	let dest = ret.unwrap();

	vec![]
		.into_iter()
		.chain(o0)
		.chain(o1)
		.chain(vec![
			BfOp::Mov(op0.clone(), dest.clone()),
			BfOp::Loop(
				op1.clone(),
				vec![BfOp::SubI(op1.clone(), 1), BfOp::SubI(dest.clone(), 1)],
			),
		])
		.collect()
}

fn build_or(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let (op0, o0) = builder_args_to_consumable_reg(ctx, &args[0]);
	let (op1, o1) = builder_args_to_consumable_reg(ctx, &args[1]);

	let dest = ret.unwrap();

	vec![]
		.into_iter()
		.chain(o0)
		.chain(o1)
		.chain(vec![
			BfOp::Loop(
				op0.clone(),
				vec![
					BfOp::AddI(dest.clone(), 1),
					BfOp::Zero(op0.clone()),
					BfOp::Zero(op1.clone()),
				],
			),
			BfOp::Loop(
				op1.clone(),
				vec![BfOp::AddI(dest.clone(), 1), BfOp::Zero(op1.clone())],
			),
		])
		.collect()
}

fn build_and(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let (op0, o0) = builder_args_to_consumable_reg(ctx, &args[0]);
	let (op1, o1) = builder_args_to_consumable_reg(ctx, &args[1]);

	let dest = ret.unwrap();

	vec![]
		.into_iter()
		.chain(o0)
		.chain(o1)
		.chain(vec![
			BfOp::Loop(
				op0.clone(),
				vec![
					BfOp::Loop(
						op1.clone(),
						vec![
							BfOp::AddI(dest.clone(), 1),
							BfOp::Zero(op1.clone()),
						],
					),
					BfOp::Zero(op0.clone()),
				],
			),
			BfOp::Zero(op1.clone()),
		])
		.collect()
}

fn build_add(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let dest = ret.unwrap();

	let (op0, o0) = builder_args_to_consumable_reg(ctx, &args[0]);
	let (op1, o1) = builder_args_to_consumable_reg(ctx, &args[1]);

	vec![]
		.into_iter()
		.chain(o0)
		.chain(o1)
		.chain(vec![
			BfOp::Mov(op0.clone(), dest.clone()),
			BfOp::Loop(
				op1.clone(),
				vec![BfOp::SubI(op1.clone(), 1), BfOp::AddI(dest.clone(), 1)],
			),
		])
		.collect()
}

fn build_sub_in_place(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let op0 = match &args[0] {
		BuilderArgs::ConsumedReg(addr) => addr,
		_ => panic!(),
	};
	let op1 = match &args[1] {
		BuilderArgs::ConsumedReg(addr) => addr,
		_ => panic!(),
	};

	vec![BfOp::Loop(
		op1.clone(),
		vec![BfOp::SubI(op1.clone(), 1), BfOp::SubI(op0.clone(), 1)],
	)]
}

fn build_nop_move(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let (op0, o0) = builder_args_to_consumable_reg(ctx, &args[0]);

	o0.into_iter()
		.chain(vec![BfOp::Mov(op0.clone(), ret.clone().unwrap())])
		.collect()
}

fn build_icmp_instr(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let (op0, o0) = builder_args_to_consumable_reg(ctx, &args[0]);
	let (op1, o1) = builder_args_to_consumable_reg(ctx, &args[1]);

	let i: llvm_ir::instruction::ICmp = i.clone().try_into().unwrap();

	vec![]
		.into_iter()
		.chain(o0)
		.chain(o1)
		.chain(build_icmp(
			ctx,
			i.predicate,
			op0.clone(),
			op1.clone(),
			ret.unwrap(),
		))
		.collect()
}

fn builder_args_to_consumable_reg<'a>(
	ctx: &mut Ctx,
	ba: &BuilderArgs,
) -> (Addr, Vec<BfOp>) {
	match ba {
		BuilderArgs::ConsumedReg(a) => (a.clone(), vec![]),
		BuilderArgs::PreservedReg(a) => {
			let tmp = borrow_reg(ctx, 1);
			let consumable = borrow_reg(ctx, 1);

			(
				consumable.clone(),
				vec![
					BfOp::Dup(a.clone(), tmp.clone(), consumable.clone()),
					BfOp::Mov(tmp.clone(), a.clone()),
				],
			)
		}
		BuilderArgs::Alloc(a) => {
			let pasi = borrow_reg(ctx, 1);
			let tmp = borrow_reg(ctx, 1);

			(
				pasi.clone(),
				vec![
					// basically reach back to the stack pointer and
					// add it to our destination int. This way the
					// initified pointer be basically be:
					// the address of the stack register position
					// +
					// the current stack's position
					BfOp::Comment(format!(
						"resolve alloca addr storing pointer value in temp address"
					)),
					BfOp::Left(1),
					BfOp::Dup(
						fixed_addr(0),
						offset(pasi.clone(), 1),
						offset(tmp.clone(), 1),
					),
					BfOp::Mov(offset(tmp.clone(), 1), fixed_addr(0)),
					BfOp::Right(1),
					BfOp::AddI(pasi, resaddr(a.clone()) as u8 + 1),
				],
			)
		}
		BuilderArgs::Const(v) => {
			let tmp = borrow_reg(ctx, 1);
			(
				tmp.clone(),
				vec![
					BfOp::Comment(format!(
						"op_to_reg storing const value in temp address"
					)),
					BfOp::Tag(tmp.clone(), format!("constop_{}", v)),
					BfOp::AddI(tmp.clone(), *v as u8),
				],
			)
		}
	}
}

fn build_store(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs], // order is [value, address]
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let (val, mut o0) = builder_args_to_consumable_reg(ctx, &args[0]);

	if let BuilderArgs::Alloc(addr) = &args[1] {
		vec![]
			.into_iter()
			.chain(o0)
			.chain(vec![BfOp::Zero(addr.clone()), BfOp::Mov(val, addr.clone())])
			.collect()
	} else {
		let (addr, mut o1) = builder_args_to_consumable_reg(ctx, &args[1]);

		vec![]
			.into_iter()
			.chain(o0)
			.chain(o1)
			.chain(build_ptr_train(ctx, addr.clone(), Some(val.clone()), None))
			.collect()
	}
}

fn build_select(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	let ret = ret.unwrap();
	let (cond, mut o0) = builder_args_to_consumable_reg(ctx, &args[0]);
	let (tru, mut o1) = builder_args_to_consumable_reg(ctx, &args[1]);
	let (fals, mut o2) = builder_args_to_consumable_reg(ctx, &args[2]);

	let tmp = borrow_reg(ctx, 1);

	vec![]
		.into_iter()
		.chain(o0)
		.chain(o1)
		.chain(o2)
		.chain(vec![
			BfOp::AddI(tmp.clone(), 1),
			BfOp::Loop(
				cond.clone(),
				vec![
					BfOp::Mov(tru.clone(), ret.clone()),
					BfOp::Zero(fals.clone()),
					BfOp::Zero(cond.clone()),
					BfOp::Zero(tmp.clone()),
				],
			),
			BfOp::Loop(
				tmp.clone(),
				vec![
					BfOp::SubI(tmp.clone(), 1),
					BfOp::Mov(fals.clone(), ret.clone()),
					BfOp::Zero(tru.clone()),
					BfOp::Zero(cond.clone()),
				],
			),
		])
		.collect()
}

fn build_load(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	if let BuilderArgs::Alloc(addr) = &args[0] {
		let tmp = borrow_reg(ctx, 1);
		vec![
			BfOp::Dup(addr.clone(), ret.unwrap(), tmp.clone()),
			BfOp::Mov(tmp.clone(), addr.clone()),
		]
	} else {
		let (addr, o) = builder_args_to_consumable_reg(ctx, &args[0]);
		vec![]
			.into_iter()
			.chain(o)
			.chain(build_ptr_train(ctx, addr, None, Some(ret.unwrap())))
			.collect()
	}
}

fn build_call(
	ctx: &mut Ctx,
	i: &llvm_ir::Instruction,
	block: &llvm_ir::BasicBlock,
	args: &[BuilderArgs],
	ret: Option<Addr>,
) -> Vec<BfOp> {
	assert!(ret.is_none());
	let c = match i {
		llvm_ir::Instruction::Call(c) => c,
		_ => panic!("ohnoonono"),
	};

	let br = match &block.term {
		llvm_ir::Terminator::Br(br) => &br.dest,
		_ => unreachable!("terminator of call block must be branch"),
	};

	let callee_name =
		match c.function.as_ref().unwrap_right().as_constant().unwrap() {
			llvm_ir::Constant::GlobalReference { name, .. } => n2nam(&name),

			_ => unimplemented!(
				"ohnoes wtf?? {:?}",
				c.function.as_ref().unwrap_right().as_constant().unwrap()
			),
		};

	// TODO(turbio): even an instric call will end in a
	// branch lol that could be a lil better

	// after the call returns branch to this block. Earlier
	// we made sure all calls are at the end of a block
	// which always ends in an unconditional branch.
	let brto = ctx
		.layout
		.iter()
		.position(|c| match c {
			Cell::BlockMask(n) => n == br,
			_ => false,
		})
		.unwrap();

	let mut callops = vec![];

	let ret_pad_width = ctx.ret_pad_width.unwrap();
	let stack_width = ctx.stack_width.unwrap();

	let retpad_addr = ctx.retpad_addr.clone().unwrap();
	let entry_block_addr = ctx.entry_block_addr.unwrap();

	let own_func_name = "caller";

	callops.push(BfOp::Comment(
		"enable next block when we return".to_string(),
	));
	callops.push(BfOp::Tag(
		fixed_addr(brto),
		format!("{}/{}", own_func_name, br),
	));
	callops.push(BfOp::AddI(fixed_addr(brto), 1));

	if callee_name.starts_with("llvm.lifetime") {
		callops.push(BfOp::Comment(format!("ignoring llvm intrinsic")));
		return callops;
	}

	// intrinsics lol
	if callee_name == "putchar" {
		assert!(c.dest.is_none(), "putchar returns nothing");
		assert!(c.arguments.len() == 1, "putchar expects one argument");

		//let val = uncop(&c.arguments[0].0);

		callops.push(BfOp::Comment("putchar intrinsic".to_string()));

		/*
		let reg = match &c.arguments[0].0 {
			llvm_ir::Operand::LocalOperand { name, .. } => take_reg(ctx, &name),
			llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
				llvm_ir::constant::Constant::Int { value, .. } => {
					let temp0 = borrow_reg(ctx, 1);
					callops.push(BfOp::AddI(temp0.clone(), *value as u8));
					temp0.clone()
				}
				_ => unimplemented!("how tf we gonna store that"),
			},

			_ => unimplemented!("ignoring meta?"),
		};
		*/

		let (reg, mut o) = builder_args_to_consumable_reg(ctx, &args[0]);
		callops.append(&mut o);
		callops.push(BfOp::Putch(reg.clone()));
		callops.push(BfOp::Zero(reg.clone()));

		return callops;
	}

	callops.push(BfOp::Comment(format!("stack_width {}", stack_width)));
	callops.push(BfOp::Comment(format!("ret_pad_width {}", ret_pad_width)));

	for (i, ar) in args.iter().enumerate() {
		callops.push(BfOp::Comment(format!("copy up arg {}", i)));

		let arg_at =
			stack_width + ret_pad_width + 1 + (c.arguments.len() - 1 - i);

		callops.push(BfOp::Tag(fixed_addr(arg_at), format!("arg_{}", i)));

		let (ar, mut o) = builder_args_to_consumable_reg(ctx, &ar);
		callops.append(&mut o);

		// TODO(turbio): copy up those args yikers
		callops.push(BfOp::Mov(ar, fixed_addr(arg_at)));
	}

	// stack pointer always goes right before the main
	// loop and after the args
	// copy our stack ptr into the callee's plus our
	// frame size
	let callee_st_ptr =
		fixed_addr(stack_width + ret_pad_width + 1 + c.arguments.len());

	callops.push(BfOp::Comment(format!("give callee a stack pointer")));
	callops.push(BfOp::Tag(callee_st_ptr.clone(), format!("stack_ptr")));
	callops.push(BfOp::AddI(
		callee_st_ptr.clone(),
		(stack_width + ret_pad_width + 3) as u8,
	));
	callops.push(BfOp::Left(1)); // forbidden territory
	callops.push(BfOp::Dup(
		fixed_addr(0),
		offset(callee_st_ptr.clone(), 1),
		offset(callee_st_ptr.clone(), 2),
	));
	callops.push(BfOp::Mov(offset(callee_st_ptr.clone(), 2), fixed_addr(0)));
	callops.push(BfOp::Right(1));

	// setup the jump pad

	callops.push(BfOp::Right(stack_width));

	callops.push(BfOp::Tag(fixed_addr(0), format!("JUMP_PAD")));
	callops.push(BfOp::AddI(fixed_addr(0), 1));

	callops.push(BfOp::Tag(
		fixed_addr(ctx.ownfid.unwrap()),
		format!("{}", own_func_name),
	));
	callops.push(BfOp::AddI(fixed_addr(ctx.ownfid.unwrap()), 1));

	callops.push(BfOp::Tag(
		retpad_addr.clone(),
		format!("{}/jump_pad_blk", own_func_name),
	));
	callops.push(BfOp::AddI(retpad_addr.clone(), 1));

	// move to callee's frame loc

	callops.push(BfOp::Right(
		c.arguments.len() + ret_pad_width + 1 + STACK_PTR_W,
	));

	// setup the callee's frame

	callops.push(BfOp::Tag(
		fixed_addr(0),
		format!("===FRAME_{}", callee_name),
	));
	callops.push(BfOp::AddI(fixed_addr(0), 1));

	let callee_fid = ctx
		.layout
		.iter()
		.position(|c| match c {
			Cell::FuncMask(n) => n == &callee_name,
			_ => false,
		})
		.unwrap();

	callops.push(BfOp::Tag(
		fixed_addr(callee_fid),
		format!("{}", callee_name),
	));
	callops.push(BfOp::AddI(fixed_addr(callee_fid), 1));
	callops.push(BfOp::Tag(
		fixed_addr(entry_block_addr),
		format!("{}/b0", callee_name),
	));
	callops.push(BfOp::AddI(fixed_addr(entry_block_addr), 1));

	callops
}

fn instr_name(i: &llvm_ir::Instruction) -> &str {
	match i {
		llvm_ir::Instruction::Store(_) => "store",
		llvm_ir::Instruction::Load(_) => "load",
		llvm_ir::Instruction::Add(_) => "add",
		llvm_ir::Instruction::Sub(_) => "sub",
		llvm_ir::Instruction::ZExt(_) => "zext",
		llvm_ir::Instruction::Trunc(_) => "trunc",
		llvm_ir::Instruction::SExt(_) => "sext",
		llvm_ir::Instruction::IntToPtr(_) => "inttoptr",
		llvm_ir::Instruction::PtrToInt(_) => "ptrtoint",
		llvm_ir::Instruction::Phi(_) => "phi",
		llvm_ir::Instruction::Or(_) => "or",
		llvm_ir::Instruction::And(_) => "and",
		_ => unimplemented!("lookup for {}", i),
	}
}

fn instr_consumes<'i>(
	ctx: &Ctx,
	i: &'i llvm_ir::Instruction,
) -> Vec<&'i llvm_ir::Name> {
	instr_opers(ctx, i)
		.iter()
		.filter_map(|o| match o {
			llvm_ir::Operand::LocalOperand { name, ty } => Some(name),
			_ => None,
		})
		.filter(|on| {
			// allocas are never actually consumed. We either take
			// their address or dup out the value.
			ctx.layout
				.iter()
				.find(|c| match c {
					Cell::Alloc(n) => &n == on,
					_ => false,
				})
				.is_none()
		})
		.collect()
}

fn consumed_op_to_reg(
	ctx: &mut Ctx,
	operand: &llvm_ir::Operand,
	multi_use: &Vec<&llvm_ir::Name>,
) -> (Addr, Vec<BfOp>) {
	match operand {
		llvm_ir::Operand::LocalOperand { name, ty } => {
			if multi_use.contains(&name) {
				let tmp = borrow_reg(ctx, 1);
				let consumable = borrow_reg(ctx, 1);

				let (nonconsumable, o) = op_to_reg(ctx, operand);
				assert!(o.len() == 0, "{:?}", o);

				(
					consumable.clone(),
					vec![
						BfOp::Dup(
							nonconsumable.clone(),
							tmp.clone(),
							consumable.clone(),
						),
						BfOp::Mov(tmp.clone(), nonconsumable.clone()),
					],
				)
			} else {
				op_to_reg(ctx, operand)
			}
		}
		_ => op_to_reg(ctx, operand),
	}
}

fn instr_opers<'i>(
	ctx: &Ctx,
	i: &'i llvm_ir::Instruction,
) -> Vec<&'i llvm_ir::Operand> {
	match i {
		llvm_ir::Instruction::Store(i) => vec![&i.value, &i.address],
		llvm_ir::Instruction::Load(i) => vec![&i.address],
		llvm_ir::Instruction::Add(i) => vec![&i.operand0, &i.operand1],
		llvm_ir::Instruction::Sub(i) => vec![&i.operand0, &i.operand1],
		llvm_ir::Instruction::ZExt(i) => vec![&i.operand],
		llvm_ir::Instruction::Trunc(i) => vec![&i.operand],
		llvm_ir::Instruction::SExt(i) => vec![&i.operand],
		llvm_ir::Instruction::IntToPtr(i) => vec![&i.operand],
		llvm_ir::Instruction::PtrToInt(i) => vec![&i.operand],
		llvm_ir::Instruction::ICmp(i) => vec![&i.operand0, &i.operand1],
		llvm_ir::Instruction::Or(i) => vec![&i.operand0, &i.operand1],
		llvm_ir::Instruction::And(i) => vec![&i.operand0, &i.operand1],
		llvm_ir::Instruction::BitCast(i) => vec![&i.operand],
		llvm_ir::Instruction::Select(i) => {
			vec![&i.condition, &i.true_value, &i.false_value]
		}
		llvm_ir::Instruction::Alloca(i) => vec![],
		llvm_ir::Instruction::Phi(i) => {
			i.incoming_values.iter().map(|(o, _)| o).collect()
		}
		llvm_ir::Instruction::Call(i) => {
			i.arguments.iter().map(|a| &a.0).collect()
		}
		_ => unimplemented!("lookup for {}", i),
	}
}

fn lookup_instr(i: &llvm_ir::Instruction) -> &'static InstrMeta<'static> {
	match i {
		llvm_ir::Instruction::Select(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_select)],
		},
		llvm_ir::Instruction::Call(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_call)],
		},
		llvm_ir::Instruction::ICmp(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_icmp_instr)],
		},
		llvm_ir::Instruction::Store(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_store)],
		},
		llvm_ir::Instruction::Load(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_load)],
		},
		llvm_ir::Instruction::Add(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_add)],
		},
		llvm_ir::Instruction::Sub(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_sub)],
		},
		llvm_ir::Instruction::Or(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_or)],
		},
		llvm_ir::Instruction::And(_) => &InstrMeta {
			builders: &[(RetMeta::Addr, build_and)],
		},
		llvm_ir::Instruction::ZExt(_)
		| llvm_ir::Instruction::IntToPtr(_)
		| llvm_ir::Instruction::BitCast(_)
		| llvm_ir::Instruction::PtrToInt(_)
		| llvm_ir::Instruction::Trunc(_)
		| llvm_ir::Instruction::SExt(_) => &InstrMeta {
			builders: &[
				(RetMeta::Addr, build_nop_move),
				//(&[ArgsMeta::InPlaceReg], RetMeta::InPlace, build_nop),
				//(&[ArgsMeta::Const], RetMeta::Addr, build_nop),
			],
		},
		_ => unimplemented!("lookup for {}", i),
	}
}

fn build_func(
	playout: &Layout,
	ret_pad_width: usize,
	stack_width: usize,
	func: &llvm_ir::Function,
) -> (Vec<BfOp>, usize) {
	// returns the stack width too
	let ret_landing_pad =
		llvm_ir::Name::Name(Box::new("ret_lading_pad".to_string()));

	let mut ctx = Ctx {
		layout: playout.clone(),
		addrs: Vec::<Addr>::new(),
		ret_pad_width: Some(ret_pad_width),
		stack_width: Some(stack_width),
		entry_block_addr: None,
		retpad_addr: None,
		ownfid: None,
	};

	for (i, block) in func.basic_blocks.iter().enumerate() {
		if i == 1 {
			// block at index 1 is always reserved for the ret landing pad
			ctx.layout.push(Cell::BlockMask(ret_landing_pad.clone()));
		}
		ctx.layout.push(Cell::BlockMask(block.name.clone()));
	}

	// if we didn't push one in while walking through the bblocks (since there's
	// only an entry) push one in now
	if func.basic_blocks.len() == 1 {
		ctx.layout.push(Cell::BlockMask(ret_landing_pad.clone()));
	}

	// grab all the allocas
	for block in func.basic_blocks.iter() {
		for instr in block.instrs.iter() {
			match instr {
				llvm_ir::Instruction::Alloca(a) => {
					ctx.layout.push(Cell::Alloc(a.dest.clone()));
				}
				_ => {}
			}
		}
	}

	let mut name_uses: Vec<&llvm_ir::Name> = vec![];
	let mut multi_use = vec![];
	for block in func.basic_blocks.iter() {
		for instr in block.instrs.iter() {
			let uses = instr_consumes(&ctx, instr);
			for u in uses {
				if name_uses.contains(&u) && !multi_use.contains(&u) {
					multi_use.push(&u);
					continue;
				}

				name_uses.push(u);
			}
		}
	}

	// and then all those regs (aka not allocas)
	// TODO: register reuse when single_use
	for block in func.basic_blocks.iter() {
		for instr in block.instrs.iter() {
			match instr {
				llvm_ir::Instruction::Alloca(_) => {}
				_ => {
					let ret = instr.try_get_result();
					if ret.is_some() {
						let ret = ret.unwrap();
						// TODO this is unsound this can only be false when a
						// register is ONCE through all flows of execution after
						// the instruction setting the value.
						// give_reg(&mut ctx, &ret, multi_use.contains(&ret));
						//
						// perhaps we can get really fancy and keep a multi use
						// register around only as long as needed. idk ill deal
						// w walking the cfg later
						give_reg(&mut ctx, &ret, true);
					}
				}
			}
		}
	}

	let ownfid = ctx
		.layout
		.iter()
		.position(|c| match c {
			Cell::FuncMask(n) => n == &func.name,
			_ => false,
		})
		.unwrap();

	ctx.ownfid = Some(ownfid);

	// TODO(turbio): pretty uncool to double copy the args. The calling
	// function puts them right before our stack then we copy them right
	// into our stack registers.
	let mut first_block_prelude = Vec::<BfOp>::new();
	first_block_prelude.push(BfOp::Comment(format!("copy up args")));
	for (i, p) in func.parameters.iter().enumerate() {
		let pdest = give_reg(&mut ctx, &p.name, false);
		first_block_prelude
			.push(BfOp::Tag(pdest.clone(), format!("arg_{}", p.name)));

		// so basically spooky ops to reach before the stack top
		first_block_prelude.push(BfOp::Left(i + STACK_PTR_W + 1));
		first_block_prelude.push(BfOp::Mov(
			fixed_addr(0),
			offset(pdest.clone(), (i + 1 + STACK_PTR_W) as i64),
		));
		first_block_prelude.push(BfOp::Right(i + STACK_PTR_W + 1));
	}

	// worth noting everone's ret pad and first block have the same address
	let retpad_addr = ctx
		.layout
		.iter()
		.position(|c| match c {
			Cell::BlockMask(n) => n == &ret_landing_pad,
			_ => false,
		})
		.unwrap();

	let retpad_addr = fixed_addr(retpad_addr);

	let entry_block_addr = ctx
		.layout
		.iter()
		.position(|c| match c {
			Cell::BlockMask(n) => n == &func.basic_blocks[0].name,
			_ => false,
		})
		.unwrap();

	ctx.retpad_addr = Some(retpad_addr.clone());
	ctx.entry_block_addr = Some(entry_block_addr.clone());

	let mut funcloop: Vec<BfOp> = vec![];

	// the ret landing pad needs to be before any ret instructions so we
	// can't fall into our own landing pad.
	funcloop.push(BfOp::Tag(
		retpad_addr.clone(),
		format!("B:{}", ret_landing_pad),
	));

	// lil block to move left. kill mainloop, func, block and then skedaddle.
	funcloop.push(BfOp::Loop(
		retpad_addr.clone(),
		vec![
			BfOp::SubI(fixed_addr(0), 1),
			BfOp::Tag(fixed_addr(0), "dead_frame".to_string()),
			BfOp::SubI(fn_mask(&mut ctx, &func.name), 1),
			BfOp::Tag(fixed_addr(0), format!("dead_fn_pad/{}", func.name)),
			BfOp::SubI(retpad_addr.clone(), 1),
			BfOp::Left(stack_width),
		],
	));

	for (i, c) in ctx.layout.clone().iter().enumerate() {
		// tag everything in the layout aot
		match c {
			Cell::Alloc(n) => {
				funcloop.push(BfOp::Tag(fixed_addr(i), format!("alloc_{}", n)))
			}
			Cell::FuncMask(n) => {
				funcloop.push(BfOp::Tag(fixed_addr(i), format!("F:{}", n)))
			}
			Cell::BlockMask(n) => {
				funcloop.push(BfOp::Tag(fixed_addr(i), format!("B:{}", n)))
			}
			Cell::MainLoop => funcloop.push(BfOp::Tag(
				fixed_addr(i),
				format!("mainloop_{}", func.name),
			)),
			Cell::Reg { n, multi_use } => funcloop.push(BfOp::Tag(
				fixed_addr(i),
				format!(
					"{}{}",
					func.basic_blocks // o lort
						.iter()
						.filter_map(|bb| bb
							.instrs
							.iter()
							.filter(|i| i
								.try_get_result()
								.filter(|r| r == &n)
								.is_some())
							.next())
						.next()
						.map_or(format!("{}", n), |i| format!("{}", i)),
					match multi_use {
						true => "(mult)",
						false => "",
					}
				),
			)),
			Cell::Borrowed(n) => panic!("how??"),
			Cell::Free => panic!("how??"),
		}
	}

	for (i, block) in func.basic_blocks.iter().enumerate() {
		let bid = ctx
			.layout
			.iter()
			.position(|c| match c {
				Cell::BlockMask(n) => n == &block.name,
				_ => false,
			})
			.unwrap();

		let mut blockloop: Vec<BfOp> = vec![];

		blockloop.push(BfOp::SubI(fixed_addr(bid), 1));

		// first block gets prepended with some fancy stuff
		if i == 0 {
			blockloop.append(&mut first_block_prelude);
		}

		for (iid, instr) in block.instrs.iter().enumerate() {
			blockloop.push(BfOp::Comment(instr.to_string()));

			// allocas arent really instructions????? idk
			if let llvm_ir::Instruction::Alloca(_) = instr {
				continue;
			}

			// phi nodes are handled by the branch instr generator
			if let llvm_ir::Instruction::Phi(_) = instr {
				continue;
			}

			/*
			for cell in &ctx.layout {
				println!("{:?}", cell);
				match cell {
					Cell::Reg { n, .. } => n,
					Cell::Alloc(n) => n,
					_ =>
				}
			}*/

			/*
			let oper_addrs: Vec<(Addr, Vec<BfOp>)> = instr_opers(&ctx, &instr)
				.iter()
				.map(|operand| {
					consumed_op_to_reg(&mut ctx, operand, &multi_use)
				})
				.collect();

			for (a, ops) in oper_addrs.iter() {
				blockloop.append(&mut ops.clone());
			}

			let oper_addrs = oper_addrs
				.iter()
				.map(|o| BuilderArgs::ConsumedReg(o.0.clone()))
				.collect::<Vec<BuilderArgs>>();
				*/

			let oper_addrs = instr_opers(&ctx, &instr)
				.iter()
				.map(|op| match op {
					llvm_ir::Operand::LocalOperand { name, ty } => ctx
						.layout
						.iter()
						.enumerate()
						.filter(|(i, c)| match c {
							Cell::Alloc(n) => n == name,
							Cell::Reg { n, .. } => n == name,
							_ => false,
						})
						.map(|(i, c)| match c {
							Cell::Alloc(n) => BuilderArgs::Alloc(fixed_addr(i)),
							Cell::Reg {
								n,
								multi_use: false,
							} => BuilderArgs::ConsumedReg(fixed_addr(i)),
							Cell::Reg { n, multi_use: true } => {
								BuilderArgs::PreservedReg(fixed_addr(i))
							}
							_ => panic!(),
						})
						.next()
						.unwrap(),
					llvm_ir::Operand::ConstantOperand(_) => {
						BuilderArgs::Const(uncop(op) as usize)
					}

					_ => unimplemented!("lol cucked"),
				})
				.collect::<Vec<_>>();

			let ret = instr.try_get_result();

			let retcell =
				ctx.layout.iter().enumerate().find(|(_, c)| match c {
					Cell::Reg { n, .. } => Some(n) == ret,
					_ => false,
				});

			if retcell.is_some() {
				let retcell = retcell.unwrap();
				if match retcell.1 {
					Cell::Reg { multi_use, .. } => *multi_use,
					_ => panic!(),
				} {
					blockloop.push(BfOp::Zero(fixed_addr(retcell.0)))
				}
			}

			let ret = ret.and_then(|i| Some(take_reg(&mut ctx, &i)));

			let instrmeta = lookup_instr(instr);
			let builder = &instrmeta.builders[0];
			blockloop.append(&mut builder.1(
				&mut ctx,
				instr,
				block,
				oper_addrs.as_slice(),
				ret,
			));

			ctx.layout = ctx
				.layout
				.into_iter()
				.map(|c| match c {
					Cell::Borrowed(c2) => *c2,
					_ => c,
				})
				.collect();
		}

		// if it handled a call we know that: the block ended in a call and
		// the terminator was a unconditional branch. These are both
		// rolled into the call instruction builder.

		let last = block.instrs.last();
		if last.is_none()
			|| llvm_ir::instruction::Call::try_from(last.unwrap().clone())
				.is_err()
		{
			blockloop.push(BfOp::Comment(block.term.to_string()));

			match &block.term {
				llvm_ir::Terminator::Br(br) => {
					let toblock = func
						.basic_blocks
						.iter()
						.find(|bb| br.dest == bb.name)
						.unwrap();

					let tophis = toblock
						.instrs
						.iter()
						.filter_map(|i| {
							llvm_ir::instruction::Phi::try_from((*i).clone())
								.ok()
						})
						.collect::<Vec<_>>();

					if tophis.len() > 1 {
						panic!("idk how to do multiple phis");
					}

					if tophis.len() == 1 {
						let tophis = tophis[0].clone();
						let our_branch = tophis
							.incoming_values
							.iter()
							.find(|pair| pair.1 == block.name)
							.unwrap();

						blockloop
							.push(BfOp::Comment(format!("doing phi stuff")));
						blockloop.push(BfOp::Comment(format!("{}", tophis)));

						match &our_branch.0 {
							llvm_ir::Operand::LocalOperand { name, ty } => {
								if multi_use.contains(&name) {
									panic!("yeek");
								}
							}
							_ => {}
						}

						let (brval, mut o) = consumed_op_to_reg(
							&mut ctx,
							&our_branch.0,
							&multi_use,
						);
						blockloop.append(&mut o);

						let dest = take_reg(&mut ctx, &tophis.dest);
						blockloop.push(BfOp::Zero(dest.clone()));
						blockloop.push(BfOp::Mov(brval, dest.clone()));
					}

					let brto = ctx
						.layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &br.dest,
							_ => false,
						})
						.unwrap();

					let brto = fixed_addr(brto);

					//blockloop.push(BfOp::Tag(
					//	brto.clone(),
					//	format!("B:{}/{}", func.name, br.dest),
					//));
					blockloop.push(BfOp::AddI(brto.clone(), 1));
				}

				llvm_ir::Terminator::CondBr(cbr) => {
					let cond = take_reg(&mut ctx, &unlop(&cbr.condition));

					let tru = ctx
						.layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &cbr.true_dest,
							_ => false,
						})
						.unwrap();
					let tru = fixed_addr(tru);

					let fals = ctx
						.layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &cbr.false_dest,
							_ => false,
						})
						.unwrap();
					let fals = fixed_addr(fals);

					{
						let totrublock = func
							.basic_blocks
							.iter()
							.find(|bb| cbr.true_dest == bb.name)
							.unwrap();

						let totruphis = totrublock
							.instrs
							.iter()
							.filter_map(|i| {
								llvm_ir::instruction::Phi::try_from(
									(*i).clone(),
								)
								.ok()
							})
							.collect::<Vec<_>>();

						if totruphis.len() > 1 {
							panic!("idk how to do multiple phis");
						}

						if totruphis.len() == 1 {
							let totruphis = totruphis[0].clone();
							let our_branch = totruphis
								.incoming_values
								.iter()
								.find(|pair| pair.1 == block.name)
								.unwrap();

							blockloop.push(BfOp::Comment(format!(
								"doing phi stuff"
							)));
							blockloop
								.push(BfOp::Comment(format!("{}", totruphis)));

							let (brval, mut o) = consumed_op_to_reg(
								&mut ctx,
								&our_branch.0,
								&multi_use,
							);
							blockloop.append(&mut o);

							let dest = take_reg(&mut ctx, &totruphis.dest);
							blockloop.push(BfOp::Zero(dest.clone()));
							blockloop.push(BfOp::Mov(brval, dest.clone()));
						}
					}

					{
						let tofalsblock = func
							.basic_blocks
							.iter()
							.find(|bb| cbr.false_dest == bb.name)
							.unwrap();

						let tofalsphis = tofalsblock
							.instrs
							.iter()
							.filter_map(|i| {
								llvm_ir::instruction::Phi::try_from(
									(*i).clone(),
								)
								.ok()
							})
							.collect::<Vec<_>>();

						if tofalsphis.len() > 1 {
							panic!("idk how to do multiple phis");
						}

						if tofalsphis.len() == 1 {
							let tofalsphis = tofalsphis[0].clone();
							let our_branch = tofalsphis
								.incoming_values
								.iter()
								.find(|pair| pair.1 == block.name)
								.unwrap();

							blockloop.push(BfOp::Comment(format!(
								"doing phi stuff"
							)));
							blockloop
								.push(BfOp::Comment(format!("{}", tofalsphis)));

							let (brval, mut o) = consumed_op_to_reg(
								&mut ctx,
								&our_branch.0,
								&multi_use,
							);
							blockloop.append(&mut o);

							let dest = take_reg(&mut ctx, &tofalsphis.dest);
							blockloop.push(BfOp::Zero(dest.clone()));
							blockloop.push(BfOp::Mov(brval, dest.clone()));
						}
					}

					// TODO(turbio): hacky but well we're using the ret pad
					// block mask as scratch cause like we'll never need it lol.
					let temp0 = retpad_addr.clone();
					blockloop.push(BfOp::AddI(temp0.clone(), 1));

					blockloop.append(&mut vec![
						// if truethy
						BfOp::Loop(
							cond.clone(),
							vec![
								BfOp::SubI(cond.clone(), 1),
								BfOp::SubI(temp0.clone(), 1),
								BfOp::AddI(tru.clone(), 1),
								BfOp::Tag(
									tru.clone(),
									format!(
										"B:{}/{}_true",
										func.name,
										n2usize(&cbr.true_dest)
									),
								),
							],
						),
						// if falsey
						BfOp::Loop(
							temp0.clone(),
							vec![
								BfOp::SubI(temp0.clone(), 1),
								BfOp::AddI(fals.clone(), 1),
								BfOp::Tag(
									fals.clone(),
									format!(
										"B:{}/{}_false",
										func.name,
										n2usize(&cbr.false_dest)
									),
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
								take_reg(&mut ctx, &name);
								// blockloop.push(BfOp::Mov(0, 0));
							}
							llvm_ir::Operand::ConstantOperand(_) => {
								// blockloop.push(BfOp::AddI(0, v as u8));
							}

							_ => unimplemented!("ignoring meta?"),
						};
					}

					blockloop.append(&mut zero_frame(&mut ctx));

					blockloop.push(BfOp::SubI(fixed_addr(0), 1));
					blockloop.push(BfOp::Tag(
						fixed_addr(0),
						"dead_frame".to_string(),
					));

					blockloop.push(BfOp::SubI(fixed_addr(ownfid), 1));

					blockloop.push(BfOp::Left(1));
					blockloop.push(BfOp::Zero(fixed_addr(0)));
					blockloop.push(BfOp::Right(1));

					// TODO(turbio): well relying on fixed arg lengths is prolly
					// not gonna work out. Prolly aught to copy args right into
					// the stack and have an entry block lay em out right.
					blockloop.push(BfOp::Left(
						func.parameters.len() + ret_pad_width + 1 + STACK_PTR_W,
					));
				}
				_ => unimplemented!("soon? {:?}", block.term),
			};
		}

		funcloop.push(BfOp::Tag(fixed_addr(bid), format!("B:{}", block.name)));
		funcloop.push(BfOp::Loop(fixed_addr(bid), blockloop));
	}

	let mut i = ctx.layout.len() + 10;

	for a in ctx.addrs.iter() {
		if match a.v.borrow().clone() {
			Addrt::Named(_) => true,
			_ => false,
		} {
			a.v.replace(Addrt::Fixed(i));
			i += 1;
		}
	}

	return (
		vec![
			BfOp::Tag(fixed_addr(ownfid), func.name.clone()),
			BfOp::Loop(fixed_addr(ownfid), funcloop),
		],
		ctx.layout.len(),
	);
}

pub fn compile(path: &Path) -> String {
	const RET_LANDING_PAD: usize = 1;

	let path = path.canonicalize().unwrap();
	let mut module = llvm_ir::Module::from_bc_path(path).unwrap();

	calls_terminate_blocks(&mut module);
	calls_never_in_first_block(&mut module);

	let funcns = module.functions.len();

	let mut root: Vec<BfOp> = vec![];

	let ret_pad_width = 1 + funcns + RET_LANDING_PAD;

	let mut layout: Layout = vec![Cell::MainLoop];

	let mut ctx = Ctx {
		// TODO
		layout: layout.clone(),
		addrs: Vec::<Addr>::new(),
		ret_pad_width: None,
		stack_width: None,
		retpad_addr: None,
		entry_block_addr: None,
		ownfid: None,
	};

	root.push(BfOp::Right(ret_pad_width + STACK_PTR_W));
	root.push(BfOp::AddI(
		fixed_addr(0),
		ret_pad_width as u8 + STACK_PTR_W as u8,
	)); // stack base address
	root.push(BfOp::Right(1));
	root.push(BfOp::Comment("runtime init:".to_string()));
	root.push(BfOp::Tag(fixed_addr(0), "===TOP FRAME".to_string()));
	root.push(BfOp::AddI(fixed_addr(0), 1));

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

	root.push(BfOp::Tag(fixed_addr(mainfid), "main".to_string()));
	root.push(BfOp::AddI(fixed_addr(mainfid), 1));
	root.push(BfOp::Tag(fixed_addr(1 + funcns), "main/b0".to_string()));
	root.push(BfOp::AddI(fixed_addr(1 + funcns), 1));

	let mut mainloop: Vec<BfOp> = vec![];

	// ret pad is always the same width with: main loop + function masks +
	// landing pad mask
	let ret_pad_width = 1 + funcns + RET_LANDING_PAD;

	for func in module.functions.iter() {
		let (_, st_width) = build_func(&layout, ret_pad_width, 0, func);
		let (mut code, _) = build_func(&layout, ret_pad_width, st_width, func);

		mainloop.append(&mut code);
	}

	root.push(BfOp::Loop(fixed_addr(0), mainloop));

	let mut out = String::from("");
	printast(&mut out, root);
	out
}

fn printast(out: &mut String, ast: Vec<BfOp>) {
	printasti(out, ast, 0, 0);
}

fn printasti(
	out: &mut String,
	ast: Vec<BfOp>,
	cstart: usize,
	i: usize,
) -> usize {
	let mut cursor = cstart;
	for ins in ast {
		cursor = printinstri(out, ins, cursor, i);
	}

	cursor
}

fn printinstri(out: &mut String, ins: BfOp, cstart: usize, i: usize) -> usize {
	let mut cursor = cstart;

	let ind = "    ".repeat(i);

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
			write!(out, "r{} {}", n, ">".repeat(n)).unwrap();
		}

		BfOp::Left(n) => {
			write!(out, "l{} {}", n, "<".repeat(n)).unwrap();
		}

		BfOp::Zero(addr) => {
			write!(out, "{}[-]", cmov(cursor, resaddr(addr.clone()))).unwrap();
			cursor = resaddr(addr.clone());
		}

		BfOp::Putch(addr) => {
			write!(out, "{}.", cmov(cursor, resaddr(addr.clone()))).unwrap();
			cursor = resaddr(addr.clone());
		}

		BfOp::AddI(addr, n) => {
			write!(
				out,
				"{}{}",
				cmov(cursor, resaddr(addr.clone())),
				"+".repeat(n as usize)
			)
			.unwrap();
			cursor = resaddr(addr.clone());
		}
		BfOp::SubI(addr, n) => {
			write!(
				out,
				"{}{}",
				cmov(cursor, resaddr(addr.clone())),
				"-".repeat(n as usize)
			)
			.unwrap();
			cursor = resaddr(addr.clone());
		}

		BfOp::Tag(addr, s) => {
			let s: String = s
				.chars()
				.map(|x| match x {
					'+' | '-' | '.' | ',' | ' ' => '_',
					'<' => '(',
					'>' => ')',
					'[' => '{',
					']' => '}',
					_ => x,
				})
				.collect();
			write!(out, "{}#{}", cmov(cursor, resaddr(addr.clone())), s)
				.unwrap();
			cursor = resaddr(addr.clone());
		}
		BfOp::Mov(from_a, to_a) => {
			let from_a = resaddr(from_a);
			let to_a = resaddr(to_a);

			assert!(from_a != to_a, "mov from same addr (infinite loop)");

			write!(
				out,
				"m{}/{} {}[-{}+{}]",
				from_a,
				to_a,
				cmov(cursor, from_a),
				cmov(from_a, to_a),
				cmov(to_a, from_a),
			)
			.unwrap();
			cursor = from_a;
		}
		BfOp::Dup(from_a, to_a1, to_a2) => {
			let from_a = resaddr(from_a);
			let to_a1 = resaddr(to_a1);
			let to_a2 = resaddr(to_a2);

			assert!(from_a != to_a1, "dup from same addr (infinite loop)");
			assert!(from_a != to_a2, "dup from same addr (infinite loop)");

			// TODO(turbio): should probably order to_a1 and to_a2 for lower
			// travel
			write!(
				out,
				"d{}/{}/{} {}[-{}+{}+{}]",
				from_a,
				to_a1,
				to_a2,
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

		BfOp::Loop(addr, ops) => {
			let m = cmov(cursor, resaddr(addr.clone()));
			cursor = resaddr(addr.clone());

			write!(out, "{}[\n", m).unwrap();
			cursor = printasti(out, ops, cursor, i + 1);

			let m = cmov(cursor, resaddr(addr.clone()));
			cursor = resaddr(addr.clone());

			write!(out, "{}{}]", ind, m).unwrap();
		}

		BfOp::Nop => {}
	}

	write!(out, "\n").unwrap();

	cursor
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
		.replace("[", "_")
		.replace("]", "_")
		.replace(".", "_")
		.replace("+", "_")
		.replace("-", "_")
}
