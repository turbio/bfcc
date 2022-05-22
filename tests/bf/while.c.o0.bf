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
        >#B:%2
        >#B:%5
        >#B:%call_term_for_2
        >#B:%10
        >#alloc_%1
        >#%3_=_load_i8*_%1__align_1(mult)
        >#%4_=_icmp_ne_i8_%3__i8_0(mult)
        >#%6_=_load_i8*_%1__align_1(mult)
        >#%7_=_zext_i8_%6_to_i32(mult)
        >#%8_=_sub_i32_%7__i32_1(mult)
        >#%9_=_trunc_i32_%8_to_i8(mult)
        <<<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i8_ align 1
            store i8 10_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>#constop_10
            ++++++++++
            <<<<<<<[-]
            m15/8 >>>>>>>[-<<<<<<<+>>>>>>>]
            br label %2
            <<<<<<<<<<<+
        <<]
        >>#B:%2
        [
            -
            %3 = load i8* %1_ align 1
            >>>>>[-]
            d8/9/16 <[->+>>>>>>>+<<<<<<<<]
            m16/8 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %4 = icmp ne i8 %3_ i8 0
            <<<<<<[-]
            d9/15/17 <[->>>>>>+>>+<<<<<<<<]
            m15/9 >>>>>>[-<<<<<<+>>>>>>]
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
                <<<<<<<<<+
            >>>>>>>>>]
            <[
                [-]
                <<<<<<<<+
            >>>>>>>>]
            br i1 %4_ label %5_ label %10
            <<<<<<<<<<<<<<<+
            >>>>>>>[
                -
                <<<<<<<-
                >>+
                #B:main/5_true
            >>>>>]
            <<<<<<<[
                -
                >>>>+
                #B:main/10_false
            <<<<]
        >]
        >#B:%5
        [
            -
            call @putchar(i8 97)
            enable next block when we return
            >#caller/%call_term_for_2
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            %6 = load i8* %1_ align 1
            >>>>>[-]
            d8/11/15 <<<[->>>+>>>>+<<<<<<<]
            m15/8 >>>>>>>[-<<<<<<<+>>>>>>>]
            %7 = zext i8 %6 to i32
            <<<[-]
            d11/15/16 <[->>>>+>+<<<<<]
            m15/11 >>>>[-<<<<+>>>>]
            m16/12 >[-<<<<+>>>>]
            %8 = sub i32 %7_ i32 1
            <<<[-]
            d12/15/16 <[->>>+>+<<<<]
            m15/12 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m16/13 <[-<<<+>>>]
            >[
                -
                <<<<-
            >>>>]
            %9 = trunc i32 %8 to i8
            <<<[-]
            d13/15/16 <[->>+>+<<<]
            m15/13 >>[-<<+>>]
            m16/14 >[-<<+>>]
            store i8 %9_ i8* %1_ align 1
            d14/15/16 <<[->+>+<<]
            m15/14 >[-<+>]
            <<<<<<<[-]
            m16/8 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            br label %2
            <<<<<<<<<<<<+
        >>]
        >#B:%10
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
            <<<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>>>]
    <<<<<<]
<]
