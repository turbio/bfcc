=== begin func main ==============

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 65, i32* %1, align 4
  store i32 32, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = add nsw i32 %3, %4
  call void @putc(i32 %5)
  ret i32 0
}


=== func prelude ============
do func
store 1 at %0       [-]+
do block 0
store 1 at %1       >[-]+<
[ ; begin func block

=== begin block 1% =========
check unset %1 >[[-]<
=== Alloca ===================
=== Alloca ===================
=== Store ===================
store 65 at %2      >>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<<
=== Store ===================
store 32 at %3      >>>[-]++++++++++++++++++++++++++++++++<<<
=== Load ===================
move %2 to %4 %5    >>>>[-]>[-]<<<[->>+>+<<<]<<
move %5 to %2       >>[-]>>>[-<<<+>>>]<<<<<
=== Load ===================
move %3 to %5 %6    >>>>>[-]>[-]<<<[->>+>+<<<]<<<
move %6 to %3       >>>[-]>>>[-<<<+>>>]<<<<<<
=== Add ===================
move %4 to %6 %7    >>>>>>[-]>[-]<<<[->>+>+<<<]<<<<
move %7 to %4       >>>>[-]>>>[-<<<+>>>]<<<<<<<
move %5 to %7 %8    >>>>>>>[-]>[-]<<<[->>+>+<<<]<<<<<
move %8 to %5       >>>>>[-]>>>[-<<<+>>>]<<<<<<<<
add %7 to %6        >>>>>>>[-<+>]<<<<<<<
=== Call ===================
putc %6             >>>>>>.<<<<<<
=== Return ===================
return %0 TODO      -
=== end block 1% ===========
check %1       >]<

] ; end func block
=== end func main ================

=== begin func putc ==============

declare void @putc(i32) #1


=== end func putc ================

