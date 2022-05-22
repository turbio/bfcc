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
            l12 <<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_=_load_i8*_%1__align_1
        >#%3_=_add_i8_%2__i8_1
        >#%4_=_load_i8*_%1__align_1
        <<<<<<<#B:%no_block0_call_for_main
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
            store i8 97_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<[-]
            m10/6 >>>>[-<<<<+>>>>]
            %2 = load i8* %1_ align 1
            d6/7/11 <<<<[->+>>>>+<<<<<]
            m11/6 >>>>>[-<<<<<+>>>>>]
            %3 = add i8 %2_ i8 1
            op_to_reg storing const value in temp address
            <#constop_1
            +
            m7/8 <<<[->+<]
            >>>[
                -
                <<+
            >>]
            store i8 %3_ i8* %1_ align 1
            <<<<[-]
            m8/6 >>[-<<+>>]
            %4 = load i8* %1_ align 1
            d6/9/10 <<[->>>+>+<<<<]
            m10/6 >>>>[-<<<<+>>>>]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>.
            [-]
        <<<<<]
        >#B:%call_term_for_0
        [
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
