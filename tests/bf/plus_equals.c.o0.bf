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
            l14 <<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_=_load_i8*_%1__align_1
        >#%3_=_zext_i8_%2_to_i32
        >#%4_=_add_i32_%3__i32_32
        >#%5_=_trunc_i32_%4_to_i8
        >#%6_=_load_i8*_%1__align_1
        <<<<<<<<<#B:%no_block0_call_for_main
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
            store i8 81_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>>>#constop_81
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<[-]
            m12/6 >>>>>>[-<<<<<<+>>>>>>]
            %2 = load i8* %1_ align 1
            d6/7/13 <<<<<<[->+>>>>>>+<<<<<<<]
            m13/6 >>>>>>>[-<<<<<<<+>>>>>>>]
            %3 = zext i8 %2 to i32
            m7/8 <<<<<<[->+<]
            %4 = add i32 %3_ i32 32
            op_to_reg storing const value in temp address
            >>>>>#constop_32
            ++++++++++++++++++++++++++++++++
            m8/9 <<<<[->+<]
            >>>>[
                -
                <<<+
            >>>]
            %5 = trunc i32 %4 to i8
            m9/10 <<<[->+<]
            store i8 %5_ i8* %1_ align 1
            <<<[-]
            m10/6 >>>>[-<<<<+>>>>]
            %6 = load i8* %1_ align 1
            d6/11/12 <<<<[->>>>>+>+<<<<<<]
            m12/6 >>>>>>[-<<<<<<+>>>>>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>.
            [-]
        <<<<<<<]
        >#B:%call_term_for_0
        [
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
