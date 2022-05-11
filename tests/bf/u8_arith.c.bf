r6 >>>>>>
++++++
r1 >
runtime init:
#===TOP_FRAME
+
>>>#main
+
>#main/b0
+
<<<<[
    >#add
    [
        >>>>#add/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/add
            >>>>>-
            l12 <<<<<<<<<<<<
        ]
        <#B:add/%call_never_first_foradd
        [
            -
            >>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/26 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            br label %2
            >>>>>>#B:add/%2
            +
        <<]
        >>#B:add/%2
        [
            -
            %3 = alloca i32_ align 4
            >>#alloca_%3
            %4 = alloca i32_ align 4
            >#alloca_%4
            store i32 %0_ i32* %3_ align 4
            store sitch: alloca Some(8)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m22/8 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            store i32 %1_ i32* %4_ align 4
            store sitch: alloca Some(9)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<[-]
            m23/9 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            %5 = load i32* %3_ align 4
            >#load_thru_%3_to_%5
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d8/10/24 <<[->>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            m10/8 >>[-<<+>>]
            %6 = add i32 65_ i32 %5
            op_to_reg storing const value in temp address
            >#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg giving known register address
            >>>>>>>>>>>>>>#%%6_add_%i32_65_ci32_%5
            m11/25 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            m24/25 >>>>>>>>>>>>>[->+<]
            %7 = load i32* %4_ align 4
            >>#load_thru_%4_to_%7
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d9/10/26 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m10/9 >[-<+>]
            %8 = add i32 %6_ i32 %7
            op_to_reg giving known register address
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>#%%8_add_%i32_%6_ci32_%7
            m25/27 <<[->>+<<]
            m26/27 >[->+<]
            %9 = trunc i32 %8 to i8
            op_to_reg giving known register address
            >>#%9_trunc_i32_%8
            m27/28 <[->+<]
            call @putchar(i8 %9)
            enable next
            <<<<<<<<<<<<<<<<<<<<#add/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<]
        >#B:add/%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>>>]
    <<<<<<]
    >#sub
    [
        >>>#sub/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/sub
            >>>>>-
            l12 <<<<<<<<<<<<
        ]
        <#B:sub/%call_never_first_forsub
        [
            -
            >>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/26 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            br label %2
            >>>>>>#B:sub/%2
            +
        <<]
        >>#B:sub/%2
        [
            -
            %3 = alloca i32_ align 4
            >>#alloca_%3
            %4 = alloca i32_ align 4
            >#alloca_%4
            store i32 %0_ i32* %3_ align 4
            store sitch: alloca Some(8)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m22/8 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            store i32 %1_ i32* %4_ align 4
            store sitch: alloca Some(9)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<[-]
            m23/9 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            %5 = load i32* %3_ align 4
            >#load_thru_%3_to_%5
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d8/10/24 <<[->>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            m10/8 >>[-<<+>>]
            %6 = add i32 65_ i32 %5
            op_to_reg storing const value in temp address
            >#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg giving known register address
            >>>>>>>>>>>>>>#%%6_add_%i32_65_ci32_%5
            m11/25 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            m24/25 >>>>>>>>>>>>>[->+<]
            %7 = load i32* %4_ align 4
            >>#load_thru_%4_to_%7
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d9/10/26 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m10/9 >[-<+>]
            %8 = sub i32 %6_ i32 %7
            op_to_reg giving known register address
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>#%%8_sub_%i32_%6_ci32_%7
            m25/27 <<[->>+<<]
            >[
                -
                >-
            <]
            %9 = trunc i32 %8 to i8
            op_to_reg giving known register address
            >>#%9_trunc_i32_%8
            m27/28 <[->+<]
            call @putchar(i8 %9)
            enable next
            <<<<<<<<<<<<<<<<<<<<#sub/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<]
        >#B:sub/%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>>>]
    <<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/main
            >>>>>-
            l33 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <#B:main/%0
        [
            -
            %1 = alloca i32_ align 4
            >>>>>>>>>>>>>>>>>>>>#alloca_%1
            %2 = alloca i32_ align 4
            >#alloca_%2
            %3 = alloca i32_ align 4
            >#alloca_%3
            %4 = alloca i32_ align 4
            >#alloca_%4
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(24)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<<<[-]
            m28/24 >>>>[-<<<<+>>>>]
            br label %5
            <<<<<<<<<<<<<<<<<<<<<<#B:main/%5
            +
        <<]
        >>#B:main/%5
        [
            -
            %6 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%6
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d24/29/43 <<<<<[->>>>>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m29/24 >>>>>[-<<<<<+>>>>>]
            %7 = icmp slt i32 %6_ i32 16
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <#constop_16
            ++++++++++++++++
            >>>>>>>>>>>>>>>>#%7_icmp_%i32_%6_slt_i32_16
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/30 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>]
            <<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<]
            br i1 %7_ label %8_ label %22
            <<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/8_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>+
                #B:main/22_false
            <<<<<<<<<]
        >]
        >#B:main/%8
        [
            -
            store i32 0_ i32* %2_ align 4
            store sitch: alloca Some(25)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>>#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<<[-]
            m28/25 >>>[-<<<+>>>]
            br label %9
            <<<<<<<<<<<<<<<<<<<<#B:main/%9
            +
        <]
        >#B:main/%9
        [
            -
            %10 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%10
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d25/28/45 <<<[->>>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m28/25 >>>[-<<<+>>>]
            %11 = icmp slt i32 %10_ i32 16
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_16
            ++++++++++++++++
            >>>>>>>>>>>>>>>>>>#%11_icmp_%i32_%10_slt_i32_16
            <<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/29 <<<[->+<]
            >>>+
            >>>>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<]
            br i1 %11_ label %12_ label %18
            <<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/12_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>+
                #B:main/18_false
            <<<<<<<]
        >>>]
        >#B:main/%12
        [
            -
            %13 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%13
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d24/28/47 <<<<[->>>>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m28/24 >>>>[-<<<<+>>>>]
            %14 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%14
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d25/28/48 <<<[->>>+>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m28/25 >>>[-<<<+>>>]
            call @add(i32 %13_ i32 %14)
            enable next
            <<<<<<<<<<<<<<<<<<#main/%call_term_for_4
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            m47/40 >>>>>>>[-<<<<<<<+>>>>>>>]
            copy up arg 1
            <<<<<<<<#arg_1
            m48/39 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#main
            +
            >>#main/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<#===FRAME_add
            +
            >#add
            +
            >>>#add/b0
            +
        >>>>>]
        >#B:main/%call_term_for_4
        [
            -
            br label %15
            >#B:main/%15
            +
        <]
        >#B:main/%15
        [
            -
            %16 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%16
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d25/28/49 <<<[->>>+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/25 >>>[-<<<+>>>]
            %17 = add i32 %16_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>#%%17_add_%i32_%16_ci32_1
            m49/50 <[->+<]
            m28/50 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            store i32 %17_ i32* %2_ align 4
            store sitch: alloca Some(25)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<[-]
            m50/25 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %9
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%9
            +
        >>>]
        >#B:main/%18
        [
            -
            br label %19
            >#B:main/%19
            +
        <]
        >#B:main/%19
        [
            -
            %20 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%20
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d24/28/51 <<<<[->>>>+>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/24 >>>>[-<<<<+>>>>]
            %21 = add i32 %20_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>#%%21_add_%i32_%20_ci32_1
            m51/52 <[->+<]
            m28/52 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            store i32 %21_ i32* %1_ align 4
            store sitch: alloca Some(24)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<[-]
            m52/24 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %5
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%5
            +
        >>>>>>>]
        >#B:main/%22
        [
            -
            store i32 0_ i32* %3_ align 4
            store sitch: alloca Some(26)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<[-]
            m28/26 >>[-<<+>>]
            br label %23
            <<<<<<<<<<<<<#B:main/%23
            +
        <]
        >#B:main/%23
        [
            -
            %24 = load i32* %3_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%3_to_%24
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d26/28/53 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/26 >>[-<<+>>]
            %25 = icmp slt i32 %24_ i32 16
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_16
            ++++++++++++++++
            >>>>>>>>>>>>>>>>>>>>>>>>>>#%25_icmp_%i32_%24_slt_i32_16
            <<<<<<<<<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/29 <<<[->+<]
            >>>+
            >>>>>>>>>>>>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<<]
            br i1 %25_ label %26_ label %40
            <<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>+
                #B:main/26_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>+
                #B:main/40_false
            <<<<<<<<<<<<<<<<<<]
        >>>>>>>>>>]
        >#B:main/%26
        [
            -
            store i32 0_ i32* %4_ align 4
            store sitch: alloca Some(27)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_0
            
            and the destination
            op_to_reg giving known register address
            <[-]
            m28/27 >[-<+>]
            br label %27
            <<<<<<<<<<<#B:main/%27
            +
        <]
        >#B:main/%27
        [
            -
            %28 = load i32* %4_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%4_to_%28
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d27/28/55 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/27 >[-<+>]
            %29 = icmp slt i32 %28_ i32 16
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_16
            ++++++++++++++++
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#%29_icmp_%i32_%28_slt_i32_16
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/29 <<<[->+<]
            >>>+
            >>>>>>>>>>>>>>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<<<<]
            br i1 %29_ label %30_ label %36
            <<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>>>+
                #B:main/30_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>+
                #B:main/36_false
            <<<<<<<<<<<<<<<<]
        >>>>>>>>>>>>]
        >#B:main/%30
        [
            -
            %31 = load i32* %3_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%3_to_%31
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d26/28/57 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/26 >>[-<<+>>]
            %32 = load i32* %4_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%4_to_%32
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d27/28/58 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/27 >[-<+>]
            call @sub(i32 %31_ i32 %32)
            enable next
            <<<<<<<<<#main/%call_term_for_13
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>#arg_0
            m57/40 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            copy up arg 1
            <<<<<<<<<<<<<<<<<<#arg_1
            m58/39 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<<<<<<<<<#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r33 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#main
            +
            >>#main/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<#===FRAME_sub
            +
            >>#sub
            +
            >>#sub/b0
            +
        >>>>>>>>>>>>>>]
        >#B:main/%call_term_for_13
        [
            -
            br label %33
            >#B:main/%33
            +
        <]
        >#B:main/%33
        [
            -
            %34 = load i32* %4_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%4_to_%34
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d27/28/59 <[->+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/27 >[-<+>]
            %35 = add i32 %34_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%%35_add_%i32_%34_ci32_1
            m59/60 <[->+<]
            m28/60 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            store i32 %35_ i32* %4_ align 4
            store sitch: alloca Some(27)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m60/27 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %27
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%27
            +
        >>>]
        >#B:main/%36
        [
            -
            br label %37
            >#B:main/%37
            +
        <]
        >#B:main/%37
        [
            -
            %38 = load i32* %3_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%3_to_%38
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d26/28/61 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/26 >>[-<<+>>]
            %39 = add i32 %38_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#%%39_add_%i32_%38_ci32_1
            m61/62 <[->+<]
            m28/62 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            store i32 %39_ i32* %3_ align 4
            store sitch: alloca Some(26)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<[-]
            m62/26 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %23
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%23
            +
        >>>>>>>]
        >#B:main/%40
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l7 <<<<<<<
        >>>>>>>>>>>>>>>>>>>>>>>]
    <<<<<<<<<<<<<<<<<<<<]
<<<]
