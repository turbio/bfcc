=== begin func main ==============

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 72, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = add nsw i32 %2, 32
  call void @putc(i32 %3)
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
=== Store ===================
store 72 at %2      >>[-]++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<<
=== Load ===================
move %2 to %3 %4    >>>[-]>[-]<<[->+>+<<]<<
move %4 to %2       >>[-]>>[-<<+>>]<<<<
=== Add ===================
move %3 to %4 %5    >>>>[-]>[-]<<[->+>+<<]<<<
move %5 to %3       >>>[-]>>[-<<+>>]<<<<<
add 32 to %4        >>>>++++++++++++++++++++++++++++++++<<<<
=== Call ===================
putc %4             >>>>.<<<<
=== Return ===================
return %0 TODO      -
=== end block 1% ===========
check %1       >]<

] ; end func block
=== end func main ================

=== begin func putc ==============

declare void @putc(i32) #1


=== end func putc ================

