=== begin func main ==============
pointer train station
store 0 at %0       [-]
store 0 at %1       >[-]<
store 0 at %2       >>[-]<<
=== func prelude ============
do func
store 1 at %3       >>>[-]+<<<
do block
store 1 at %4       >>>>[-]+<<<<
>>>[<<< ; begin func block

=== begin block 4% =========
check unset %4 >>>>[[-]<<<<
=== Alloca ===================
=== Alloca ===================
=== Store ===================
store 65 at %5      >>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<<<<<
=== Store ===================
store 32 at %6      >>>>>>[-]++++++++++++++++++++++++++++++++<<<<<<
=== Load ===================
move %5 to %7 %8    >>>>>>>[-]>[-]<<<[->>+>+<<<]<<<<<
move %8 to %5       >>>>>[-]>>>[-<<<+>>>]<<<<<<<<
=== ZExt ===================
move %7 to %8 %9    >>>>>>>>[-]>[-]<<[->+>+<<]<<<<<<<
move %9 to %7       >>>>>>>[-]>>[-<<+>>]<<<<<<<<<
=== Load ===================
move %6 to %9 %10   >>>>>>>>>[-]>[-]<<<<[->>>+>+<<<<]<<<<<<
move %10 to %6      >>>>>>[-]>>>>[-<<<<+>>>>]<<<<<<<<<<
=== ZExt ===================
move %9 to %10 %11  >>>>>>>>>>[-]>[-]<<[->+>+<<]<<<<<<<<<
move %11 to %9      >>>>>>>>>[-]>>[-<<+>>]<<<<<<<<<<<
=== Add ===================
move %8 to %11 %12  >>>>>>>>>>>[-]>[-]<<<<[->>>+>+<<<<]<<<<<<<<
move %12 to %8      >>>>>>>>[-]>>>>[-<<<<+>>>>]<<<<<<<<<<<<
move %10 to %12 %13 >>>>>>>>>>>>[-]>[-]<<<[->>+>+<<<]<<<<<<<<<<
move %13 to %10     >>>>>>>>>>[-]>>>[-<<<+>>>]<<<<<<<<<<<<<
add %12 to %11      >>>>>>>>>>>>[-<+>]<<<<<<<<<<<<
=== Trunc ===================
move %11 to %12 %13 >>>>>>>>>>>>[-]>[-]<<[->+>+<<]<<<<<<<<<<<
move %13 to %11     >>>>>>>>>>>[-]>>[-<<+>>]<<<<<<<<<<<<<
=== Call ===================
putc %12            >>>>>>>>>>>>.<<<<<<<<<<<<
=== Return ===================
return %3 TODO      >>>-<<<
=== end block 4% ===========
check %4       >>>>]<<<<

>>>]<<< ; end func block
=== end func main ================

=== begin func putc ==============
=== end func putc ================

