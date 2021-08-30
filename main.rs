extern crate llvm_ir;

use std::ops::Deref;

use std::env;
use std::path::Path;

#[derive(Debug)]
enum Op {
    // warning: load and store use the train station
    Load(usize, usize),  // *a -> b
    Store(usize, usize), // a -> *b

    StoreImm(u8, usize),     // a -> b
    StoreAddr(usize, usize), // a -> b (same as StoreImm, but retains  meaning)

    Move(usize, usize),         // a -> b
    Move2(usize, usize, usize), // a -> b, c

    Add(usize, usize), // a + b -> b
    Sub(usize, usize), // b - a -> b

    AddImm(u8, usize), // a + b -> b
    SubImm(u8, usize), // b - a -> b

    Not(usize, usize),     // !a -> b
    BitCast(usize, usize), // !!a -> b

    Ret(usize), // FAKE NEWS -_-

    Putc(usize), // TODO just for testing
    Getc(usize), // TODO just for testing

    Branch(usize),             // unconditional branch to a
    Cond(usize, usize, usize), // if a branch to b else branch to c
    Loop(usize, Vec<Op>),      // while a do ops
}

impl Op {
    fn pretty_print(&self) -> String {
        let as_str = match self {
            Op::Load(src, dest) => format!("load *#{} to #{}", src, dest),
            Op::Store(src, dest) => format!("store #{} at *#{}", src, dest),
            Op::StoreImm(val, dest) => format!("store {} at #{}", val, dest),
            Op::StoreAddr(val, dest) => format!("store &#{} at #{}", val, dest),
            Op::Move(src, dest) => format!("move #{} to #{}", src, dest),
            Op::Move2(src, dest1, dest2) => {
                format!("move #{} to #{} #{}", src, dest1, dest2)
            }
            Op::Add(src, dest) => format!("add #{} to #{}", src, dest),
            Op::Sub(src, dest) => format!("sub #{} from #{}", src, dest),
            Op::AddImm(src, dest) => format!("add {} to #{}", src, dest),
            Op::SubImm(src, dest) => format!("sub {} from #{}", src, dest),
            Op::Not(src, dest) => format!("not #{} to #{}", src, dest),
            Op::BitCast(src, dest) => format!("bitcast #{} to #{}", src, dest),
            Op::Ret(addr) => format!("return #{} TODO", addr),
            Op::Putc(addr) => format!("putc #{}", addr),
            Op::Getc(addr) => format!("getc #{}", addr),
            Op::Branch(addr) => format!("do block #{}", addr),
            Op::Cond(src, t, f) => {
                format!("if #{} then #{} else #{}", src, t, f)
            }
            Op::Loop(src, ops) => format!(
                "while #{} do\n{}",
                src,
                ops.iter()
                    .map(|op| format!("\t{}", op.pretty_print()))
                    .collect::<Vec<String>>()
                    .join("\n")
            ),
        };

        const OPCODES: &[char] = &['[', ']', '+', '-', '>', '<', ',', '.'];

        if as_str.find(OPCODES).is_some() {
            panic!("pretty printed output {} has opcode", as_str);
        }

        format!("{:20}{}", as_str, self.print())
    }

    fn print(&self) -> String {
        match self {
            // this whole thing is pretty hairy. The idea is to
            // clear the first few cells, copy the pointer value
            // into this area then move forward while moving cells
            // infront behind and decrementing the pointer.
            //
            // for example: say we have the tape:
            // | a | b | c | x | y | z | p | d |
            //
            // where `p` is the address we want to deref, `d`
            // is where we want to store the value and `z` is the
            // value pointed to by `p` (p would equal 5). a, b, and
            // c are the train station.
            //
            // then copy the pointer to the train station
            //
            // | 0 | 0 | 2 | x | y | z | p | d |
            //
            // next we'll move forward one. the ptr copy is
            // decremented and a return counter is incremented.
            //
            // | x | 0 | 1 | 1 | y | z | p | d |
            //
            // repeat until the ptr copy is 0.
            //
            // | x | y | 0 | 2 | 0 | z | p | d |
            //
            // once ptr copy is 0 we'll copy the next value
            // into its place
            //
            // | x | y | 0 | 2 | z | z | p | d |
            //
            // reverse the process, moving back until the return
            // counter is 0.
            //
            // | x | 0 | 1 | z | y | z | p | d |
            //
            // | 0 | 0 | z | x | y | z | p | d |
            //
            // once 0 copy the value over to d and restore the moved
            // cells
            //
            // | a | b | c | x | y | z | p | z |
            //
            // it's like a train! choo choo
            Op::Load(src, dest) => format!(
                "
copy addr to #2 \t{} {}
dec #2 by 3     \t{}
dec #2 inc #1   \t>>[-<+<
move #3 to #0   \t{}
move #2 to #3   \t{}
move #1 to #2   \t{}
drive right     \t>
                \t>>]<<
copy #3 to #2   \t{} {}
                \t>[-<
move #1 to #0   \t{}
move #2 to #1   \t{}
drive left      \t<
move #0 to #3   \t{}
                \t>]<
copy #2 to dest \t{}
",
                Op::Move2(*src, 1, 2).print(),
                Op::Move(1, *src).print(),
                Op::SubImm(3, 2).print(),
                Op::Move(3, 0).print(),
                Op::Move(2, 3).print(),
                Op::Move(1, 2).print(),
                Op::Move2(3, 0, 2).print(),
                Op::Move(0, 3).print(),
                Op::Move(1, 0).print(),
                Op::Move(2, 1).print(),
                Op::Move(0, 3).print(),
                Op::Move(2, *dest).print(),
            ),

            Op::Store(src, dest) => format!(
                // store works in a similar fasion to load, just in reverse.
                // the layout is
                //   0     1       2     3
                // | tmp | value | ret | addr
                "
copy addr to #3 \t{} {}
dec #3 by 4     \t{}
copy v to #1    \t{}
dec #3 inc #2   \t>>>[-<+<<
move #4 to #0   \t{}
move #3 to #4   \t{}
move #2 to #3   \t{}
move #1 to #2   \t{}
drive right     \t>
                \t>>>]<<<
move #1 to #4   \t{}
                \t>>[-<<
move #2 to #1   \t{}
drive left      \t<
move #0 to #3   \t{}
                \t>>]<<
",
                // copy addr to #3 (addr)
                Op::Move2(*dest, 2, 3).print(),
                Op::Move(2, *dest).print(),
                // dec #3 (addr) by 4 (we're starting at cell 4)
                Op::SubImm(4, 3).print(),
                // copy v to #1
                Op::Move(*src, 1).print(),
                // dec #3 inc #2
                // move #4 to #0
                Op::Move(4, 0).print(),
                // move #3 to #4
                Op::Move(3, 4).print(),
                // move #2 to #3
                Op::Move(2, 3).print(),
                // move #1 to #2
                Op::Move(1, 2).print(),
                // drive right
                // copy #3 to #2
                Op::Move(1, 4).print(),
                // move #2 to #1
                Op::Move(2, 1).print(),
                // drive left
                // move #0 to #3
                Op::Move(0, 4).print(),
            ),

            Op::StoreImm(v, dest) => format!(
                "{}[-]{}{}",
                print_tape_move(0, *dest),
                "+".repeat(*v as usize),
                print_tape_move(*dest, 0),
            ),

            Op::StoreAddr(v, dest) => format!(
                "{}[-]{}{}",
                print_tape_move(0, *dest),
                "+".repeat(*v),
                print_tape_move(*dest, 0),
            ),

            Op::Move2(src, dest1, dest2) => format!(
                "{}[-]{}[-]{}[-{}+{}+{}]{}",
                print_tape_move(0, *dest1),
                print_tape_move(*dest1, *dest2),
                print_tape_move(*dest2, *src),
                print_tape_move(*src, *dest1),
                print_tape_move(*dest1, *dest2),
                print_tape_move(*dest2, *src),
                print_tape_move(*src, 0),
            ),

            Op::Move(src, dest) => format!(
                "{}[-]{}[-{}+{}]{}",
                print_tape_move(0, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, 0)
            ),

            Op::Add(src, dest) => format!(
                "{}[-{}+{}]{}",
                print_tape_move(0, *src),
                print_tape_move(*src, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, 0)
            ),

            Op::Sub(src, dest) => format!(
                "{}[-{}-{}]{}",
                print_tape_move(0, *src),
                print_tape_move(*src, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, 0)
            ),

            Op::AddImm(v, dest) => format!(
                "{}{}{}",
                print_tape_move(0, *dest),
                "+".repeat(*v as usize),
                print_tape_move(*dest, 0),
            ),

            Op::SubImm(v, dest) => format!(
                "{}{}{}",
                print_tape_move(0, *dest),
                "-".repeat(*v as usize),
                print_tape_move(*dest, 0)
            ),

            Op::Not(src, dest) => format!(
                "{}+{}[{}-{}[-]]{}",
                print_tape_move(0, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, 0),
            ),

            Op::BitCast(src, dest) => format!(
                "{}[-]{}[{}+{}[-]]{}",
                print_tape_move(0, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, *dest),
                print_tape_move(*dest, *src),
                print_tape_move(*src, 0),
            ),

            Op::Branch(addr) => Op::StoreImm(1, *addr).print(),

            Op::Cond(src, tru, fals) => vec![
                Op::Move2(*src, *tru, *fals),
                Op::Move(*fals, *src),
                Op::Not(*src, *fals),
            ]
            .iter()
            .map(|o| o.print())
            .collect::<Vec<String>>()
            .join(" "),

            Op::Loop(_, _) => format!("todo lol"),

            Op::Ret(addr) => format!(
                "{}-{}",
                print_tape_move(0, *addr),
                print_tape_move(*addr, 0)
            ),

            Op::Putc(addr) => format!(
                "{}.{}",
                print_tape_move(0, *addr),
                print_tape_move(*addr, 0)
            ),

            Op::Getc(addr) => format!(
                "{},{}",
                print_tape_move(0, *addr),
                print_tape_move(*addr, 0)
            ),
        }
    }
}

fn print_tape_move(from: usize, to: usize) -> String {
    if from > to {
        "<".repeat(from - to)
    } else {
        ">".repeat(to - from)
    }
}

#[derive(Debug)]
struct Block {
    address: usize, // execute b if a is truthy
    ops: Vec<Op>,
    bblock: llvm_ir::basicblock::BasicBlock,
}

impl Block {
    fn print_begin(&self) -> String {
        format!(
            "{}[[-]{}",
            print_tape_move(0, self.address),
            print_tape_move(self.address, 0),
        )
    }

    fn print_end(&self) -> String {
        format!(
            "{}]{}",
            print_tape_move(0, self.address),
            print_tape_move(self.address, 0),
        )
    }

    fn pretty_print_begin(&self) -> String {
        format!(
            "{:15}{}",
            format!("check clear #{}", self.address),
            self.print_begin()
        )
    }

    fn pretty_print_end(&self) -> String {
        format!(
            "{:15}{}",
            format!("check #{}", self.address),
            self.print_end()
        )
    }
}

#[derive(Debug)]
enum RValue {
    Addr(Cell),
    Imm(u8),
}

#[derive(Debug, Clone)]
enum CellFrom {
    Inst(llvm_ir::instruction::Instruction),
    Block,
    Alloc,
}

#[derive(Debug, Clone)]
struct Cell {
    address: usize,
    from: Option<CellFrom>,
}

#[derive(Debug)]
struct RegMap(Vec<Cell>);

impl RegMap {
    fn for_inst(&mut self, from: llvm_ir::instruction::Instruction) -> Cell {
        self.new(CellFrom::Inst(from))
    }

    fn for_block(&mut self) -> Cell {
        self.new(CellFrom::Block)
    }

    fn for_alloc(&mut self) -> Cell {
        self.new(CellFrom::Alloc)
    }

    fn new_tmp(&mut self) -> Cell {
        let next_addr = {
            let last = self.0.last();
            if last.is_some() {
                last.unwrap().address + 1
            } else {
                0
            }
        };

        let ent = Cell {
            address: next_addr,
            from: None,
        };

        self.0.push(ent.clone());

        ent
    }

    fn new(&mut self, from: CellFrom) -> Cell {
        let next_addr = {
            let last = self.0.last();
            if last.is_some() {
                last.unwrap().address + 1
            } else {
                0
            }
        };

        let ent = Cell {
            address: next_addr,
            from: Some(from),
        };

        self.0.push(ent.clone());

        ent
    }

    fn discard(&mut self, e: Cell) {
        let index = self
            .0
            .iter()
            .position(|ee| ee.address == e.address)
            .unwrap();

        self.0.remove(index);
    }

    fn from_inst(&self, inst: llvm_ir::instruction::Instruction) -> Option<&Cell> {
        self.0
            .iter()
            .filter(|e| e.from.is_some())
            .find(|e| match e.from.clone().unwrap() {
                CellFrom::Inst(i) => i == inst,
                _ => false,
            })
    }
}

#[derive(Debug)]
struct BuildFunc {
    address: usize,
    rmap: RegMap,
    blocks: Vec<Block>,
    cblock: usize,
    prelude: Vec<Op>,
}

impl BuildFunc {
    fn block_from_bblock(&self, b: llvm_ir::BasicBlock) -> Option<&Block> {
        self.blocks.iter().find(|e| e.bblock == b)
    }

    fn pushop(&mut self, op: Op) {
        println!("{}", op.pretty_print());

        let curblock = self.blocks.get_mut(self.cblock).unwrap();
        curblock.ops.push(op);
    }

    fn pushprelude(&mut self, op: Op) {
        println!("{}", op.pretty_print());

        self.prelude.push(op);
    }

    fn setblock(&mut self, i: usize) {
        if self.blocks.get(i).is_none() {
            panic!("tried to set current block to invalid");
        }
        self.cblock = i;
    }

    fn getblock(&self) -> &Block {
        self.blocks.get(self.cblock).unwrap()
    }

    fn gen_inst_alloca(&mut self, alloca: llvm_ir::instruction::Alloca) {
        let typ = alloca.allocated_type.deref();
        match typ {
            llvm_ir::Type::IntegerType { bits: _ } => {
                // let uval = v.get_zero_extended_constant().unwrap() as usize;
                // let bytes = v.get_type().get_bit_width() as usize / 8;
                // let cells = uval * bytes;
                // println!("alloca {} items * {} bytes = {} cells", uval, bytes, cells);
                // println!("{}", ">".repeat(cells));

                // for now we'll just assume all allocas are one byte :/

                let addr = self.rmap.for_alloc().address;
                let ptr = self
                    .rmap
                    .for_inst(llvm_ir::instruction::Instruction::Alloca(alloca));
                self.pushop(Op::StoreAddr(addr, ptr.address));
            }
            _ => panic!("unsupported operand to alloca"),
        };
    }

    fn gen_inst_store(&mut self, store: llvm_ir::instruction::Store) {
        let dest = match store.address.as_constant().unwrap() {
            llvm_ir::constant::Constant::Int { bits: _, value } => *value as usize,
            _ => unreachable!("what kinda address is that lol"),
        };
        let src = store.value;

        match src {
            llvm_ir::operand::Operand::ConstantOperand(cref) => match cref.deref() {
                llvm_ir::constant::Constant::Int { bits: _, value } => {
                    if *value > 255 {
                        unimplemented!("unsupported value")
                    }

                    let tmp = self.rmap.new_tmp();
                    self.pushop(Op::StoreImm(*value as u8, tmp.address));
                    self.pushop(Op::Store(tmp.address, dest));
                    self.rmap.discard(tmp);
                }

                _ => unimplemented!("dunno about that type"),
            },

            llvm_ir::operand::Operand::LocalOperand { name: _, ty } => match ty.deref() {
                llvm_ir::types::Type::IntegerType { bits: _ } => {}
                _ => unimplemented!("unsupported store dest type"),
            },

            _ => unimplemented!("unsupported store source value"), /*
                                                                   BasicValueEnum::IntValue(v) => {
                                                                       if v.is_const() {
                                                                           let immv = v.get_zero_extended_constant().unwrap();

                                                                           if immv > 255 {
                                                                               unimplemented!("unsupported value")
                                                                           }

                                                                           let tmp = self.rmap.new_tmp();
                                                                           self.pushop(Op::StoreImm(immv as u8, tmp.address));
                                                                           self.pushop(Op::Store(tmp.address, dest));
                                                                           self.rmap.discard(tmp);
                                                                       } else {
                                                                           let src = {
                                                                               let src = v.as_instruction().unwrap();
                                                                               self.rmap.from_inst(src).unwrap().address
                                                                           };

                                                                           let tmp1 = self.rmap.new_tmp();
                                                                           let tmp2 = self.rmap.new_tmp();

                                                                           self.pushop(Op::Move2(src, tmp1.address, tmp2.address));
                                                                           self.pushop(Op::Move(tmp2.address, src));
                                                                           self.pushop(Op::Store(tmp1.address, dest));

                                                                           self.rmap.discard(tmp1);
                                                                           self.rmap.discard(tmp2);
                                                                       }
                                                                   }

                                                                   BasicValueEnum::PointerValue(p) => {
                                                                       let instsrc = p.as_instruction().unwrap();
                                                                       let src = { self.rmap.from_inst(instsrc).unwrap().address };

                                                                       if src > 0xff {
                                                                           unimplemented!("address out of range, char addresses");
                                                                       }

                                                                       let tmp1 = self.rmap.new_tmp();
                                                                       let tmp2 = self.rmap.new_tmp();

                                                                       self.pushop(Op::Move2(src, tmp1.address, tmp2.address));
                                                                       self.pushop(Op::Move(tmp2.address, src));
                                                                       self.pushop(Op::Store(tmp1.address, dest));

                                                                       self.rmap.discard(tmp1);
                                                                       self.rmap.discard(tmp2);
                                                                   }

                                                                   _ => unimplemented!("unsupported store source {:#?}", src),
                                                                   */
        };
    }

    /*
    fn gen_inst_load(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 1);

        let dest = { self.rmap.for_inst(inst) };

        let src = inst.get_operand(0).unwrap().left().unwrap();

        let src = src.as_instruction_value().unwrap();
        let src = { self.rmap.from_inst(src).unwrap().address };

        self.pushop(Op::Load(src, dest.address));
    }
    */

    /*
    fn gen_inst_add(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let (rv1, rv2) = {
            let op1 = inst.get_operand(0).unwrap().left().unwrap();
            let op1 = self.rvalue_from_bval(op1);

            let op2 = inst.get_operand(1).unwrap().left().unwrap();
            let op2 = self.rvalue_from_bval(op2);

            (op1, op2)
        };

        let dest = self.rmap.for_inst(inst);

        match rv1 {
            RValue::Imm(v) => {
                self.pushop(Op::StoreImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop = self.rmap.new_tmp();
                self.pushop(Op::Move2(
                    src.address,
                    dest.address,
                    tmp_cop.address,
                ));
                self.pushop(Op::Move(tmp_cop.address, src.address));
                self.rmap.discard(tmp_cop);
            }
        }

        match rv2 {
            RValue::Imm(v) => {
                self.pushop(Op::AddImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop1 = self.rmap.new_tmp();
                let tmp_cop2 = self.rmap.new_tmp();

                self.pushop(Op::Move2(
                    src.address,
                    tmp_cop1.address,
                    tmp_cop2.address,
                ));
                self.pushop(Op::Move(tmp_cop2.address, src.address));
                self.pushop(Op::Add(tmp_cop1.address, dest.address));

                self.rmap.discard(tmp_cop1);
                self.rmap.discard(tmp_cop2);
            }
        }
    }
    */

    /*
    fn rvalue_from_bval(&self, b: BasicValueEnum) -> RValue {
        if b.as_instruction_value().is_some() {
            RValue::Addr(
                *self
                    .rmap
                    .from_inst(b.as_instruction_value().unwrap())
                    .unwrap(),
            )
        } else {
            match b {
                BasicValueEnum::IntValue(v) => {
                    RValue::Imm(v.get_zero_extended_constant().unwrap() as u8)
                }
                _ => unimplemented!("only ints right now"),
            }
        }
    }
    */

    /*
    fn gen_inst_sub(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let (rv1, rv2) = {
            let op1 = inst.get_operand(0).unwrap().left().unwrap();
            let op1 = self.rvalue_from_bval(op1);

            let op2 = inst.get_operand(1).unwrap().left().unwrap();
            let op2 = self.rvalue_from_bval(op2);

            (op1, op2)
        };

        let dest = self.rmap.for_inst(inst);

        match rv1 {
            RValue::Imm(v) => {
                self.pushop(Op::StoreImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop = self.rmap.new_tmp();
                self.pushop(Op::Move2(
                    src.address,
                    dest.address,
                    tmp_cop.address,
                ));
                self.pushop(Op::Move(tmp_cop.address, src.address));
                self.rmap.discard(tmp_cop);
            }
        }

        match rv2 {
            RValue::Imm(v) => {
                self.pushop(Op::SubImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop1 = self.rmap.new_tmp();
                let tmp_cop2 = self.rmap.new_tmp();

                self.pushop(Op::Move2(
                    src.address,
                    tmp_cop1.address,
                    tmp_cop2.address,
                ));
                self.pushop(Op::Move(tmp_cop2.address, src.address));
                self.pushop(Op::Sub(tmp_cop1.address, dest.address));

                self.rmap.discard(tmp_cop1);
                self.rmap.discard(tmp_cop2);
            }
        }
    }
    */

    /*
    fn gen_inst_ret(&mut self, inst: InstructionValue) {
        // FAKE NEWS

        let addr = { self.address };
        self.pushop(Op::Ret(addr)); // just guess where
        return assert_eq!(inst.get_num_operands(), 1);

        let operand = inst.get_operand(0).unwrap().left().unwrap();

        match operand {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let i = v.get_zero_extended_constant().unwrap();

                    let tmp = self.rmap.new_tmp();
                    self.pushop(Op::StoreImm(i as u8, tmp.address));
                    self.pushop(Op::Ret(tmp.address));

                    self.rmap.discard(tmp);
                } else {
                    let i = v.as_instruction_value().unwrap();
                    let i = { self.rmap.from_inst(i).unwrap().address };

                    self.pushop(Op::Ret(i));
                }
            }
            _ => panic!("oh no, we don't handle that"),
        }
    }
    */

    /*
    // TODO: this is just for validating execution right now
    fn gen_inst_call(&mut self, inst: InstructionValue) {
        if inst.get_num_operands() == 2 {
            let (ptr, tmp) = match inst.get_operand(0).unwrap().left().unwrap()
            {
                BasicValueEnum::IntValue(v) => {
                    if v.is_const() {
                        let ptr = self.rmap.new_tmp();

                        let immv = v.get_zero_extended_constant().unwrap();

                        let newop = {
                            if immv > 255 {
                                panic!("unsupported value")
                            }
                            Op::StoreImm(immv as u8, ptr.address)
                        };

                        self.pushop(newop);

                        (ptr, true)
                    } else {
                        let ptr = {
                            let src = v.as_instruction().unwrap();
                            *self.rmap.from_inst(src).unwrap()
                        };

                        (ptr, false)
                    }
                }
                _ => panic!("we only deal in ints!"),
            };

            let func = match inst.get_operand(1).unwrap().left().unwrap() {
                BasicValueEnum::PointerValue(v) => v,
                _ => panic!("unable to call"),
            };

            if func.get_name().to_str().unwrap() == "putc" {
                self.pushop(Op::Putc(ptr.address));
            } else {
                panic!("we only know how to handle the putc builtin")
            }

            if tmp {
                self.rmap.discard(ptr);
            }
        } else if inst.get_num_operands() == 1 {
            let func = match inst.get_operand(0).unwrap().left().unwrap() {
                BasicValueEnum::PointerValue(v) => v,
                _ => panic!("unable to call"),
            };

            let dest = self.rmap.for_inst(inst);

            if func.get_name().to_str().unwrap() == "getc" {
                self.pushop(Op::Getc(dest.address));
            } else {
                panic!("we only know how to handle the putc builtin")
            }
        } else {
            unimplemented!("yeah, it's all fake :/")
        }
    }
    */

    /*
    fn gen_inst_mul(&mut self, _inst: InstructionValue) {
        unimplemented!("we can't multiply yet :(");
    }
    */

    /*
    fn gen_inst_icmp(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let pred = inst.get_icmp_predicate().unwrap();

        let rv1 = inst.get_operand(0).unwrap().left().unwrap();
        let rv1 = self.rvalue_from_bval(rv1);

        let rv2 = inst.get_operand(1).unwrap().left().unwrap();
        let rv2 = self.rvalue_from_bval(rv2);

        let dest = self.rmap.for_inst(inst);

        match pred {
            IntPredicate::EQ => {
                let tmp_sub = self.rmap.new_tmp();

                match rv1 {
                    RValue::Imm(v) => {
                        self.pushop(Op::StoreImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop = self.rmap.new_tmp();
                        self.pushop(Op::Move2(
                            from.address,
                            tmp_sub.address,
                            tmp_cop.address,
                        ));
                        self.pushop(Op::Move(tmp_cop.address, from.address));
                        self.rmap.discard(tmp_cop);
                    }
                };
                match rv2 {
                    RValue::Imm(v) => {
                        self.pushop(Op::SubImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop1 = self.rmap.new_tmp();
                        let tmp_cop2 = self.rmap.new_tmp();

                        self.pushop(Op::Move2(
                            from.address,
                            tmp_cop1.address,
                            tmp_cop2.address,
                        ));
                        self.pushop(Op::Move(tmp_cop2.address, from.address));
                        self.pushop(Op::Sub(tmp_cop1.address, tmp_sub.address));

                        self.rmap.discard(tmp_cop1);
                        self.rmap.discard(tmp_cop2);
                    }
                };

                self.pushop(Op::Not(tmp_sub.address, dest.address));

                self.rmap.discard(tmp_sub);
            }
            IntPredicate::NE => {
                let tmp_sub = self.rmap.new_tmp();

                match rv1 {
                    RValue::Imm(v) => {
                        self.pushop(Op::StoreImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop = self.rmap.new_tmp();
                        self.pushop(Op::Move2(
                            from.address,
                            tmp_sub.address,
                            tmp_cop.address,
                        ));
                        self.pushop(Op::Move(tmp_cop.address, from.address));
                        self.rmap.discard(tmp_cop);
                    }
                };
                match rv2 {
                    RValue::Imm(v) => {
                        self.pushop(Op::SubImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop1 = self.rmap.new_tmp();
                        let tmp_cop2 = self.rmap.new_tmp();

                        self.pushop(Op::Move2(
                            from.address,
                            tmp_cop1.address,
                            tmp_cop2.address,
                        ));
                        self.pushop(Op::Move(tmp_cop2.address, from.address));
                        self.pushop(Op::Sub(tmp_cop1.address, tmp_sub.address));

                        self.rmap.discard(tmp_cop1);
                        self.rmap.discard(tmp_cop2);
                    }
                };

                self.pushop(Op::BitCast(tmp_sub.address, dest.address));

                self.rmap.discard(tmp_sub);
            }
            _ => unimplemented!("can't handle icmp type {:#?}", pred),
        }
    }
    */

    /*
    fn gen_inst_phi(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_opcode(), InstructionOpcode::Phi);
        assert!(inst.get_previous_instruction().is_none());
        assert_eq!(inst.get_num_operands(), 2);

        let a = inst.get_operand(0).unwrap().left().unwrap();
        let b = inst.get_operand(1).unwrap().left().unwrap();

        let a = a.as_any_value_enum();

        println!("wiw {:?}", a);
    }
    */

    /*
    fn gen_inst_result_noop(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 1);

        let src =
            self.rvalue_from_bval(inst.get_operand(0).unwrap().left().unwrap());

        let dest = self.rmap.for_inst(inst);
        let tmp = self.rmap.new_tmp();

        match src {
            RValue::Imm(_) => {
                panic!("why tho");
            }
            RValue::Addr(src) => {
                self.pushop(Op::Move2(src.address, dest.address, tmp.address));
                self.pushop(Op::Move(tmp.address, src.address));
            }
        }

        self.rmap.discard(tmp);
    }
    */

    /*
    fn gen_inst_br(&mut self, inst: InstructionValue) {
        assert!(inst.get_num_operands() == 3 || inst.get_num_operands() == 1);

        if inst.get_num_operands() == 3 {
            let op1 = inst.get_operand(0).unwrap().left().unwrap();
            let op1 = self.rvalue_from_bval(op1);

            // hmmm, shold double check this
            // llvm's interface has the true operand as the second

            let tblock = inst.get_operand(2).unwrap().right().unwrap();
            let tblock = { self.block_from_bblock(tblock).unwrap().address };

            let fblock = inst.get_operand(1).unwrap().right().unwrap();
            let fblock = { self.block_from_bblock(fblock).unwrap().address };

            match op1 {
                RValue::Addr(cell) => {
                    self.pushop(Op::Cond(cell.address, tblock, fblock))
                }
                _ => unimplemented!("unhandled operand to br"),
            };
        } else if inst.get_num_operands() == 1 {
            let block = inst.get_operand(0).unwrap().right().unwrap();
            let block = { self.block_from_bblock(block).unwrap().address };

            self.pushop(Op::Branch(block));
        } else {
            panic!("unexpected number of operands");
        }
    }
    */

    fn gen_bblock(&mut self) {
        println!("=== begin block #{} =========", self.getblock().address);

        println!("{}", self.getblock().pretty_print_begin());

        for inst in self.getblock().bblock.instrs.clone().into_iter() {
            println!("=== {:#?} ===================", inst);

            match inst {
                llvm_ir::instruction::Instruction::Alloca(i) => self.gen_inst_alloca(i),
                llvm_ir::instruction::Instruction::Store(i) => self.gen_inst_store(i),
                //llvm_ir::instruction::Instruction::Load(i) => self.gen_inst_load(i),
                //llvm_ir::instruction::Instruction::Add(i) => self.gen_inst_add(i),
                //llvm_ir::instruction::Instruction::Sub(i) => self.gen_inst_sub(i),
                //llvm_ir::instruction::Instruction::Call(i) => self.gen_inst_call(i),
                //llvm_ir::instruction::Instruction::Mul(i) => self.gen_inst_mul(i),
                //llvm_ir::instruction::Instruction::ICmp(i) => self.gen_inst_icmp(i),

                //llvm_ir::instruction::Instruction::Phi(i) => self.gen_inst_phi(i),

                // i mean.......
                //llvm_ir::instruction::Instruction::ZExt(i) => self.gen_inst_result_noop(i),
                //llvm_ir::instruction::Instruction::Trunc(i) => self.gen_inst_result_noop(i),

                //llvm_ir::instruction::Instruction::Invoke(i) => unimplemented!("invoke is unsupported, pls lower '-lowerinvoke'"),
                //llvm_ir::instruction::Instruction::Switch(i) => unimplemented!("switch is unsupported, pls lower '-lowerswitch'"),

                //InstructionOpcode::Return => self.gen_inst_ret(inst),
                //InstructionOpcode::Br => self.gen_inst_br(inst),
                _ => {
                    unimplemented!("instruction {:#?}", inst);
                }
            }

            // no tmps are left over
            for m in self.rmap.0.iter() {
                assert!(m.from.is_some());
            }
        }

        // self.ops
        //     .iter()
        //     .map(|op| format!("\t{}", op.pretty_print()))
        //     .collect::<Vec<String>>()
        //     .join("\n"),

        println!("=== end block #{} ===========", self.getblock().address);
        println!("{}", self.getblock().pretty_print_end());
        println!("");
    }
}

fn gen_func(func: llvm_ir::Function) {
    let mut bfunc = BuildFunc {
        address: 0,
        rmap: RegMap(vec![]),
        blocks: vec![],
        cblock: 0,
        prelude: vec![],
    };

    // reserve blocks for traion station
    println!("pointer train station");
    let station = bfunc.rmap.for_block();
    bfunc.pushprelude(Op::StoreImm(0, station.address));
    let station = bfunc.rmap.for_block();
    bfunc.pushprelude(Op::StoreImm(0, station.address));
    let station = bfunc.rmap.for_block();
    bfunc.pushprelude(Op::StoreImm(0, station.address));
    let station = bfunc.rmap.for_block();
    bfunc.pushprelude(Op::StoreImm(0, station.address));

    let funcl = bfunc.rmap.for_block();
    bfunc.address = funcl.address;

    for block in func.basic_blocks.into_iter() {
        let blockcell = bfunc.rmap.for_block();

        bfunc.blocks.push(Block {
            address: blockcell.address,
            bblock: block,
            ops: vec![],
        });
    }

    println!("=== func prelude ============");
    println!("do func");
    bfunc.pushprelude(Op::StoreImm(1, funcl.address));
    for i in 0..bfunc.blocks.len() {
        let v = if i == 0 {
            println!("do block");
            1
        } else {
            println!("skip block");
            0
        };

        bfunc.setblock(i);
        let addr = { bfunc.getblock().address };

        bfunc.pushprelude(Op::StoreImm(v, addr));
    }

    println!(
        "{}[{} ; begin func block",
        print_tape_move(0, funcl.address),
        print_tape_move(funcl.address, 0),
    );

    println!("");

    for i in 0..bfunc.blocks.len() {
        bfunc.setblock(i);
        bfunc.gen_bblock();
    }

    println!(
        "{}]{} ; end func block",
        print_tape_move(0, funcl.address),
        print_tape_move(funcl.address, 0),
    )
}

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

fn compile(path: &Path) {
    let path = path.canonicalize().unwrap();
    let mut module = llvm_ir::Module::from_bc_path(path).unwrap();

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
    for func in module.functions.iter_mut() {
        let mut b = 0;
        while b < func.basic_blocks.len() {
            let mut i = 0;
            while i < func.basic_blocks[b].instrs.len() {
                match &func.basic_blocks[b].instrs[i] {
                    llvm_ir::Instruction::Call(c) => c,
                    _ => {
                        i += 1;
                        continue;
                    }
                };

                let nextn = llvm_ir::Name::Number(
                    func.basic_blocks
                        .iter()
                        .map(|b| n2usize(&b.name))
                        .max()
                        .unwrap()
                        + 1,
                );

                if i == func.basic_blocks[b].instrs.len() - 1 {
                    let splitn = llvm_ir::BasicBlock {
                        name: nextn.clone(),
                        instrs: vec![],
                        term: func.basic_blocks[b].term.clone(),
                    };
                    func.basic_blocks.insert(b + 1, splitn);

                    func.basic_blocks[b].term = llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
                        debugloc: None,
                        dest: nextn.clone(),
                    });
                } else {
                    let splitn = llvm_ir::BasicBlock {
                        name: nextn.clone(),
                        instrs: func.basic_blocks[b].instrs.split_off(i + 1),
                        term: func.basic_blocks[b].term.clone(),
                    };
                    func.basic_blocks.insert(b + 1, splitn);

                    func.basic_blocks[b].term = llvm_ir::Terminator::Br(llvm_ir::terminator::Br {
                        debugloc: None,
                        dest: nextn.clone(),
                    });
                }
                i += 1;
            }

            b += 1;
        }
    }

    // TODO: this isn't really the move imo
    // function calls always call into block0. Thing is, if we're making a call
    // from block0 into another block0 we'll end up setting everything up but
    // then rerunning block0 in the calling function instead of the target.
    for func in module.functions.iter_mut() {
        let hascall = func.basic_blocks[0].instrs.iter().any(|i| match i {
            llvm_ir::Instruction::Call(_) => true,
            _ => false,
        });

        if hascall {
            let nextn = llvm_ir::Name::Number(
                func.basic_blocks
                    .iter()
                    .map(|b| n2usize(&b.name))
                    .max()
                    .unwrap()
                    + 1,
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

    //ppmod(&module);

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

    let intrinsics = vec![("putchar", "PUTCHAR"), ("getchar", "GETCHAR")]
        .into_iter()
        .collect::<std::collections::HashMap<&str, &str>>();

    // <function name> -> <function index>
    //                    <block num> -> <block index>
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
        .chain(
            vec![
                (
                    "putchar",
                    FnFlow {
                        fid: 0,
                        blks: Default::default(),
                        intrinsic: Some("".to_string()),
                    },
                ),
                (
                    "putchar",
                    FnFlow {
                        fid: 0,
                        blks: Default::default(),
                        intrinsic: Some("".to_string()),
                    },
                ),
            ]
            .into_iter()
            .enumerate()
            .map(|(i, mut f)| {
                f.1.fid = module.functions.len() + i;
                return f;
            }),
        )
        .collect::<std::collections::HashMap<&str, FnFlow>>();

    let mainfid = func2id["main"].fid;

    println!("runtime init: ");
    println!("+ #mainloop");
    gotofunc(0, mainfid, || println!("+ call #main"));
    gotoblock(0, funcns, 0, || println!("+ at #main/entry"));
    println!("");

    println!("[ main_loop");

    struct Reg {
        llvm_id: usize,
    }

    for (fid, func) in module.functions.iter().enumerate() {
        gotofunc(0, fid, || println!("#{} [", func.name));

        let mut regmap: Vec<Reg> = Default::default();

        for (bid, block) in func.basic_blocks.iter().enumerate() {
            let blockn = n2usize(&block.name);

            gotoblock(1, funcns, bid, || {
                println!("\t#{}/{} [-", func.name, blockn)
            });

            let mut handle_call = false;

            for (iid, instr) in block.instrs.iter().enumerate() {
                println!("\t\t{}", bfsan(instr.to_string()));
                match instr {
                    llvm_ir::Instruction::Call(c) => {
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

                        let brto = func2id[func.name.as_str()].blks[&br];

                        gotoblock(2, funcns, brto, || {
                            println!("\t\t+ enable next #{}/{}", func.name, br)
                        });
                        println!("\t\t{} next frame", ">".repeat(16));
                        println!("\t\t+ place #mainloop_{}", fnn);
                        gotofunc(2, func2id[fnn.as_str()].fid, || {
                            println!("\t\t+ call func #{}", fnn)
                        });
                        gotoblock(2, funcns, 0, || println!("\t\t+ #{}/entry", fnn));
                    }
                    llvm_ir::Instruction::Alloca(c) => {
                        match c.allocated_type.deref() {
                            llvm_ir::Type::IntegerType { bits } => {
                                //assert!(*bits == 8, "ohno {} bits", bits) lolz
                            }
                            _ => unimplemented!("those types arent welcome here"),
                        };

                        regmap.push(Reg {
                            llvm_id: n2usize(&c.dest),
                        })
                    }
                    llvm_ir::Instruction::Store(s) => {
                        let to = match &s.address {
                            llvm_ir::Operand::LocalOperand { name, .. } => n2usize(&name),
                            _ => unimplemented!("how tf we gonna deref that"),
                        };
                        let val = match &s.value {
                            llvm_ir::Operand::ConstantOperand(c) => match c.deref() {
                                llvm_ir::constant::Constant::Int { bits, value } => value,
                                _ => unimplemented!("how tf we gonna store that"),
                            },
                            _ => {
                                println!("TODO {:?}", s.value);
                                &0
                            }
                        };

                        let blockns = func.basic_blocks.len();

                        let reg = regmap
                            .iter()
                            .enumerate()
                            .find(|(_, x)| x.llvm_id == to)
                            .unwrap()
                            .0;

                        gotoreg(2, reg, funcns, blockns, || {
                            println!("\t\t{} #const_{}", "+".repeat(*val as usize), val)
                        });
                    }
                    _ => {
                        println!("\t\tunimpl");
                    }
                }
            }
            if !handle_call {
                println!("\t\tE {}", bfsan(block.term.to_string()));
                match &block.term {
                    llvm_ir::Terminator::Br(br) => {
                        let to = n2usize(&br.dest);
                        let toblock = func2id[func.name.as_str()].blks[&to];

                        gotoblock(2, funcns, toblock, || {
                            println!("\t\t+ #{}/{}", func.name, to)
                        });
                    }
                    llvm_ir::Terminator::CondBr(_) => {}
                    llvm_ir::Terminator::Ret(_) => {}
                    _ => unimplemented!("soon? {:?}", block.term),
                };
            }

            gotoblock(1, funcns, bid, || println!("\t] b{}", blockn));
        }

        gotofunc(0, fid, || println!("] {}", func.name));
    }

    println!("] main_loop");
}

fn gotoreg<F>(i: usize, reg: usize, funcns: usize, blockns: usize, f: F)
where
    F: FnOnce(),
{
    println!(
        "{}{}",
        "\t".repeat(i),
        ">".repeat(1 + funcns + blockns + reg)
    );
    f();
    println!(
        "{}{}",
        "\t".repeat(i),
        "<".repeat(1 + funcns + blockns + reg)
    );
}

fn gotoblock<F>(i: usize, bid: usize, funcns: usize, f: F)
where
    F: FnOnce(),
{
    println!("{}{}", "\t".repeat(i), ">".repeat(1 + bid + funcns));
    f();
    println!("{}{}", "\t".repeat(i), "<".repeat(1 + bid + funcns));
}

fn gotofunc<F>(i: usize, fid: usize, f: F)
where
    F: FnOnce(),
{
    println!("{}{}", "\t".repeat(i), ">".repeat(1 + fid));
    f();
    println!("{}{}", "\t".repeat(i), "<".repeat(1 + fid));
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
