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
            l18 <<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#alloc_%2
        >#%3_=_load_i8*_%1__align_1(mult)
        >#%4_=_zext_i8_%3_to_i32(mult)
        >#%5_=_load_i8*_%2__align_1(mult)
        >#%6_=_zext_i8_%5_to_i32(mult)
        >#%7_=_add_i32_%4__i32_%6(mult)
        >#%8_=_trunc_i32_%7_to_i8(mult)
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
            <<<<<<<<[-]
            m14/6 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            store i8 32_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            >#constop_32
            ++++++++++++++++++++++++++++++++
            <<<<<<<<[-]
            m15/7 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %3 = load i8* %1_ align 1
            <<<<<<<[-]
            d6/8/14 <<[->>+>>>>>>+<<<<<<<<]
            m14/6 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %4 = zext i8 %3 to i32
            <<<<<[-]
            d8/14/16 <[->>>>>>+>>+<<<<<<<<]
            m14/8 >>>>>>[-<<<<<<+>>>>>>]
            m16/9 >>[-<<<<<<<+>>>>>>>]
            %5 = load i8* %2_ align 1
            <<<<<<[-]
            d7/10/14 <<<[->>>+>>>>+<<<<<<<]
            m14/7 >>>>>>>[-<<<<<<<+>>>>>>>]
            %6 = zext i8 %5 to i32
            <<<[-]
            d10/14/15 <[->>>>+>+<<<<<]
            m14/10 >>>>[-<<<<+>>>>]
            m15/11 >[-<<<<+>>>>]
            %7 = add i32 %4_ i32 %6
            <<<[-]
            d9/14/15 <<<[->>>>>+>+<<<<<<]
            m14/9 >>>>>[-<<<<<+>>>>>]
            d11/17/16 <<<[->>>>>>+<+<<<<<]
            m17/11 >>>>>>[-<<<<<<+>>>>>>]
            m15/12 <<[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            %8 = trunc i32 %7 to i8
            <<<[-]
            d12/14/15 <[->>+>+<<<]
            m14/12 >>[-<<+>>]
            m15/13 >[-<<+>>]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            d13/14/15 >>>>>>>>[->+>+<<]
            m14/13 >[-<+>]
            >.
            [-]
        <<<<<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret i32 0
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
