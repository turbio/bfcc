```
    oooOOOOOOOOOOO"
   o  ____
 _T_,_|[]| __++++++
{|_|_|___|-|______|
 /oo---OO   oo  oo
```

# bfcc

compile llvm to brainfuck

LLVM -> bfcc -> brainfuck

So like in theory any c code can be compiled to brainfuck.

## conceptual stuff that needs susing

- operand consumption semantics, right now we throw caution to the wind and
  (sometimes?) mostly consume.
  - oh wait loads are never consumptive lol... cause that's memory dude
  - also mangling vs consumption semantics
- register reuse, right now we always create a new register even in the case of
  say `%a = add i32 %b, i32 1` even tho `%b` is consumed
- scratch space zeroing. It's probably the garbage maker's job to clean up any
  scratch registers.
- pack register order to optimize travel distance
- register packing for order dependant operations
- `verifier` for some of these properties
- should be able to use control flow mask registers as scratch space while
  they're not being used
- "# of functions" + "max # of blocks" as the mask space is gonna get seeky
  - could encode the mask as a tree-y thing
  - or just like some kind of scheme with uint8s as function/block addresses but
    that sounds expensive but 
- variable stack size: so like what if there's a fixed width jump frame in
  between each actual frame owned by the caller. This way the jump frame handles
  the ret while the callee only needs to seek to the jump frame.
- non dependant op re-ordering for reduced travel time

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
