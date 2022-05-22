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
        >>>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/lol
            >>>>-
            l24 <<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_lol
        >#F:lol
        >#F:main
        >#B:%no_block0_call_for_lol
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%call_term_for_0
        >#B:%8
        >#B:%call_term_for_2
        >#B:%11
        >#alloc_%2
        >#%3_=_load_i32*_%2__align_4
        >#%4_=_add_i32_%3__i32_97
        >#%5_=_trunc_i32_%4_to_i8
        >#%6_=_load_i32*_%2__align_4
        >#%7_=_icmp_slt_i32_%6__i32_5
        >#%9_=_load_i32*_%2__align_4
        >#%10_=_add_i32_%9__i32_1
        >#%0
        <<<<<<<<<<<<<<<#B:%no_block0_call_for_lol
        [
            -
            copy up args
            >>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/20 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>+
        <<]
        >>#B:%1
        [
            -
            %2 = alloca i32_ align 4
            store i32 %0_ i32* %2_ align 4
            >>>>>[-]
            m18/10 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %3 = load i32* %2_ align 4
            d10/11/19 <<<<<<<<[->+>>>>>>>>+<<<<<<<<<]
            m19/10 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            %4 = add i32 %3_ i32 97
            op_to_reg storing const value in temp address
            >#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            m11/12 <<<<<<<<<[->+<]
            >>>>>>>>>[
                -
                <<<<<<<<+
            >>>>>>>>]
            %5 = trunc i32 %4 to i8
            m12/13 <<<<<<<<[->+<]
            call @putchar(i8 %5)
            enable next block when we return
            <<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>.
            [-]
        <<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            %6 = load i32* %2_ align 4
            d10/14/19 >>>>[->>>>+>>>>>+<<<<<<<<<]
            m19/10 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            %7 = icmp slt i32 %6_ i32 5
            op_to_reg storing const value in temp address
            #constop_5
            +++++
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m19/21 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<[
                -
                
                >>>>>>>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<]
            >>>>>>>>>-
            <<[
                [-]
                <<<<<<+
            >>>>>>]
            br i1 %7_ label %8_ label %11
            <<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>[
                -
                <<<<<<<<<<<-
                >>>+
                #B:lol/8_true
            >>>>>>>>]
            <<<<<<<<<<<[
                -
                >>>>>+
                #B:lol/11_false
            <<<<<]
        >>]
        >#B:%8
        [
            -
            %9 = load i32* %2_ align 4
            d10/16/19 >>>[->>>>>>+>>>+<<<<<<<<<]
            m19/10 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            %10 = add i32 %9_ i32 1
            op_to_reg storing const value in temp address
            #constop_1
            +
            m16/17 <<<[->+<]
            >>>[
                -
                <<+
            >>]
            call @lol(i32 %10)
            enable next block when we return
            <<<<<<<<<<<#caller/%call_term_for_2
            +
            stack_width 24
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>#arg_0
            m17/29 <<<<<<<<<<<<[->>>>>>>>>>>>+<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++
            l1 <
            d0/31/32 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m32/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r24 >>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >#caller
            +
            >>>#caller/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_lol
            +
            >#lol
            +
            >>#lol/b0
            +
        >>>>]
        >#B:%call_term_for_2
        [
            -
            br label %11
            >+
        <]
        >#B:%11
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
        >>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l8 <<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:lol
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        <<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            call @lol(i32 0)
            enable next block when we return
            >#caller/%call_term_for_0
            +
            stack_width 8
            ret_pad_width 4
            copy up arg 0
            >>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<#constop_0
            
            m7/13 [->>>>>>+<<<<<<]
            give callee a stack pointer
            >>>>>>>#stack_ptr
            +++++++++++++++
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            r8 >>>>>>>>
            <<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_lol
            +
            >#lol
            +
            >>#lol/b0
            +
        >>]
        >#B:%call_term_for_0
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
