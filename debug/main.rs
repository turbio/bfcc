use std::env;
use std::fs;

extern crate ncurses;

enum Color {
    Normal,
    Comment,
    Jump,
    Move,
    Inc,
    IO,
    Annot,

    Mem0,
    Mem1,
    Mem,
}

struct State {
    tape: Vec<u8>,
    annots: Vec<Option<String>>,

    mp: usize,
    pc: usize,

    code: String,

    ic: usize,
    input: Vec<u8>,

    output: Vec<u8>,
}

const INSTRUCTS: &[char] = &['[', ']', '+', '-', '>', '<', ',', '.'];

impl State {
    fn new(code: String, input: Vec<u8>) -> State {
        State {
            tape: vec![0],
            annots: vec![None],

            mp: 0,
            pc: code.find(INSTRUCTS).unwrap(),

            code: code,

            ic: 0,
            input: input,

            output: vec![],
        }
    }

    fn nextop(&self) -> (usize, Option<String>) {
        let from = 1 + self.pc;
        let nextpc = self.code.as_str()[from..].find(INSTRUCTS).unwrap_or(0) + from;

        let annot = self.code[from..nextpc].rfind(|c| c == '#');
        if annot.is_some() {
            let annot = annot.unwrap() + 1;
            let to = self.code[(from + annot)..]
                .find(|c| !char::is_alphanumeric(c) && c != '/' && c != '_')
                .unwrap();

            (
                nextpc,
                Some(self.code[(from + annot)..(from + annot + to)].to_string()),
            )
        } else {
            (nextpc, None)
        }
    }

    fn ch(&self, i: usize) -> char {
        self.code.chars().nth(i).unwrap()
    }

    fn next(&self) -> (State, Option<String>) {
        let mut n = State {
            tape: self.tape.clone(),
            annots: self.annots.clone(),

            pc: self.pc,
            mp: self.mp,

            code: self.code.clone(),

            ic: self.ic,
            input: self.input.clone(),
            output: self.output.clone(),
        };

        match n.ch(n.pc) {
            '+' => n.tape[n.mp] += 1,
            '-' => n.tape[n.mp] -= 1,
            '>' => {
                if n.mp == n.tape.len() - 1 {
                    n.tape.push(0);
                    n.annots.push(None);
                }
                n.mp += 1;
            }
            '<' => {
                n.mp -= 1;
            }
            ',' => {
                n.tape[n.mp] = n.input[n.ic];
                if n.ic < n.input.len() - 1 {
                    n.ic += 1
                };
            }
            '.' => n.output.push(n.tape[n.mp]),
            '[' => {
                if n.tape[n.mp] == 0 {
                    let mut depth = 0;
                    n.pc += 1;

                    while depth > 0 || n.ch(n.pc) != ']' {
                        if n.ch(n.pc) == '[' {
                            depth += 1;
                        } else if n.ch(n.pc) == ']' {
                            depth -= 1;
                        }

                        n.pc += 1;
                    }
                }
            }
            ']' => {
                if n.tape[n.mp] != 0 {
                    let mut depth = 0;
                    n.pc -= 1;

                    while depth > 0 || n.ch(n.pc) != '[' {
                        if n.ch(n.pc) == ']' {
                            depth += 1;
                        } else if n.ch(n.pc) == '[' {
                            depth -= 1;
                        }

                        n.pc -= 1;
                    }
                }
            }
            _ => panic!("shouldn't try to handle {:#?}", n.ch(n.pc)),
        };

        let (pc, annot) = n.nextop();
        n.pc = pc;
        if annot.is_some() {
            n.annots[n.mp] = annot.clone();
        }

        (n, annot)
    }
}

struct Debugger {
    state: Vec<State>,

    scroll: isize,

    root: ncurses::SCREEN,
}

impl Debugger {
    fn new(code: String, input: Vec<u8>) -> Debugger {
        // technically incorrect but at least it won't break rendering
        let code = code.replace('\t', "    ");

        Debugger {
            state: vec![State::new(code, input)],
            root: ncurses::initscr(),
            scroll: 0,
        }
    }

    fn scroll(&mut self, l: isize) {
        let lines = self.cur().code.as_str().lines().count() as isize;

        self.scroll = if l + self.scroll < 0 {
            0
        } else if self.scroll + l > lines {
            lines
        } else {
            self.scroll + l
        }
    }

    fn cur(&self) -> &State {
        self.state.last().unwrap()
    }

    fn last(&self) -> Option<&State> {
        if self.state.len() > 1 {
            self.state.get(self.state.len() - 2)
        } else {
            None
        }
    }

    fn jumpto(&mut self, x: i32, y: i32) {
        let adjy = y - 7;
        if adjy < 0 {
            return;
        }

        let mut index = 0;

        let mut line = 0;
        let mut col = 0;
        for (i, c) in self.cur().code.chars().enumerate() {
            if line > adjy || (line == adjy && col >= x) {
                index = i;
                break;
            }

            if c == '\n' || col >= ncurses::getmaxx(self.root) - 2 {
                line += 1;
                col = 0;
            } else {
                col += 1;
            }
        }

        if index > self.cur().pc {
            while index > self.cur().pc {
                self.step();
            }

            if index != self.cur().pc {
                self.rewind();
            }
        } else if index < self.cur().pc {
            while index < self.cur().pc && self.last().is_some() {
                self.rewind();
            }

            if index != self.cur().pc {
                self.step();
            }
        }
    }

    fn step(&mut self) {
        let next = self.cur().next();
        self.state.push(next.0);
    }

    fn rewind(&mut self) {
        if self.state.len() > 1 {
            self.state.pop();
        }
    }

    fn next(&mut self) {
        let before = self.cur().pc;

        while self.cur().pc <= before {
            self.step();
        }
    }

    fn prev(&mut self) {
        let before = self.cur().pc;

        while self.cur().pc >= before {
            self.rewind();
        }
    }

    fn until(&mut self, annot: Option<&str>) {
        self.step();

        loop {
            let (next, found) = self.cur().next();

            if match (&annot, &found) {
                (Some(a), Some(f)) => a == f,
                (None, Some(_)) => true,
                _ => false,
            } {
                break;
            }

            self.state.push(next);
        }
    }

    fn init(&self) {
        ncurses::noecho();
        ncurses::cbreak();
        ncurses::keypad(self.root, true);
        ncurses::mouseinterval(0);

        ncurses::curs_set(ncurses::CURSOR_VISIBILITY::CURSOR_INVISIBLE);
        ncurses::start_color();

        ncurses::init_pair(Color::Comment as i16, 8, 0);
        ncurses::init_pair(Color::Jump as i16, 1, 0);
        ncurses::init_pair(Color::Move as i16, 10, 0);
        ncurses::init_pair(Color::Inc as i16, 3, 0);
        ncurses::init_pair(Color::IO as i16, 5, 0);
        ncurses::init_pair(Color::Annot as i16, 6, 0);

        ncurses::init_pair(Color::Mem0 as i16, 8, 0);
        ncurses::init_pair(Color::Mem1 as i16, 2, 0);
        ncurses::init_pair(Color::Mem as i16, 7, 0);
    }

    fn draw(&self, bp: Option<&str>) {
        ncurses::erase();

        ncurses::wcolor_set(self.root, Color::Normal as i16);
        ncurses::wmove(self.root, ncurses::getmaxy(self.root) - 2, 0);
        ncurses::hline(ncurses::ACS_HLINE(), ncurses::getmaxx(self.root));
        ncurses::mvwaddstr(
            self.root,
            ncurses::getmaxy(self.root) - 1,
            0,
            "j: step    k: rewind    J: next    K: prev    c: continue    b: breakpoint    q: quite",
        );

        self.drawio();
        self.drawcode(0, 3, ncurses::getmaxx(self.root) - 20, -1);
        self.drawmem(
            ncurses::getmaxx(self.root) - 20,
            3,
            20,
            std::cmp::min(
                ncurses::getmaxy(self.root) - 3 - 2,
                1 + self.cur().tape.len() as i32,
            ),
        );

        let steps = format!(
            " step: {} bp: {} ",
            self.state.len(),
            bp.as_ref().unwrap_or(&"*")
        );

        ncurses::wmove(
            self.root,
            0,
            ncurses::getmaxx(self.root) - steps.len() as i32 - 2,
        );
        ncurses::wcolor_set(self.root, Color::Normal as i16);
        ncurses::waddstr(self.root, &steps);
    }

    fn drawio(&self) {
        let top = 0;

        ncurses::wcolor_set(self.root, Color::Normal as i16);
        ncurses::wmove(self.root, top, 0);
        ncurses::hline(ncurses::ACS_HLINE(), ncurses::getmaxx(self.root));
        ncurses::mvwaddstr(self.root, 0, 1, "io ");

        ncurses::wmove(self.root, top + 1, 0);
        ncurses::waddstr(self.root, " input: ");
        for (i, ch) in self.cur().input.iter().enumerate() {
            if i == self.cur().ic {
                ncurses::wattron(self.root, ncurses::A_REVERSE());
            }

            ncurses::waddstr(self.root, &format!("{:?}", *ch as char));

            if i == self.cur().ic {
                ncurses::wattroff(self.root, ncurses::A_REVERSE());
            }
        }

        ncurses::wmove(self.root, top + 2, 0);
        ncurses::waddstr(self.root, "output: ");

        for ch in self.cur().output.iter() {
            ncurses::waddstr(self.root, &format!("{:?}", *ch as char));
        }
    }

    fn drawmem(&self, x: i32, y: i32, width: i32, height: i32) {
        let top = y;
        let left = x;
        let virt = true;

        ncurses::wcolor_set(self.root, Color::Normal as i16);
        ncurses::wmove(self.root, top, left);
        ncurses::hline(ncurses::ACS_HLINE(), width);
        ncurses::vline(ncurses::ACS_VLINE(), height);
        ncurses::mvwaddstr(self.root, top, left + 1, "mem ");

        if virt {
            for i in 0..height - 1 {
                if self.cur().mp == i as usize {
                    ncurses::wmove(self.root, i + top + 1, left);
                    ncurses::waddstr(self.root, ">");
                    ncurses::wattron(self.root, ncurses::A_REVERSE());
                }

                ncurses::wmove(self.root, i + top + 1, left + 1);

                if self.cur().tape[i as usize] == 0 {
                    ncurses::wcolor_set(self.root, Color::Mem0 as i16);
                } else if self.cur().tape[i as usize] == 1 {
                    ncurses::wcolor_set(self.root, Color::Mem1 as i16);
                } else {
                    ncurses::wcolor_set(self.root, Color::Mem as i16);
                }

                ncurses::waddstr(self.root, &format!("{:03}", self.cur().tape[i as usize]));

                ncurses::wattroff(self.root, ncurses::A_REVERSE());

                if self.cur().annots[i as usize].is_some() {
                    ncurses::wcolor_set(self.root, Color::Annot as i16);
                    ncurses::waddstr(
                        self.root,
                        &format!(" {}", self.cur().annots[i as usize].as_ref().unwrap()),
                    );
                    ncurses::wcolor_set(self.root, Color::Normal as i16);
                }
            }
        } else {
            ncurses::wmove(self.root, top + 1, left);
            let mut tapestr = self
                .cur()
                .tape
                .iter()
                .map(|cell| format!("{:03}", cell))
                .collect::<Vec<String>>()
                .join(" ");

            tapestr.truncate(ncurses::getmaxx(self.root) as usize);

            ncurses::waddstr(self.root, &tapestr);

            if self.cur().mp * 4 < ncurses::getmaxx(self.root) as usize {
                ncurses::wmove(self.root, top + 2, (self.cur().mp * 4) as i32);
                ncurses::waddch(self.root, ncurses::ACS_UARROW());
            }
        }
    }

    fn drawcode(&self, x: i32, y: i32, width: i32, _height: i32) {
        let top = y;

        ncurses::wcolor_set(self.root, Color::Normal as i16);

        ncurses::wmove(self.root, top, 0);
        for _ in 0..width {
            ncurses::waddch(self.root, ncurses::ACS_HLINE());
        }
        ncurses::mvwaddstr(self.root, top, 1, "program ");

        ncurses::wmove(self.root, top + 1, 0);
        let mut l = 0;
        for (i, ch) in self.cur().code.chars().enumerate() {
            if ncurses::getcury(self.root) > ncurses::getmaxy(self.root) - 3 {
                break;
            }

            if self.scroll > l {
                if ch == '\n' {
                    l += 1;
                }
                continue;
            }

            match ch {
                '>' | '<' => ncurses::wcolor_set(self.root, Color::Move as i16),
                '+' | '-' => ncurses::wcolor_set(self.root, Color::Inc as i16),
                '[' | ']' => ncurses::wcolor_set(self.root, Color::Jump as i16),
                ',' | '.' => ncurses::wcolor_set(self.root, Color::IO as i16),
                '#' => ncurses::wcolor_set(self.root, Color::Annot as i16),
                _ => ncurses::wcolor_set(self.root, Color::Comment as i16),
            };

            if self.last().is_some() && i == self.last().unwrap().pc {
                ncurses::wattron(self.root, ncurses::A_UNDERLINE());
            }

            if i == self.cur().pc as usize {
                ncurses::wattron(self.root, ncurses::A_REVERSE());
            }

            ncurses::waddch(self.root, ch as u32);

            if self.last().is_some() && i == self.last().unwrap().pc {
                ncurses::wattroff(self.root, ncurses::A_UNDERLINE());
            }

            if i == self.cur().pc as usize {
                ncurses::wattroff(self.root, ncurses::A_REVERSE());
            }
        }
    }
}

fn main() {
    let mut pathstr = "".to_owned();

    for arg in env::args().skip(1).by_ref() {
        pathstr = arg;
    }

    if pathstr == "" {
        println!("expected one argument");
        return;
    }

    let code = fs::read_to_string(pathstr).unwrap();

    if code.find(INSTRUCTS).is_none() {
        println!("the given file doesn't have any code");
        return;
    }

    let mut d = Debugger::new(code, "hi\0".as_bytes().to_vec());

    let mut bp = None;

    d.init();
    d.draw(bp);

    ncurses::mousemask(
        (ncurses::ALL_MOUSE_EVENTS | ncurses::REPORT_MOUSE_POSITION) as u32,
        None,
    );

    loop {
        let ch = ncurses::wgetch(d.root);

        if ch == 'j' as i32 {
            d.step();
        } else if ch == 'k' as i32 {
            d.rewind();
        } else if ch == 'J' as i32 {
            d.next();
        } else if ch == 'K' as i32 {
            d.prev();
        } else if ch == 'c' as i32 {
            d.until(bp);
        } else if ch == 'b' as i32 {
            bp = Some("a/0");
        } else if ch == 'q' as i32 {
            break;
        } else if ch == ncurses::KEY_MOUSE {
            let mut mev = ncurses::MEVENT {
                id: 0,
                x: 0,
                y: 0,
                z: 0,
                bstate: 0,
            };

            if ncurses::getmouse(&mut mev) == ncurses::OK {
                if mev.bstate & ncurses::BUTTON5_PRESSED as u32 != 0 {
                    d.scroll(5);
                } else if mev.bstate & ncurses::BUTTON4_PRESSED as u32 != 0 {
                    d.scroll(-5);
                } else if mev.bstate & (ncurses::BUTTON1_PRESSED) as u32 != 0 {
                    d.jumpto(mev.x, mev.y);
                }
            }
        }

        d.draw(bp);
    }

    ncurses::endwin();
}
