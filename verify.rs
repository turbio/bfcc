use std::process::Command;
use std::fs;
use std::fs::File;
use std::io::prelude::*;
use std::io;
use std::path::Path;
use std::collections::HashMap;

extern crate serde_json;

extern crate serde;
use serde::{Deserialize, Serialize};

mod bfcc;


#[derive(Deserialize)]
struct TestCase {
	name: String,
	output: String,
}

fn compile_ir(from: &str, to: &str) -> Result<(), String> {
	Command::new("clang")
		.args(["-O0", "-emit-llvm", "-I", ".", "-c", from, "-o", to])
		.output()
		.map_err(|e|e.to_string())
		.and_then(|o|
			match o.status.success() {
				true => Ok(()),
				false => Err(std::str::from_utf8(o.stderr.as_slice()).unwrap().to_string())
			}
		)
}

fn compile_bf(path: &Path, target: &Path) -> String{
	let code_out = bfcc::compile(path);

	let mut file = File::create(target).unwrap();
	file.write_all(code_out.as_bytes());

	code_out
}

fn main() {
	let cases = fs::read_dir("./tests/cases").unwrap();
	for case in cases {
		let case = case.unwrap();

		let content = fs::read_to_string(case.path()).unwrap();

		let from = content.find("TEST:").unwrap()+5;
		let to = content[from..].find("\n").unwrap()+from;
		let info: TestCase = serde_json::from_str(&content[from..to]).unwrap();

		println!("TEST {}", info.name);

		let source = format!("{}", case.path().as_path().to_str().unwrap());
		let target = format!("./tests/ir/{}.bc", case.file_name().into_string().unwrap());

		compile_ir(&source, &target).unwrap();

		let bfout = format!("./tests/bf/{}.bf", case.file_name().into_string().unwrap());
		let bf_code = compile_bf(Path::new(&target), Path::new(&bfout));

		let result = exec(&bf_code, "").unwrap();
		if result.output != info.output {
			println!("OUTPUT MISMATCH");
			println!("expected: {}", info.output);
			println!("  actual: {}", result.output);
			panic!("output mismatch")
		}

		println!("PASS {} in {} steps", info.name, result.steps);
	}
}

#[derive(Debug)]
enum InterpErr {
	IntOverflow,
	IntUnderflow,
	MemOverflow,
	MemUnderflow,
	LoopMemOverflow,
	LoopMemUnderflow,
	TooManySteps,
	Unbalanced,
}

struct ExecResult {
	output: String,
	steps: usize,
	coverage: HashMap<usize, usize>,
}

fn exec(code: &str, input: &str) -> Result<ExecResult, InterpErr> {
	let mut pc = 0;
	let mut mp = 0;
	let mut ic = 0;
	let mut steps = 0;

	let mut coverage: HashMap<usize, usize> = HashMap::new();

	let mut mem: [u8;1000] = [0;1000];

	let code = code.chars().collect::<Vec<char>>();
	let input: Vec<u8> = input.into();
	let mut output: Vec<char> = vec![];

	while pc < code.len() {
		//coverage.insert(pc, coverage.get(&pc).unwrap_or(&0)+1);

		match code[pc] {
			',' => {
				mem[mp] = input[ic];
				ic += 1;
			}

			'.' => output.push(mem[mp] as char),

			'+' => {
				if mem[mp] == 255 {
					return Err(InterpErr::IntOverflow);
				}
				mem[mp] += 1
			}

			'-' => {
				if mem[mp] == 0 {
					return Err(InterpErr::IntUnderflow);
				}
				mem[mp] -= 1
			}

			'>' => {
				if mp == mem.len() - 1 {
					return Err(InterpErr::MemOverflow);
				}
				mp += 1
			}

			'<' => {
				if mp == 0 {
					return Err(InterpErr::MemUnderflow);
				}

				mp -= 1
			}

			'[' => {
				if mem[mp] == 0 {
					let mut depth = 0;
					pc += 1;

					if pc == code.len() {
						return Err(InterpErr::LoopMemOverflow);
					}

					while depth > 0 || code[pc] != ']' {
						if code[pc] == '[' {
							depth += 1;
						} else if code[pc] == ']' {
							depth -= 1;
						}

						pc += 1;

						if pc >= code.len() {
							return Err(InterpErr::LoopMemOverflow);
						}
					}
				}
			}

			']' => {
				if mem[mp] != 0 {
					let mut depth = 0;

					if pc == 0 {
						return Err(InterpErr::LoopMemUnderflow);
					}

					pc -= 1;

					while depth > 0 || code[pc] != '[' {
						if code[pc] == ']' {
							depth += 1;
						} else if code[pc] == '[' {
							depth -= 1;
						}

						if pc == 0 {
							return Err(InterpErr::LoopMemUnderflow);
						}

						pc -= 1;
					}
				}
			}

			_ => {}
		};

		pc += 1;
		steps += 1;
	}

	Ok(ExecResult {
		output: output.iter().collect(),
		steps: steps,
		coverage: coverage,
	})
}
