r5 >>>>>
+++++
r1 >
runtime init:
#===TOP_FRAME
+
>>#main
+
>#main/b0
+
<<<[
    >#printi
    [
        >>>#printi/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/printi
            >>>>-
            l22 <<<<<<<<<<<<<<<<<<<<<<
        ]
        <#B:printi/%1
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/34 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            %2 = alloca i32_ align 4
            >>>>>>>>>>>>#alloca_%2
            %3 = alloca i32_ align 4
            >#alloca_%3
            store i32 %0_ i32* %2_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m32/12 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            br label %4
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#B:printi/%4
            +
        <<]
        >>#B:printi/%4
        [
            -
            store i32 0_ i32* %3_ align 4
            store sitch: alloca Some(13)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>>>>>>>#constop_0
            
            and the destination
            op_to_reg giving known register address
            <[-]
            m14/13 >[-<+>]
            br label %5
            <<<<<<<<#B:printi/%5
            +
        <]
        >#B:printi/%5
        [
            -
            %6 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%6
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d12/15/33 <<<[->>>+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m15/12 >>>[-<<<+>>>]
            %7 = icmp sgt i32 %6_ i32 10
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <#constop_10
            ++++++++++
            >>>>>>>>>>>>>>>>>>>>#%7_icmp_%i32_%6_sgt_i32_10
            <<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m33/16 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<+
            <<<<[
                -
                
                >>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<]
            >>>>-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<]
            br i1 %7_ label %8_ label %13
            <<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>+
                #B:printi/8_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>+
                #B:printi/13_false
            <<<<]
        >>]
        >#B:printi/%8
        [
            -
            %9 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%9
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d12/14/35 <<[->>+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m14/12 >>[-<<+>>]
            %10 = sub i32 %9_ i32 10
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_10
            ++++++++++
            >>>>>>>>>>>>>>>>>>>>>>#%%10_sub_%i32_%9_ci32_10
            m35/36 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>-
            <<<<<<<<<<<<<<<<<<<<<<]
            store i32 %10_ i32* %2_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<[-]
            m36/12 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %11 = load i32* %3_ align 4
            >#load_thru_%3_to_%11
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/14/37 <[->+>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m14/13 >[-<+>]
            %12 = add i32 %11_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>#%%12_add_%i32_%11_ci32_1
            m37/38 <[->+<]
            m14/38 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            store i32 %12_ i32* %3_ align 4
            store sitch: alloca Some(13)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m38/13 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %5
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:printi/%5
            +
        >]
        >#B:printi/%13
        [
            -
            %14 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%14
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d12/14/39 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m14/12 >>[-<<+>>]
            %15 = add i32 48_ i32 %14
            op_to_reg storing const value in temp address
            #constop_48
            ++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>#%%15_add_%i32_48_ci32_%14
            m14/40 <<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m39/40 >>>>>>>>>>>>>>>>>>>>>>>>>[->+<]
            %16 = trunc i32 %15 to i8
            op_to_reg giving known register address
            >>#%16_trunc_i32_%15
            m40/41 <[->+<]
            call @putchar(i8 %16)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#printi/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:printi/%call_term_for_4
        [
            -
            %17 = load i32* %3_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%3_to_%17
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/14/42 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m14/13 >[-<+>]
            store i32 %17_ i32* %2_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<[-]
            m42/12 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %18
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:printi/%18
            +
        <]
        >#B:printi/%18
        [
            -
            %19 = load i32* %3_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%3_to_%19
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/14/43 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m14/13 >[-<+>]
            %20 = icmp ne i32 %19_ i32 0
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_0
            
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%20_icmp_%i32_%19_ne_i32_0
            <<<<<<<<<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m43/19 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<+
            <<<<<<<[
                -
                >+
                >>>>[
                    -
                    <<<<-
                    r1 >
                >>>>]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<]
            >>>>>>>-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<<]
            <<<<[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            br i1 %20_ label %4_ label %21
            <<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >+
                #B:printi/4_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>+
                #B:printi/21_false
            <<<<<<<]
        >>>>>>]
        >#B:printi/%21
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l7 <<<<<<<
        >>>>>>>>>>>]
    <<<<<<<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l24 <<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <#B:main/%0
        [
            -
            %1 = alloca i32_ align 4
            >>>>>>>>>>#alloca_%1
            %2 = alloca i8_ align 1
            >#alloca_%2
            %3 = alloca i8_ align 1
            >#alloca_%3
            %4 = alloca i32_ align 4
            >#alloca_%4
            %5 = alloca i8_ align 1
            >#alloca_%5
            %6 = alloca i8_ align 1
            >#alloca_%6
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(13)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<<<<<[-]
            m19/13 >>>>>>[-<<<<<<+>>>>>>]
            store i8 1_ i8* %2_ align 1
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_1
            +
            and the destination
            op_to_reg giving known register address
            <<<<<<[-]
            m20/14 >>>>>>[-<<<<<<+>>>>>>]
            store i8 0_ i8* %3_ align 1
            store sitch: alloca Some(15)
            grab the value we're storing
            op_to_reg storing const value in temp address
            <#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<<<[-]
            m19/15 >>>>[-<<<<+>>>>]
            store i32 10_ i32* %4_ align 4
            store sitch: alloca Some(16)
            grab the value we're storing
            op_to_reg storing const value in temp address
            #constop_10
            ++++++++++
            and the destination
            op_to_reg giving known register address
            <<<[-]
            m19/16 >>>[-<<<+>>>]
            store i8 0_ i8* %5_ align 1
            store sitch: alloca Some(17)
            grab the value we're storing
            op_to_reg storing const value in temp address
            #constop_0
            
            and the destination
            op_to_reg giving known register address
            <<[-]
            m19/17 >>[-<<+>>]
            br label %7
            <<<<<<<<<<<<<<#B:main/%7
            +
        <<]
        >>#B:main/%7
        [
            -
            %8 = load i8* %5_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%5_to_%8
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<#tmp0_for_load
            d17/19/34 <<[->>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m19/17 >>[-<<+>>]
            %9 = zext i8 %8 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>#%9_zext_i8_%8
            m34/35 <[->+<]
            %10 = load i32* %4_ align 4
            >>#load_thru_%4_to_%10
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d16/19/36 <<<[->>>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m19/16 >>>[-<<<+>>>]
            %11 = icmp slt i32 %9_ i32 %10
            op_to_reg giving known register address
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>#%11_icmp_%i32_%9_slt_i32_%10
            <<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m36/21 >>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<+
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
                >>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<]
            br i1 %11_ label %12_ label %33
            <<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/12_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>+
                #B:main/33_false
            <<<<<<<<]
        >]
        >#B:main/%12
        [
            -
            %13 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%13
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/19/38 <<<<<[->>>>>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/14 >>>>>[-<<<<<+>>>>>]
            %14 = zext i8 %13 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>#%14_zext_i8_%13
            m38/39 <[->+<]
            call @printi(i32 %14)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#main/%call_term_for_2
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>#arg_0
            m39/29 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++
            l1 <
            d0/31/32 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m32/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r24 >>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_printi
            +
            >#printi
            +
            >>#printi/b0
            +
        >>>]
        >#B:main/%call_term_for_2
        [
            -
            %15 = load i8* %5_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%5_to_%15
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d17/19/40 <<[->>+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m19/17 >>[-<<+>>]
            %16 = zext i8 %15 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>#%16_zext_i8_%15
            m40/41 <[->+<]
            %17 = load i32* %4_ align 4
            >>#load_thru_%4_to_%17
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d16/19/42 <<<[->>>+>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/16 >>>[-<<<+>>>]
            %18 = sub i32 %17_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>#%%18_sub_%i32_%17_ci32_1
            m42/43 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>>>-
            <<<<<<<<<<<<<<<<<<<<<<<<]
            %19 = icmp slt i32 %16_ i32 %18
            op_to_reg giving known register address
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>#%19_icmp_%i32_%16_slt_i32_%18
            <<<<<<<<<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m43/19 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<<]
            br i1 %19_ label %20_ label %21
            <<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/20_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>+
                #B:main/21_false
            <<<<<<]
        >>>]
        >#B:main/%20
        [
            -
            call @putchar(i8 32)
            enable next
            >#main/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>>>>++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<]
        >#B:main/%call_term_for_4
        [
            -
            br label %21
            >#B:main/%21
            +
        <]
        >#B:main/%21
        [
            -
            %22 = load i8* %3_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%3_to_%22
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d15/19/45 <<<<[->>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/15 >>>>[-<<<<+>>>>]
            store i8 %22_ i8* %6_ align 1
            store sitch: alloca Some(18)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m45/18 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            %23 = load i8* %2_ align 1
            >#load_thru_%2_to_%23
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/19/46 <<<<<[->>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/14 >>>>>[-<<<<<+>>>>>]
            store i8 %23_ i8* %3_ align 1
            store sitch: alloca Some(15)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<[-]
            m46/15 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            %24 = load i8* %6_ align 1
            >#load_thru_%6_to_%24
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d18/19/47 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/18 >[-<+>]
            %25 = zext i8 %24 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%25_zext_i8_%24
            m47/48 <[->+<]
            %26 = load i8* %2_ align 1
            >>#load_thru_%2_to_%26
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/19/49 <<<<<[->>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/14 >>>>>[-<<<<<+>>>>>]
            %27 = zext i8 %26 to i32
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%27_zext_i8_%26
            m49/50 <[->+<]
            %28 = add i32 %27_ i32 %25
            op_to_reg giving known register address
            op_to_reg giving known register address
            >>#%%28_add_%i32_%27_ci32_%25
            m50/51 <[->+<]
            m48/51 <<[->>>+<<<]
            %29 = trunc i32 %28 to i8
            op_to_reg giving known register address
            >>>>#%29_trunc_i32_%28
            m51/52 <[->+<]
            store i8 %29_ i8* %2_ align 1
            store sitch: alloca Some(14)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m52/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %30
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%30
            +
        <]
        >#B:main/%30
        [
            -
            %31 = load i8* %5_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%5_to_%31
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d17/19/53 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/17 >>[-<<+>>]
            %32 = add i8 %31_ i8 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%%32_add_%i8_%31_ci8_1
            m53/54 <[->+<]
            m19/54 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            store i8 %32_ i8* %5_ align 1
            store sitch: alloca Some(17)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<[-]
            m54/17 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %7
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%7
            +
        >>>>>>]
        >#B:main/%33
        [
            -
            %34 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%34
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/19/55 <<<<<<[->>>>>>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m19/13 >>>>>>[-<<<<<<+>>>>>>]
            ret i32 %34
            zero all function allocs
            <<<<<<[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>>>>>>>]
    <<<<<<<<<<]
<<]
