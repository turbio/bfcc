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
            l16 <<<<<<<<<<<<<<<<
        ]
        <#B:main/%0
        [
            -
            %1 = alloca i8_ align 1
            >>>>>>>#alloca_%1
            %2 = alloca i8_ align 1
            >#alloca_%2
            store i8 0_ i8* %1_ align 1
            store sitch: alloca Some(9)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<[-]
            m11/9 >>[-<<+>>]
            br label %3
            <<<<<<<#B:main/%3
            +
        <<]
        >>#B:main/%3
        [
            -
            %4 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%4
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d9/12/26 <<<[->>>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m12/9 >>>[-<<<+>>>]
            %5 = zext i8 %4 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>#%5_zext_i8_%4
            m26/27 <[->+<]
            %6 = icmp slt i32 %5_ i32 58
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<#constop_58
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>#%6_icmp_%i32_%5_slt_i32_58
            <<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m11/13 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>]
            <<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<]
            br i1 %6_ label %7_ label %16
            <<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/7_true
            >>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:main/16_false
            <<<<<]
        >]
        >#B:main/%7
        [
            -
            %8 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%8
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d9/11/29 <<[->>+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m11/9 >>[-<<+>>]
            %9 = zext i8 %8 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>#%9_zext_i8_%8
            m29/30 <[->+<]
            %10 = add i32 %9_ i32 65
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>>>#%_Named(Number(10))_add_%_Named(Number(9))_c_Fixed(11)
            m30/31 <[->+<]
            <<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<]
            %11 = trunc i32 %10 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>#%11_trunc_i32_%10
            m31/32 <[->+<]
            store i8 %11_ i8* %2_ align 1
            store sitch: alloca Some(10)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<[-]
            m32/10 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            %12 = load i8* %2_ align 1
            >#load_thru_%2_to_%12
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/33 <[->+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            call @putchar(i8 %12)
            enable next
            <<<<<#main/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:main/%call_term_for_2
        [
            -
            br label %13
            >#B:main/%13
            +
        <]
        >#B:main/%13
        [
            -
            %14 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%14
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d9/11/34 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m11/9 >>[-<<+>>]
            %15 = add i8 %14_ i8 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>#%_Named(Number(15))_add_%_Named(Number(14))_c_Fixed(11)
            m34/35 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<]
            store i8 %15_ i8* %1_ align 1
            store sitch: alloca Some(9)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<[-]
            m35/9 >>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %3
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%3
            +
        >>>]
        >#B:main/%16
        [
            -
            ret void
            zero all function allocs
            >[-]
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
