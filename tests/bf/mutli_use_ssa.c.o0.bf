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
            l15 <<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_=_load_i32*_%1__align_4(mult)
        >#%3_=_add_i32_%2__i32_1(mult)
        >#%4_=_add_i32_65__i32_%3(mult)
        >#%5_=_trunc_i32_%4_to_i8(mult)
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
            <<<<<[-]
            m11/6 >>>>>[-<<<<<+>>>>>]
            %2 = load i32* %1_ align 4
            <<<<[-]
            d6/7/12 <[->+>>>>>+<<<<<<]
            m12/6 >>>>>>[-<<<<<<+>>>>>>]
            %3 = add i32 %2_ i32 1
            <<<<[-]
            d7/11/13 <[->>>>+>>+<<<<<<]
            m11/7 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >#constop_1
            +
            m13/8 >[-<<<<<+>>>>>]
            <[
                -
                <<<<+
            >>>>]
            store i32 %3_ i32* %1_ align 4
            d8/11/12 <<<<[->>>+>+<<<<]
            m11/8 >>>[-<<<+>>>]
            <<<<<[-]
            m12/6 >>>>>>[-<<<<<<+>>>>>>]
            %4 = add i32 65_ i32 %3
            <<<[-]
            op_to_reg storing const value in temp address
            >>#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            d8/12/14 <<<[->>>>+>>+<<<<<<]
            m12/8 >>>>[-<<<<+>>>>]
            m11/9 <[-<<+>>]
            >>>[
                -
                <<<<<+
            >>>>>]
            %5 = trunc i32 %4 to i8
            <<<<[-]
            d9/11/12 <[->>+>+<<<]
            m11/9 >>[-<<+>>]
            m12/10 >[-<<+>>]
            call @putchar(i8 %5)
            enable next block when we return
            <<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            d10/11/12 >>>>>[->+>+<<]
            m11/10 >[-<+>]
            >.
            [-]
        <<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
