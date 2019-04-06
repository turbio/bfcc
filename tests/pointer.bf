=== begin func main ==============

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  store i32 12, i32* %1, align 4
  store i32* %1, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  call void @putc(i32 %4)
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
store 12 at %2      >>[-]++++++++++++<<
=== Store ===================
store 2 at %3       >>>[-]++<<<
=== Load ===================
pv PointerValue(
    PointerValue {
        ptr_value: Value {
            name: "",
            address: 0x000055cab3d63c08,
            is_const: false,
            is_null: false,
            is_undef: false,
            llvm_value: "  %2 = alloca i32*, align 8",
            llvm_type: "i32**"
        }
    }
)
is InstructionValue {
    instruction_value: Value {
        name: "",
        address: 0x000055cab3d63c08,
        is_const: false,
        is_null: false,
        is_undef: false,
        llvm_value: "  %2 = alloca i32*, align 8",
        llvm_type: "i32**"
    }
}
copy %3 to %4 %5    >>>>[-]>[-]<<[->+>+<<]<<<
move %5 to %3       >>>[-]>>[-<<+>>]<<<<<
=== Load ===================
pv PointerValue(
    PointerValue {
        ptr_value: Value {
            name: "",
            address: 0x000055cab3d63ce8,
            is_const: false,
            is_null: false,
            is_undef: false,
            llvm_value: "  %3 = load i32*, i32** %2, align 8",
            llvm_type: "i32*"
        }
    }
)
is InstructionValue {
    instruction_value: Value {
        name: "",
        address: 0x000055cab3d63ce8,
        is_const: false,
        is_null: false,
        is_undef: false,
        llvm_value: "  %3 = load i32*, i32** %2, align 8",
        llvm_type: "i32*"
    }
}
copy %4 to %5 %6    >>>>>[-]>[-]<<[->+>+<<]<<<<
move %6 to %4       >>>>[-]>>[-<<+>>]<<<<<<
=== Call ===================
putc %5             >>>>>.<<<<<
=== Return ===================
return %0 TODO      -
=== end block 1% ===========
check %1       >]<

] ; end func block
=== end func main ================

=== begin func putc ==============

declare void @putc(i32) #1


=== end func putc ================

