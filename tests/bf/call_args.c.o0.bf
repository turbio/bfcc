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
            l24 <<<<<<<<<<<<<<<<<<<<<<<<
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
        >#alloc_%4
        >#alloc_%5
        >#alloc_%6
        >#%7_=_load_i32*_%4__align_4(mult)
        >#%8_=_trunc_i32_%7_to_i8(mult)
        >#%9_=_load_i32*_%5__align_4(mult)
        >#%10_=_trunc_i32_%9_to_i8(mult)
        >#%11_=_load_i32*_%6__align_4(mult)
        >#%12_=_trunc_i32_%11_to_i8(mult)
        >#%0
        >#%1
        >#%2
        <<<<<<<<<<<<<<<<<#B:%no_block0_call_for_call_me
        [
            -
            copy up args
            >>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/20 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/22 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            >>>>>>>>>>>>>>>>>>>>#arg_%2
            l4 <<<<
            m0/24 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            r4 >>>>
            br label %3
            >>>>>+
        <<]
        >>#B:%3
        [
            -
            %4 = alloca i32_ align 4
            %5 = alloca i32_ align 4
            %6 = alloca i32_ align 4
            store i32 %0_ i32* %4_ align 4
            >>>>[-]
            m18/9 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            store i32 %1_ i32* %5_ align 4
            <<<<<<<<[-]
            m19/10 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            store i32 %2_ i32* %6_ align 4
            <<<<<<<<[-]
            m20/11 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            %7 = load i32* %4_ align 4
            <<<<<<<<[-]
            d9/12/21 <<<[->>>+>>>>>>>>>+<<<<<<<<<<<<]
            m21/9 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            %8 = trunc i32 %7 to i8
            <<<<<<<<[-]
            d12/22/21 <[->>>>>>>>>>+<+<<<<<<<<<]
            m22/12 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            m21/13 <[-<<<<<<<<+>>>>>>>>]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            d13/21/23 >>>>>>>[->>>>>>>>+>>+<<<<<<<<<<]
            m21/13 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            >>.
            [-]
        <<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            %9 = load i32* %5_ align 4
            >>>>>>>>[-]
            d10/14/21 <<<<[->>>>+>>>>>>>+<<<<<<<<<<<]
            m21/10 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            %10 = trunc i32 %9 to i8
            <<<<<<[-]
            d14/21/22 <[->>>>>>>+>+<<<<<<<<]
            m21/14 >>>>>>>[-<<<<<<<+>>>>>>>]
            m22/15 >[-<<<<<<<+>>>>>>>]
            call @putchar(i8 %10)
            enable next block when we return
            <<<<<<<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            d15/21/22 >>>>>>>>[->>>>>>+>+<<<<<<<]
            m21/15 >>>>>>[-<<<<<<+>>>>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            %11 = load i32* %6_ align 4
            >>>>>>>>>[-]
            d11/16/21 <<<<<[->>>>>+>>>>>+<<<<<<<<<<]
            m21/11 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            %12 = trunc i32 %11 to i8
            <<<<[-]
            d16/21/22 <[->>>>>+>+<<<<<<]
            m21/16 >>>>>[-<<<<<+>>>>>]
            m22/17 >[-<<<<<+>>>>>]
            call @putchar(i8 %12)
            enable next block when we return
            <<<<<<<<<<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            d17/21/22 >>>>>>>>>[->>>>+>+<<<<<]
            m21/17 >>>>[-<<<<+>>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<-
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
