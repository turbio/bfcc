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
    >#lt
    [
        >>>#lt/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/lt
            >>>>-
            l17 <<<<<<<<<<<<<<<<<
        ]
        <#B:lt/%2
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/29 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            %3 = alloca i32_ align 4
            >>>>>>>>>>#alloca_%3
            %4 = alloca i32_ align 4
            >#alloca_%4
            store i32 %0_ i32* %3_ align 4
            store sitch: alloca Some(10)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m27/10 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            store i32 %1_ i32* %4_ align 4
            store sitch: alloca Some(11)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<[-]
            m28/11 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            %5 = load i32* %3_ align 4
            >#load_thru_%3_to_%5
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/12/29 <<[->>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m12/10 >>[-<<+>>]
            %6 = load i32* %4_ align 4
            >>>>>>>>>>>>>>>>>>#load_thru_%4_to_%6
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d11/13/30 <<[->>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m13/11 >>[-<<+>>]
            %7 = icmp slt i32 %5_ i32 %6
            op_to_reg giving known register address
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>#%7_icmp_%i32_%5_slt_i32_%6
            <<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m30/14 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<]
            br i1 %7_ label %8_ label %9
            <<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >+
                #B:lt/8_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>+
                #B:lt/9_false
            <<<]
        <]
        >>#B:lt/%8
        [
            -
            call @putchar(i8 108)
            enable next
            >#lt/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<]
        >#B:lt/%call_term_for_1
        [
            -
            br label %10
            >>>#B:lt/%10
            +
        <<<]
        >#B:lt/%9
        [
            -
            call @putchar(i8 114)
            enable next
            >#lt/%call_term_for_3
            +
            putchar intrinsic
            >>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<]
        >#B:lt/%call_term_for_3
        [
            -
            br label %10
            >#B:lt/%10
            +
        <]
        >#B:lt/%10
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>]
    <<<<<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
            %1 = alloca i32_ align 4
            >>>>>>>>>>>>>>>>>>>#alloca_%1
            %2 = alloca i32_ align 4
            >#alloca_%2
            call @lt(i32 1_ i32 2)
            enable next
            <<<<<<<<<<<<<<<<<<<#main/%call_term_for_0
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            +
            copy up arg 1
            <#arg_1
            ++
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>]
        >#B:main/%call_term_for_0
        [
            -
            call @lt(i32 2_ i32 1)
            enable next
            >#main/%call_term_for_1
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            ++
            copy up arg 1
            <#arg_1
            +
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>]
        >#B:main/%call_term_for_1
        [
            -
            call @lt(i32 3_ i32 4)
            enable next
            >#main/%call_term_for_2
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            +++
            copy up arg 1
            <#arg_1
            ++++
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>]
        >#B:main/%call_term_for_2
        [
            -
            call @lt(i32 3_ i32 3)
            enable next
            >#main/%call_term_for_3
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            +++
            copy up arg 1
            <#arg_1
            +++
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>]
        >#B:main/%call_term_for_3
        [
            -
            call @lt(i32 4_ i32 5)
            enable next
            >#main/%call_term_for_4
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            ++++
            copy up arg 1
            <#arg_1
            +++++
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>]
        >#B:main/%call_term_for_4
        [
            -
            call @lt(i32 5_ i32 6)
            enable next
            >#main/%call_term_for_5
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            +++++
            copy up arg 1
            <#arg_1
            ++++++
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>]
        >#B:main/%call_term_for_5
        [
            -
            call @lt(i32 6_ i32 7)
            enable next
            >#main/%call_term_for_6
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            ++++++
            copy up arg 1
            <#arg_1
            +++++++
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>]
        >#B:main/%call_term_for_6
        [
            -
            call @lt(i32 7_ i32 8)
            enable next
            >#main/%call_term_for_7
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            +++++++
            copy up arg 1
            <#arg_1
            ++++++++
            give callee a stack pointer
            >>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>>]
        >#B:main/%call_term_for_7
        [
            -
            call @putchar(i8 10)
            enable next
            >#main/%call_term_for_8
            +
            putchar intrinsic
            >>>>>>>>>>>>++++++++++
            .
            [-]
        <<<<<<<<<<<<<]
        >#B:main/%call_term_for_8
        [
            -
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(24)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>#constop_0
            
            and the destination
            op_to_reg giving known register address
            <<<[-]
            m27/24 >>>[-<<<+>>>]
            br label %3
            <<<<<<<<<<<<#B:main/%3
            +
        <]
        >#B:main/%3
        [
            -
            %4 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%4
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<#tmp0_for_load
            d24/26/41 <<[->>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m26/24 >>[-<<+>>]
            %5 = icmp slt i32 %4_ i32 30
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_30
            ++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>#%5_icmp_%i32_%4_slt_i32_30
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m26/28 <<<<[->>+<<]
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
            br i1 %5_ label %6_ label %20
            <<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>>+
                #B:main/6_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>+
                #B:main/20_false
            <<<<<<<<<<<<<<<<<<<]
        >>>>>>>>>>>]
        >#B:main/%6
        [
            -
            store i32 0_ i32* %2_ align 4
            store sitch: alloca Some(25)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >>>>>>>>>>#constop_0
            
            and the destination
            op_to_reg giving known register address
            <[-]
            m26/25 >[-<+>]
            br label %7
            <<<<<<<<<#B:main/%7
            +
        <]
        >#B:main/%7
        [
            -
            %8 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%8
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d25/26/43 <[->+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            m26/25 >[-<+>]
            %9 = icmp slt i32 %8_ i32 30
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_30
            ++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>#%9_icmp_%i32_%8_slt_i32_30
            <<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m26/27 <<<[->+<]
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
            br i1 %9_ label %10_ label %16
            <<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>>>>+
                #B:main/10_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>+
                #B:main/16_false
            <<<<<<<<<<<<<<<<<]
        >>>>>>>>>>>>>]
        >#B:main/%10
        [
            -
            %11 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%11
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d24/26/45 <<[->>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m26/24 >>[-<<+>>]
            %12 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%12
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d25/26/46 <[->+>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m26/25 >[-<+>]
            call @lt(i32 %11_ i32 %12)
            enable next
            <<<<<<<#main/%call_term_for_13
            +
            copy up arg 0
            >>>>>>>>>>>>>>>>>>#arg_0
            m45/37 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            copy up arg 1
            <<<<<<<<<#arg_1
            m46/36 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<#stack_ptr
            ++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/39/40 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m40/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r31 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>>>>>>>>]
        >#B:main/%call_term_for_13
        [
            -
            br label %13
            >#B:main/%13
            +
        <]
        >#B:main/%13
        [
            -
            %14 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%14
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d25/26/47 <[->+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m26/25 >[-<+>]
            %15 = add i32 %14_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>#%_Named(Number(15))_add_%_Named(Number(14))_c_Fixed(26)
            m47/48 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<]
            store i32 %15_ i32* %2_ align 4
            store sitch: alloca Some(25)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m48/25 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            br label %7
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%7
            +
        >>>]
        >#B:main/%16
        [
            -
            br label %17
            >#B:main/%17
            +
        <]
        >#B:main/%17
        [
            -
            %18 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%18
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d24/26/49 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/24 >>[-<<+>>]
            %19 = add i32 %18_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>#%_Named(Number(19))_add_%_Named(Number(18))_c_Fixed(26)
            m49/50 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<]
            store i32 %19_ i32* %1_ align 4
            store sitch: alloca Some(24)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <<[-]
            m50/24 >>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %3
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:main/%3
            +
        >>>>>>>]
        >#B:main/%20
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>>>>>>>>>>>>>>>>>>]
    <<<<<<<<<<<<<<<<<<<<<]
<<]
