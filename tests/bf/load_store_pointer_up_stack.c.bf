r6 >>>>>>
++++++
r1 >
runtime init:
#===TOP_FRAME
+
>>>#main
+
>#main/b0
+
<<<<[
    >#deref_int_set
    [
        >>>>#deref_int_set/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/deref_int_set
            >>>>>-
            l21 <<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_deref_int_set
        >#F:deref_int_set
        >#F:deref_int
        >#F:main
        >#B:%no_b0_call_for_deref_int_set
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%call_term_for_0
        >#alloc_%2
        <<<<[
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/41 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>>+
        <<]
        >>[
            -
            %2 = alloca i8_ align 1
            store i8 %0_ i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            >>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++++
            store sitch: alloca Some(8)
            store sitch: from LocalOperand { name: Number(0)_ ty: TypeRef(IntegerType { bits: 8 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m16/18 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>>+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<<]
            >>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m18/13 [-<<<<<+>>>>>]
                <<<<<+++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m39/14 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            drive left! choo choo
            <<<<<<<<<<<<<<<<<<<<<<<<<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                m14/13 >[-<+>]
                m10/14 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m14/10 >>>>[-<<<<+>>>>]
            <<[
                m15/11 >>>[-<<<<+>>>>]
                
                m12/13 <<<[->+<]
                r1 >
                -
            ]
            %3 = load i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            <<<#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<[
                -
                >>>>>>>+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<]
            >>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m17/13 [-<<<<+>>>>]
                <<<<+++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                
                m10/13 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d10/11/13 <<<[->+>>+<<<]
            m11/10 >[-<+>]
            >[
                m14/11 >>[-<<<+>>>]
                m13/14 <[->+<]
                m12/13 <[->+<]
                r1 >
                -
            ]
            m13/31 >[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            %4 = zext i8 %3 to i64
            m31/32 >>>>>>>>>>>>>>>>>>[->+<]
            %5 = inttoptr i64 %4 to i32*
            m32/33 >[->+<]
            store i32 98_ i32* %5_ align 4
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<<<#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: alloca None
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 98 }))
            >#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<-
            <<#subnu_to
            [
                if pos
                m17/12 [-<<<<<+>>>>>]
                <<<<<++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m9/13 <<<<<<<[->>>>+<<<<]
            drive left! choo choo
            >>>[
                m11/10 <[-<+>]
                m12/11 >[-<+>]
                m13/12 >[-<+>]
                m9/13 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m13/9 >>>>[-<<<<+>>>>]
            <<[
                m14/10 >>>[-<<<<+>>>>]
                
                m11/12 <<<[->+<]
                r1 >
                -
            ]
            %6 = load i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            <<#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<[
                -
                >>>>>>>+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<]
            >>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m17/13 [-<<<<+>>>>]
                <<<<+++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                
                m10/13 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d10/11/13 <<<[->+>>+<<<]
            m11/10 >[-<+>]
            >[
                m14/11 >>[-<<<+>>>]
                m13/14 <[->+<]
                m12/13 <[->+<]
                r1 >
                -
            ]
            m13/34 >[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            %7 = zext i8 %6 to i64
            m34/35 >>>>>>>>>>>>>>>>>>>>>[->+<]
            %8 = inttoptr i64 %7 to i32*
            m35/36 >[->+<]
            %9 = load i32* %8_ align 4
            <<<<<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/13/14 <<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/15 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<-
            <<#subnu_to
            [
                if pos
                m15/11 [-<<<<+>>>>]
                <<<<+++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m10/9 <[-<+>]
                m11/10 >[-<+>]
                
                m8/11 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d8/9/11 <<<[->+>>+<<<]
            m9/8 >[-<+>]
            >[
                m12/9 >>[-<<<+>>>]
                m11/12 <[->+<]
                m10/11 <[->+<]
                r1 >
                -
            ]
            m11/37 >[->>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            %10 = trunc i32 %9 to i8
            m37/38 >>>>>>>>>>>>>>>>>>>>>>>>>>[->+<]
            call @putchar(i8 %10)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>]
    <<<<<<]
    >#deref_int
    [
        >>>#deref_int/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/deref_int
            >>>>>-
            l21 <<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_deref_int
        >#F:deref_int_set
        >#F:deref_int
        >#F:main
        >#B:%no_b0_call_for_deref_int
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%call_term_for_0
        >#alloc_%2
        <<<<[
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/38 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>>+
        <<]
        >>[
            -
            %2 = alloca i8_ align 1
            store i8 %0_ i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            >>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++++
            store sitch: alloca Some(8)
            store sitch: from LocalOperand { name: Number(0)_ ty: TypeRef(IntegerType { bits: 8 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m16/18 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>>+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<<]
            >>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m18/13 [-<<<<<+>>>>>]
                <<<<<+++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m36/14 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            drive left! choo choo
            <<<<<<<<<<<<<<<<<<<<<<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                m14/13 >[-<+>]
                m10/14 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m14/10 >>>>[-<<<<+>>>>]
            <<[
                m15/11 >>>[-<<<<+>>>>]
                
                m12/13 <<<[->+<]
                r1 >
                -
            ]
            %3 = load i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            <<<#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<[
                -
                >>>>>>>+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<]
            >>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m17/13 [-<<<<+>>>>]
                <<<<+++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                
                m10/13 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d10/11/13 <<<[->+>>+<<<]
            m11/10 >[-<+>]
            >[
                m14/11 >>[-<<<+>>>]
                m13/14 <[->+<]
                m12/13 <[->+<]
                r1 >
                -
            ]
            m13/31 >[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            %4 = zext i8 %3 to i64
            m31/32 >>>>>>>>>>>>>>>>>>[->+<]
            %5 = inttoptr i64 %4 to i32*
            m32/33 >[->+<]
            %6 = load i32* %5_ align 4
            <<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/13/14 <<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/15 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<-
            <<#subnu_to
            [
                if pos
                m15/11 [-<<<<+>>>>]
                <<<<+++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m10/9 <[-<+>]
                m11/10 >[-<+>]
                
                m8/11 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d8/9/11 <<<[->+>>+<<<]
            m9/8 >[-<+>]
            >[
                m12/9 >>[-<<<+>>>]
                m11/12 <[->+<]
                m10/11 <[->+<]
                r1 >
                -
            ]
            m11/34 >[->>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            %7 = trunc i32 %6 to i8
            m34/35 >>>>>>>>>>>>>>>>>>>>>>>[->+<]
            call @putchar(i8 %7)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>]
    <<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/main
            >>>>>-
            l33 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_main
        >#F:deref_int_set
        >#F:deref_int
        >#F:main
        >#B:%no_b0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#B:%call_term_for_1
        >#B:%call_term_for_2
        >#B:%call_term_for_3
        >#B:%call_term_for_4
        >#B:%call_term_for_5
        >#B:%call_term_for_6
        >#alloc_%1
        >#alloc_%2
        >#alloc_%3
        <<<<<<<<<<<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            %1 = alloca i32_ align 4
            %2 = alloca i32_ align 4
            %3 = alloca i32_ align 4
            store i32 112_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>#constop_112
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            store sitch: alloca Some(14)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 112 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/25/26 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m25/0 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m25/27 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>>+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<<]
            >>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m27/22 [-<<<<<+>>>>>]
                <<<<<++++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m17/23 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m21/20 <[-<+>]
                m22/21 >[-<+>]
                m23/22 >[-<+>]
                m19/23 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m23/19 >>>>[-<<<<+>>>>]
            <<[
                m24/20 >>>[-<<<<+>>>>]
                
                m21/22 <<<[->+<]
                r1 >
                -
            ]
            store i32 116_ i32* %2_ align 4
            op_to_reg storing const value in temp address
            <<<<#constop_116
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++++
            store sitch: alloca Some(15)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 116 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/25/26 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m25/0 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m25/30 <<<<<<<[->>>>>+<<<<<]
            >>>>>>>+
            <<<<<<<<<<<<<<[
                -
                >>>>>>>>+
                >>>>[
                    -
                    <<<<-
                    r1 >
                >>>>]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<<<<<]
            >>>>>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m30/22 [-<<<<<<<<+>>>>>>>>]
                <<<<<<<<++++++++++++++++++++
            >>>>>>>>]
            <<<<[
                if neg
                <<<<++++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m17/23 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m21/20 <[-<+>]
                m22/21 >[-<+>]
                m23/22 >[-<+>]
                m19/23 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m23/19 >>>>[-<<<<+>>>>]
            <<[
                m24/20 >>>[-<<<<+>>>>]
                
                m21/22 <<<[->+<]
                r1 >
                -
            ]
            store i32 114_ i32* %3_ align 4
            op_to_reg storing const value in temp address
            <<<<#constop_114
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%3
            >#tmp_allocptr_tru_%3
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++++
            store sitch: alloca Some(16)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 114 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/25/26 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m25/0 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m25/27 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>>+
                >[
                    -
                    <-
                    r1 >
                >]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<<]
            >>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m27/22 [-<<<<<+>>>>>]
                <<<<<++++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m17/23 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m21/20 <[-<+>]
                m22/21 >[-<+>]
                m23/22 >[-<+>]
                m19/23 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m23/19 >>>>[-<<<<+>>>>]
            <<[
                m24/20 >>>[-<<<<+>>>>]
                
                m21/22 <<<[->+<]
                r1 >
                -
            ]
            %4 = ptrtoint i32* %1 to i8
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            m17/43 [->>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %4)
            enable next block when we return
            <<<<<<<<<<#caller/%call_term_for_0
            +
            stack_width 33
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m43/39 >>>>[-<<<<+>>>>]
            give callee a stack pointer
            <<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>]
        >[
            -
            %5 = ptrtoint i32* %2 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>>>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++++
            m17/44 [->>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %5)
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_1
            +
            stack_width 33
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m44/39 >>>>>[-<<<<<+>>>>>]
            give callee a stack pointer
            <<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>]
        >[
            -
            %6 = ptrtoint i32* %3 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>>>#tmp_allocptr_%3
            >#tmp_allocptr_tru_%3
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++++
            m17/45 [->>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %6)
            enable next block when we return
            <<<<<<<<#caller/%call_term_for_2
            +
            stack_width 33
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m45/39 >>>>>>[-<<<<<<+>>>>>>]
            give callee a stack pointer
            <<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>]
        >[
            -
            %7 = ptrtoint i32* %1 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            m17/46 [->>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int_set(i8 %7)
            enable next block when we return
            <<<<<<<#caller/%call_term_for_3
            +
            stack_width 33
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m46/39 >>>>>>>[-<<<<<<<+>>>>>>>]
            give callee a stack pointer
            <<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int_set
            +
            >#deref_int_set
            +
            >>>#deref_int_set/b0
            +
        >>>>>]
        >[
            -
            %8 = ptrtoint i32* %1 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            m17/47 [->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %8)
            enable next block when we return
            <<<<<<#caller/%call_term_for_4
            +
            stack_width 33
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m47/39 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            give callee a stack pointer
            <<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>>>]
        >[
            -
            %9 = ptrtoint i32* %2 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++++
            m17/48 [->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %9)
            enable next block when we return
            <<<<<#caller/%call_term_for_5
            +
            stack_width 33
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m48/39 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>>>>]
        >[
            -
            %10 = ptrtoint i32* %3 to i8
            op_to_reg storing pointer value in temp address
            >>>>>#tmp_allocptr_%3
            >#tmp_allocptr_tru_%3
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++++
            m17/49 [->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %10)
            enable next block when we return
            <<<<#caller/%call_term_for_6
            +
            stack_width 33
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m49/39 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>>>>>]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l7 <<<<<<<
        >>>>>>>>>>>>>]
    <<<<<<<<<<]
<<<]
