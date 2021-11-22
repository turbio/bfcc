```
    oooOOOOOOOOOOO"
   o  ____
 _T_,_|[]| __++++++
{|_|_|___|-|______|
 /oo---OO   oo  oo
```

# bfcc

Compile llvm ir to brainfuck

So like in theory: c/c++/rust/zig/etc --> LLVM --> bfcc --> brainfuck

Now you can target the most ubiquitous cross platform runtime in existence. If you can think of a platform [someones probably ran brainfuck on it](https://github.com/search?q=brainfuck). Write once run everywhere can finally be realized!

Because the brainfuck ecosystem is so diverse bfcc supports any cell size and doesn't depend on wrapping. That means any platform that is even slightly [spec compliant](https://esolangs.org/wiki/Brainfuck#Implementation_issues) can run bfcc programs no problem. 

## coverage

Pretty much every instruction's implementation has lots of caveats. Only brainfuck runtime cells are actually supported, instructions hoping for anything else are out of luck and are secretly given cells anyways.

Floating point, signed, and other fancy instructions are also ignored. For now they're substituted with their closest implemented counterpart lol.

- Terminator Instructions
  - [x] `ret`
  - [x] `br`
  - [ ] `switch`
  - [ ] `indirectbr`
  - [ ] `invoke`
  - [ ] `unwind`
  - [ ] `unreachable`
- Binary Operations
  - [x] `add`
  - [x] `sub`
  - [ ] `mul`
  - [ ] `udiv`
  - [ ] `sdiv`
  - [ ] `urem`
- Bitwise Binary Operations
  - [ ] `shl`
  - [ ] `lshr`
  - [ ] `ashr`
  - [ ] `and`
  - [ ] `or`
  - [ ] `xor`
- Memory Access and Addressing Operations
  - [x] `alloca`
  - [x] `load`
  - [x] `store`
  - [ ] `getelementptr`
- Conversion Operations
  - [x] `trunc .. to`
  - [x] `zext .. to`
  - [ ] `sext .. to`
  - [ ] `ptrtoint .. to`
  - [ ] `inttoptr .. to`
  - [ ] `bitcast .. to`
- Other Operations
  - [x] `icmp`
    - [x] `eq`: equal
    - [x] `ne`: not equal
    - [x] `ugt`: unsigned greater than
    - [x] `uge`: unsigned greater or equal
    - [x] `ult`: unsigned less than
    - [x] `ule`: unsigned less or equal
    - [x] `sgt`: signed greater than
    - [x] `sge`: signed greater or equal
    - [x] `slt`: signed less than
    - [x] `sle`: signed less or equal
  - [x] `call`

## conceptual stuff that needs susing

- operand consumption semantics, right now we throw caution to the wind and
  (sometimes?) mostly consume.
  - except for loads... cause that's memory dude
  - also mangling vs consumption semantics are unclear
- register reuse, right now we always create a new register even in the case of
  say `%a = zext i32 %b to i32`
- scratch space zeroing. It's probably the garbage maker's job to clean up any
  left over registers.
- pack register order to optimize travel distance, idk sounds hard an prolly
  needs a cost model
- register packing for order dependant operations
- "verify" for some of these properties, cardinality is gonna explode in a lotta
  cases tho
- should be able to use control flow mask registers as scratch space while
  they're not being used
- "# of functions" + "max # of blocks" as the mask space is gonna get seek-y
  - could encode the mask as a tree-y thing
  - or just like some kind of scheme with uint8s as function/block addresses
    that sounds expensive but like what's even the cost model???
- variable stack size: so like what if there's a fixed width jump frame in
  between each actual frame owned by the caller. This way the jump frame handles
  the ret while the callee only needs to seek to the jump frame.
- non dependant op re-ordering for reduced travel time, basically out of order
  execution
  - also block ordering??
