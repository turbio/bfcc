use std::env;
use std::path::Path;

extern crate inkwell;

use inkwell::basic_block::BasicBlock;
use inkwell::module::Module;
use inkwell::types::AnyTypeEnum;
use inkwell::values::{
    BasicValue, BasicValueEnum, FunctionValue, InstructionOpcode,
    InstructionValue,
};
use inkwell::IntPredicate;

#[derive(Debug)]
enum Op {
    StoreImm(u8, usize),        // a -> b
    Move(usize, usize),         // a -> b
    Move2(usize, usize, usize), // a -> b, c
    Add(usize, usize),          // a + b -> b
    Sub(usize, usize),          // b - a -> b
    AddImm(u8, usize),          // a + b -> b
    SubImm(u8, usize),          // b - a -> b
    Not(usize, usize),          // !a -> b
    BitCast(usize, usize),      // !!a -> b

    Ret(usize), // FAKE NEWS :/

    Putc(usize), // TODO just for testing
    Getc(usize), // TODO just for testing

    Branch(usize),             // unconditional branch to a
    Cond(usize, usize, usize), // if a branch to b else branch to c
    Loop(usize, Vec<Op>),      // while a do ops
}

impl Op {
    fn pretty_print(&self) -> String {
        format!(
            "{:20}{}",
            match self {
                Op::StoreImm(val, dest) => {
                    format!("store {} at %{}", val, dest)
                }
                Op::Move(src, dest) => format!("move %{} to %{}", src, dest),
                Op::Move2(src, dest1, dest2) => {
                    format!("move %{} to %{} %{}", src, dest1, dest2)
                }
                Op::Add(src, dest) => format!("add %{} to %{}", src, dest),
                Op::Sub(src, dest) => format!("sub %{} from %{}", src, dest),
                Op::AddImm(src, dest) => format!("add {} to %{}", src, dest),
                Op::SubImm(src, dest) => format!("sub {} from %{}", src, dest),
                Op::Not(src, dest) => format!("not %{} to %{}", src, dest),
                Op::BitCast(src, dest) => {
                    format!("bitcast %{} to %{}", src, dest)
                }
                Op::Ret(addr) => format!("return %{} TODO", addr),
                Op::Putc(addr) => format!("putc %{}", addr),
                Op::Getc(addr) => format!("getc %{}", addr),
                Op::Branch(addr) => format!("do block %{}", addr),
                Op::Cond(src, tru, fals) => {
                    format!("if %{} th %{} el %{}", src, tru, fals)
                }
                Op::Loop(src, ops) => format!(
                    "while %{} do\n{}",
                    src,
                    ops.iter()
                        .map(|op| format!("\t{}", op.pretty_print()))
                        .collect::<Vec<String>>()
                        .join("\n")
                ),
            },
            self.print(),
        )
    }

    fn print(&self) -> String {
        match self {
            Op::StoreImm(v, dest) => format!(
                "{}[-]{}{}",
                print_tape_move(0, *dest),
                "+".repeat(*v as usize),
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
            .join(""),

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
    bblock: BasicBlock,
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
            format!("check unset %{}", self.address),
            self.print_begin()
        )
    }

    fn pretty_print_end(&self) -> String {
        format!(
            "{:15}{}",
            format!("check %{}", self.address),
            self.print_end()
        )
    }
}

#[derive(Debug)]
enum RValue {
    Addr(Cell),
    Imm(u8),
}

#[derive(Debug, Clone, Copy)]
enum CellFrom {
    Inst(InstructionValue),
    Block,
}

#[derive(Debug, Clone, Copy)]
struct Cell {
    address: usize,
    from: Option<CellFrom>,
}

#[derive(Debug)]
struct Mmap(Vec<Cell>);

impl Mmap {
    fn for_inst(&mut self, from: InstructionValue) -> Cell {
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
            from: Some(CellFrom::Inst(from)),
        };

        self.0.push(ent);

        ent
    }

    fn for_block(&mut self) -> Cell {
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
            from: Some(CellFrom::Block),
        };

        self.0.push(ent);

        ent
    }

    fn new_tmp(&mut self) -> Cell {
        let mut next_addr = 0;

        {
            let last = self.0.last();
            if last.is_some() {
                next_addr = last.unwrap().address + 1;
            }
        }

        let ent = Cell {
            address: next_addr,
            from: None,
        };

        self.0.push(ent);

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

    fn from_inst(&self, inst: InstructionValue) -> Option<&Cell> {
        self.0.iter().filter(|e| e.from.is_some()).find(|e| {
            match e.from.unwrap() {
                CellFrom::Inst(i) => i == inst,
                _ => false,
            }
        })
    }
}

#[derive(Debug)]
struct BuildFunc {
    address: isize,
    mmap: Mmap,
    blocks: Vec<Block>,
    cblock: usize,
    prelude: Vec<Op>,
}

impl BuildFunc {
    fn block_from_bblock(&self, b: BasicBlock) -> Option<&Block> {
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

    fn gen_inst_alloca(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 1);

        let operand = inst.get_operand(0).unwrap().left().unwrap();

        match operand {
            BasicValueEnum::IntValue(_v) => {
                // let uval = v.get_zero_extended_constant().unwrap() as usize;
                // let bytes = v.get_type().get_bit_width() as usize / 8;
                // let cells = uval * bytes;
                // println!("alloca {} items * {} bytes = {} cells", uval, bytes, cells);
                // println!("{}", ">".repeat(cells));

                // for now we'll just assume all allocas are one byte :/
                self.mmap.for_inst(inst);
            }
            _ => panic!("unsupported operand to alloca"),
        };
    }

    fn gen_inst_store(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        // assume the first operand is a pointer and get the instruction
        // and get the instruction that created it.
        let dest = inst.get_operand(1).unwrap().left().unwrap();
        let dest = match dest {
            BasicValueEnum::PointerValue(v) => v.as_instruction().unwrap(),
            _ => unimplemented!("espected store destination to be a pointer"),
        };

        let dest = { self.mmap.from_inst(dest).unwrap().address };

        let src = inst.get_operand(0).unwrap().left().unwrap();

        match src {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let immv = v.get_zero_extended_constant().unwrap();

                    let newop = {
                        if immv > 255 {
                            unimplemented!("unsupported value")
                        }
                        Op::StoreImm(immv as u8, dest)
                    };

                    self.pushop(newop);
                } else {
                    let src = {
                        let src = v.as_instruction().unwrap();
                        self.mmap.from_inst(src).unwrap().address
                    };
                    let tmp = self.mmap.new_tmp();
                    self.pushop(Op::Move2(src, dest, tmp.address));
                    self.pushop(Op::Move(tmp.address, src));
                    self.mmap.discard(tmp);
                }
            }

            BasicValueEnum::PointerValue(p) => {
                let instsrc = p.as_instruction().unwrap();
                let cellsrc = { self.mmap.from_inst(instsrc).unwrap().address };

                if cellsrc > 0xff {
                    unimplemented!("address out of range, char addresses");
                }

                self.pushop(Op::StoreImm(cellsrc as u8, dest));
            }

            _ => unimplemented!("unsupported store source {:#?}", src),
        };
    }

    fn gen_inst_load(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 1);

        let dest = { self.mmap.for_inst(inst) };

        let src = inst.get_operand(0).unwrap().left().unwrap();

        match src {
            BasicValueEnum::PointerValue(v) => {
                let src = src.as_instruction_value().unwrap();
                let src = { self.mmap.from_inst(src).unwrap().address };

                let eltype = v.get_type().get_element_type();
                match eltype {
                    AnyTypeEnum::PointerType(_) => {
                        // this whole thing is pretty hairy. The idea is to
                        // clear the first few cells, copy the pointer value
                        // into this area then move forward while moving cells
                        // infront behind and decrementing the pointer.
                        //
                        // for example: say we have the memory tape:
                        // | a | b | c | x | y | z | p | d | ? | ? | ? |
                        //
                        // where `p` is the address we want to deref, `d`
                        // is where we want to store the value and `z` is the
                        // value pointed to by `p` (p would equal 6)
                        //
                        // first we'll make room at the beginning:
                        // | 0 | 0 | 0 | x | y | z | p | d | a | b | c |
                        //
                        // then copy the pointer there (sub 3)
                        // | 0 | 0 | 2 | x | y | z | p | d | a | b | c |
                        //
                        // next we'll move forward one. the ptr copy is
                        // decremented and a return counter is incremented.
                        // | x | 0 | 1 | 1 | y | z | p | d | a | b | c |
                        //
                        // reap until the ptr copy is 0.
                        // | x | y | 0 | 2 | 0 | z | p | d | a | b | c |
                        //
                        // once ptr copy is 0 we'll copy the next value
                        // into its place
                        // | x | y | 0 | 2 | z | z | p | d | a | b | c |
                        //
                        // reverse the process, moving back until the return
                        // counter is 0.
                        // | x | 0 | 1 | z | y | z | p | d | a | b | c |
                        //
                        // | 0 | 0 | z | x | y | z | p | d | a | b | c |
                        //
                        // once 0 copy the value over to d and restore the moved
                        // cells
                        //
                        // | a | b | c | x | y | z | p | z | ? | ? | ? |
                        //
                        // it's like a train! choo choo

                        let tmp0 = { self.mmap.new_tmp() };
                        let tmp1 = { self.mmap.new_tmp() };
                        let tmp2 = { self.mmap.new_tmp() };

                        self.pushop(Op::Move(0, tmp0.address));
                        self.pushop(Op::Move(1, tmp1.address));
                        self.pushop(Op::Move(2, tmp2.address));

                        self.pushop(Op::Move2(src, 0, 1));
                        self.pushop(Op::Move(1, src));

                        self.pushop(Op::Loop(
                            0,
                            vec![Op::Move(3, 2), Op::Move(3, 2)],
                        ));

                        self.pushop(Op::Move(tmp0.address, 0));
                        self.pushop(Op::Move(tmp1.address, 1));
                        self.pushop(Op::Move(tmp2.address, 2));

                        self.mmap.discard(tmp0);
                        self.mmap.discard(tmp1);
                        self.mmap.discard(tmp2);
                    }
                    AnyTypeEnum::IntType(_) => {
                        let tmp = { self.mmap.new_tmp() };

                        self.pushop(Op::Move2(src, dest.address, tmp.address));
                        self.pushop(Op::Move(tmp.address, src));

                        self.mmap.discard(tmp);
                    }
                    _ => unimplemented!("load type {:#?}", eltype),
                }
            }
            _ => unimplemented!("load {:#?}", src),
        }
    }

    fn gen_inst_add(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let (rv1, rv2) = {
            let op1 = inst.get_operand(0).unwrap().left().unwrap();
            let op1 = self.rvalue_from_bval(op1);

            let op2 = inst.get_operand(1).unwrap().left().unwrap();
            let op2 = self.rvalue_from_bval(op2);

            (op1, op2)
        };

        let dest = self.mmap.for_inst(inst);

        match rv1 {
            RValue::Imm(v) => {
                self.pushop(Op::StoreImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop = self.mmap.new_tmp();
                self.pushop(Op::Move2(
                    src.address,
                    dest.address,
                    tmp_cop.address,
                ));
                self.pushop(Op::Move(tmp_cop.address, src.address));
                self.mmap.discard(tmp_cop);
            }
        }

        match rv2 {
            RValue::Imm(v) => {
                self.pushop(Op::AddImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop1 = self.mmap.new_tmp();
                let tmp_cop2 = self.mmap.new_tmp();

                self.pushop(Op::Move2(
                    src.address,
                    tmp_cop1.address,
                    tmp_cop2.address,
                ));
                self.pushop(Op::Move(tmp_cop2.address, src.address));
                self.pushop(Op::Add(tmp_cop1.address, dest.address));

                self.mmap.discard(tmp_cop1);
                self.mmap.discard(tmp_cop2);
            }
        }
    }

    fn rvalue_from_bval(&self, b: BasicValueEnum) -> RValue {
        if b.as_instruction_value().is_some() {
            RValue::Addr(
                *self
                    .mmap
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

    fn gen_inst_sub(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let (rv1, rv2) = {
            let op1 = inst.get_operand(0).unwrap().left().unwrap();
            let op1 = self.rvalue_from_bval(op1);

            let op2 = inst.get_operand(1).unwrap().left().unwrap();
            let op2 = self.rvalue_from_bval(op2);

            (op1, op2)
        };

        let dest = self.mmap.for_inst(inst);

        match rv1 {
            RValue::Imm(v) => {
                self.pushop(Op::StoreImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop = self.mmap.new_tmp();
                self.pushop(Op::Move2(
                    src.address,
                    dest.address,
                    tmp_cop.address,
                ));
                self.pushop(Op::Move(tmp_cop.address, src.address));
                self.mmap.discard(tmp_cop);
            }
        }

        match rv2 {
            RValue::Imm(v) => {
                self.pushop(Op::SubImm(v, dest.address));
            }
            RValue::Addr(src) => {
                let tmp_cop1 = self.mmap.new_tmp();
                let tmp_cop2 = self.mmap.new_tmp();

                self.pushop(Op::Move2(
                    src.address,
                    tmp_cop1.address,
                    tmp_cop2.address,
                ));
                self.pushop(Op::Move(tmp_cop2.address, src.address));
                self.pushop(Op::Sub(tmp_cop1.address, dest.address));

                self.mmap.discard(tmp_cop1);
                self.mmap.discard(tmp_cop2);
            }
        }
    }

    fn gen_inst_ret(&mut self, inst: InstructionValue) {
        // FAKE NEWS

        self.pushop(Op::Ret(0));
        return assert_eq!(inst.get_num_operands(), 1);

        let operand = inst.get_operand(0).unwrap().left().unwrap();

        match operand {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let i = v.get_zero_extended_constant().unwrap();

                    let tmp = self.mmap.new_tmp();
                    self.pushop(Op::StoreImm(i as u8, tmp.address));
                    self.pushop(Op::Ret(tmp.address));

                    self.mmap.discard(tmp);
                } else {
                    let i = v.as_instruction_value().unwrap();
                    let i = { self.mmap.from_inst(i).unwrap().address };

                    self.pushop(Op::Ret(i));
                }
            }
            _ => panic!("oh no, we don't handle that"),
        }
    }

    // TODO: this is just for validating execution right now
    fn gen_inst_call(&mut self, inst: InstructionValue) {
        if inst.get_num_operands() == 2 {
            let (ptr, tmp) = match inst.get_operand(0).unwrap().left().unwrap()
            {
                BasicValueEnum::IntValue(v) => {
                    if v.is_const() {
                        let ptr = self.mmap.new_tmp();

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
                            *self.mmap.from_inst(src).unwrap()
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
                self.mmap.discard(ptr);
            }
        } else if inst.get_num_operands() == 1 {
            let func = match inst.get_operand(0).unwrap().left().unwrap() {
                BasicValueEnum::PointerValue(v) => v,
                _ => panic!("unable to call"),
            };

            let dest = self.mmap.for_inst(inst);

            if func.get_name().to_str().unwrap() == "getc" {
                self.pushop(Op::Getc(dest.address));
            } else {
                panic!("we only know how to handle the putc builtin")
            }
        } else {
            unimplemented!("yeah, it's all fake :/")
        }
    }

    fn gen_inst_mul(&mut self, _inst: InstructionValue) {
        unimplemented!("we can't multiply yet :(");
    }

    fn gen_inst_icmp(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let pred = inst.get_icmp_predicate().unwrap();

        let rv1 = inst.get_operand(0).unwrap().left().unwrap();
        let rv1 = self.rvalue_from_bval(rv1);

        let rv2 = inst.get_operand(1).unwrap().left().unwrap();
        let rv2 = self.rvalue_from_bval(rv2);

        let dest = self.mmap.for_inst(inst);

        match pred {
            IntPredicate::EQ => {
                let tmp_sub = self.mmap.new_tmp();

                match rv1 {
                    RValue::Imm(v) => {
                        self.pushop(Op::StoreImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop = self.mmap.new_tmp();
                        self.pushop(Op::Move2(
                            from.address,
                            tmp_sub.address,
                            tmp_cop.address,
                        ));
                        self.pushop(Op::Move(tmp_cop.address, from.address));
                        self.mmap.discard(tmp_cop);
                    }
                };
                match rv2 {
                    RValue::Imm(v) => {
                        self.pushop(Op::SubImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop1 = self.mmap.new_tmp();
                        let tmp_cop2 = self.mmap.new_tmp();

                        self.pushop(Op::Move2(
                            from.address,
                            tmp_cop1.address,
                            tmp_cop2.address,
                        ));
                        self.pushop(Op::Move(tmp_cop2.address, from.address));
                        self.pushop(Op::Sub(tmp_cop1.address, tmp_sub.address));

                        self.mmap.discard(tmp_cop1);
                        self.mmap.discard(tmp_cop2);
                    }
                };

                self.pushop(Op::Not(tmp_sub.address, dest.address));

                self.mmap.discard(tmp_sub);
            }
            IntPredicate::NE => {
                let tmp_sub = self.mmap.new_tmp();

                match rv1 {
                    RValue::Imm(v) => {
                        self.pushop(Op::StoreImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop = self.mmap.new_tmp();
                        self.pushop(Op::Move2(
                            from.address,
                            tmp_sub.address,
                            tmp_cop.address,
                        ));
                        self.pushop(Op::Move(tmp_cop.address, from.address));
                        self.mmap.discard(tmp_cop);
                    }
                };
                match rv2 {
                    RValue::Imm(v) => {
                        self.pushop(Op::SubImm(v, tmp_sub.address))
                    }
                    RValue::Addr(from) => {
                        let tmp_cop1 = self.mmap.new_tmp();
                        let tmp_cop2 = self.mmap.new_tmp();

                        self.pushop(Op::Move2(
                            from.address,
                            tmp_cop1.address,
                            tmp_cop2.address,
                        ));
                        self.pushop(Op::Move(tmp_cop2.address, from.address));
                        self.pushop(Op::Sub(tmp_cop1.address, tmp_sub.address));

                        self.mmap.discard(tmp_cop1);
                        self.mmap.discard(tmp_cop2);
                    }
                };

                self.pushop(Op::BitCast(tmp_sub.address, dest.address));

                self.mmap.discard(tmp_sub);
            }
            _ => unimplemented!("can't handle icmp type {:#?}", pred),
        }
    }

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

    fn gen_bblock(&mut self) {
        println!("=== begin block {}% =========", self.getblock().address);

        println!("{}", self.getblock().pretty_print_begin());

        let mut maybe_inst = self.getblock().bblock.get_first_instruction();
        while maybe_inst.is_some() {
            let inst = maybe_inst.unwrap();
            maybe_inst = inst.get_next_instruction();

            println!("=== {:#?} ===================", inst.get_opcode());

            match inst.get_opcode() {
                InstructionOpcode::Alloca => self.gen_inst_alloca(inst),
                InstructionOpcode::Store => self.gen_inst_store(inst),
                InstructionOpcode::Load => self.gen_inst_load(inst),
                InstructionOpcode::Add => self.gen_inst_add(inst),
                InstructionOpcode::Sub => self.gen_inst_sub(inst),
                InstructionOpcode::Return => self.gen_inst_ret(inst),
                InstructionOpcode::Call => self.gen_inst_call(inst),
                InstructionOpcode::Mul => self.gen_inst_mul(inst),
                InstructionOpcode::ICmp => self.gen_inst_icmp(inst),
                InstructionOpcode::Br => self.gen_inst_br(inst),
                _ => {
                    unimplemented!("instruction {:#?}", inst.get_opcode());
                }
            }

            // no tmps are left over
            for m in self.mmap.0.iter() {
                assert!(m.from.is_some());
            }
        }

        // self.ops
        //     .iter()
        //     .map(|op| format!("\t{}", op.pretty_print()))
        //     .collect::<Vec<String>>()
        //     .join("\n"),

        println!("=== end block {}% ===========", self.getblock().address);
        println!("{}", self.getblock().pretty_print_end());
        println!("");
    }
}

fn gen_func(func: FunctionValue) {
    let mut bfunc = BuildFunc {
        address: 0,
        mmap: Mmap(vec![]),
        blocks: vec![],
        cblock: 0,
        prelude: vec![],
    };

    let funcl = bfunc.mmap.for_block();

    let mut maybe_block = func.get_first_basic_block();
    while maybe_block.is_some() {
        let block = maybe_block.unwrap();
        maybe_block = block.get_next_basic_block();

        let blockcell = bfunc.mmap.for_block();

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
            println!("do block 0");
            1
        } else {
            println!("skip block 0");
            0
        };

        bfunc.setblock(i);
        let addr = { bfunc.getblock().address };

        bfunc.pushprelude(Op::StoreImm(v, addr));
    }

    println!("[ ; begin func block");

    println!("");

    for i in 0..bfunc.blocks.len() {
        bfunc.setblock(i);
        bfunc.gen_bblock();
    }

    println!("] ; end func block")
}

fn compile(path: &Path, print_llvm: bool) {
    let path = path.canonicalize().unwrap();
    let module = Module::parse_bitcode_from_path(path).unwrap();

    let mut maybe_func = module.get_first_function();

    while maybe_func.is_some() {
        let func = maybe_func.unwrap();
        maybe_func = func.get_next_function();

        println!(
            "=== begin func {} ==============",
            func.get_name().to_str().unwrap()
        );

        if print_llvm {
            println!("{}\n", func.print_to_string().to_string());
        }

        if func.get_basic_blocks().len() != 0 {
            gen_func(func);
        }

        println!(
            "=== end func {} ================\n",
            func.get_name().to_str().unwrap()
        );
    }
}

fn main() {
    let mut print_llvm = false;
    let mut pathstr = String::new();

    for arg in env::args().skip(1).by_ref() {
        if arg == "-llvm" {
            print_llvm = true;
        } else if pathstr == "" {
            if arg == "-" {
                pathstr = "/dev/stdin".to_owned();
            } else {
                pathstr = arg;
            }
        }
    }

    if pathstr == "" {
        panic!("expected at least one arg");
    }

    let bcfile = Path::new(&pathstr);

    compile(&bcfile, print_llvm);
}
