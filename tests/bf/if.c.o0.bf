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
            l22 <<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%5
        >#B:%call_term_for_1
        >#B:%7
        >#B:%call_term_for_3
        >#B:%8
        >#alloc_%1
        >#alloc_%2
        >#%3_=_load_i8*_%2__align_1(mult)
        >#%4_=_icmp_ne_i8_%3__i8_0(mult)
        >#%6_=_load_i8*_%2__align_1(mult)
        >#%9_=_load_i32*_%1__align_4(mult)
        <<<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i32_ align 4
            %2 = alloca i8_ align 1
            store i32 0_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>#constop_0
            
            <<<<<<[-]
            m15/9 >>>>>>[-<<<<<<+>>>>>>]
            store i8 98_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            >#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<[-]
            m16/10 >>>>>>[-<<<<<<+>>>>>>]
            %3 = load i8* %2_ align 1
            <<<<<[-]
            d10/11/15 <[->+>>>>+<<<<<]
            m15/10 >>>>>[-<<<<<+>>>>>]
            %4 = icmp ne i8 %3_ i8 0
            <<<[-]
            d11/15/17 <[->>>>+>>+<<<<<<]
            m15/11 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >#constop_0
            
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m17/19 <<<<[->>+<<]
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
            <<[
                [-]
                <<<<<<<+
            >>>>>>>]
            <[
                [-]
                <<<<<<+
            >>>>>>]
            br i1 %4_ label %5_ label %7
            <<<<<<<<<<<<<<<+
            >>>>>>>>>[
                -
                <<<<<<<<<-
                >+
                #B:main/5_true
            >>>>>>>>]
            <<<<<<<<<[
                -
                >>>+
                #B:main/7_false
            <<<]
        <]
        >>#B:%5
        [
            -
            %6 = load i8* %2_ align 1
            >>>>>>>>>[-]
            d10/13/15 <<<[->>>+>>+<<<<<]
            m15/10 >>>>>[-<<<<<+>>>>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            d13/15/16 >>>>>>>>[->>+>+<<<]
            m15/13 >>[-<<+>>]
            >.
            [-]
        <<<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            br label %8
            >>>+
        <<<]
        >#B:%7
        [
            -
            call @putchar(i8 110)
            enable next block when we return
            >#caller/%call_term_for_3
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>#constop_110
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<]
        >#B:%call_term_for_3
        [
            -
            br label %8
            >+
        <]
        >#B:%8
        [
            -
            %9 = load i32* %1_ align 4
            >>>>>>[-]
            d9/14/15 <<<<<[->>>>>+>+<<<<<<]
            m15/9 >>>>>>[-<<<<<<+>>>>>>]
            ret i32 %9
            zero all function allocs
            <<<<<<[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>>>>]
    <<<<<<<]
<]
