use std::env;
use std::path::Path;

extern crate inkwell;

use inkwell::basic_block::BasicBlock;
use inkwell::module::Module;
use inkwell::values::{
    BasicValue, BasicValueEnum, FunctionValue, InstructionOpcode, InstructionValue,
};
use inkwell::IntPredicate;

#[derive(Debug)]
enum Op {
    Store(u8, usize),          // b = a
    Copy(usize, usize, usize), // a -> b, c
    Move(usize, usize),        // a -> b
    Add(usize, usize),         // b += a
    Sub(usize, usize),         // b -= a
    AddImm(u8, usize),         // b += a
    SubImm(u8, usize),         // b += a
    Not(usize, usize),         // b = !a
    BitCast(usize, usize),     // b = !!a

    Ret(usize),  // FAKE NEWS :/
    Putc(usize), // TODO just for testing

    Branch(usize), // hmmm
}

impl Op {
    fn pretty_print(&self) -> String {
        format!(
            "{:20}{}",
            match self {
                Op::Store(val, dest) => format!("store {} at %{}", val, dest),
                Op::Copy(src, dest1, dest2) => format!("copy %{} to %{} %{}", src, dest1, dest2),
                Op::Move(src, dest) => format!("move %{} to %{}", src, dest),
                Op::Add(src, dest) => format!("add %{} to %{}", src, dest),
                Op::Sub(src, dest) => format!("sub %{} from %{}", src, dest),
                Op::AddImm(src, dest) => format!("add {} to %{}", src, dest),
                Op::SubImm(src, dest) => format!("sub {} from %{}", src, dest),
                Op::Not(src, dest) => format!("not %{} to %{}", src, dest),
                Op::BitCast(src, dest) => format!("bitcast %{} to %{}", src, dest),
                Op::Ret(addr) => format!("return %{} TODO", addr),
                Op::Putc(addr) => format!("putc %{}", addr),
                Op::Branch(addr) => format!("branch %{}", addr),
            },
            self.print(),
        )
    }

    fn print(&self) -> String {
        match self {
            Op::Store(v, dest) => format!(
                "{}[-]{}{}",
                print_tape_move(0, *dest),
                "+".repeat(*v as usize),
                print_tape_move(*dest, 0),
            ),

            Op::Copy(src, dest1, dest2) => format!(
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

            Op::Branch(addr) => format!(
                "{}BRANCH{}",
                print_tape_move(0, *addr),
                print_tape_move(*addr, 0),
            ),

            Op::Ret(addr) => format!(
                "{}TODO RETURN{}",
                print_tape_move(0, *addr),
                print_tape_move(*addr, 0)
            ),

            Op::Putc(addr) => format!(
                "{}.{}",
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
            "{}[{}",
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
            "{:20}{}",
            format!("check %{}", self.address),
            self.print_begin()
        )
    }

    fn pretty_print_end(&self) -> String {
        format!(
            "{:20}{}",
            format!("check %{}", self.address),
            self.print_end()
        )
    }
}

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
        self.0
            .iter()
            .filter(|e| e.from.is_some())
            .find(|e| match e.from.unwrap() {
                CellFrom::Inst(i) => i == inst,
                _ => false,
            })
    }
}

#[derive(Debug)]
struct BuildFunc {
    address: isize,
    mmap: Mmap,
    blocks: Vec<Block>,
    cblock: usize,
}

impl BuildFunc {
    fn pushop(&mut self, op: Op) {
        println!("{}", op.pretty_print());

        let curblock = self.blocks.get_mut(self.cblock).unwrap();
        curblock.ops.push(op);
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
            _ => unimplemented!("oh no"),
        };

        let dest = { self.mmap.from_inst(dest).unwrap().address };

        match inst.get_operand(0).unwrap().left().unwrap() {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let immv = v.get_zero_extended_constant().unwrap();

                    let newop = {
                        if immv > 255 {
                            unimplemented!("unsupported value")
                        }
                        Op::Store(immv as u8, dest)
                    };

                    self.pushop(newop);
                } else {
                    let src = {
                        let src = v.as_instruction().unwrap();
                        self.mmap.from_inst(src).unwrap().address
                    };
                    let tmp = self.mmap.new_tmp();
                    self.pushop(Op::Copy(src, dest, tmp.address));
                    self.pushop(Op::Move(tmp.address, src));
                    self.mmap.discard(tmp);
                }
            }
            _ => unimplemented!("only int stores are handled"),
        };
    }

    fn gen_inst_load(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 1);

        let dest = { self.mmap.for_inst(inst) };

        let tmp_dest2 = { self.mmap.for_inst(inst) };

        let (opc, opm) = {
            let src = inst.get_operand(0).unwrap().left().unwrap();
            let src = src.as_instruction_value().unwrap();
            let src = self.mmap.from_inst(src).unwrap();

            let opc = Op::Copy(src.address, dest.address, tmp_dest2.address);
            let opm = Op::Move(tmp_dest2.address, src.address);
            (opc, opm)
        };

        self.pushop(opc);
        self.pushop(opm);

        self.mmap.discard(tmp_dest2);
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
                self.pushop(Op::Store(v, dest.address));
            }
            RValue::Addr(a) => {
                let tmp_cop = self.mmap.new_tmp();
                self.pushop(Op::Copy(a.address, dest.address, tmp_cop.address));
                self.pushop(Op::Move(tmp_cop.address, a.address));
                self.mmap.discard(tmp_cop);
            }
        }

        match rv2 {
            RValue::Imm(v) => {
                self.pushop(Op::AddImm(v, dest.address));
            }
            RValue::Addr(a) => {
                let tmp_cop = self.mmap.new_tmp();
                self.pushop(Op::Copy(a.address, dest.address, tmp_cop.address));
                self.pushop(Op::Move(tmp_cop.address, a.address));
                self.pushop(Op::Add(tmp_cop.address, dest.address));
                self.mmap.discard(tmp_cop);
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
                self.pushop(Op::Store(v, dest.address));
            }
            RValue::Addr(a) => {
                let tmp_cop = self.mmap.new_tmp();
                self.pushop(Op::Copy(a.address, dest.address, tmp_cop.address));
                self.pushop(Op::Move(tmp_cop.address, a.address));
                self.mmap.discard(tmp_cop);
            }
        }

        match rv2 {
            RValue::Imm(v) => {
                self.pushop(Op::SubImm(v, dest.address));
            }
            RValue::Addr(a) => {
                let tmp_cop = self.mmap.new_tmp();
                self.pushop(Op::Copy(a.address, dest.address, tmp_cop.address));
                self.pushop(Op::Move(tmp_cop.address, a.address));
                self.pushop(Op::Sub(tmp_cop.address, dest.address));
                self.mmap.discard(tmp_cop);
            }
        }
    }

    fn gen_inst_ret(&mut self, inst: InstructionValue) {
        // FAKE NEWS

        assert_eq!(inst.get_num_operands(), 1);

        let operand = inst.get_operand(0).unwrap().left().unwrap();

        match operand {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let i = v.get_zero_extended_constant().unwrap();

                    let tmp = self.mmap.new_tmp();
                    self.pushop(Op::Store(i as u8, tmp.address));
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
        assert_eq!(inst.get_num_operands(), 2);

        let (ptr, tmp) = match inst.get_operand(0).unwrap().left().unwrap() {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let ptr = self.mmap.new_tmp();

                    let immv = v.get_zero_extended_constant().unwrap();

                    let newop = {
                        if immv > 255 {
                            panic!("unsupported value")
                        }
                        Op::Store(immv as u8, ptr.address)
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
                    RValue::Imm(v) => self.pushop(Op::Store(v, tmp_sub.address)),
                    RValue::Addr(from) => {
                        let tmp_cop = self.mmap.new_tmp();
                        self.pushop(Op::Copy(from.address, tmp_sub.address, tmp_cop.address));
                        self.pushop(Op::Move(tmp_cop.address, from.address));
                        self.mmap.discard(tmp_cop);
                    }
                };
                match rv2 {
                    RValue::Imm(v) => self.pushop(Op::SubImm(v, tmp_sub.address)),
                    RValue::Addr(from) => {
                        let tmp_cop1 = self.mmap.new_tmp();
                        let tmp_cop2 = self.mmap.new_tmp();

                        self.pushop(Op::Copy(from.address, tmp_cop1.address, tmp_cop2.address));
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
                    RValue::Imm(v) => self.pushop(Op::Store(v, tmp_sub.address)),
                    RValue::Addr(from) => {
                        let tmp_cop = self.mmap.new_tmp();
                        self.pushop(Op::Copy(from.address, tmp_sub.address, tmp_cop.address));
                        self.pushop(Op::Move(tmp_cop.address, from.address));
                        self.mmap.discard(tmp_cop);
                    }
                };
                match rv2 {
                    RValue::Imm(v) => self.pushop(Op::SubImm(v, tmp_sub.address)),
                    RValue::Addr(from) => {
                        let tmp_cop1 = self.mmap.new_tmp();
                        let tmp_cop2 = self.mmap.new_tmp();

                        self.pushop(Op::Copy(from.address, tmp_cop1.address, tmp_cop2.address));
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

    fn gen_inst_br(&mut self, _inst: InstructionValue) {
        self.pushop(Op::Branch(5)); // lol, fake news
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

        println!("{}", self.getblock().pretty_print_end());

        println!("=== end block {}% ===========\n\n", self.getblock().address);
    }
}

fn gen_func(func: FunctionValue) {
    let mut bfunc = BuildFunc {
        address: 0,
        mmap: Mmap(vec![]),
        blocks: vec![],
        cblock: 0,
    };

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

    for i in 0..bfunc.blocks.len() {
        bfunc.setblock(i);
        bfunc.gen_bblock();
    }
}

fn compile(path: &Path, print_llvm: bool) {
    let path = path.canonicalize().unwrap();
    let module = Module::parse_bitcode_from_path(path).unwrap();

    let mut maybe_func = module.get_first_function();

    while maybe_func.is_some() {
        let func = maybe_func.unwrap();
        maybe_func = func.get_next_function();

        println!(
            "=== begin func {} ==============\n",
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
    let mut pathstr = "".to_owned();

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

fn exec(code: &str, input: &str) -> String {
    let mut input = input.to_owned();
    let code: Vec<char> = code.chars().collect();
    let mut mem: [u8; 1000] = [0; 1000];
    let mut pc = 0;
    let mut mp = 0;
    let mut out = String::new();

    while pc < code.len() {
        match code.get(pc).unwrap() {
            '+' => mem[mp] += 1,
            '-' => mem[mp] -= 1,
            '>' => mp += 1,
            '<' => mp -= 1,
            ',' => mem[mp] = input.remove(0) as u8,
            '.' => out.push(mem[mp] as char),
            '[' => {
                if mem[mp] == 0 {
                    let mut depth = 0;
                    while depth > 0 || *code.get(pc).unwrap() != ']' {
                        pc += 1;
                        if *code.get(pc).unwrap() == '[' {
                            depth += 1;
                        } else if *code.get(pc).unwrap() == ']' {
                            depth -= 1;
                        }
                    }
                }
            }
            ']' => {
                if mem[mp] != 0 {
                    let mut depth = 0;
                    while depth > 0 || *code.get(pc).unwrap() != '[' {
                        pc -= 1;
                        if *code.get(pc).unwrap() == ']' {
                            depth += 1;
                        } else if *code.get(pc).unwrap() == '[' {
                            depth -= 1;
                        }
                    }
                }
            }
            _ => {}
        };
        pc += 1;
    }

    out
}
