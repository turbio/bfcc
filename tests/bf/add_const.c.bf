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
        >>#main/RET_LANDING_PAD
        [
            <<<-
            #dead_frame
            >-
            <#dead_fn_pad/main
            >>>-
            l24 <<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_b0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_F
        >#%3_F
        >#%4_F
        >#%5_F
        <<<<<<<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            %1 = alloca i8_ align 1
            store i8 72_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>>#constop_72
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/13/14 <<<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 72 }))
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
            %2 = load i8* %1_ align 1
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
            %3 = zext i8 %2 to i32
            m7/8 <<<<<<<<[->+<]
            %4 = add i32 %3_ i32 32
            op_to_reg storing const value in temp address
            >>>>#constop_32
            ++++++++++++++++++++++++++++++++
            m8/9 <<<[->+<]
            >>>[
                -
                <<+
            >>]
            %5 = trunc i32 %4 to i8
            m9/10 <<[->+<]
            call @putchar(i8 %5)
            enable next block when we return
            <<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>.
            [-]
        <<<<<<]
        >[
            -
            ret i32 0
            zero all function allocs
            >[-]
            <<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
