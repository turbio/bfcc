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

struct State<'a> {
	tape: Vec<u8>,
	annots: Vec<Option<String>>,

	mp: usize,
	pc: usize,

	code: &'a str,

	ic: usize,
	input: Vec<u8>,

	output: Vec<u8>,
}

const INSTRUCTS: &[char] = &['[', ']', '+', '-', '>', '<', ',', '.'];

fn is_instr(i: char) -> bool {
	return INSTRUCTS.iter().find(|c| **c == i).is_some();
}

impl<'a> State<'a> {
	fn new(code: &'a str, input: Vec<u8>) -> State<'a> {
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

	fn nextop(&self) -> Result<(usize, Option<String>), ()> {
		let from = self.pc + 1;
		let nextpc = self.code[from..].find(INSTRUCTS);
		if nextpc.is_none() {
			return Err(());
		}

		let nextpc = nextpc.unwrap() + from;

		let annot = self.code[from..nextpc].rfind(|c| c == '#');
		if annot.is_some() {
			let annot = annot.unwrap() + 1;
			let to = self.code[(from + annot)..]
				.find(|c| char::is_whitespace(c) || is_instr(c))
				.unwrap();

			Ok((
				nextpc,
				Some(
					self.code[(from + annot)..(from + annot + to)].to_string(),
				),
			))
		} else {
			Ok((nextpc, None))
		}
	}

	fn prevop(&self) -> Result<(usize, Option<String>), ()> {
		let from = self.pc - 1;
		let nextpc = self.code[..from].rfind(INSTRUCTS);
		if nextpc.is_none() {
			return Err(());
		}

		let nextpc = nextpc.unwrap();

		Ok((nextpc, None))
	}

	fn ch(&self, i: usize) -> char {
		self.code.chars().nth(i).unwrap()
	}

	fn next(&self) -> Result<(State<'a>, Option<String>), &str> {
		let mut n: State<'a> = State {
			tape: self.tape.clone(),
			annots: self.annots.clone(),

			pc: self.pc,
			mp: self.mp,

			code: self.code,

			ic: self.ic,
			input: self.input.clone(),
			output: self.output.clone(),
		};

		match self.ch(self.pc) {
			'+' => {
				if n.tape[n.mp] == 255 {
					return Err("overflow");
				}

				n.tape[n.mp] += 1
			}
			'-' => {
				if n.tape[n.mp] == 0 {
					return Err("underflow");
				}

				n.tape[n.mp] -= 1
			}
			'>' => {
				if n.mp == n.tape.len() - 1 {
					n.tape.push(0);
					n.annots.push(None);
				}
				n.mp += 1;
			}
			'<' => {
				if n.mp == 0 {
					return Err("negative tape");
				}

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

		let next = n.nextop();
		if next.is_err() {
			return Err("EOF");
		}

		let (pc, annot) = next.unwrap();

		n.pc = pc;
		if annot.is_some() {
			n.annots[n.mp] = annot.clone();
		}

		Ok((n, annot))
	}
}

struct Debugger<'a> {
	state: State<'a>,

	code_scroll: isize,
	mem_scroll: isize,

	status: String,

	root: ncurses::SCREEN,
}

const mem_wid: usize = 60;

impl<'a> Debugger<'a> {
	fn new(code: &'a str, input: Vec<u8>) -> Debugger<'a> {
		Debugger {
			state: State::new(code, input),
			root: ncurses::initscr(),
			code_scroll: 0,
			mem_scroll: 0,
			status: "".to_string(),
		}
	}

	fn scroll(&mut self, l: isize, x: usize, y: usize) {
		if x < ncurses::getmaxx(self.root) as usize - mem_wid {
			let lines = self.cur().code.lines().count() as isize;

			self.code_scroll = if l + self.code_scroll < 0 {
				0
			} else if self.code_scroll + l > lines {
				lines
			} else {
				self.code_scroll + l
			}
		} else {
			let cells = self.cur().tape.len();

			self.mem_scroll = if l + self.mem_scroll < 0 {
				0
			} else if self.mem_scroll + l > cells as isize {
				cells as isize
			} else {
				self.mem_scroll + l
			}
		}
	}

	fn cur(&self) -> &State {
		&self.state
	}

	fn last(&self) -> Option<&State> {
		None
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

	fn step(&mut self) -> Result<(), &str> {
		let next = self.state.next();

		if next.is_err() {
			self.status = next.err().unwrap().to_string();
			Err("step failed")
		} else {
			self.state = next.unwrap().0;
			Ok(())
		}
	}

	fn rewind(&mut self) {}

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

	fn scrolltoview(&mut self) {
		let cline = self.cur().code[..self.cur().pc]
			.chars()
			.filter(|c| *c == '\n')
			.count() as isize;

		let maxy = ncurses::getmaxy(self.root) as isize - (4 + 3);

		if cline < self.code_scroll {
			self.code_scroll = cline as isize;
		} else if cline > self.code_scroll + maxy {
			self.code_scroll = cline as isize - maxy;
		}
	}

	fn until(&mut self, annot: Option<&str>) {
		self.step();

		loop {
			let ret = self.state.next();
			if ret.is_err() {
				self.status = format!("step err: {}", ret.err().unwrap());
				break;
			}

			let (next, found) = ret.unwrap();

			if match (&annot, &found) {
				(Some(a), Some(f)) => a == f,
				(None, Some(_)) => true,
				_ => false,
			} {
				break;
			}

			self.state = next;
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
		self.drawcode(0, 3, ncurses::getmaxx(self.root) - mem_wid as i32, -1);
		self.drawmem(
			ncurses::getmaxx(self.root) - mem_wid as i32,
			3,
			mem_wid as i32,
			ncurses::getmaxy(self.root) - 3 - 2,
		);

		let steps = format!(
			" step: {} bp: {} st: {}",
			-1,
			bp.as_ref().unwrap_or(&"*"),
			self.status,
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
				let i = i + self.mem_scroll as i32;
				if i >= self.cur().tape.len() as i32 {
					continue;
				}

				if self.cur().mp == i as usize {
					ncurses::wmove(
						self.root,
						i + top + 1 - (self.mem_scroll as i32),
						left,
					);
					ncurses::waddstr(self.root, ">");
					ncurses::wattron(self.root, ncurses::A_REVERSE());
				}

				ncurses::wmove(
					self.root,
					i + top + 1 - (self.mem_scroll as i32),
					left + 1,
				);

				ncurses::wcolor_set(self.root, Color::Normal as i16);

				ncurses::waddstr(
					self.root,
					&format!(
						"{:03} / {:03} : ",
						(i as i32 - self.cur().mp as i32).abs(),
						i
					),
				);

				if self.cur().tape[i as usize] == 0 {
					ncurses::wcolor_set(self.root, Color::Mem0 as i16);
				} else if self.cur().tape[i as usize] == 1 {
					ncurses::wcolor_set(self.root, Color::Mem1 as i16);
				} else {
					ncurses::wcolor_set(self.root, Color::Mem as i16);
				}

				ncurses::waddstr(
					self.root,
					&format!(
						"{v:03} / {c:01}",
						v = self.cur().tape[i as usize],
						c = if self.cur().tape[i as usize] >= 32 {
							self.cur().tape[i as usize] as char
						} else {
							' '
						}
					),
				);

				ncurses::wattroff(self.root, ncurses::A_REVERSE());

				if self.cur().annots[i as usize].is_some() {
					ncurses::wcolor_set(self.root, Color::Annot as i16);
					ncurses::waddstr(
						self.root,
						&format!(
							" {}",
							self.cur().annots[i as usize].as_ref().unwrap()
						),
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

			if self.code_scroll > l {
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
	let mut bpa: String;
	let mut input: String = "\0".to_string();
	let mut bp: Option<&str> = None;

	let mut skip = false;
	for (i, arg) in env::args().enumerate().skip(1).by_ref() {
		if skip {
			skip = false;
			continue;
		}

		if arg == "-b"
			|| arg == "-break"
			|| arg == "-breakpoint"
			|| arg == "--b"
			|| arg == "--break"
			|| arg == "--breakpoint"
		{
			bpa = env::args().nth(i + 1).unwrap();
			bp = Some(bpa.as_str());
			skip = true;
		} else if arg == "-i" || arg == "-input" || arg == "--input" {
			input = env::args().nth(i + 1).unwrap();
			skip = true;
		} else {
			pathstr = arg;
		}
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

	// technically incorrect but at least it won't break rendering
	let code = code.replace('\t', "    ");

	let mut d = Debugger::new(&code, input.as_bytes().to_vec());

	d.init();
	d.draw(bp);

	ncurses::mousemask(
		(ncurses::ALL_MOUSE_EVENTS | ncurses::REPORT_MOUSE_POSITION) as u32,
		None,
	);

	loop {
		let ch = ncurses::wgetch(d.root);
		let mut didscroll = false;

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
			bp = None;
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
					d.scroll(5, mev.x as usize, mev.y as usize);
					didscroll = true;
				} else if mev.bstate & ncurses::BUTTON4_PRESSED as u32 != 0 {
					d.scroll(-5, mev.x as usize, mev.y as usize);
					didscroll = true;
				} else if mev.bstate & (ncurses::BUTTON1_PRESSED) as u32 != 0 {
					d.jumpto(mev.x, mev.y);
				}
			}
		}

		if !didscroll {
			d.scrolltoview();
		}

		d.draw(bp);
	}

	ncurses::endwin();
}
