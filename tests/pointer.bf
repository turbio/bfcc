=== begin func main ==============
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
h PointerType {
    ptr_type: Type {
        address: 0x000055f8456f77f0,
        llvm_type: "i32*"
    }
}
