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
            l10 <<<<<<<<<<
        ]
        <#B:main/%call_never_first_formain
        [
            -
            br label %0
            >>#B:main/%0
            +
        <<]
        >>#B:main/%0
        [
            -
            %1 = alloca i8_ align 1
            >>#alloca_%1
            %2 = alloca i8_ align 1
            >#alloca_%2
            store i8 122_ i8* %1_ align 1
            store sitch: alloca Some(6)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_122
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            and the destination
            op_to_reg giving known register address
            <<[-]
            m8/6 >>[-<<+>>]
            store i8 32_ i8* %2_ align 1
            store sitch: alloca Some(7)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_32
            ++++++++++++++++++++++++++++++++
            and the destination
            op_to_reg giving known register address
            <<[-]
            m9/7 >>[-<<+>>]
            %3 = load i8* %1_ align 1
            >>>>>>>>>>>#load_thru_%1_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<#tmp0_for_load
            d6/8/20 <<[->>+>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            m8/6 >>[-<<+>>]
            %4 = zext i8 %3 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>#%4_zext_i8_%3
            m20/21 <[->+<]
            %5 = load i8* %2_ align 1
            >>#load_thru_%2_to_%5
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d7/8/22 <[->+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            m8/7 >[-<+>]
            %6 = zext i8 %5 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>#%6_zext_i8_%5
            m22/23 <[->+<]
            %7 = sub i32 %4_ i32 %6
            op_to_reg giving known register address
            op_to_reg giving known register address
            >>#%%7_sub_%i32_%4_ci32_%6
            m21/24 <<<[->>>+<<<]
            >>[
                -
                >-
            <]
            %8 = trunc i32 %7 to i8
            op_to_reg giving known register address
            >>#%8_trunc_i32_%7
            m24/25 <[->+<]
            call @putchar(i8 %8)
            enable next
            <<<<<<<<<<<<<<<<<<<#main/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<]
        >#B:main/%call_term_for_0
        [
            -
            ret i32 0
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
