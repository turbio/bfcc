use std::path::Path;
use std::env;
use std::process::Command;

extern crate inkwell;

use inkwell::module::Module;
use inkwell::values::{BasicValueEnum, FunctionValue, InstructionOpcode, InstructionValue,
                      BasicValue};

#[derive(Debug)]
enum Op {
    Store(u8, usize), // b = a
    Copy(usize, usize, usize), // a -> b, c
    Move(usize, usize), // a -> b
    Add(usize, usize), // b += a
    Sub(usize, usize), // b -= a
    Ret(usize), // FAKE
    Putc(usize), // TODO just for testing
}

#[derive(Debug, Clone, Copy)]
struct Cell {
    address: usize,

    from: Option<InstructionValue>,
}

#[derive(Debug)]
struct BuildFunc {
    address: isize,
    local_memmap: Vec<Cell>,
    ops: Vec<Op>,
}

fn pretty_print_op(op: &Op) -> String {
    format!(
        "{:20}",
        match op {
            Op::Store(val, dest) => format!("store {} at %{}", val, dest),
            Op::Copy(src, dest1, dest2) => format!("copy %{} to %{} %{}", src, dest1, dest2),
            Op::Move(src, dest) => format!("move %{} to %{}", src, dest),
            Op::Add(src, dest) => format!("add %{} to %{}", src, dest),
            Op::Sub(src, dest) => format!("sub %{} from %{}", src, dest),
            Op::Ret(addr) => format!("return %{} TODO", addr),
            Op::Putc(addr) => format!("putc %{}", addr),
        }
    )
}

impl BuildFunc {
    fn new_cell(&mut self, from: InstructionValue) -> Cell {
        let mut next_addr = 0;

        {
            let last = self.local_memmap.last();
            if last.is_some() {
                next_addr = last.unwrap().address + 1;
            }
        }

        let ent = Cell {
            address: next_addr,
            from: Some(from),
        };

        self.local_memmap.push(ent);

        ent
    }

    fn new_tmp_cell(&mut self) -> Cell {
        let mut next_addr = 0;

        {
            let last = self.local_memmap.last();
            if last.is_some() {
                next_addr = last.unwrap().address + 1;
            }
        }

        let ent = Cell {
            address: next_addr,
            from: None,
        };

        self.local_memmap.push(ent);

        ent
    }

    fn discard_cell(&mut self, e: Cell) {
        let index = self.local_memmap
            .iter()
            .position(|ee| ee.address == e.address)
            .unwrap();

        self.local_memmap.remove(index);
    }

    fn ent_from_inst(&self, inst: InstructionValue) -> Option<&Cell> {
        self.local_memmap.iter().filter(|e| e.from.is_some()).find(
            |e| {
                e.from.unwrap() == inst
            },
        )
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
                self.new_cell(inst);
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

        let dest = {
            self.ent_from_inst(dest).unwrap().address
        };

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

                    self.ops.push(newop);
                } else {
                    let src = {
                        let src = v.as_instruction().unwrap();
                        self.ent_from_inst(src).unwrap().address
                    };
                    let tmp = self.new_tmp_cell();
                    self.ops.push(Op::Copy(src, dest, tmp.address));
                    self.ops.push(Op::Move(tmp.address, src));
                    self.discard_cell(tmp);
                }
            }
            _ => unimplemented!("only int stores are handled"),
        };
    }

    fn gen_inst_load(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 1);

        let dest = {
            self.new_cell(inst)
        };

        let tmp_dest2 = {
            self.new_cell(inst)
        };

        let (opc, opm) = {
            let src = inst.get_operand(0).unwrap().left().unwrap();
            let src = src.as_instruction_value().unwrap();
            let src = self.ent_from_inst(src).unwrap();

            let opc = Op::Copy(src.address, dest.address, tmp_dest2.address);
            let opm = Op::Move(tmp_dest2.address, src.address);
            (opc, opm)
        };

        self.ops.push(opc);
        self.ops.push(opm);

        self.discard_cell(tmp_dest2);
    }

    fn gen_inst_add(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let (meml, memr) = {
            let opl = inst.get_operand(0)
                .unwrap()
                .left()
                .unwrap()
                .as_instruction_value()
                .unwrap();
            let opl = self.ent_from_inst(opl).unwrap();

            let opr = inst.get_operand(1)
                .unwrap()
                .left()
                .unwrap()
                .as_instruction_value()
                .unwrap();
            let opr = self.ent_from_inst(opr).unwrap();

            (opl.address, opr.address)
        };

        let dest = self.new_cell(inst);

        let tmpr = self.new_tmp_cell();

        let tmpc = self.new_tmp_cell();

        self.ops.push(Op::Copy(meml, dest.address, tmpc.address));
        self.ops.push(Op::Move(tmpc.address, meml));
        self.ops.push(Op::Copy(memr, tmpr.address, tmpc.address));
        self.ops.push(Op::Move(tmpc.address, memr));
        self.ops.push(Op::Add(tmpr.address, dest.address));

        self.discard_cell(tmpr);
        self.discard_cell(tmpc);
    }

    fn gen_inst_sub(&mut self, inst: InstructionValue) {
        assert_eq!(inst.get_num_operands(), 2);

        let (meml, memr) = {
            let opl = inst.get_operand(0)
                .unwrap()
                .left()
                .unwrap()
                .as_instruction_value()
                .unwrap();
            let opl = self.ent_from_inst(opl).unwrap();

            println!("{:#?}", inst.get_operand(1).unwrap().left().unwrap());

            let opr = inst.get_operand(1)
                .unwrap()
                .left()
                .unwrap()
                .as_instruction_value()
                .unwrap();
            let opr = self.ent_from_inst(opr).unwrap();

            (opl.address, opr.address)
        };

        let dest = self.new_cell(inst);

        let tmpr = self.new_tmp_cell();

        let tmpc = self.new_tmp_cell();

        self.ops.push(Op::Copy(meml, dest.address, tmpc.address));
        self.ops.push(Op::Move(tmpc.address, meml));
        self.ops.push(Op::Copy(memr, tmpr.address, tmpc.address));
        self.ops.push(Op::Move(tmpc.address, memr));
        self.ops.push(Op::Sub(tmpr.address, dest.address));

        self.discard_cell(tmpr);
        self.discard_cell(tmpc);
    }

    fn gen_inst_ret(&mut self, inst: InstructionValue) {
        // FAKE

        assert_eq!(inst.get_num_operands(), 1);

        let operand = inst.get_operand(0).unwrap().left().unwrap();

        match operand {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let i = v.get_zero_extended_constant().unwrap();

                    let tmp = self.new_tmp_cell();
                    self.ops.push(Op::Store(i as u8, tmp.address));
                    self.ops.push(Op::Ret(tmp.address));

                    self.discard_cell(tmp);
                } else {
                    let i = v.as_instruction_value().unwrap();
                    let i = {
                        self.ent_from_inst(i).unwrap().address
                    };


                    self.ops.push(Op::Ret(i));
                }
            }
            _ => panic!("oh no, we don't handle that"),
        }
    }

    // TODO: this is just for validating execution right now
    fn gen_inst_call(&mut self, inst: InstructionValue) {
        let (ptr, tmp) = match inst.get_operand(0).unwrap().left().unwrap() {
            BasicValueEnum::IntValue(v) => {
                if v.is_const() {
                    let ptr = self.new_tmp_cell();

                    let immv = v.get_zero_extended_constant().unwrap();

                    let newop = {
                        if immv > 255 {
                            panic!("unsupported value")
                        }
                        Op::Store(immv as u8, ptr.address)
                    };

                    self.ops.push(newop);

                    (ptr, true)
                } else {
                    let ptr = {
                        let src = v.as_instruction().unwrap();
                        *self.ent_from_inst(src).unwrap()
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
            self.ops.push(Op::Putc(ptr.address));
        } else {
            panic!("we only know how to handle the putc builtin")
        }

        if tmp {
            self.discard_cell(ptr);
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

fn print_op(op: &Op) -> String {
    match op {
        Op::Store(v, dest) => {
            let mut s = String::new();

            s.push_str(&print_tape_move(0, *dest));
            s.push_str("[-]");
            s.push_str(&"+".repeat(*v as usize));
            s.push_str(&print_tape_move(*dest, 0));

            s
        }

        Op::Copy(src, dest1, dest2) => {
            let mut s = String::new();

            s.push_str(&print_tape_move(0, *dest1));
            s.push_str("[-]");
            s.push_str(&print_tape_move(*dest1, *dest2));
            s.push_str("[-]");

            s.push_str(&print_tape_move(*dest2, *src));
            s.push_str("[");
            s.push_str("-");
            s.push_str(&print_tape_move(*src, *dest1));
            s.push_str("+");
            s.push_str(&print_tape_move(*dest1, *dest2));
            s.push_str("+");
            s.push_str(&print_tape_move(*dest2, *src));
            s.push_str("]");
            s.push_str(&print_tape_move(*src, 0));

            s
        }

        Op::Move(src, dest) => {
            let mut s = String::new();

            s.push_str(&print_tape_move(0, *dest));
            s.push_str("[-]");

            s.push_str(&print_tape_move(*dest, *src));
            s.push_str("[");
            s.push_str("-");
            s.push_str(&print_tape_move(*src, *dest));
            s.push_str("+");
            s.push_str(&print_tape_move(*dest, *src));
            s.push_str("]");
            s.push_str(&print_tape_move(*src, 0));

            s
        }

        Op::Add(src, dest) => {
            let mut s = String::new();

            s.push_str(&print_tape_move(0, *src));
            s.push_str("[");
            s.push_str("-");
            s.push_str(&print_tape_move(*src, *dest));
            s.push_str("+");
            s.push_str(&print_tape_move(*dest, *src));
            s.push_str("]");
            s.push_str(&print_tape_move(*src, 0));

            s
        }

        Op::Sub(src, dest) => {
            let mut s = String::new();

            s.push_str(&print_tape_move(0, *src));
            s.push_str("[");
            s.push_str("-");
            s.push_str(&print_tape_move(*src, *dest));
            s.push_str("-");
            s.push_str(&print_tape_move(*dest, *src));
            s.push_str("]");
            s.push_str(&print_tape_move(*src, 0));

            s
        }

        Op::Ret(addr) => {
            let mut s = String::new();

            s.push_str(&print_tape_move(0, *addr));
            s.push_str("TODO RETURN");
            s.push_str(&print_tape_move(*addr, 0));

            s
        }

        Op::Putc(addr) => {
            let mut s = String::new();

            s.push_str(&print_tape_move(0, *addr));
            s.push_str(".");
            s.push_str(&print_tape_move(*addr, 0));

            s
        }
    }
}

fn gen_func(func: FunctionValue) -> String {
    let mut out = String::new();

    assert_eq!(func.get_basic_blocks().len(), 1);

    let mut bfunc = BuildFunc {
        address: 0,
        local_memmap: vec![],
        ops: vec![],
    };

    let block = func.get_first_basic_block().unwrap();

    out.push_str(&format!("=== block ====================\n"));

    let mut maybe_inst = block.get_first_instruction();
    while maybe_inst.is_some() {
        let inst = maybe_inst.unwrap();
        maybe_inst = inst.get_next_instruction();

        out.push_str(&format!(
            "=== {:#?} ===================\n",
            inst.get_opcode()
        ));

        match inst.get_opcode() {
            InstructionOpcode::Alloca => bfunc.gen_inst_alloca(inst),
            InstructionOpcode::Store => bfunc.gen_inst_store(inst),
            InstructionOpcode::Load => bfunc.gen_inst_load(inst),
            InstructionOpcode::Add => bfunc.gen_inst_add(inst),
            InstructionOpcode::Sub => bfunc.gen_inst_sub(inst),
            InstructionOpcode::Return => bfunc.gen_inst_ret(inst),
            InstructionOpcode::Call => bfunc.gen_inst_call(inst),
            _ => {
                unimplemented!("instruction {:#?}", inst.get_opcode());
            }
        }

        // no tmps are left over
        for m in bfunc.local_memmap.iter() {
            assert!(m.from.is_some());
        }
    }

    for op in bfunc.ops.iter() {
        out.push_str(&format!("{}:\t{}\n", pretty_print_op(op), print_op(op)))
    }

    out.push_str(&format!("=== block ====================\n"));

    out
}

fn compile(path: &Path, print_llvm: bool) -> String {
    let mut out = String::new();

    let path = path.canonicalize().unwrap();
    let module = Module::parse_bitcode_from_path(path).unwrap();

    let mut maybe_func = module.get_first_function();

    while maybe_func.is_some() {
        let func = maybe_func.unwrap();
        maybe_func = func.get_next_function();

        out.push_str(&format!(
            "=== func {} ====================\n",
            func.get_name().to_str().unwrap()
        ));

        if print_llvm {
            out.push_str(&format!("{}\n", func.print_to_string().to_string()));
        }

        if func.get_basic_blocks().len() != 0 {
            out.push_str(&gen_func(func));
        }

        out.push_str(&format!(
            "=== func {} ====================\n",
            func.get_name().to_str().unwrap()
        ));
    }

    out
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

    let out = compile(&bcfile, print_llvm);
    println!("{}", out);
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

fn compile_llvm(path: &str) {
    let clang = Command::new("clang")
        .arg("-emit-llvm")
        .arg("-c")
        .arg(format!("./tests/{}.c", path))
        .arg("-o")
        .arg(format!("./tests/{}.bc", path))
        .status()
        .unwrap();
    assert!(clang.success());
}

#[test]
fn add_some_numbers() {
    compile_llvm("add_and_print");
    let out = compile(Path::new("./tests/add_and_print.bc"), false);
    println!("{}", out);
    let output = exec(&out, "");

    assert_eq!(output, "a");
}

#[test]
fn print_hello_world() {
    compile_llvm("hello_world");

    let out = compile(Path::new("./tests/hello_world.bc"), false);
    println!("{}", out);
    let output = exec(&out, "");

    assert_eq!(output, "hello world");
}
