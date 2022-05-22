r4 >>>>
++++
r1 >
runtime init:
#===TOP_FRAME
+
>#main
+
>#main/b0
+
<<[
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<-
            #dead_frame
            >-
            <#dead_fn_pad/main
            >>>-
            l27 <<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_=_load_i32*_%1__align_4
        >#%3_=_add_i32_%2__i32_1(mult)
        >#%4_=_add_i32_65__i32_%3
        >#%5_=_trunc_i32_%4_to_i8
        <<<<<<<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            %1 = alloca i32_ align 4
            store i32 1_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>#constop_1
            +
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/13/14 <<<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 1 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m19/21 <<<<[->>+<<]
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
                m21/16 [-<<<<<+>>>>>]
                <<<<<++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m11/17 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m15/14 <[-<+>]
                m16/15 >[-<+>]
                m17/16 >[-<+>]
                m13/17 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m17/13 >>>>[-<<<<+>>>>]
            <<[
                m18/14 >>>[-<<<<+>>>>]
                
                m15/16 <<<[->+<]
                r1 >
                -
            ]
            %2 = load i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/12/13 <<<<<<<<<<<<[->>>>>>>>>>>>+>+<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/17/18 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m17/19 <<<<[->>+<<]
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
                m19/15 [-<<<<+>>>>]
                <<<<+++++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m14/13 <[-<+>]
                m15/14 >[-<+>]
                
                m12/15 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d12/13/15 <<<[->+>>+<<<]
            m13/12 >[-<+>]
            >[
                m16/13 >>[-<<<+>>>]
                m15/16 <[->+<]
                m14/15 <[->+<]
                r1 >
                -
            ]
            m15/7 >[-<<<<<<<<+>>>>>>>>]
            %3 = add i32 %2_ i32 1
            op_to_reg storing const value in temp address
            <<<<#constop_1
            +
            <<<[-]
            m7/8 <[->+<]
            >>>>[
                -
                <<<+
            >>>]
            store i32 %3_ i32* %1_ align 4
            d8/11/12 <<<[->>>+>+<<<<]
            m11/8 >>>[-<<<+>>>]
            op_to_reg storing pointer value in temp address
            >>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/14/15 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from LocalOperand { name: Number(3)_ ty: TypeRef(IntegerType { bits: 32 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/20/21 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m20/24 <<<<<<[->>>>+<<<<]
            >>>>>>+
            <<<<<<<<<<<<<[
                -
                >>>>>>>>+
                >>>[
                    -
                    <<<-
                    r1 >
                >>>]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<<<<]
            >>>>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m24/17 [-<<<<<<<+>>>>>>>]
                <<<<<<<+++++++++++++++
            >>>>>>>]
            <<<[
                if neg
                <<<<+++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m12/18 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m16/15 <[-<+>]
                m17/16 >[-<+>]
                m18/17 >[-<+>]
                m14/18 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m18/14 >>>>[-<<<<+>>>>]
            <<[
                m19/15 >>>[-<<<<+>>>>]
                
                m16/17 <<<[->+<]
                r1 >
                -
            ]
            %4 = add i32 65_ i32 %3
            op_to_reg storing const value in temp address
            <<<<<#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            d8/12/13 <<<[->>>>+>+<<<<<]
            m12/8 >>>>[-<<<<+>>>>]
            m11/9 <[-<<+>>]
            >>[
                -
                <<<<+
            >>>>]
            %5 = trunc i32 %4 to i8
            m9/10 <<<<[->+<]
            call @putchar(i8 %5)
            enable next block when we return
            <<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>.
            [-]
        <<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            >>[-]
            <<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
