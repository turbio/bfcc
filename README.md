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

Now you can target the most ubiquitous cross platform runtime in existence. If you can think of a platform [someones probably ran brainfuck on it](https://github.com/search?q=brainfuck). Write once run everywhere can actually be realized!

Because the brainfuck ecosystem is so diverse (this is our strength) bfcc supports any cell size and doesn't depend on wrapping. Any platform even slightly [spec compliant](https://esolangs.org/wiki/Brainfuck#Implementation_issues) can run bfcc generated code no problem. We'll never seek left of the starting cell, never decrement past zero, and never increment past 255. That's our promise to you.

If you're based and nix pilled you can try it out with:

```bash
# open a dev shell
nix develop

# to run the test suite
cargo run --bin verify

# compile c to brainfuck
clang -emit-llvm -c hello.c -o hello.bc
cargo run --bin bfcc hello.bc > hello.bf

```
in the repo's root.

## coverage

Pretty much every instruction's implementation has lots of caveats. Only brainfuck runtime cells are actually supported, instructions hoping for anything else are out of luck and are secretly given cells anyways.

Floating point, signed, and other fancy instructions are also ignored. For now they're substituted with their closest implemented counterpart lol.

████████████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░  41% (23/55)


- Terminator Instructions
  - [x] `ret`
  - [x] `br`
  - [ ] `switch`
  - [ ] `indirectbr`
  - [ ] ~`invoke`~ exceptions
  - [ ] ~`callbr`~ only used to implement the “goto” feature of gcc style inline assembly
  - [ ] ~`resume`~ exceptions
  - [ ] ~`catchswitch`~  exceptions
  - [ ] ~`catchret`~ exceptions
  - [ ] ~`cleanupret`~ exceptions
  - [ ] `unreachable`
- Unary Operations
  - [ ] `fneg`
- Binary Operations
  - [x] `add`
  - [ ] `fadd`
  - [x] `sub`
  - [ ] `fsub`
  - [x] `mul`
  - [ ] `fmul`
  - [x] `udiv`
  - [x] `sdiv`
  - [ ] `fdiv`
  - [x] `urem`
  - [x] `srem`bfcc.rs
  - [ ] `frem`
- Bitwise Binary Operations
  - [x] `shl`
  - [x] `lshr`
  - [x] `ashr`
  - [x] `and`
  - [x] `or`
  - [x] `xor`
- Vector Operations
  - [ ] `extractelement`
  - [ ] `insertelement`
  - [ ] `shufflevector`
- Aggregate Operations
  - [ ] `extractvalue`
  - [ ] `insertvalue`
- Memory Access and Addressing Operations
  - [x] `alloca`
  - [x] `load`
  - [x] `store`
  - [ ] `fence`
  - [ ] `cmpxchg`
  - [ ] `atomicrmw`
  - [ ] `getelementptr`
- Conversion Operations
  - [x] `trunc .. to`
  - [x] `zext .. to`
  - [x] `sext .. to`
  - [ ] `fptrunc .. to`
  - [ ] `fpext .. to`
  - [ ] `fptoui .. to`
  - [ ] `fptosi .. to`
  - [ ] `uitofp .. to`
  - [ ] `sitofp .. to`
  - [x] `ptrtoint .. to`
  - [x] `inttoptr .. to`
  - [x] `bitcast .. to`
  - [ ] `addrspacecast .. to`
- Other Operations
  - [x] `icmp`
  - [ ] `fcmp`
  - [x] `phi`
  - [x] `select`
  - [ ] `freeze`
  - [x] `call`
  - [ ] `va_arg`
  - [ ] ~`landingpad`~ exceptions
  - [ ] ~`catchpad`~ exceptions
  - [ ] ~`cleanuppad`~ exceptions


## conceptual susing

- operand consumption semantics, right now we throw caution to the wind and
  (sometimes?) mostly consume.
  - except for loads... cause that's memory dude
  - also mangling vs consumption semantics are unclear
- variable stack size: so like what if there's a fixed width jump frame in
  between each actual frame owned by the caller. This way the jump frame handles
  the ret while the callee only needs to seek to the jump frame.
- "# of functions" + "max # of blocks" as the mask space is gonna get seek-y
  - could encode the mask as a tree-y thing
  - or just like some kind of scheme with uint8s as function/block addresses
    that sounds expensive but
- should really just find a good subset of llvm and port the rest over
- register reuse, right now we always create a new register even in the case of `%a = zext i32 %b to i32`
- scratch space zeroing. It's probably the garbage maker's job to clean up any
  left over registers.
- pack register order to optimize travel distance, idk sounds hard n prolly
  needs a cost model
  - register packing for order dependant operations
- a "verify" binary for some of these properties, cardinality is gonna explode in a lotta
  cases tho
- should be able to use control flow mask registers as scratch space while
  they're not being used
- non dependant op re-ordering for reduced travel time, basically oooe
  - also block ordering??
