r5 >>>>>
+++++
r1 >
runtime init:
#===TOP_FRAME
+
>>#main
+
>#main/b0
+
<<<[
    >#lol
    [
        >>>#lol/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/lol
            >>>>-
            l16 <<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_lol
        >#F:lol
        >#F:main
        >#B:%no_b0_call_for_lol
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%call_term_for_0
        >#B:%8
        >#B:%call_term_for_2
        >#B:%11
        >#alloc_%2
        <<<<<<<[
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/28 <<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>+
        <<]
        >>[
            -
            %2 = alloca i32_ align 4
            store i32 %0_ i32* %2_ align 4
            store sitch: alloca Some(10)
            store sitch: from LocalOperand { name: Number(0)_ ty: TypeRef(IntegerType { bits: 32 }) }
            >>>>>[-]
            m26/10 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            %3 = load i32* %2_ align 4
            >#load_ret_%3
            #load_thru_%2_to_%3
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/27 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            %4 = add i32 %3_ i32 97
            op_to_reg storing const value in temp address
            >#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>#add_op0_i32_%3
            <<<<<<<<<<<<<<<#add_op1_i32_97
            >>>>>>>>>>>>>>>>#add_ret_%4
            m27/28 <[->+<]
            <<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<]
            %5 = trunc i32 %4 to i8
            >>>>>>>>>>>>>>>>#trunc_op_i32_%4
            >#trunc_ret_%5
            m28/29 <[->+<]
            call @putchar(i8 %5)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            %6 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%6
            #load_thru_%2_to_%6
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/30 <[->+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            %7 = icmp slt i32 %6_ i32 6
            op_to_reg storing const value in temp address
            #constop_6
            ++++++
            >>>>>>>>>>>>>>>>>>>#icmp_op0_i32_%6
            <<<<<<<<<<<<<<<<<<<#icmp_op1_i32_6
            >>>>>>>>>>>>>>>>>>>>#icmp_ret_%7
            <<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m11/13 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<]
            br i1 %7_ label %8_ label %11
            <<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>+
                #B:lol/8_true
            >>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:lol/11_false
            <<<<<]
        >>]
        >[
            -
            %9 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%9
            #load_thru_%2_to_%9
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/32 <[->+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            %10 = add i32 %9_ i32 1
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>#add_op0_i32_%9
            <<<<<<<<<<<<<<<<<<<<<#add_op1_i32_1
            >>>>>>>>>>>>>>>>>>>>>>#add_ret_%10
            m32/33 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<]
            call @lol(i32 %10)
            enable next block when we return
            <<<#caller/%call_term_for_2
            +
            stack_width 16
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>#arg_0
            m33/21 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<<<#stack_ptr
            +++++++++++++++++++++++
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r16 >>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >#caller
            +
            >>>#caller/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_lol
            +
            >#lol
            +
            >>#lol/b0
            +
        >>>>]
        >[
            -
            br label %11
            >+
        <]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l7 <<<<<<<
        >>>>>>>>>]
    <<<<<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l8 <<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:lol
        >#F:main
        >#B:%no_b0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        <<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            call @lol(i32 0)
            op_to_reg storing const value in temp address
            >>#constop_0
            
            enable next block when we return
            <#caller/%call_term_for_0
            +
            stack_width 8
            ret_pad_width 4
            copy up arg 0
            >>>>>>>#arg_0
            m7/13 <<<<<<[->>>>>>+<<<<<<]
            give callee a stack pointer
            >>>>>>>#stack_ptr
            +++++++++++++++
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            r8 >>>>>>>>
            <<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_lol
            +
            >#lol
            +
            >>#lol/b0
            +
        >>]
        >[
            -
            ret void
            zero all function allocs
            <<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>]
    <<<<]
<<]
