use std::env;
use std::process;
use std::path::Path;

mod bfcc;

fn main() {
	if env::args().len() != 2 {
		eprintln!("expected a single argument: path to llvm bytecode");
		process::exit(1);
	}

	let bcpath = env::args().nth(1).unwrap();

	let bfcode = bfcc::compile(Path::new(&bcpath));
	println!("{}", bfcode);
}
