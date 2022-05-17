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
            l21 <<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%3
        >#B:%6
        >#B:%call_term_for_2
        >#B:%14
        >#B:%call_term_for_4
        >#B:%call_term_for_5
        >#B:%15
        >#B:%16
        >#B:%21
        >#alloc_%1
        >#alloc_%2
        <<<<<<<<<<<<[
            -
            copy up args
            %1 = alloca i32_ align 4
            %2 = alloca i8_ align 1
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(13)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>#constop_0
            
            and the destination
            <<[-]
            m15/13 >>[-<<+>>]
            store i8 9_ i8* %2_ align 1
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_9
            +++++++++
            and the destination
            <<[-]
            m16/14 >>[-<<+>>]
            br label %3
            <<<<<<<<<<<<+
        <<]
        >>[
            -
            %4 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%4
            #load_thru_%2_to_%4
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/31 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %5 = icmp ne i8 %4_ i8 0
            op_to_reg storing const value in temp address
            #constop_0
            
            >>>>>>>>>>>>>>>>#icmp_op0_i8_%4
            <<<<<<<<<<<<<<<<#icmp_op1_i8_0
            >>>>>>>>>>>>>>>>>#icmp_ret_%5
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m31/18 >>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            <<<<<<<<<<<+
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
                >>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<]
            <[
                [-]
                >>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<]
            br i1 %5_ label %6_ label %21
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/6_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>+
                #B:main/21_false
            <<<<<<<<<]
        >]
        >[
            -
            %7 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%7
            #load_thru_%2_to_%7
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/33 <[->+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %8 = zext i8 %7 to i32
            >>>>>>>>>>>>>>>>>>#zext_op_i8_%7
            >#zext_ret_%8
            m33/34 <[->+<]
            %9 = add i32 48_ i32 %8
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<#constop_48
            ++++++++++++++++++++++++++++++++++++++++++++++++
            #add_op0_i32_48
            >>>>>>>>>>>>>>>>>>>#add_op1_i32_%8
            >#add_ret_%9
            m15/35 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            >>>>>>>>>>>>>>>>>>>[
                -
                >+
            <]
            %10 = trunc i32 %9 to i8
            >#trunc_op_i32_%9
            >#trunc_ret_%10
            m35/36 <[->+<]
            call @putchar(i8 %10)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            %11 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%11
            #load_thru_%2_to_%11
            <<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/37 <[->+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %12 = zext i8 %11 to i32
            >>>>>>>>>>>>>>>>>>>>>>#zext_op_i8_%11
            >#zext_ret_%12
            m37/38 <[->+<]
            %13 = icmp ne i32 %12_ i32 1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>#icmp_op0_i32_%12
            <<<<<<<<<<<<<<<<<<<<<<<#icmp_op1_i32_1
            >>>>>>>>>>>>>>>>>>>>>>>>#icmp_ret_%13
            <<<<<<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m38/17 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<+
            <<<<[
                -
                >+
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
            <<]
            >>>>-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<]
            <[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<]
            br i1 %13_ label %14_ label %15
            <<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/14_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>+
                #B:main/15_false
            <<<<<<<]
        >>>]
        >[
            -
            call @putchar(i8 44)
            enable next block when we return
            >#caller/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<]
        >[
            -
            call @putchar(i8 32)
            enable next block when we return
            >#caller/%call_term_for_5
            +
            putchar intrinsic
            >>>>>>++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<]
        >[
            -
            br label %15
            >+
        <]
        >[
            -
            br label %16
            >+
        <]
        >[
            -
            %17 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%17
            #load_thru_%2_to_%17
            <<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/40 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %18 = zext i8 %17 to i32
            >>>>>>>>>>>>>>>>>>>>>>>>>#zext_op_i8_%17
            >#zext_ret_%18
            m40/41 <[->+<]
            %19 = sub i32 %18_ i32 1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<<<<<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>>#sub_op0_i32_%18
            <<<<<<<<<<<<<<<<<<<<<<<<<<#sub_op1_i32_1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#sub_ret_%19
            m41/42 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>>>>>>-
            <<<<<<<<<<<<<<<<<<<<<<<<<<<]
            %20 = trunc i32 %19 to i8
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#trunc_op_i32_%19
            >#trunc_ret_%20
            m42/43 <[->+<]
            store i8 %20_ i8* %2_ align 1
            store sitch: alloca Some(14)
            grab the value we're storing
            and the destination
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m43/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %3
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
        >>>>>>>]
        >[
            -
            %22 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%22
            #load_thru_%1_to_%22
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/15/44 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m15/13 >>[-<<+>>]
            ret i32 %22
            zero all function allocs
            <<[-]
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
