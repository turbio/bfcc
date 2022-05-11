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
            l17 <<<<<<<<<<<<<<<<<
        ]
        <#B:main/%0
        [
            -
            %1 = alloca i32_ align 4
            >>>>>>>#alloca_%1
            %2 = alloca i8_ align 1
            >#alloca_%2
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(9)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<[-]
            m11/9 >>[-<<+>>]
            store i8 98_ i8* %2_ align 1
            store sitch: alloca Some(10)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            and the destination
            op_to_reg giving known register address
            <<[-]
            m12/10 >>[-<<+>>]
            %3 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>#load_thru_%2_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/27 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            %4 = icmp ne i8 %3_ i8 0
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_0
            
            >>>>>>>>>>>>>>>>>#%4_icmp_%i8_%3_ne_i8_0
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m27/14 >>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
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
            br i1 %4_ label %5_ label %7
            <<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<-
                >+
                #B:main/5_true
            >>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>+
                #B:main/7_false
            <<<]
        <]
        >>#B:main/%5
        [
            -
            %6 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%6
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/29 <[->+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            call @putchar(i8 %6)
            enable next
            <<<<<<#main/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:main/%call_term_for_1
        [
            -
            br label %8
            >>>#B:main/%8
            +
        <<<]
        >#B:main/%7
        [
            -
            call @putchar(i8 110)
            enable next
            >#main/%call_term_for_3
            +
            putchar intrinsic
            >>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<]
        >#B:main/%call_term_for_3
        [
            -
            br label %8
            >#B:main/%8
            +
        <]
        >#B:main/%8
        [
            -
            %9 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%9
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d9/11/30 <<[->>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m11/9 >>[-<<+>>]
            ret i32 %9
            zero all function allocs
            <<[-]
            >[-]
            <<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>>>>]
    <<<<<<<]
<]
