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
        >#alloc_%2
        <<<<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            %1 = alloca i8_ align 1
            %2 = alloca i8_ align 1
            store i8 122_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>#constop_122
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 122 }))
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
            m8/14 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
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
            store i8 32_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            <<<<#constop_32
            ++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
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
            d0/16/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m16/21 <<<<<<<[->>>>>+<<<<<]
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
                m21/13 [-<<<<<<<<+>>>>>>>>]
                <<<<<<<<+++++++++++
            >>>>>>>>]
            <<<<[
                if neg
                <<<<+++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m8/14 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
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
            %3 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/9/10 <<<<<<<<<[->>>>>>>>>+>+<<<<<<<<<<]
            m10/0 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            r1 >
            <<+++++++
            >>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%3
            <<<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/14/15 <<<<<<<<<<<<<[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m14/16 <<<<[->>+<<]
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
                m16/12 [-<<<<+>>>>]
                <<<<++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m11/10 <[-<+>]
                m12/11 >[-<+>]
                
                m9/12 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d9/10/12 <<<[->+>>+<<<]
            m10/9 >[-<+>]
            >[
                m13/10 >>[-<<<+>>>]
                m12/13 <[->+<]
                m11/12 <[->+<]
                r1 >
                -
            ]
            m12/34 >[->>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            %4 = zext i8 %3 to i32
            >>>>>>>>>>>>>>>>>>>>>>#zext_op_i8_%3
            >#zext_ret_%4
            m34/35 <[->+<]
            %5 = load i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            <<<<<<<<<<<<<<<<<<<<<<<<<<#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/9/10 <<<<<<<<<[->>>>>>>>>+>+<<<<<<<<<<]
            m10/0 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            r1 >
            <<++++++++
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%5
            <<<<<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/14/15 <<<<<<<<<<<<<[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m14/16 <<<<[->>+<<]
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
                m16/12 [-<<<<+>>>>]
                <<<<++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m11/10 <[-<+>]
                m12/11 >[-<+>]
                
                m9/12 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d9/10/12 <<<[->+>>+<<<]
            m10/9 >[-<+>]
            >[
                m13/10 >>[-<<<+>>>]
                m12/13 <[->+<]
                m11/12 <[->+<]
                r1 >
                -
            ]
            m12/36 >[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            %6 = zext i8 %5 to i32
            >>>>>>>>>>>>>>>>>>>>>>>>#zext_op_i8_%5
            >#zext_ret_%6
            m36/37 <[->+<]
            %7 = sub i32 %4_ i32 %6
            <#sub_op0_i32_%4
            >>#sub_op1_i32_%6
            >#sub_ret_%7
            m35/38 <<<[->>>+<<<]
            >>[
                -
                >-
            <]
            %8 = trunc i32 %7 to i8
            >#trunc_op_i32_%7
            >#trunc_ret_%8
            m38/39 <[->+<]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
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
