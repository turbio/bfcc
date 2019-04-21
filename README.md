```
    oooOOOOOOOOOOO"
   o  ____
 _T_,_|[]| __++++++
{|_|_|___|-|______|
 /oo---OO   oo  oo
```

# bfcc

compile llvm to brainfuck

LLVM bitcode -> bfcc -> brainfuck

## coverage

Pretty much every instruction's implementation has lots of caveats. Only
unsigned bytes are actually supported, instructions hoping for anything else
are out of luck.

Floating point, signed, and other fancy instructions are also ignored. For now
they're substituted with their closest implemented counterpart.

- Terminator Instructions
  - [ ] `ret`
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
  - [ ] `icmp`
    - [x] `eq`: equal
    - [x] `ne`: not equal
    - [ ] `ugt`: unsigned greater than
    - [ ] `uge`: unsigned greater or equal
    - [ ] `ult`: unsigned less than
    - [ ] `ule`: unsigned less or equal
    - [ ] `sgt`: signed greater than
    - [ ] `sge`: signed greater or equal
    - [ ] `slt`: signed less than
    - [ ] `sle`: signed less or equal
  - [ ] `call`
