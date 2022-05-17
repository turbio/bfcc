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
	// input: Option<String>,
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
	let mut cases = fs::read_dir("./tests/cases")
		.unwrap()
		.map(|r| r.unwrap())
		.collect::<Vec<_>>();
	cases.sort_by_key(|dir| dir.path());
	for case in cases {
		let content = fs::read_to_string(case.path()).unwrap();

		let from = content.find("TEST:").unwrap() + 5;
		let to = content[from..].find("\n").unwrap() + from;
		let info: TestCase = serde_json::from_str(&content[from..to]).unwrap();

		if env::args().len() > 1
			&& env::args().find(|x| x == &info.name).is_none()
		{
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
		let target = format!(
			"./tests/ir/{}.bc",
			case.file_name().into_string().unwrap()
		);

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

		let bfout = format!(
			"./tests/bf/{}.bf",
			case.file_name().into_string().unwrap()
		);
		let bf_code = compile_bf(Path::new(&target), Path::new(&bfout));

		let comp = compile(&bf_code);

		let result = exec(comp);
		if result.is_err() {
			print!("\n");
			println!("EXECUTE ERROR");
			println!("{:?}", result.err().unwrap());
			println!(
				"{}FAIL{} {}",
				color::Fg(color::Red),
				style::Reset,
				info.name,
			);
			continue;
		}

		let result = result.unwrap();
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
}

struct ExecResult {
	output: String,
	steps: usize,
}

#[derive(Clone, Copy, Debug)]
enum COps {
	Add(i32),
	Mov(i64),
	Putchar,
	JmpIfZ(u64),
	JmpIfNZ(u64),
	//Loop(Vec<COps>)
}

fn compile(code: &str) -> Vec<COps> {
	let mut opsout = Vec::<COps>::new();

	let chars: Vec<char> = code.chars().collect();

	for c in chars.iter() {
		opsout.push(match c {
			'+' => COps::Add(1),
			'-' => COps::Add(-1),
			'>' => COps::Mov(1),
			'<' => COps::Mov(-1),
			'[' => COps::JmpIfZ(0),
			']' => COps::JmpIfNZ(0),
			'.' => COps::Putchar,
			',' => panic!("TODO"),
			_ => continue,
		})
	}

	// combine similar
	let mut into = vec![opsout[0]];
	for op in opsout.iter().skip(1) {
		let repl = match (into[into.len() - 1], op) {
			(COps::Add(a), COps::Add(b)) => Some(COps::Add(a + b)),
			(COps::Mov(a), COps::Mov(b)) => Some(COps::Mov(a + b)),
			_ => None,
		};

		if repl.is_some() {
			let l = into.len();
			into[l - 1] = repl.unwrap();
		} else {
			into.push(*op);
		}
	}
	let mut opsout = into;

	// actually resolve ops
	opsout = opsout
		.iter()
		.enumerate()
		.map(|(i, op)| match op {
			COps::JmpIfZ(_) => {
				let mut d = 1;
				for j in (i + 1)..opsout.len() {
					d += match opsout[j] {
						COps::JmpIfZ(_) => 1,
						COps::JmpIfNZ(_) => -1,
						_ => 0,
					};

					if d == 0
						&& match opsout[j] {
							COps::JmpIfNZ(_) => true,
							_ => false,
						} {
						return COps::JmpIfZ(j as u64);
					}
				}

				panic!("unbalanced?");
			}
			COps::JmpIfNZ(_) => {
				let mut d = 1;
				for j in (0..i).rev() {
					d += match opsout[j] {
						COps::JmpIfNZ(_) => 1,
						COps::JmpIfZ(_) => -1,
						_ => 0,
					};

					if d == 0
						&& match opsout[j] {
							COps::JmpIfZ(_) => true,
							_ => false,
						} {
						return COps::JmpIfNZ(j as u64);
					}
				}

				panic!("unbalanced?");
			}
			_ => *op,
		})
		.collect();

	opsout
}

fn exec(ops: Vec<COps>) -> Result<ExecResult, InterpErr> {
	let mut pc = 0;
	let mut mp = 0;
	let mut steps = 0;

	let mut mem: [u8; 10000] = [0; 10000];

	let mut output: Vec<char> = vec![];

	while pc < ops.len() {
		match ops[pc] {
			COps::Putchar => output.push(mem[mp] as char),

			COps::Add(n) => {
				let v = mem[mp] as isize + n as isize;
				if v > 255 {
					return Err(InterpErr::IntOverflow);
				} else if v < 0 {
					return Err(InterpErr::IntUnderflow);
				}
				mem[mp] = v as u8;
			}

			COps::Mov(n) => {
				let to = mp as isize + n as isize;
				if to >= mem.len() as isize {
					return Err(InterpErr::MemOverflow);
				}

				if to < 0 {
					return Err(InterpErr::MemUnderflow);
				}

				mp = to as usize;
			}

			COps::JmpIfZ(a) => {
				if mem[mp] == 0 {
					pc = a as usize;
				}
			}

			COps::JmpIfNZ(a) => {
				if mem[mp] != 0 {
					pc = a as usize;
				}
			}
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
