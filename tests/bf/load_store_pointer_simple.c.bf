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
            l20 <<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_b0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        <<<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            %1 = alloca i32_ align 4
            store i32 112_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>#constop_112
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/9/10 <<<<<<<<<[->>>>>>>>>+>+<<<<<<<<<<]
            m10/0 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 112 }))
            >>#train_tmp
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
            m7/13 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
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
            %2 = ptrtoint i32* %1 to i32
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/8/9 <<<<<<<<[->>>>>>>>+>+<<<<<<<<<]
            m9/0 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            r1 >
            <<+++++++
            #ptrtoint_op_i32*_%1
            >>>>>>>>>>>>>>>>>>>>>>>#ptrtoint_ret_%2
            m7/30 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            %3 = add i32 65_ i32 %2
            op_to_reg storing const value in temp address
            #constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            #add_op0_i32_65
            >>>>>>>>>>>>>>>>>>>>>>>#add_op1_i32_%2
            >#add_ret_%3
            m7/31 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            >>>>>>>>>>>>>>>>>>>>>>>[
                -
                >+
            <]
            %4 = trunc i32 %3 to i8
            >#trunc_op_i32_%3
            >#trunc_ret_%4
            m31/32 <[->+<]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            ret void
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
