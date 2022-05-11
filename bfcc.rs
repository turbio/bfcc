extern crate llvm_ir;

use std::fmt;

use bfcc::llvm_ir::instruction::BinaryOp;
use bfcc::llvm_ir::instruction::UnaryOp;

use std::cell::RefCell;
use std::fmt::Write;
use std::ops::Deref;
use std::path::Path;
use std::rc::Rc;

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
				match &func.basic_blocks[block].instrs[instr] {
					llvm_ir::Instruction::Call(c) => c,
					_ => {
						instr += 1;
						continue;
					}
				};

				let nextn = llvm_ir::Name::Name(Box::new(format!(
					"call_term_for_{}",
					block
				)));

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
			"call_never_first_for{}",
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

fn fixed_addr(ctx: &mut Ctx, a: usize) -> Addr {
	let a = Addr {
		v: Rc::new(RefCell::new(Addrt::Fixed(a))),
	};
	ctx.addrs.push(a.clone());
	return a;
}

#[derive(Debug)]
enum BfOp {
	// actual brainfuck, these do fucky stuff to the ptr
	Right(usize),
	Left(usize),

	AddI(Addr, u8), // *a + n -> *a : a must be less than 255
	SubI(Addr, u8), // *a - n -> *a : a msut be greater than 0
	Dup(Addr, Addr, Addr), /* *a -> *b, *c : a will be zeroed, b and c must
	                 * be zero */

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
fn give_reg<'a>(ctx: &'a mut Ctx, name: &llvm_ir::Name) -> Addr {
	assert!(
		!ctx.addrs.iter().any(|a| match a.v.borrow().clone() {
			Addrt::Named(n) => &n == name,
			_ => false,
		}),
		"wtf man, we already have that"
	);

	let a = Addr {
		v: Rc::new(RefCell::new(Addrt::Named(name.clone()))),
	};
	ctx.addrs.push(a.clone());
	return a;
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
fn take_reg<'a>(ctx: &'a mut Ctx, name: &llvm_ir::Name) -> Addr {
	let found = ctx.addrs.iter().find(|a| match a.v.borrow().clone() {
		Addrt::Named(n) => &n == name,
		_ => false,
	});

	if found.is_some() {
		found.unwrap().clone()
	} else {
		let faddr = ctx
			.layout
			.iter()
			.position(|c| match c {
				Cell::Alloc(n) => n == name,
				_ => false,
			})
			.unwrap();

		Addr {
			v: Rc::new(RefCell::new(Addrt::Fixed(faddr))),
		}
	}
}

// get addr of function mask
fn fn_mask(ctx: &mut Ctx, name: &String) -> Addr {
	fixed_addr(
		ctx,
		ctx.layout
			.iter()
			.position(|c| match c {
				Cell::FuncMask(n) => n == name,
				_ => false,
			})
			.unwrap(),
	)
}

// generate the ops to zero all the allocs make in a function
fn zero_allocs(ctx: &mut Ctx) -> Vec<BfOp> {
	let mut ops = vec![BfOp::Comment(format!("zero all function allocs"))];

	ops.append(
		&mut ctx
			.layout
			.clone()
			.iter()
			.enumerate()
			.filter(|(_, c)| match c {
				Cell::Alloc(_) => true,
				_ => false,
			})
			.map(|(i, _)| BfOp::Zero(fixed_addr(ctx, i)))
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
			llvm_ir::Type::IntegerType { .. } => (
				take_reg(ctx, name),
				vec![BfOp::Comment(format!(
					"op_to_reg giving known register address"
				))],
			),

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
							BfOp::Left(1),
							BfOp::Dup(
								fixed_addr(ctx, 0),
								offset(pasi.clone(), 1),
								offset(tmp.clone(), 1),
							),
							BfOp::Mov(
								offset(tmp.clone(), 1),
								fixed_addr(ctx, 0),
							),
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

					let from_ptr = ctx
						.layout
						.iter()
						.position(|c| match c {
							Cell::Ptr(n) => n == name,
							_ => false,
						})
						.unwrap();

					(fixed_addr(ctx, from_ptr), vec![])
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

fn give_ptr<'a>(ctx: &'a mut Ctx, name: &llvm_ir::Name) -> Addr {
	let slot = ctx.layout.iter().position(|c| match c {
		Cell::Free => true,
		_ => false,
	});

	if slot.is_some() {
		let slot = slot.unwrap();
		ctx.layout[slot] = Cell::Ptr(name.clone());
		fixed_addr(ctx, slot)
	} else {
		let slot = ctx.layout.len();
		ctx.layout.push(Cell::Ptr(name.clone()));
		fixed_addr(ctx, slot)
	}
}

// borrow a register for scratch space.you just have to reallyt
// really really promise to not leave any junk beyond the life
// of the instruction. Otherwise absolute chaos ensues since
// this borrows control flow regs.
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
				return fixed_addr(ctx, i);
			}
		}
	}

	let slot = ctx.layout.len();
	for _ in 0..contig {
		ctx.layout.push(Cell::Borrowed(Box::new(Cell::Free)));
	}
	fixed_addr(ctx, slot)
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
	Ptr(llvm_ir::Name),

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
				fixed_addr(ctx, 0),
				offset(stackptr_tmp.clone(), 1),
				offset(stackptr.clone(), 1),
			),
			BfOp::Mov(offset(stackptr_tmp.clone(), 1), fixed_addr(ctx, 0)),
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
}

enum ArgsMeta {
	ConsumedReg,
	Const,
	InPlaceReg,
}

enum RetMeta {
	Addr,
	InPlace,
	None,
}

enum BuilderArgs {
	Reg(Addr),
	Const(usize),
}

struct InstrMeta<'a> {
	builders: &'a [(
		&'a [ArgsMeta],
		RetMeta,
		fn(&[BuilderArgs], Option<Addr>) -> Vec<BfOp>,
	)],
}

fn build_nop(args: &[BuilderArgs], ret: Option<Addr>) -> Vec<BfOp> {
	assert_eq!(args.len(), 1);

	match &args[0] {
		BuilderArgs::Const(c) => vec![BfOp::AddI(ret.unwrap(), *c as u8)],
		BuilderArgs::Reg(c) => {
			assert!(ret.is_none());
			vec![]
		}
	}
}

fn build_sub(args: &[BuilderArgs], ret: Option<Addr>) -> Vec<BfOp> {
	assert_eq!(args.len(), 2);
	let op0 = match &args[0] {
		BuilderArgs::Reg(addr) => addr,
		BuilderArgs::Const(_) => panic!("sub: first arg must be reg"),
	};
	let op1 = match &args[1] {
		BuilderArgs::Reg(addr) => addr,
		BuilderArgs::Const(_) => panic!("sub: sec arg must be reg"),
	};

	let dest = ret.unwrap();

	vec![
		BfOp::Tag(dest.clone(), format!("%{}_sub_%{}_c{}", dest, op0, op1)),
		BfOp::Mov(op0.clone(), dest.clone()),
		BfOp::Loop(
			op1.clone(),
			vec![BfOp::SubI(op1.clone(), 1), BfOp::SubI(dest.clone(), 1)],
		),
	]
}

fn build_add(args: &[BuilderArgs], ret: Option<Addr>) -> Vec<BfOp> {
	assert_eq!(args.len(), 2);
	let op0 = match &args[0] {
		BuilderArgs::Reg(addr) => addr,
		BuilderArgs::Const(_) => panic!("add: first arg must be reg"),
	};
	let op1 = match &args[1] {
		BuilderArgs::Reg(addr) => addr,
		BuilderArgs::Const(_) => panic!("add: sec arg must be reg"),
	};

	let dest = ret.unwrap();

	vec![
		BfOp::Tag(dest.clone(), format!("%{}_add_%{}_c{}", dest, op0, op1)),
		BfOp::Mov(op0.clone(), dest.clone()),
		BfOp::Loop(
			op1.clone(),
			vec![BfOp::SubI(op1.clone(), 1), BfOp::AddI(dest.clone(), 1)],
		),
	]
}

fn build_sub_in_place(args: &[BuilderArgs], ret: Option<Addr>) -> Vec<BfOp> {
	assert_eq!(args.len(), 2);
	assert!(ret.is_none());
	let op0 = match &args[0] {
		BuilderArgs::Reg(addr) => addr,
		BuilderArgs::Const(_) => panic!("sub: first arg must be reg"),
	};
	let op1 = match &args[1] {
		BuilderArgs::Reg(addr) => addr,
		BuilderArgs::Const(_) => panic!("sub: second arg must be reg"),
	};

	vec![
		BfOp::Tag(op0.clone(), format!("%{}_sub_%{}_c{}", op0, op0, op1)),
		BfOp::Loop(
			op1.clone(),
			vec![BfOp::SubI(op1.clone(), 1), BfOp::SubI(op0.clone(), 1)],
		),
	]
}

fn lookup_instr(
	i: &llvm_ir::Instruction,
) -> Option<&'static InstrMeta<'static>> {
	match i {
		//llvm_ir::Instruction::Call(_) => &InstrMeta {},
		//llvm_ir::Instruction::Alloca(_) => &InstrMeta {},
		//llvm_ir::Instruction::Store(_) => &InstrMeta {},
		//llvm_ir::Instruction::Load(_) => &InstrMeta {},
		//llvm_ir::Instruction::ICmp(_) => &InstrMeta {},
		llvm_ir::Instruction::Add(_) => Some(&InstrMeta {
			builders: &[(
				&[ArgsMeta::ConsumedReg, ArgsMeta::ConsumedReg],
				RetMeta::Addr,
				build_add,
			)],
		}),
		llvm_ir::Instruction::Sub(_) => Some(&InstrMeta {
			builders: &[
				(
					&[ArgsMeta::ConsumedReg, ArgsMeta::ConsumedReg],
					RetMeta::Addr,
					build_sub,
				),
				(
					&[ArgsMeta::InPlaceReg, ArgsMeta::ConsumedReg],
					RetMeta::InPlace,
					build_sub_in_place,
				),
			],
		}),

		//llvm_ir::Instruction::ZExt(_)
		//| llvm_ir::Instruction::Trunc(_)
		//| llvm_ir::Instruction::SExt(_)
		//| llvm_ir::Instruction::PtrToInt(_)
		//| llvm_ir::Instruction::IntToPtr(_) => Some(&InstrMeta {
		//	builders: &[
		//		(&[ArgsMeta::InPlaceReg], RetMeta::InPlace, build_nop),
		//		(&[ArgsMeta::Const], RetMeta::Addr, build_nop),
		//	],
		//}),
		_ => None,
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

	let fid = ctx
		.layout
		.iter()
		.position(|c| match c {
			Cell::FuncMask(n) => n == &func.name,
			_ => false,
		})
		.unwrap();

	let mut name_uses: Vec<llvm_ir::Operand> = vec![];

	for block in func.basic_blocks.iter() {
		for instr in block.instrs.iter() {
			if instr.is_unary_op() {
				let uop: llvm_ir::instruction::groups::UnaryOp =
					instr.clone().try_into().unwrap();

				if name_uses.contains(uop.get_operand()) {
					panic!(
						"multiple uses of a name:\n{}\nuses {}",
						instr,
						uop.get_operand()
					);
				}

				if match uop.get_operand() {
					llvm_ir::operand::Operand::LocalOperand { .. } => true,
					_ => false,
				} {
					name_uses.push(uop.get_operand().clone());
				}
			} else if instr.is_binary_op() {
				let bop: llvm_ir::instruction::groups::BinaryOp =
					instr.clone().try_into().unwrap();

				if name_uses.contains(bop.get_operand0())
					|| name_uses.contains(bop.get_operand1())
				{
					panic!(
						"multiple uses of a name:\n{}\nuses {} and {}",
						instr,
						bop.get_operand0(),
						bop.get_operand1()
					);
				}

				if match bop.get_operand0() {
					llvm_ir::operand::Operand::LocalOperand { .. } => true,
					_ => false,
				} {
					name_uses.push(bop.get_operand0().clone());
				}

				if match bop.get_operand1() {
					llvm_ir::operand::Operand::LocalOperand { .. } => true,
					_ => false,
				} {
					name_uses.push(bop.get_operand1().clone());
				}
			}
		}
	}

	// TODO(turbio): not optimal to double copy the args. The calling
	// function puts them right before our stack then we copy them right
	// into our stack registers.
	let mut first_block_prelude = Vec::<BfOp>::new();
	for (i, p) in func.parameters.iter().enumerate() {
		let pdest = give_reg(&mut ctx, &p.name);
		first_block_prelude
			.push(BfOp::Tag(pdest.clone(), format!("arg_{}", p.name)));

		// so basically spooky ops to reach before the stack top
		first_block_prelude.push(BfOp::Left(i + STACK_PTR_W + 1));
		first_block_prelude.push(BfOp::Mov(
			fixed_addr(&mut ctx, 0),
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

	let retpad_addr = fixed_addr(&mut ctx, retpad_addr);

	let entry_block_addr = ctx
		.layout
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
		retpad_addr.clone(),
		format!("{}/RET_LANDING_PAD", func.name),
	));

	// lil block to move left. kill mainloop, func, block and then skedaddle.
	funcloop.push(BfOp::Loop(
		retpad_addr.clone(),
		vec![
			BfOp::SubI(fixed_addr(&mut ctx, 0), 1),
			BfOp::Tag(fixed_addr(&mut ctx, 0), "dead_frame".to_string()),
			BfOp::SubI(fn_mask(&mut ctx, &func.name), 1),
			BfOp::Tag(
				fixed_addr(&mut ctx, 0),
				format!("dead_fn_pad/{}", func.name),
			),
			BfOp::SubI(retpad_addr.clone(), 1),
			BfOp::Left(stack_width),
		],
	));

	for (i, block) in func.basic_blocks.iter().enumerate() {
		let bid = ctx
			.layout
			.iter()
			.position(|c| match c {
				Cell::BlockMask(n) => n == &block.name,
				_ => false,
			})
			.unwrap();

		funcloop.push(BfOp::Tag(
			fixed_addr(&mut ctx, bid),
			format!("B:{}/{}", func.name, &block.name),
		));
		let mut blockloop: Vec<BfOp> = vec![];

		blockloop.push(BfOp::SubI(fixed_addr(&mut ctx, bid), 1));

		// first block gets prepended with some fancy stuff
		if i == 0 {
			blockloop.append(&mut first_block_prelude);
		}

		let mut handle_call = false;

		for (iid, instr) in block.instrs.iter().enumerate() {
			blockloop.push(BfOp::Comment(instr.to_string()));

			let instrmeta = lookup_instr(instr);
			if instrmeta.is_some() {
				let instrmeta = instrmeta.unwrap();
				let builder = &instrmeta.builders[0];

				assert!(instr.is_binary_op());
				let asbinop: llvm_ir::instruction::groups::BinaryOp =
					instr.clone().try_into().unwrap();

				let (op0, mut ops) =
					op_to_reg(&mut ctx, &asbinop.get_operand0());
				blockloop.append(&mut ops);

				let (op1, mut ops) =
					op_to_reg(&mut ctx, &asbinop.get_operand1());
				blockloop.append(&mut ops);

				let dest = give_reg(&mut ctx, &instr.try_get_result().unwrap());

				blockloop.append(&mut builder.2(
					&[BuilderArgs::Reg(op0), BuilderArgs::Reg(op1)],
					Some(dest),
				))
			} else {
				match instr {
					llvm_ir::Instruction::Call(c) => {
						handle_call = true;
						let br = match &block.term {
							llvm_ir::Terminator::Br(br) => &br.dest,
							_ => unreachable!(
								"terminator of call block must be branch"
							),
						};

						assert!(block.instrs.len() - 1 == iid); // double check calls are the last instr

						let callee_name = match c
							.function
							.as_ref()
							.unwrap_right()
							.as_constant()
							.unwrap()
						{
							llvm_ir::Constant::GlobalReference {
								name, ..
							} => n2nam(&name),

							_ => unimplemented!(
								"ohnoes wtf?? {:?}",
								c.function
									.as_ref()
									.unwrap_right()
									.as_constant()
									.unwrap()
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

						blockloop
							.push(BfOp::Comment("enable next".to_string()));
						blockloop.push(BfOp::Tag(
							fixed_addr(&mut ctx, brto),
							format!("{}/{}", func.name, br),
						));
						blockloop
							.push(BfOp::AddI(fixed_addr(&mut ctx, brto), 1));

						// intrinsics lol
						if callee_name == "putchar" {
							assert!(
								c.dest.is_none(),
								"putchar returns nothing"
							);
							assert!(
								c.arguments.len() == 1,
								"putchar expects one argument"
							);

							//let val = uncop(&c.arguments[0].0);

							blockloop.push(BfOp::Comment(
								"putchar intrinsic".to_string(),
							));

							let reg = match &c.arguments[0].0 {
								llvm_ir::Operand::LocalOperand {
									name, ..
								} => take_reg(&mut ctx, &name),
								llvm_ir::Operand::ConstantOperand(c) => {
									match c.deref() {
										llvm_ir::constant::Constant::Int {
											value,
											..
										} => {
											let temp0 = borrow_reg(&mut ctx, 1);
											blockloop.push(BfOp::AddI(
												temp0.clone(),
												*value as u8,
											));
											temp0.clone()
										}
										_ => unimplemented!(
											"how tf we gonna store that"
										),
									}
								}

								_ => unimplemented!("ignoring meta?"),
							};

							blockloop.push(BfOp::Putch(reg.clone()));
							blockloop.push(BfOp::Zero(reg.clone()));
						} else {
							for (i, ar) in c.arguments.iter().enumerate() {
								blockloop.push(BfOp::Comment(format!(
									"copy up arg {}",
									i
								)));

								let arg_at =
									stack_width
										+ ret_pad_width + 1 + (c.arguments.len()
										- 1 - i);

								blockloop.push(BfOp::Tag(
									fixed_addr(&mut ctx, arg_at),
									format!("arg_{}", i),
								));

								// TODO(turbio): copy up those args yikers
								match &ar.0 {
									llvm_ir::Operand::LocalOperand {
										name,
										..
									} => {
										let src = take_reg(&mut ctx, &name);
										blockloop.push(BfOp::Mov(
											src,
											fixed_addr(&mut ctx, arg_at),
										));
									}
									llvm_ir::Operand::ConstantOperand(_) => {
										let v = uncop(&ar.0);
										blockloop.push(BfOp::AddI(
											fixed_addr(&mut ctx, arg_at),
											v as u8,
										));
									}

									_ => unimplemented!("ignoring meta?"),
								}
							}

							// stack pointer always goes right before the main
							// loop and after the args
							// copy our stack ptr into the callee's plus our
							// frame size
							let callee_st_ptr = fixed_addr(
								&mut ctx,
								stack_width
									+ ret_pad_width + 1 + c.arguments.len(),
							);

							blockloop.push(BfOp::Comment(format!(
								"give callee a stack pointer"
							)));
							blockloop.push(BfOp::Tag(
								callee_st_ptr.clone(),
								format!("stack_ptr"),
							));
							blockloop.push(BfOp::AddI(
								callee_st_ptr.clone(),
								(stack_width + ret_pad_width + 3) as u8,
							));
							blockloop.push(BfOp::Left(1)); // forbidden territory
							blockloop.push(BfOp::Dup(
								fixed_addr(&mut ctx, 0),
								offset(callee_st_ptr.clone(), 1),
								offset(callee_st_ptr.clone(), 2),
							));
							blockloop.push(BfOp::Mov(
								offset(callee_st_ptr.clone(), 2),
								fixed_addr(&mut ctx, 0),
							));
							blockloop.push(BfOp::Right(1));

							// setup the jump pad

							blockloop.push(BfOp::Right(stack_width));

							blockloop.push(BfOp::Tag(
								fixed_addr(&mut ctx, 0),
								format!("JUMP_PAD"),
							));
							blockloop
								.push(BfOp::AddI(fixed_addr(&mut ctx, 0), 1));

							blockloop.push(BfOp::Tag(
								fixed_addr(&mut ctx, fid),
								format!("{}", func.name),
							));
							blockloop
								.push(BfOp::AddI(fixed_addr(&mut ctx, fid), 1));

							blockloop.push(BfOp::Tag(
								retpad_addr.clone(),
								format!("{}/jump_pad_blk", func.name),
							));
							blockloop.push(BfOp::AddI(retpad_addr.clone(), 1));

							// move to callee's frame loc

							blockloop.push(BfOp::Right(
								c.arguments.len()
									+ ret_pad_width + 1 + STACK_PTR_W,
							));

							// setup the callee's frame

							blockloop.push(BfOp::Tag(
								fixed_addr(&mut ctx, 0),
								format!("===FRAME_{}", callee_name),
							));
							blockloop
								.push(BfOp::AddI(fixed_addr(&mut ctx, 0), 1));

							let callee_fid = ctx
								.layout
								.iter()
								.position(|c| match c {
									Cell::FuncMask(n) => n == &callee_name,
									_ => false,
								})
								.unwrap();

							blockloop.push(BfOp::Tag(
								fixed_addr(&mut ctx, callee_fid),
								format!("{}", callee_name),
							));
							blockloop.push(BfOp::AddI(
								fixed_addr(&mut ctx, callee_fid),
								1,
							));
							blockloop.push(BfOp::Tag(
								fixed_addr(&mut ctx, entry_block_addr),
								format!("{}/b0", callee_name),
							));
							blockloop.push(BfOp::AddI(
								fixed_addr(&mut ctx, entry_block_addr),
								1,
							));
						}
					}

					llvm_ir::Instruction::Alloca(c) => {
						let dest = take_reg(&mut ctx, &c.dest);

						blockloop.push(BfOp::Tag(
							dest,
							format!("alloca_{}", c.dest),
						));
					}

					llvm_ir::Instruction::Store(s) => {
						let typ =
							ctx.layout.iter().position(|cell| match cell {
								Cell::Alloc(n) => n == unlop(&s.address),
								_ => false,
							});

						blockloop.push(BfOp::Comment(format!(
							"store sitch: alloca {:?}",
							typ
						)));

						blockloop.push(BfOp::Comment(format!(
							"grab the value we're storing"
						)));
						let (value, mut ops) = op_to_reg(&mut ctx, &s.value);
						blockloop.append(&mut ops);

						if typ.is_some() {
							blockloop.push(BfOp::Comment(format!(
								"and the destination"
							)));

							let (dest, mut ops) = op_to_reg(
								&mut ctx,
								&op_unwrap_ptr_all(&s.address),
							);
							blockloop.append(&mut ops);

							blockloop.push(BfOp::Zero(dest.clone()));
							blockloop.push(BfOp::Mov(value, dest.clone()));
						} else {
							let (dest, mut ops) =
								op_to_reg(&mut ctx, &s.address);
							blockloop.append(&mut ops);

							blockloop.append(&mut build_ptr_train(
								&mut ctx,
								dest,
								Some(value),
								None,
							));

							// unimplemented!("store to non-alloca");
						}
					}

					llvm_ir::Instruction::Load(l) => {
						let dest = give_reg(&mut ctx, &l.dest);

						let typ = ctx.layout.iter().position(|c| match c {
							Cell::Alloc(n) => n == unlop(&l.address),
							_ => false,
						});

						if typ.is_some() {
							blockloop.push(BfOp::Tag(
								dest.clone(),
								format!(
									"load_thru_%{}_to_%{}",
									n2usize(unlop(&l.address)),
									n2usize(&l.dest)
								),
							));

							let (addr, mut ops) = op_to_reg(
								&mut ctx,
								&op_unwrap_ptr_all(&l.address),
							);
							blockloop.append(&mut ops);

							let tmp = borrow_reg(&mut ctx, 1);

							blockloop.push(BfOp::Tag(
								tmp.clone(),
								format!("tmp0_for_load"),
							));
							blockloop.push(BfOp::Dup(
								addr.clone(),
								tmp.clone(),
								dest.clone(),
							));
							blockloop
								.push(BfOp::Mov(tmp.clone(), addr.clone()));
						} else {
							// ohno it's actually a pointer!?
							let (addr, mut ops) =
								op_to_reg(&mut ctx, &l.address);
							blockloop.append(&mut ops);

							blockloop.append(&mut build_ptr_train(
								&mut ctx,
								addr,
								None,
								Some(dest),
							));
						}
					}

					llvm_ir::Instruction::ICmp(i) => {
						let (op0, mut ops) = op_to_reg(&mut ctx, &i.operand0);
						blockloop.append(&mut ops);

						let (op1, mut ops) = op_to_reg(&mut ctx, &i.operand1);
						blockloop.append(&mut ops);

						let dest = give_reg(&mut ctx, &i.dest);

						blockloop.push(BfOp::Tag(
							dest.clone(),
							format!(
								"%{}_icmp_%{}_{}_{}",
								n2usize(&i.dest),
								i.operand0,
								i.predicate,
								i.operand1
							),
						));

						blockloop.append(&mut build_icmp(
							&mut ctx,
							i.predicate,
							op0,
							op1,
							dest.clone(),
						));
					}

					// these are all lies and actually nops
					llvm_ir::Instruction::ZExt(i) => {
						let (src, mut ops) = op_to_reg(&mut ctx, &i.operand);
						blockloop.append(&mut ops);

						let dest = give_reg(&mut ctx, &i.dest);
						blockloop.push(BfOp::Tag(
							dest.clone(),
							format!("{}_zext_{}", i.dest, i.operand),
						));
						blockloop.push(BfOp::Mov(src, dest.clone()));
					}
					llvm_ir::Instruction::Trunc(i) => {
						let (src, mut ops) = op_to_reg(&mut ctx, &i.operand);
						blockloop.append(&mut ops);

						let dest = give_reg(&mut ctx, &i.dest);
						blockloop.push(BfOp::Tag(
							dest.clone(),
							format!("{}_trunc_{}", i.dest, i.operand),
						));
						blockloop.push(BfOp::Mov(src, dest.clone()));
					}
					llvm_ir::Instruction::SExt(i) => {
						let (src, mut ops) = op_to_reg(&mut ctx, &i.operand);
						blockloop.append(&mut ops);

						let dest = give_reg(&mut ctx, &i.dest);
						blockloop.push(BfOp::Tag(
							dest.clone(),
							format!("{}_sext_{}", i.dest, i.operand),
						));
						blockloop.push(BfOp::Mov(src, dest.clone()));
					}

					llvm_ir::Instruction::PtrToInt(i) => {
						let dest = give_reg(&mut ctx, &i.dest);

						blockloop.push(BfOp::Tag(
							dest.clone(),
							format!("%{}_ptrtoi_%{}", i.dest, i.operand),
						));

						let ptr = ctx
							.layout
							.iter()
							.position(|c| match c {
								Cell::Alloc(n) => n == unlop(&i.operand),
								_ => false,
							})
							.unwrap();

						let tmp = borrow_reg(&mut ctx, 1);

						// basically reach back to the stack pointer and add it
						// to our destination int. This way the initified
						// pointer be basically be:
						// the address of the stack register position
						// +
						// the current stack's position
						blockloop.push(BfOp::Left(1));
						blockloop.push(BfOp::Dup(
							fixed_addr(&mut ctx, 0),
							offset(tmp.clone(), 1),
							offset(dest.clone(), 1),
						));
						blockloop.push(BfOp::Mov(
							offset(tmp.clone(), 1),
							fixed_addr(&mut ctx, 0),
						));
						blockloop.push(BfOp::Right(1));

						// plus 1 since the stack pointer is 1 before main loop
						blockloop.push(BfOp::AddI(dest.clone(), ptr as u8 + 1));
					}

					llvm_ir::Instruction::IntToPtr(i) => {
						let (src, mut ops) = op_to_reg(&mut ctx, &i.operand);
						blockloop.append(&mut ops);
						let dest = give_ptr(&mut ctx, &i.dest);
						blockloop.push(BfOp::Tag(
							dest.clone(),
							format!("{}_itoptr_{}", i.dest, i.operand),
						));
						blockloop.push(BfOp::Mov(src.clone(), dest));
					}

					_ => {
						unimplemented!("instruction? {}", instr);
					}
				}

				ctx.layout = ctx
					.layout
					.into_iter()
					.map(|c| match c {
						Cell::Borrowed(c2) => *c2,
						_ => c,
					})
					.collect();
			}
		}

		// if it handled a call we know that: the block ended in a call and
		// the terminator was a unconditional branch. These are both
		// rolled into the call instruction generator.
		if !handle_call {
			blockloop.push(BfOp::Comment(block.term.to_string()));

			match &block.term {
				llvm_ir::Terminator::Br(br) => {
					let brto = ctx
						.layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &br.dest,
							_ => false,
						})
						.unwrap();

					let brto = fixed_addr(&mut ctx, brto);

					blockloop.push(BfOp::Tag(
						brto.clone(),
						format!("B:{}/{}", func.name, br.dest),
					));
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
					let tru = fixed_addr(&mut ctx, tru);

					let fals = ctx
						.layout
						.iter()
						.position(|c| match c {
							Cell::BlockMask(n) => n == &cbr.false_dest,
							_ => false,
						})
						.unwrap();
					let fals = fixed_addr(&mut ctx, fals);

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

					blockloop.append(&mut zero_allocs(&mut ctx));

					blockloop.push(BfOp::SubI(fixed_addr(&mut ctx, 0), 1));
					blockloop.push(BfOp::Tag(
						fixed_addr(&mut ctx, 0),
						"dead_frame".to_string(),
					));

					blockloop.push(BfOp::SubI(fixed_addr(&mut ctx, fid), 1));

					blockloop.push(BfOp::Left(1));
					blockloop.push(BfOp::Zero(fixed_addr(&mut ctx, 0)));
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

		funcloop.push(BfOp::Loop(fixed_addr(&mut ctx, bid), blockloop))
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
			BfOp::Tag(fixed_addr(&mut ctx, fid), func.name.clone()),
			BfOp::Loop(fixed_addr(&mut ctx, fid), funcloop),
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
		layout: layout.clone(),
		addrs: Vec::<Addr>::new(),
	};

	root.push(BfOp::Right(ret_pad_width + STACK_PTR_W));
	root.push(BfOp::AddI(
		fixed_addr(&mut ctx, 0),
		ret_pad_width as u8 + STACK_PTR_W as u8,
	)); // stack base address
	root.push(BfOp::Right(1));
	root.push(BfOp::Comment("runtime init:".to_string()));
	root.push(BfOp::Tag(
		fixed_addr(&mut ctx, 0),
		"===TOP FRAME".to_string(),
	));
	root.push(BfOp::AddI(fixed_addr(&mut ctx, 0), 1));

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

	root.push(BfOp::Tag(fixed_addr(&mut ctx, mainfid), "main".to_string()));
	root.push(BfOp::AddI(fixed_addr(&mut ctx, mainfid), 1));
	root.push(BfOp::Tag(
		fixed_addr(&mut ctx, 1 + funcns),
		"main/b0".to_string(),
	));
	root.push(BfOp::AddI(fixed_addr(&mut ctx, 1 + funcns), 1));

	let mut mainloop: Vec<BfOp> = vec![];

	// ret pad is always the same width with: main loop + function masks +
	// landing pad mask
	let ret_pad_width = 1 + funcns + RET_LANDING_PAD;

	for func in module.functions.iter() {
		let (_, st_width) = build_func(&layout, ret_pad_width, 0, func);
		let (mut code, _) = build_func(&layout, ret_pad_width, st_width, func);

		mainloop.append(&mut code);
	}

	root.push(BfOp::Loop(fixed_addr(&mut ctx, 0), mainloop));

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
					'+' | '-' | '<' | '>' | '.' | ',' | '[' | ']' | ' ' => '_',
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
}
