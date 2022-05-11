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
            store i8 9_ i8* %2_ align 1
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_9
            +++++++++
            and the destination
            op_to_reg giving known register address
            <<[-]
            m16/14 >>[-<<+>>]
            br label %3
            <<<<<<<<<<<<#B:main/%3
            +
        <<]
        >>#B:main/%3
        [
            -
            %4 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%4
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/31 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %5 = icmp ne i8 %4_ i8 0
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_0
            
            >>>>>>>>>>>>>>>>>#%5_icmp_%i8_%4_ne_i8_0
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
        >#B:main/%6
        [
            -
            %7 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%7
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/33 <[->+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %8 = zext i8 %7 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>#%8_zext_i8_%7
            m33/34 <[->+<]
            %9 = add i32 48_ i32 %8
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<#constop_48
            ++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>#%_Named(Number(9))_add_%_Fixed(15)_c_Named(Number(8))
            m15/35 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            >>>>>>>>>>>>>>>>>>>[
                -
                >+
            <]
            %10 = trunc i32 %9 to i8
            op_to_reg giving known register address
            >>#%10_trunc_i32_%9
            m35/36 <[->+<]
            call @putchar(i8 %10)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#main/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:main/%call_term_for_2
        [
            -
            %11 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%11
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/37 <[->+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %12 = zext i8 %11 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>#%12_zext_i8_%11
            m37/38 <[->+<]
            %13 = icmp ne i32 %12_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>#%13_icmp_%i32_%12_ne_i32_1
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
        >#B:main/%14
        [
            -
            call @putchar(i8 44)
            enable next
            >#main/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<]
        >#B:main/%call_term_for_4
        [
            -
            call @putchar(i8 32)
            enable next
            >#main/%call_term_for_5
            +
            putchar intrinsic
            >>>>>>++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<]
        >#B:main/%call_term_for_5
        [
            -
            br label %15
            >#B:main/%15
            +
        <]
        >#B:main/%15
        [
            -
            br label %16
            >#B:main/%16
            +
        <]
        >#B:main/%16
        [
            -
            %17 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%17
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/15/40 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m15/14 >[-<+>]
            %18 = zext i8 %17 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>#%18_zext_i8_%17
            m40/41 <[->+<]
            %19 = sub i32 %18_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<<<<<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#%_Named(Number(19))_sub_%_Named(Number(18))_c_Fixed(15)
            m41/42 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>>>>>>-
            <<<<<<<<<<<<<<<<<<<<<<<<<<<]
            %20 = trunc i32 %19 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#%20_trunc_i32_%19
            m42/43 <[->+<]
            store i8 %20_ i8* %2_ align 1
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m43/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %3
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%3
            +
        >>>>>>>]
        >#B:main/%21
        [
            -
            %22 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%22
            op_to_reg giving known register address
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
