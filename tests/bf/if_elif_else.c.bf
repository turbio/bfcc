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
        <#B:main/%0
        [
            -
            %1 = alloca i32_ align 4
            >>>>>>>>>>>#alloca_%1
            %2 = alloca i8_ align 1
            >#alloca_%2
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(13)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<[-]
            m15/13 >>[-<<+>>]
            store i8 98_ i8* %2_ align 1
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            and the destination
            op_to_reg giving known register address
            <<[-]
            m16/14 >>[-<<+>>]
            %3 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>#load_thru_%2_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/31 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %4 = zext i8 %3 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>#%4_zext_i8_%3
            m31/32 <[->+<]
            %5 = icmp eq i32 %4_ i32 97
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>#%5_icmp_%i32_%4_eq_i32_97
            <<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/18 <<<<<[->>>+<<<]
            >>>>>+
            >>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<+
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
            >>>>>>>>>>>>>>]
            <<<<<<<<<<<<-
            >>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<[
                [-]
                >>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<]
            <[
                [-]
                >>>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<<]
            br i1 %5_ label %6_ label %7
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >+
                #B:main/6_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>+
                #B:main/7_false
            <<<]
        <]
        >>#B:main/%6
        [
            -
            call @putchar(i8 120)
            enable next
            >#main/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<]
        >#B:main/%call_term_for_1
        [
            -
            br label %14
            >>>>>>>#B:main/%14
            +
        <<<<<<<]
        >#B:main/%7
        [
            -
            %8 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%8
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/34 <[->+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %9 = zext i8 %8 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>#%9_zext_i8_%8
            m34/35 <[->+<]
            %10 = icmp eq i32 %9_ i32 98
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>>>>#%10_icmp_%i32_%9_eq_i32_98
            <<<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<+
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
            >>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<-
            >>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<[
                [-]
                >>>>>>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<<<<<]
            <[
                [-]
                >>>>>>>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<<<<<<]
            br i1 %10_ label %11_ label %12
            <<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/11_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>+
                #B:main/12_false
            <<<<<<]
        >>>]
        >#B:main/%11
        [
            -
            call @putchar(i8 121)
            enable next
            >#main/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<]
        >#B:main/%call_term_for_4
        [
            -
            br label %13
            >>>#B:main/%13
            +
        <<<]
        >#B:main/%12
        [
            -
            call @putchar(i8 122)
            enable next
            >#main/%call_term_for_6
            +
            putchar intrinsic
            >>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<]
        >#B:main/%call_term_for_6
        [
            -
            br label %13
            >#B:main/%13
            +
        <]
        >#B:main/%13
        [
            -
            br label %14
            >#B:main/%14
            +
        <]
        >#B:main/%14
        [
            -
            %15 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%15
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/15/37 <<[->>+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m15/13 >>[-<<+>>]
            ret i32 %15
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
