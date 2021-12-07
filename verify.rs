use std::collections::HashMap;
use std::env;
use std::fs;
use std::fs::File;
use std::io;
use std::io::prelude::*;
use std::path::Path;
use std::process::Command;

extern crate termion;
use termion::{color, style};

extern crate serde;
extern crate serde_json;
use serde::Deserialize;

mod bfcc;

#[derive(Deserialize)]
struct TestCase {
	name: String,
	output: String,
	input: Option<String>,
	skip: Option<bool>,
}

fn compile_ir(from: &str, to: &str) -> Result<(), String> {
	let res = Command::new("clang")
		.args(["-O0", "-emit-llvm", "-I", ".", "-c", from, "-o", to])
		.output()
		.map_err(|e| e.to_string())
		.and_then(|o| match o.status.success() {
			true => Ok(()),
			false => Err(std::str::from_utf8(o.stderr.as_slice())
				.unwrap()
				.to_string()),
		});

	// be nice and write out the human readable ir too
	Command::new("llvm-dis").args([to]).output().unwrap();

	res
}

fn compile_bf(path: &Path, target: &Path) -> String {
	let code_out = bfcc::compile(path);

	let mut file = File::create(target).unwrap();
	file.write_all(code_out.as_bytes()).unwrap();

	code_out
}

fn main() {
	let cases = fs::read_dir("./tests/cases").unwrap();
	for case in cases {
		let case = case.unwrap();

		let content = fs::read_to_string(case.path()).unwrap();

		let from = content.find("TEST:").unwrap() + 5;
		let to = content[from..].find("\n").unwrap() + from;
		let info: TestCase = serde_json::from_str(&content[from..to]).unwrap();

		if env::args().len() > 1 && env::args().find(|x| x == &info.name).is_none() {
			continue;
		}

		if info.skip.unwrap_or(false) {
			println!(
				"{}SKIP{} {}",
				color::Fg(color::Yellow),
				style::Reset,
				info.name
			);
			continue;
		}

		print!("TEST {}", info.name);
		io::stdout().flush().unwrap();

		let source = format!("{}", case.path().as_path().to_str().unwrap());
		let target = format!("./tests/ir/{}.bc", case.file_name().into_string().unwrap());

		let cc = compile_ir(&source, &target);
		if cc.is_err() {
			println!(
				"\r{}FAIL{} {}",
				color::Fg(color::Red),
				style::Reset,
				info.name
			);
			println!("{}", cc.unwrap_err());
			continue;
		}

		let bfout = format!("./tests/bf/{}.bf", case.file_name().into_string().unwrap());
		let bf_code = compile_bf(Path::new(&target), Path::new(&bfout));

		let result = exec(&bf_code, "").unwrap();
		if result.output != info.output {
			print!("\n");
			println!("OUTPUT MISMATCH");
			println!("---");
			println!("expected: {}", info.output);
			println!("  actual: {}", result.output);
			println!("---");
			println!("source: {}", source);
			println!("target: {}", bfout);
			println!(
				"{}FAIL{} {}",
				color::Fg(color::Red),
				style::Reset,
				info.name,
			);
			continue;
		}

		let mut stats = File::create(Path::new(&format!(
			"./tests/stats/{}.txt",
			case.file_name().into_string().unwrap(),
		)))
		.unwrap();
		stats
			.write_all(format!("steps: {}\n", result.steps).as_bytes())
			.unwrap();

		println!(
			"\r{}PASS{} {}",
			color::Fg(color::Green),
			style::Reset,
			info.name,
		);
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
}

struct ExecResult {
	output: String,
	steps: usize,
}

fn exec(code: &str, input: &str) -> Result<ExecResult, InterpErr> {
	let mut pc = 0;
	let mut mp = 0;
	let mut ic = 0;
	let mut steps = 0;

	let mut mem: [u8; 10000] = [0; 10000];

	let input: Vec<u8> = input.into();
	let mut output: Vec<char> = vec![];

	let mut jmpmap = HashMap::<usize, usize>::new();

	let chars: Vec<char> = code.chars().collect();

	'outer: for (i, c) in chars.iter().enumerate() {
		if *c == '[' {
			let mut d = 1;
			for j in (i + 1)..code.len() {
				d += match chars[j] {
					'[' => 1,
					']' => -1,
					_ => 0,
				};

				if d == 0 && chars[j] == ']' {
					jmpmap.insert(i, j);
					continue 'outer;
				}
			}

			panic!("unbalanced?");
		}

		if *c == ']' {
			let mut d = 1;
			for j in (0..i).rev() {
				d += match chars[j] {
					']' => 1,
					'[' => -1,
					_ => 0,
				};

				if d == 0 && chars[j] == '[' {
					jmpmap.insert(i, j);
					continue 'outer;
				}
			}

			panic!("unbalanced?");
		}
	}

	while pc < code.len() {
		match chars[pc] {
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
					pc = jmpmap[&pc];
				}
			}

			']' => {
				if mem[mp] != 0 {
					pc = jmpmap[&pc];
				}
			}

			_ => {}
		};

		pc += 1;
		steps += 1;
	}

	for i in mem {
		assert!(i == 0, "expected all memory to be zero");
	}

	Ok(ExecResult {
		output: output.iter().collect(),
		steps: steps,
	})
}
