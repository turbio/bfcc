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
    >#call_me
    [
        >>>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/call_me
            >>>>-
            l18 <<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_call_me
        >#F:call_me
        >#F:main
        >#B:%no_block0_call_for_call_me
        >#B:%ret_lading_pad
        >#B:%3
        >#B:%call_term_for_0
        >#B:%call_term_for_1
        >#B:%call_term_for_2
        >#%4_=_trunc_i32_%0_to_i8(mult)
        >#%5_=_trunc_i32_%1_to_i8(mult)
        >#%6_=_trunc_i32_%2_to_i8(mult)
        >#%0
        >#%1
        >#%2
        <<<<<<<<<<<#B:%no_block0_call_for_call_me
        [
            -
            copy up args
            >>>>>>>>>#arg_%0
            l2 <<
            m0/14 <<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/16 <<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            r3 >>>
            >>>>>>>>>>>>>>#arg_%2
            l4 <<<<
            m0/18 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            r4 >>>>
            br label %3
            >>>>>+
        <<]
        >>#B:%3
        [
            -
            %4 = trunc i32 %0 to i8
            >>>>[-]
            m12/9 >>>[-<<<+>>>]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            d9/15/16 >>>[->>>>>>+>+<<<<<<<]
            m15/9 >>>>>>[-<<<<<<+>>>>>>]
            >.
            [-]
        <<<<<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            %5 = trunc i32 %1 to i8
            >>>>[-]
            m13/10 >>>[-<<<+>>>]
            call @putchar(i8 %5)
            enable next block when we return
            <<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            d10/15/17 >>>[->>>>>+>>+<<<<<<<]
            m15/10 >>>>>[-<<<<<+>>>>>]
            >>.
            [-]
        <<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            %6 = trunc i32 %2 to i8
            >>>>[-]
            m14/11 >>>[-<<<+>>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            d11/15/16 >>>[->>>>+>+<<<<<]
            m15/11 >>>>[-<<<<+>>>>]
            >.
            [-]
        <<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>>>>]
    <<<<<<<]
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l10 <<<<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:call_me
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        <<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            call @call_me(i32 49_ i32 50_ i32 51)
            enable next block when we return
            >#caller/%call_term_for_0
            +
            stack_width 10
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<#constop_49
            +++++++++++++++++++++++++++++++++++++++++++++++++
            m7/17 [->>>>>>>>>>+<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<#constop_50
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            m8/16 [->>>>>>>>+<<<<<<<<]
            copy up arg 2
            >>>>>>>#arg_2
            op_to_reg storing const value in temp address
            <<<<<<#constop_51
            +++++++++++++++++++++++++++++++++++++++++++++++++++
            m9/15 [->>>>>>+<<<<<<]
            give callee a stack pointer
            >>>>>>>>>#stack_ptr
            +++++++++++++++++
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r10 >>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<#===FRAME_call_me
            +
            >#call_me
            +
            >>#call_me/b0
            +
        >>]
        >#B:%call_term_for_0
        [
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
