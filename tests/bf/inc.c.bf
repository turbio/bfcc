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
            l9 <<<<<<<<<
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
            %1 = alloca i8_ align 1
            store i8 97_ i8* %1_ align 1
            store sitch: alloca Some(6)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            and the destination
            <[-]
            m7/6 >[-<+>]
            %2 = load i8* %1_ align 1
            >>>>>>>>>>>>#load_ret_%2
            #load_thru_%1_to_%2
            <<<<<<<<<<<#tmp0_for_load
            d6/8/19 <<[->>+>>>>>>>>>>>+<<<<<<<<<<<<<]
            m8/6 >>[-<<+>>]
            %3 = add i8 %2_ i8 1
            op_to_reg storing const value in temp address
            <#constop_1
            +
            >>>>>>>>>>>>#add_op0_i8_%2
            <<<<<<<<<<<<#add_op1_i8_1
            >>>>>>>>>>>>>#add_ret_%3
            m19/20 <[->+<]
            <<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>+
            <<<<<<<<<<<<<]
            store i8 %3_ i8* %1_ align 1
            store sitch: alloca Some(6)
            grab the value we're storing
            and the destination
            <[-]
            m20/6 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            %4 = load i8* %1_ align 1
            >#load_ret_%4
            #load_thru_%1_to_%4
            <<<<<<<<<<<<<<#tmp0_for_load
            d6/7/21 <[->+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            m7/6 >[-<+>]
            call @putchar(i8 %4)
            enable next block when we return
            <<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<]
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
