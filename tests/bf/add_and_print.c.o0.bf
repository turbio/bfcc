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
            l30 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#alloc_%2
        >#%3_=_load_i8*_%1__align_1
        >#%4_=_zext_i8_%3_to_i32
        >#%5_=_load_i8*_%2__align_1
        >#%6_=_zext_i8_%5_to_i32
        >#%7_=_add_i32_%4__i32_%6
        >#%8_=_trunc_i32_%7_to_i8
        <<<<<<<<<<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            %1 = alloca i8_ align 1
            %2 = alloca i8_ align 1
            store i8 65_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>>>>>#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 65 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/22/23 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<]
            m22/0 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m22/24 <<<<[->>+<<]
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
                m24/19 [-<<<<<+>>>>>]
                <<<<<+++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m14/20 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m18/17 <[-<+>]
                m19/18 >[-<+>]
                m20/19 >[-<+>]
                m16/20 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m20/16 >>>>[-<<<<+>>>>]
            <<[
                m21/17 >>>[-<<<<+>>>>]
                
                m18/19 <<<[->+<]
                r1 >
                -
            ]
            store i8 32_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            <<<<#constop_32
            ++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++
            store sitch: alloca Some(7)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 32 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/22/23 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<]
            m22/0 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m22/27 <<<<<<<[->>>>>+<<<<<]
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
                m27/19 [-<<<<<<<<+>>>>>>>>]
                <<<<<<<<+++++++++++++++++
            >>>>>>>>]
            <<<<[
                if neg
                <<<<+++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m14/20 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m18/17 <[-<+>]
                m19/18 >[-<+>]
                m20/19 >[-<+>]
                m16/20 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m20/16 >>>>[-<<<<+>>>>]
            <<[
                m21/17 >>>[-<<<<+>>>>]
                
                m18/19 <<<[->+<]
                r1 >
                -
            ]
            %3 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/15/16 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/20/21 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m20/22 <<<<[->>+<<]
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
                m22/18 [-<<<<+>>>>]
                <<<<++++++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m17/16 <[-<+>]
                m18/17 >[-<+>]
                
                m15/18 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d15/16/18 <<<[->+>>+<<<]
            m16/15 >[-<+>]
            >[
                m19/16 >>[-<<<+>>>]
                m18/19 <[->+<]
                m17/18 <[->+<]
                r1 >
                -
            ]
            m18/8 >[-<<<<<<<<<<+>>>>>>>>>>]
            %4 = zext i8 %3 to i32
            m8/9 <<<<<<<<<<[->+<]
            %5 = load i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            >>>>>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/15/16 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/20/21 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m20/22 <<<<[->>+<<]
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
                m22/18 [-<<<<+>>>>]
                <<<<++++++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m17/16 <[-<+>]
                m18/17 >[-<+>]
                
                m15/18 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d15/16/18 <<<[->+>>+<<<]
            m16/15 >[-<+>]
            >[
                m19/16 >>[-<<<+>>>]
                m18/19 <[->+<]
                m17/18 <[->+<]
                r1 >
                -
            ]
            m18/10 >[-<<<<<<<<+>>>>>>>>]
            %6 = zext i8 %5 to i32
            m10/11 <<<<<<<<[->+<]
            %7 = add i32 %4_ i32 %6
            m9/12 <[->>>+<<<]
            >>[
                -
                >+
            <]
            %8 = trunc i32 %7 to i8
            m12/13 >[->+<]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>.
            [-]
        <<<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret i32 0
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
