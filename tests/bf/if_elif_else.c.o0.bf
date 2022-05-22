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
            l28 <<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%6
        >#B:%call_term_for_1
        >#B:%7
        >#B:%11
        >#B:%call_term_for_4
        >#B:%12
        >#B:%call_term_for_6
        >#B:%13
        >#B:%14
        >#alloc_%1
        >#alloc_%2
        >#%3_=_load_i8*_%2__align_1
        >#%4_=_zext_i8_%3_to_i32
        >#%5_=_icmp_eq_i32_%4__i32_97
        >#%8_=_load_i8*_%2__align_1
        >#%9_=_zext_i8_%8_to_i32
        >#%10_=_icmp_eq_i32_%9__i32_98
        >#%15_=_load_i32*_%1__align_4
        <<<<<<<<<<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i32_ align 4
            %2 = alloca i8_ align 1
            store i32 0_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>#constop_0
            
            <<<<<<<<<[-]
            m22/13 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            store i8 98_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            >#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<<<<[-]
            m23/14 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            %3 = load i8* %2_ align 1
            d14/15/22 <<<<<<<<<[->+>>>>>>>+<<<<<<<<]
            m22/14 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %4 = zext i8 %3 to i32
            m15/16 <<<<<<<[->+<]
            %5 = icmp eq i32 %4_ i32 97
            op_to_reg storing const value in temp address
            >>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m22/25 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>>+
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
            <<<<<<<<<]
            >>>>>>>>>>>-
            <<<<<<<<<<+
            >>>>>>>>[
                [-]
                <<<<<<<<[-]
            >>>>>>>>]
            <[
                [-]
                <<<<<<<[-]
            >>>>>>>]
            br i1 %5_ label %6_ label %7
            <<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<-
                >+
                #B:main/6_true
            >>>>>>>>>>>>>]
            <<<<<<<<<<<<<<[
                -
                >>>+
                #B:main/7_false
            <<<]
        <]
        >>#B:%6
        [
            -
            call @putchar(i8 120)
            enable next block when we return
            >#caller/%call_term_for_1
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>#constop_120
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            br label %14
            >>>>>>>+
        <<<<<<<]
        >#B:%7
        [
            -
            %8 = load i8* %2_ align 1
            d14/18/22 >>>>>>>>[->>>>+>>>>+<<<<<<<<]
            m22/14 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %9 = zext i8 %8 to i32
            m18/19 <<<<[->+<]
            %10 = icmp eq i32 %9_ i32 98
            op_to_reg storing const value in temp address
            >>>>#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m22/24 <<<<[->>+<<]
            >>>>+
            <<<<<<<[
                -
                >>>>+
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
            <<<<<]
            >>>>>>>-
            <<<<<<+
            >>>>[
                [-]
                <<<<[-]
            >>>>]
            <[
                [-]
                <<<[-]
            >>>]
            br i1 %10_ label %11_ label %12
            <<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/11_true
            >>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<[
                -
                >>>>>>+
                #B:main/12_false
            <<<<<<]
        >>>]
        >#B:%11
        [
            -
            call @putchar(i8 121)
            enable next block when we return
            >#caller/%call_term_for_4
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>#constop_121
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<]
        >#B:%call_term_for_4
        [
            -
            br label %13
            >>>+
        <<<]
        >#B:%12
        [
            -
            call @putchar(i8 122)
            enable next block when we return
            >#caller/%call_term_for_6
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_122
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<]
        >#B:%call_term_for_6
        [
            -
            br label %13
            >+
        <]
        >#B:%13
        [
            -
            br label %14
            >+
        <]
        >#B:%14
        [
            -
            %15 = load i32* %1_ align 4
            d13/21/22 >[->>>>>>>>+>+<<<<<<<<<]
            m22/13 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            ret i32 %15
            zero all function allocs
            <<<<<<<<<[-]
            >[-]
            <<<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>>>>>>>>]
    <<<<<<<<<<<]
<]
