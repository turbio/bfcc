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
            l9 <<<<<<<<<
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
            store i8 97_ i8* %1_ align 1
            store sitch: alloca Some(6)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            and the destination
            op_to_reg giving known register address
            <[-]
            m7/6 >[-<+>]
            %2 = load i8* %1_ align 1
            >>>>>>>>>>>>#load_thru_%1_to_%2
            op_to_reg giving known register address
            <<<<<<<<<<<#tmp0_for_load
            d6/8/19 <<[->>+>>>>>>>>>>>+<<<<<<<<<<<<<]
            m8/6 >>[-<<+>>]
            %3 = add i8 %2_ i8 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <#constop_1
            +
            >>>>>>>>>>>>>#%_Named(Number(3))_add_%_Named(Number(2))_c_Fixed(7)
            m19/20 <[->+<]
            <<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>+
            <<<<<<<<<<<<<]
            store i8 %3_ i8* %1_ align 1
            store sitch: alloca Some(6)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m20/6 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            %4 = load i8* %1_ align 1
            >#load_thru_%1_to_%4
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d6/7/21 <[->+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            m7/6 >[-<+>]
            call @putchar(i8 %4)
            enable next
            <<#main/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<]
        >#B:main/%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
