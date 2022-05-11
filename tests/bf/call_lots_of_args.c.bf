r7 >>>>>>>
+++++++
r1 >
runtime init:
#===TOP_FRAME
+
>>>>#main
+
>#main/b0
+
<<<<<[
    >#three_args
    [
        >>>>>#three_args/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/three_args
            >>>>>>-
            l16 <<<<<<<<<<<<<<<<
        ]
        <#B:three_args/%call_never_first_forthree_args
        [
            -
            >>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/28 <<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/30 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%2
            l4 <<<<
            m0/32 <<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r4 >>>>
            br label %3
            >>>>>>>#B:three_args/%3
            +
        <<]
        >>#B:three_args/%3
        [
            -
            %4 = alloca i32_ align 4
            >>>>#alloca_%4
            %5 = alloca i32_ align 4
            >#alloca_%5
            %6 = alloca i32_ align 4
            >#alloca_%6
            store i32 %0_ i32* %4_ align 4
            store sitch: alloca Some(11)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<[-]
            m26/11 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            store i32 %1_ i32* %5_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<[-]
            m27/12 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            store i32 %2_ i32* %6_ align 4
            store sitch: alloca Some(13)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<[-]
            m28/13 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            %7 = load i32* %4_ align 4
            >#load_thru_%4_to_%7
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<#tmp0_for_load
            d11/14/29 <<<[->>>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            m14/11 >>>[-<<<+>>>]
            %8 = trunc i32 %7 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>#%8_trunc_i32_%7
            m29/30 <[->+<]
            call @putchar(i8 %8)
            enable next
            <<<<<<<<<<<<<<<<<<<<<#three_args/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<]
        >#B:three_args/%call_term_for_0
        [
            -
            %9 = load i32* %5_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>#load_thru_%5_to_%9
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d12/15/31 <<<[->>>+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m15/12 >>>[-<<<+>>>]
            %10 = trunc i32 %9 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>#%10_trunc_i32_%9
            m31/32 <[->+<]
            call @putchar(i8 %10)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<#three_args/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:three_args/%call_term_for_1
        [
            -
            %11 = load i32* %6_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%6_to_%11
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/14/33 <[->+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m14/13 >[-<+>]
            %12 = trunc i32 %11 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>#%12_trunc_i32_%11
            m33/34 <[->+<]
            call @putchar(i8 %12)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<#three_args/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:three_args/%call_term_for_2
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l11 <<<<<<<<<<<
        >>>>>>>>>>]
    <<<<<<<<<]
    >#five_args
    [
        >>>>#five_args/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/five_args
            >>>>>>-
            l20 <<<<<<<<<<<<<<<<<<<<
        ]
        <#B:five_args/%call_never_first_forfive_args
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/32 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/34 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%2
            l4 <<<<
            m0/36 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r4 >>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%3
            l5 <<<<<
            m0/38 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r5 >>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%4
            l6 <<<<<<
            m0/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r6 >>>>>>
            br label %5
            >>>>>>>#B:five_args/%5
            +
        <<]
        >>#B:five_args/%5
        [
            -
            %6 = alloca i32_ align 4
            >>>>>>#alloca_%6
            %7 = alloca i32_ align 4
            >#alloca_%7
            %8 = alloca i32_ align 4
            >#alloca_%8
            %9 = alloca i32_ align 4
            >#alloca_%9
            %10 = alloca i32_ align 4
            >#alloca_%10
            store i32 %0_ i32* %6_ align 4
            store sitch: alloca Some(13)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<[-]
            m30/13 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            store i32 %1_ i32* %7_ align 4
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<[-]
            m31/14 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            store i32 %2_ i32* %8_ align 4
            store sitch: alloca Some(15)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<[-]
            m32/15 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            store i32 %3_ i32* %9_ align 4
            store sitch: alloca Some(16)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<[-]
            m33/16 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            store i32 %4_ i32* %10_ align 4
            store sitch: alloca Some(17)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<[-]
            m34/17 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            %11 = load i32* %6_ align 4
            >#load_thru_%6_to_%11
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/18/35 <<<<<[->>>>>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m18/13 >>>>>[-<<<<<+>>>>>]
            %12 = trunc i32 %11 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>#%12_trunc_i32_%11
            m35/36 <[->+<]
            call @putchar(i8 %12)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#five_args/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:five_args/%call_term_for_0
        [
            -
            %13 = load i32* %7_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%7_to_%13
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/19/37 <<<<<[->>>>>+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m19/14 >>>>>[-<<<<<+>>>>>]
            %14 = trunc i32 %13 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>#%14_trunc_i32_%13
            m37/38 <[->+<]
            call @putchar(i8 %14)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<#five_args/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:five_args/%call_term_for_1
        [
            -
            %15 = load i32* %8_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%8_to_%15
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d15/18/39 <<<[->>>+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m18/15 >>>[-<<<+>>>]
            %16 = trunc i32 %15 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>#%16_trunc_i32_%15
            m39/40 <[->+<]
            call @putchar(i8 %16)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#five_args/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:five_args/%call_term_for_2
        [
            -
            %17 = load i32* %9_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%9_to_%17
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d16/18/41 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m18/16 >>[-<<+>>]
            %18 = trunc i32 %17 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>#%18_trunc_i32_%17
            m41/42 <[->+<]
            call @putchar(i8 %18)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#five_args/%call_term_for_3
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:five_args/%call_term_for_3
        [
            -
            %19 = load i32* %10_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%10_to_%19
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d17/18/43 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m18/17 >[-<+>]
            %20 = trunc i32 %19 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>#%20_trunc_i32_%19
            m43/44 <[->+<]
            call @putchar(i8 %20)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#five_args/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:five_args/%call_term_for_4
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l13 <<<<<<<<<<<<<
        >>>>>>>>>>>>]
    <<<<<<<<<<]
    >#twelve_args
    [
        >>>#twelve_args/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/twelve_args
            >>>>>>-
            l28 <<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <#B:twelve_args/%call_never_first_fortwelve_args
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%2
            l4 <<<<
            m0/44 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r4 >>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%3
            l5 <<<<<
            m0/46 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r5 >>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%4
            l6 <<<<<<
            m0/48 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r6 >>>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%5
            l7 <<<<<<<
            m0/50 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r7 >>>>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%6
            l8 <<<<<<<<
            m0/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r8 >>>>>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%7
            l9 <<<<<<<<<
            m0/54 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r9 >>>>>>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%8
            l10 <<<<<<<<<<
            m0/56 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r10 >>>>>>>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%9
            l11 <<<<<<<<<<<
            m0/58 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r11 >>>>>>>>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%10
            l12 <<<<<<<<<<<<
            m0/60 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r12 >>>>>>>>>>>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%11
            l13 <<<<<<<<<<<<<
            m0/62 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r13 >>>>>>>>>>>>>
            br label %12
            >>>>>>>#B:twelve_args/%12
            +
        <<]
        >>#B:twelve_args/%12
        [
            -
            %13 = alloca i32_ align 4
            >>>>>>>#alloca_%13
            %14 = alloca i32_ align 4
            >#alloca_%14
            %15 = alloca i32_ align 4
            >#alloca_%15
            %16 = alloca i32_ align 4
            >#alloca_%16
            %17 = alloca i32_ align 4
            >#alloca_%17
            %18 = alloca i32_ align 4
            >#alloca_%18
            %19 = alloca i32_ align 4
            >#alloca_%19
            %20 = alloca i32_ align 4
            >#alloca_%20
            %21 = alloca i32_ align 4
            >#alloca_%21
            %22 = alloca i32_ align 4
            >#alloca_%22
            %23 = alloca i32_ align 4
            >#alloca_%23
            %24 = alloca i32_ align 4
            >#alloca_%24
            store i32 %0_ i32* %13_ align 4
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<[-]
            m38/14 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %1_ i32* %14_ align 4
            store sitch: alloca Some(15)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m39/15 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %2_ i32* %15_ align 4
            store sitch: alloca Some(16)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m40/16 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %3_ i32* %16_ align 4
            store sitch: alloca Some(17)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m41/17 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %4_ i32* %17_ align 4
            store sitch: alloca Some(18)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m42/18 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %5_ i32* %18_ align 4
            store sitch: alloca Some(19)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m43/19 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %6_ i32* %19_ align 4
            store sitch: alloca Some(20)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m44/20 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %7_ i32* %20_ align 4
            store sitch: alloca Some(21)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m45/21 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %8_ i32* %21_ align 4
            store sitch: alloca Some(22)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m46/22 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %9_ i32* %22_ align 4
            store sitch: alloca Some(23)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m47/23 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %10_ i32* %23_ align 4
            store sitch: alloca Some(24)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m48/24 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %11_ i32* %24_ align 4
            store sitch: alloca Some(25)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m49/25 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %25 = load i32* %13_ align 4
            >#load_thru_%13_to_%25
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/26/50 <<<<<<<<<<<<[->>>>>>>>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/14 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            %26 = load i32* %14_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%14_to_%26
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d15/27/51 <<<<<<<<<<<<[->>>>>>>>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m27/15 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            %27 = load i32* %15_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%15_to_%27
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d16/26/52 <<<<<<<<<<[->>>>>>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/16 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            call @three_args(i32 %25_ i32 %26_ i32 %27)
            enable next
            <<<<<<<<<<<<<<<<<<#twelve_args/%call_term_for_0
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m50/37 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            copy up arg 1
            <<<<<<<<<<<<<<#arg_1
            m51/36 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            copy up arg 2
            <<<<<<<<<<<<<<<<#arg_2
            m52/35 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r28 >>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#twelve_args
            +
            >>>#twelve_args/jump_pad_blk
            +
            r11 >>>>>>>>>>>
            <<<<<<#===FRAME_three_args
            +
            >#three_args
            +
            >>>>#three_args/b0
            +
        >>]
        >#B:twelve_args/%call_term_for_0
        [
            -
            %28 = load i32* %16_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%16_to_%28
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d17/26/53 <<<<<<<<<[->>>>>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/17 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            %29 = load i32* %17_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%17_to_%29
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d18/26/54 <<<<<<<<[->>>>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/18 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %30 = load i32* %18_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%18_to_%30
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d19/26/55 <<<<<<<[->>>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/19 >>>>>>>[-<<<<<<<+>>>>>>>]
            %31 = load i32* %19_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%19_to_%31
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d20/26/56 <<<<<<[->>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/20 >>>>>>[-<<<<<<+>>>>>>]
            %32 = load i32* %20_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%20_to_%32
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d21/26/57 <<<<<[->>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/21 >>>>>[-<<<<<+>>>>>]
            call @five_args(i32 %28_ i32 %29_ i32 %30_ i32 %31_ i32 %32)
            enable next
            <<<<<<<<<<<<<<<<<#twelve_args/%call_term_for_1
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m53/39 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            copy up arg 1
            <<<<<<<<<<<<<<<#arg_1
            m54/38 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            copy up arg 2
            <<<<<<<<<<<<<<<<<#arg_2
            m55/37 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            copy up arg 3
            <<<<<<<<<<<<<<<<<<<#arg_3
            m56/36 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            copy up arg 4
            <<<<<<<<<<<<<<<<<<<<<#arg_4
            m57/35 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<<<<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++
            l1 <
            d0/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m42/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r28 >>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#twelve_args
            +
            >>>#twelve_args/jump_pad_blk
            +
            r13 >>>>>>>>>>>>>
            <<<<<<#===FRAME_five_args
            +
            >>#five_args
            +
            >>>#five_args/b0
            +
        >>>]
        >#B:twelve_args/%call_term_for_1
        [
            -
            %33 = load i32* %21_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%21_to_%33
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d22/26/58 <<<<[->>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/22 >>>>[-<<<<+>>>>]
            %34 = trunc i32 %33 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%34_trunc_i32_%33
            m58/59 <[->+<]
            call @putchar(i8 %34)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#twelve_args/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:twelve_args/%call_term_for_2
        [
            -
            %35 = load i32* %22_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%22_to_%35
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d23/26/60 <<<[->>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/23 >>>[-<<<+>>>]
            %36 = trunc i32 %35 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%36_trunc_i32_%35
            m60/61 <[->+<]
            call @putchar(i8 %36)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#twelve_args/%call_term_for_3
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:twelve_args/%call_term_for_3
        [
            -
            %37 = load i32* %23_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%23_to_%37
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d24/26/62 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/24 >>[-<<+>>]
            %38 = trunc i32 %37 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%38_trunc_i32_%37
            m62/63 <[->+<]
            call @putchar(i8 %38)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#twelve_args/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:twelve_args/%call_term_for_4
        [
            -
            %39 = load i32* %24_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%24_to_%39
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d25/26/64 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/25 >[-<+>]
            %40 = trunc i32 %39 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%40_trunc_i32_%39
            m64/65 <[->+<]
            call @putchar(i8 %40)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#twelve_args/%call_term_for_5
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:twelve_args/%call_term_for_5
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
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l20 <<<<<<<<<<<<<<<<<<<<
        >>>>>>>>>>>>>]
    <<<<<<<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>>>-
            <<<<#dead_fn_pad/main
            >>>>>>-
            l15 <<<<<<<<<<<<<<<
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
            call @three_args(i32 79_ i32 119_ i32 79)
            enable next
            >#main/%call_term_for_0
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>#arg_0
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 1
            <#arg_1
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 2
            <#arg_2
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            give callee a stack pointer
            >>>#stack_ptr
            ++++++++++++++++++++++++
            l1 <
            d0/26/27 <<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m27/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r15 >>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#main
            +
            >>#main/jump_pad_blk
            +
            r11 >>>>>>>>>>>
            <<<<<<#===FRAME_three_args
            +
            >#three_args
            +
            >>>>#three_args/b0
            +
        >>]
        >#B:main/%call_term_for_0
        [
            -
            call @putchar(i8 10)
            enable next
            >#main/%call_term_for_1
            +
            putchar intrinsic
            >>>>++++++++++
            .
            [-]
        <<<<<]
        >#B:main/%call_term_for_1
        [
            -
            call @five_args(i32 122_ i32 97_ i32 100_ i32 100_ i32 121)
            enable next
            >#main/%call_term_for_2
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>#arg_0
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 1
            <#arg_1
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 2
            <#arg_2
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 3
            <#arg_3
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 4
            <#arg_4
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            give callee a stack pointer
            >>>>>#stack_ptr
            ++++++++++++++++++++++++
            l1 <
            d0/28/29 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m29/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r15 >>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#main
            +
            >>#main/jump_pad_blk
            +
            r13 >>>>>>>>>>>>>
            <<<<<<#===FRAME_five_args
            +
            >>#five_args
            +
            >>>#five_args/b0
            +
        >>>>]
        >#B:main/%call_term_for_2
        [
            -
            call @putchar(i8 10)
            enable next
            >#main/%call_term_for_3
            +
            putchar intrinsic
            >>>++++++++++
            .
            [-]
        <<<<]
        >#B:main/%call_term_for_3
        [
            -
            call @twelve_args(i32 108_ i32 109_ i32 97_ i32 111_ i32 109_ i32 121_ i32 100_ i32 117_ i32 100_ i32 101_ i32 33_ i32 63)
            enable next
            >#main/%call_term_for_4
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>#arg_0
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 1
            <#arg_1
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 2
            <#arg_2
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 3
            <#arg_3
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 4
            <#arg_4
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 5
            <#arg_5
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 6
            <#arg_6
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 7
            <#arg_7
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 8
            <#arg_8
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 9
            <#arg_9
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            copy up arg 10
            <#arg_10
            +++++++++++++++++++++++++++++++++
            copy up arg 11
            <#arg_11
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            give callee a stack pointer
            >>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++
            l1 <
            d0/35/36 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m36/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r15 >>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#main
            +
            >>#main/jump_pad_blk
            +
            r20 >>>>>>>>>>>>>>>>>>>>
            <<<<<<#===FRAME_twelve_args
            +
            >>>#twelve_args
            +
            >>#twelve_args/b0
            +
        >>>>>>]
        >#B:main/%call_term_for_4
        [
            -
            ret void
            zero all function allocs
            <<<<<<<<<<<<-
            #dead_frame
            >>>>-
            l1 <
            <<<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>>>]
    <<<<<<<<]
<<<<]
