use std::env;
use std::fs;
use std::io;
use std::io::Write;

fn main() {
    let mut pathstr = "".to_owned();

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

    let code = fs::read_to_string(pathstr).unwrap();

    let out = exec(&code, "");

    let stdout = io::stdout();
    let mut out_handle = stdout.lock();
    out_handle.write(out.as_slice()).unwrap();
    out_handle.flush().unwrap();
}

fn exec(code: &str, input: &str) -> Vec<u8> {
    let mut input = input.to_owned();
    let code: Vec<char> = code.chars().collect();
    let mut mem: [u8; 1000] = [0; 1000];
    let mut pc = 0;
    let mut mp = 0;
    let mut out = Vec::new();

    while pc < code.len() {
        match code.get(pc).unwrap() {
            '+' => mem[mp] += 1,
            '-' => mem[mp] -= 1,
            '>' => mp += 1,
            '<' => mp -= 1,
            ',' => mem[mp] = input.remove(0) as u8,
            '.' => out.push(mem[mp]),
            '[' => {
                if mem[mp] == 0 {
                    let mut depth = 0;
                    pc += 1;

                    while depth > 0 || *code.get(pc).unwrap() != ']' {
                        if *code.get(pc).unwrap() == '[' {
                            depth += 1;
                        } else if *code.get(pc).unwrap() == ']' {
                            depth -= 1;
                        }

                        pc += 1;
                    }
                }
            }
            ']' => {
                if mem[mp] != 0 {
                    let mut depth = 0;
                    pc -= 1;

                    while depth > 0 || *code.get(pc).unwrap() != '[' {
                        if *code.get(pc).unwrap() == ']' {
                            depth += 1;
                        } else if *code.get(pc).unwrap() == '[' {
                            depth -= 1;
                        }

                        pc -= 1;
                    }
                }
            }
            _ => {}
        };
        pc += 1;
    }

    out
}
