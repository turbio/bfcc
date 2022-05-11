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
    >#lol
    [
        >>>#lol/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/lol
            >>>>-
            l16 <<<<<<<<<<<<<<<<
        ]
        <#B:lol/%call_never_first_forlol
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/28 <<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>#B:lol/%1
            +
        <<]
        >>#B:lol/%1
        [
            -
            %2 = alloca i32_ align 4
            >>>>>#alloca_%2
            store i32 %0_ i32* %2_ align 4
            store sitch: alloca Some(10)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            [-]
            m26/10 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            %3 = load i32* %2_ align 4
            >#load_thru_%2_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/27 <[->+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            %4 = add i32 %3_ i32 97
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            >#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>#%%4_add_%i32_%3_ci32_97
            m27/28 <[->+<]
            m12/28 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            %5 = trunc i32 %4 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>#%5_trunc_i32_%4
            m28/29 <[->+<]
            call @putchar(i8 %5)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<#lol/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:lol/%call_term_for_0
        [
            -
            %6 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%6
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/30 <[->+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            %7 = icmp slt i32 %6_ i32 6
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_6
            ++++++
            >>>>>>>>>>>>>>>>>>>>#%7_icmp_%i32_%6_slt_i32_6
            <<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m11/13 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<]
            br i1 %7_ label %8_ label %11
            <<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>+
                #B:lol/8_true
            >>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:lol/11_false
            <<<<<]
        >>]
        >#B:lol/%8
        [
            -
            %9 = load i32* %2_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%9
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/11/32 <[->+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m11/10 >[-<+>]
            %10 = add i32 %9_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>#%%10_add_%i32_%9_ci32_1
            m32/33 <[->+<]
            m11/33 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            call @lol(i32 %10)
            enable next
            <<<#lol/%call_term_for_2
            +
            copy up arg 0
            >>>>>>>>>>>>>#arg_0
            m33/21 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<<<#stack_ptr
            +++++++++++++++++++++++
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r16 >>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >#lol
            +
            >>>#lol/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_lol
            +
            >#lol
            +
            >>#lol/b0
            +
        >>>>]
        >#B:lol/%call_term_for_2
        [
            -
            br label %11
            >#B:lol/%11
            +
        <]
        >#B:lol/%11
        [
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l7 <<<<<<<
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
            l7 <<<<<<<
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
            call @lol(i32 0)
            enable next
            >#main/%call_term_for_0
            +
            copy up arg 0
            >>>>>>#arg_0
            
            give callee a stack pointer
            >#stack_ptr
            ++++++++++++++
            l1 <
            d0/14/15 <<<<<<<<<<<<<[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            r7 >>>>>>>
            <<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#main
            +
            >>#main/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_lol
            +
            >#lol
            +
            >>#lol/b0
            +
        >>]
        >#B:main/%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            <<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>]
    <<<<]
<<]
