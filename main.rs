use std::path::Path;

extern crate inkwell;

use inkwell::context::Context;
use inkwell::module::Module;
use inkwell::values::{BasicValueEnum, FunctionValue, InstructionOpcode, InstructionValue};

fn gen_inst_alloca(inst: InstructionValue) {
    assert_eq!(inst.get_num_operands(), 1);

    println!("alloc instr: {:p}", &inst);

    match inst.get_operand(0).unwrap().left().unwrap() {
        BasicValueEnum::IntValue(v) => {
            let uval = v.get_zero_extended_constant().unwrap() as usize;
            let bytes = v.get_type().get_bit_width() as usize / 8;
            let cells = uval * bytes;
            println!("alloca {} items * {} bytes = {} cells", uval, bytes, cells);
            println!("{}", ">".repeat(cells));
            //println!("{:#?}", *uval);
            //println!("{:#?}", v);
        }
        _ => panic!("unexpected operand to alloca"),
    };
}

fn gen_inst_store(inst: InstructionValue) {
    assert_eq!(inst.get_num_operands(), 2);

    let ival = match inst.get_operand(0).unwrap().left().unwrap() {
        BasicValueEnum::IntValue(v) => v.get_sign_extended_constant().unwrap(),
        _ => panic!("only int stores are handled"),
    };

    let at = match inst.get_operand(1).unwrap().left().unwrap() {
        BasicValueEnum::PointerValue(v) => {
            println!("ptr {:#?}", v.get_name());

            "???"
        }
        _ => panic!("expected second operand to be an address"),
    };

    println!("store {} at {}", ival, at);
}

fn gen_func(func: FunctionValue) {
    assert_eq!(func.get_basic_blocks().len(), 1);

    let block = func.get_first_basic_block().unwrap();

    println!("=== block ====================");

    let mut maybe_inst = block.get_first_instruction();
    while maybe_inst.is_some() {
        let inst = maybe_inst.unwrap();
        maybe_inst = inst.get_next_instruction();

        println!("=== {:#?} ===================", inst.get_opcode());

        match inst.get_opcode() {
            InstructionOpcode::Alloca => gen_inst_alloca(inst),
            InstructionOpcode::Store => gen_inst_store(inst),
            _ => panic!("encountered unexpected instruction"),
        }
    }

    println!("=== block ====================");
}

fn main() {
    let ctx = Context::create();

    let bcfile = Path::new("./example.bc");

    let cpath = bcfile.canonicalize().unwrap();

    let module = Module::parse_bitcode_from_path_in_context(cpath, &ctx).unwrap();

    let mut maybe_func = module.get_first_function();

    while maybe_func.is_some() {
        let func = maybe_func.unwrap();
        maybe_func = func.get_next_function();

        assert_eq!(func.get_name().to_str().unwrap(), "main");

        println!(
            "=== func {} ====================",
            func.get_name().to_str().unwrap()
        );
        println!("{}", func.print_to_string().to_string());

        gen_func(func);

        println!(
            "=== func {} ====================",
            func.get_name().to_str().unwrap()
        );
    }
}
