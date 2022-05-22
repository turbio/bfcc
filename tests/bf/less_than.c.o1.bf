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
    >#lt
    [
        >>>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/lt
            >>>>-
            l16 <<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_lt
        >#F:lt
        >#F:main
        >#B:%no_block0_call_for_lt
        >#B:%ret_lading_pad
        >#B:%2
        >#B:%call_term_for_0
        >#%3_=_icmp_slt_i32_%0__i32_%1(mult)
        >#%4_=_select_i1_%3__i8_108__i8_114(mult)
        >#%0
        >#%1
        <<<<<<<#B:%no_block0_call_for_lt
        [
            -
            copy up args
            >>>>>>#arg_%0
            l2 <<
            m0/11 <<<<<<<<<[->>>>>>>>>>>+<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>#arg_%1
            l3 <<<
            m0/13 <<<<<<<<<<[->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            r3 >>>
            br label %2
            >>>>>+
        <<]
        >>#B:%2
        [
            -
            %3 = icmp slt i32 %0_ i32 %1
            >>[-]
            >>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m10/11 <<<[->+<]
            >>>+
            <<<<[
                -
                
                >>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<]
            >>>>-
            <<[
                [-]
                <<<<+
            >>>>]
            %4 = select i1 %3_ i8 108_ i8 114
            <<<[-]
            d7/11/12 <[->>>>+>+<<<<<]
            m11/7 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >>>#constop_108
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing const value in temp address
            <#constop_114
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>+
            <<<[
                m14/8 >>[-<<<<<<+>>>>>>]
                <[-]
                <[-]
                >>>[-]
            <<<]
            >>>[
                -
                m13/8 <<[-<<<<<+>>>>>]
                >[-]
                <<[-]
            >>>]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            d8/11/12 >>[->>>+>+<<<<]
            m11/8 >>>[-<<<+>>>]
            >.
            [-]
        <<<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>]
    <<<<<]
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l34 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:lt
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#B:%call_term_for_1
        >#B:%call_term_for_2
        >#B:%call_term_for_3
        >#B:%call_term_for_4
        >#B:%call_term_for_5
        >#B:%call_term_for_6
        >#B:%call_term_for_7
        >#B:%call_term_for_8
        >#B:%1
        >#B:%3
        >#B:%4
        >#B:%7
        >#B:%call_term_for_13
        >#%2_=_phi_i32_{_i32_0__%call_term_for_8_}__{_i32_%5__%4_}(mult)
        >#%5_=_add_i32_%2__i32_1(mult)
        >#%6_=_icmp_eq_i32_%5__i32_30(mult)
        >#%8_=_phi_i32_{_i32_0__%1_}__{_i32_%9__%call_term_for_13_}(mult)
        >#%9_=_add_i32_%8__i32_1(mult)
        >#%10_=_icmp_eq_i32_%9__i32_30(mult)
        <<<<<<<<<<<<<<<<<<<<<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            call @lt(i32 1_ i32 2)
            enable next block when we return
            >#caller/%call_term_for_0
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_1
            +
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<#constop_2
            ++
            m27/39 [->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>]
        >#B:%call_term_for_0
        [
            -
            call @lt(i32 2_ i32 1)
            enable next block when we return
            >#caller/%call_term_for_1
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_2
            ++
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_1
            +
            m28/39 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>]
        >#B:%call_term_for_1
        [
            -
            call @lt(i32 3_ i32 4)
            enable next block when we return
            >#caller/%call_term_for_2
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_3
            +++
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<#constop_4
            ++++
            m27/39 [->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>]
        >#B:%call_term_for_2
        [
            -
            call @lt(i32 3_ i32 3)
            enable next block when we return
            >#caller/%call_term_for_3
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_3
            +++
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<#constop_3
            +++
            m27/39 [->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>]
        >#B:%call_term_for_3
        [
            -
            call @lt(i32 4_ i32 5)
            enable next block when we return
            >#caller/%call_term_for_4
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_4
            ++++
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<#constop_5
            +++++
            m27/39 [->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>]
        >#B:%call_term_for_4
        [
            -
            call @lt(i32 5_ i32 6)
            enable next block when we return
            >#caller/%call_term_for_5
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_5
            +++++
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<#constop_6
            ++++++
            m27/39 [->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>]
        >#B:%call_term_for_5
        [
            -
            call @lt(i32 6_ i32 7)
            enable next block when we return
            >#caller/%call_term_for_6
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_6
            ++++++
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<#constop_7
            +++++++
            m27/39 [->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>]
        >#B:%call_term_for_6
        [
            -
            call @lt(i32 7_ i32 8)
            enable next block when we return
            >#caller/%call_term_for_7
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<#constop_7
            +++++++
            m26/40 [->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<#constop_8
            ++++++++
            m27/39 [->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>>]
        >#B:%call_term_for_7
        [
            -
            call @putchar(i8 10)
            enable next block when we return
            >#caller/%call_term_for_8
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_10
            ++++++++++
            .
            [-]
        <<<<<<<<<<<<<]
        >#B:%call_term_for_8
        [
            -
            br label %1
            doing phi stuff
            %2 = phi i32 _ i32 0_ %call_term_for_8 __ _ i32 %5_ %4 _
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_0
            
            <<<<<<[-]
            m26/20 >>>>>>[-<<<<<<+>>>>>>]
            <<<<<<<<<<<+
        <]
        >#B:%1
        [
            -
            %2 = phi i32 _ i32 0_ %call_term_for_8 __ _ i32 %5_ %4 _
            br label %7
            doing phi stuff
            %8 = phi i32 _ i32 0_ %1 __ _ i32 %9_ %call_term_for_13 _
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_0
            
            <<<<[-]
            m27/23 >>>>[-<<<<+>>>>]
            <<<<<<<<<+
        <<<]
        >#B:%3
        [
            -
            ret void
            zero all function allocs
            >>>>[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>>>>>>>>>>>]
        >#B:%4
        [
            -
            %5 = add i32 %2_ i32 1
            >>>>[-]
            d20/29/28 <[->>>>>>>>>+<+<<<<<<<<]
            m29/20 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            op_to_reg storing const value in temp address
            >#constop_1
            +
            m28/21 <<[-<<<<<<<+>>>>>>>]
            >>[
                -
                <<<<<<<<<+
            >>>>>>>>>]
            %6 = icmp eq i32 %5_ i32 30
            <<<<<<<<[-]
            d21/26/27 <[->>>>>+>+<<<<<<]
            m26/21 >>>>>[-<<<<<+>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_30
            ++++++++++++++++++++++++++++++
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/31 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<[
                -
                >>+
                >>[
                    -
                    <<-
                    r1 >
                >>]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<]
            >>>>>>-
            <<<<<<<<<<<+
            >>>>>>>>>[
                [-]
                <<<<<<<<<[-]
            >>>>>>>>>]
            <<[
                [-]
                <<<<<<<[-]
            >>>>>>>]
            br i1 %6_ label %3_ label %1
            doing phi stuff
            %2 = phi i32 _ i32 0_ %call_term_for_8 __ _ i32 %5_ %4 _
            d21/26/27 <<<<<<<<[->>>>>+>+<<<<<<]
            m26/21 >>>>>[-<<<<<+>>>>>]
            <<<<<<[-]
            m27/20 >>>>>>>[-<<<<<<<+>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>>+
                #B:main/3_true
            >>>>>>]
            <<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>+
                #B:main/1_false
            <<<<<<<<<<<]
        >>>>>>>>>>>>>]
        >#B:%7
        [
            -
            %8 = phi i32 _ i32 0_ %1 __ _ i32 %9_ %call_term_for_13 _
            call @lt(i32 %2_ i32 %8)
            enable next block when we return
            >#caller/%call_term_for_13
            +
            stack_width 34
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>#arg_0
            d20/28/29 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>+>+<<<<<<<<<]
            m28/20 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            m29/40 >[->>>>>>>>>>>+<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>#arg_1
            d23/30/31 <<<<<<<<<<<<<<<<[->>>>>>>+>+<<<<<<<<]
            m30/23 >>>>>>>[-<<<<<<<+>>>>>>>]
            m31/39 >[->>>>>>>>+<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r34 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>>>>>>>>]
        >#B:%call_term_for_13
        [
            -
            %9 = add i32 %8_ i32 1
            >>>>>[-]
            d23/26/27 <[->>>+>+<<<<]
            m26/23 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m27/24 <[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            %10 = icmp eq i32 %9_ i32 30
            <<<[-]
            d24/26/27 <[->>+>+<<<]
            m26/24 >>[-<<+>>]
            op_to_reg storing const value in temp address
            >>#constop_30
            ++++++++++++++++++++++++++++++
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/30 <<<<[->>+<<]
            >>>>+
            <<<<<[
                -
                >>+
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
            <<<]
            >>>>>-
            <<<<<<<+
            >>>>>[
                [-]
                <<<<<[-]
            >>>>>]
            <[
                [-]
                <<<<[-]
            >>>>]
            br i1 %10_ label %4_ label %7
            doing phi stuff
            %8 = phi i32 _ i32 0_ %1 __ _ i32 %9_ %call_term_for_13 _
            d24/26/27 <<<<<[->>+>+<<<]
            m26/24 >>[-<<+>>]
            <<<[-]
            m27/23 >>>>[-<<<<+>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>>>+
                #B:main/4_true
            >>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>+
                #B:main/7_false
            <<<<<<<<<<<<<<]
        >>>>>>>>>>>>>>>]
    <<<<<<<<<<<<<<<<<]
<<]
