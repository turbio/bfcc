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
            l15 <<<<<<<<<<<<<<<
        ]
        <#B:main/%0
        [
            -
            %1 = alloca i8_ align 1
            >>>>>>#alloca_%1
            store i8 10_ i8* %1_ align 1
            store sitch: alloca Some(8)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_10
            ++++++++++
            and the destination
            op_to_reg giving known register address
            <[-]
            m9/8 >[-<+>]
            br label %2
            <<<<<#B:main/%2
            +
        <<]
        >>#B:main/%2
        [
            -
            %3 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<#tmp0_for_load
            d8/10/25 <<[->>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m10/8 >>[-<<+>>]
            %4 = icmp ne i8 %3_ i8 0
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <#constop_0
            
            >>>>>>>>>>>>>>>>>#%4_icmp_%i8_%3_ne_i8_0
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m25/12 >>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
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
            br i1 %4_ label %5_ label %10
            <<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/5_true
            >>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>+
                #B:main/10_false
            <<<<]
        >]
        >#B:main/%5
        [
            -
            call @putchar(i8 97)
            enable next
            >#main/%call_term_for_2
            +
            putchar intrinsic
            >>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<]
        >#B:main/%call_term_for_2
        [
            -
            %6 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%6
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d8/9/27 <[->+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m9/8 >[-<+>]
            %7 = zext i8 %6 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>#%7_zext_i8_%6
            m27/28 <[->+<]
            %8 = sub i32 %7_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>#%%8_sub_%i32_%7_ci32_1
            m28/29 <[->+<]
            <<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>-
            <<<<<<<<<<<<<<<<<<<<]
            %9 = trunc i32 %8 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>#%9_trunc_i32_%8
            m29/30 <[->+<]
            store i8 %9_ i8* %1_ align 1
            store sitch: alloca Some(8)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<[-]
            m30/8 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            br label %2
            <<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%2
            +
        >>]
        >#B:main/%10
        [
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>>>]
    <<<<<<]
<]
