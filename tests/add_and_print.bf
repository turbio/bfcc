=== begin func main ==============
pointer train station
store 0 at #0       [-]
store 0 at #1       >[-]<
store 0 at #2       >>[-]<<
store 0 at #3       >>>[-]<<<
=== func prelude ============
do func
store 1 at #4       >>>>[-]+<<<<
do block
store 1 at #5       >>>>>[-]+<<<<<
>>>>[<<<< ; begin func block

=== begin block #5 =========
check clear #5 >>>>>[[-]<<<<<
=== Alloca(
    Alloca {
        allocated_type: TypeRef(
            IntegerType {
                bits: 8,
            },
        ),
        num_elements: ConstantOperand(
            ConstantRef(
                Int {
                    bits: 32,
                    value: 1,
                },
            ),
        ),
        dest: Number(
            1,
        ),
        alignment: 1,
        debugloc: None,
    },
) ===================
store &#6 at #7     >>>>>>>[-]++++++<<<<<<<
=== Alloca(
    Alloca {
        allocated_type: TypeRef(
            IntegerType {
                bits: 8,
            },
        ),
        num_elements: ConstantOperand(
            ConstantRef(
                Int {
                    bits: 32,
                    value: 1,
                },
            ),
        ),
        dest: Number(
            2,
        ),
        alignment: 1,
        debugloc: None,
    },
) ===================
store &#8 at #9     >>>>>>>>>[-]++++++++<<<<<<<<<
=== Store(
    Store {
        address: LocalOperand {
            name: Number(
                1,
            ),
            ty: TypeRef(
                PointerType {
                    pointee_type: TypeRef(
                        IntegerType {
                            bits: 8,
                        },
                    ),
                    addr_space: 0,
                },
            ),
        },
        value: ConstantOperand(
            ConstantRef(
                Int {
                    bits: 8,
                    value: 65,
                },
            ),
        ),
        volatile: false,
        atomicity: None,
        alignment: 1,
        debugloc: None,
    },
) ===================
