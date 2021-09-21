use std::env;
use std::fs;
use std::io;
use std::io::Read;
use std::io::Write;
use std::time;

/*
fn main() {
    return

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

    let out = exec(&code, None).unwrap();

    let stdout = io::stdout();
    let mut out_handle = stdout.lock();
    out_handle.write(out.as_slice()).unwrap();
    out_handle.flush().unwrap();
}
*/

/*
#[test]
fn verify_lt() {
    let bfimpl = "
>, #l <
>>, #r <<

>>> #out <<<
>>>> #loop_t + <<<<
>>>>> #loop_f  <<<<<

>>>>[-<<<<

>>>>]<<<<

>>>.<<<
";

    for l in 0..255 {
        for r in 0..255 {
            let expected = vec![(l < r) as u8];
            let actual = exec(bfimpl, Some(vec![l, r]));
            assert!(
                actual == expected,
                format!(
                    "expected {:?} < {:?} -> {:?} got {:?}",
                    l, r, expected, actual
                )
            );
        }
    }
}
*/

/*
#[test]
fn verify_eq() {
    let bfimpl = "
>, #l <
>>, #r <<

>#l[->#r-<#l]

+

>#r[<#l->#r[-]]

<.
";

    for l in 0..255 {
        for r in 0..255 {
            let expected = vec![(l == r) as u8];
            let actual = exec(bfimpl, Some(vec![l, r])).unwrap();
            assert!(
                actual == expected,
                format!(
                    "expected {:?} < {:?} -> {:?} got {:?}",
                    l, r, expected, actual
                )
            );
        }
    }
}
*/

fn map2(code: &[u8]) -> String {
    code.iter()
        .map(|b| match b {
            0 => '_',
            1 => '+',
            2 => '-',
            3 => '>',
            4 => '<',
            5 => '[',
            6 => ']',
            7 => 'b',

            9 => ',',
            10 => '.',
            _ => ' ',
        })
        .collect()
}

enum Op {
    Add = 1,
    Sub = 2,
    Rit = 3,
    Lef = 4,
    Lop = 5,
    Fin = 6,

    Inp = 9,
    Out = 10,
}

fn main() {
    let mut code: [u8; 10] = [0; 10];

    let start = std::time::Instant::now();

    let len = 10;

    let mut max: u64 = 0;

    for i in 0..len {
        max |= 0b111 << (3 * i);
    }

    let max = max;

    'next: for c in 0..=max {
        for i in 0..len {
            code[i] = ((c >> (3 * i)) & 0b111) as u8;
        }

        if c % 10000000 == 0 {
            println!(
                "{:04}s {:0.0} Milop/s {:010} / {} {:.2}% {}",
                start.elapsed().as_secs(),
                ((c as f64) / 1_000_000.0) / (start.elapsed().as_secs() as f64),
                c,
                max,
                (c as f64 / max as f64) * 100.0,
                map2(&code[..]),
            );
        }

        for l in 0..=255 {
            for r in 0..=255 {
                // let expected = vec![(l == r) as u8];
                // let expected = (l < r) as u8;
                let expected = (l != 0 && r != 0);
                //let expected = l == r;

                let mut mem: [u8; 20] = [0; 20];
                mem[0] = l;
                mem[1] = r;

                let actual = exec(&mut mem, &code[..], 1000);

                if actual.is_err() {
                    continue 'next;
                }

                if expected != (actual.unwrap() != 0) {
                    continue 'next;
                }
            }
        }

        println!("found #{} {}", c, map2(&code[..]));
        return;
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

fn exec(mem: &mut [u8], code: &[u8], stepmax: usize) -> Result<u8, InterpErr> {
    let mut pc = 0;
    let mut mp = 0;
    let mut step = 0;

    if mem
        .iter()
        .map(|x| match x {
            _ => 0,
            6 => -1,
            5 => 1,
        })
        .sum::<i64>()
        != 0
    {
        return Err(InterpErr::Unbalanced);
    }

    while pc < code.len() {
        match code[pc] {
            1 => {
                // +
                if mem[mp] == 255 {
                    return Err(InterpErr::IntOverflow);
                }
                mem[mp] += 1
            }
            2 => {
                // -
                if mem[mp] == 0 {
                    return Err(InterpErr::IntUnderflow);
                }
                mem[mp] -= 1
            }
            3 => {
                // >
                if mp == mem.len() - 1 {
                    return Err(InterpErr::MemOverflow);
                }
                mp += 1
            }
            4 => {
                // <
                if mp == 0 {
                    return Err(InterpErr::MemUnderflow);
                }

                mp -= 1
            }
            5 => {
                // [
                if mem[mp] == 0 {
                    let mut depth = 0;
                    pc += 1;

                    if pc == code.len() {
                        return Err(InterpErr::LoopMemOverflow);
                    }

                    while depth > 0 || *code.get(pc).unwrap() != (Op::Fin as u8) {
                        if *code.get(pc).unwrap() == (Op::Lop as u8) {
                            depth += 1;
                        } else if *code.get(pc).unwrap() == (Op::Fin as u8) {
                            depth -= 1;
                        }

                        pc += 1;

                        if code.get(pc).is_none() {
                            return Err(InterpErr::LoopMemOverflow);
                        }
                    }
                }
            }
            6 => {
                // ]
                if mem[mp] != 0 {
                    let mut depth = 0;

                    if pc == 0 {
                        return Err(InterpErr::LoopMemUnderflow);
                    }

                    pc -= 1;

                    while depth > 0 || *code.get(pc).unwrap() != (Op::Lop as u8) {
                        if *code.get(pc).unwrap() == (Op::Fin as u8) {
                            depth += 1;
                        } else if *code.get(pc).unwrap() == (Op::Lop as u8) {
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
        step += 1;

        if step > stepmax {
            return Err(InterpErr::TooManySteps);
        }
    }

    Ok(mem[mp])
}
