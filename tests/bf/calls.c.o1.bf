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
    >#c
    [
        >>>>>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/c
            >>>>>>-
            l10 <<<<<<<<<<
        ]
        <<<<<<#mainloop_c
        >#F:c
        >#F:b
        >#F:a
        >#F:main
        >#B:%no_block0_call_for_c
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        <<<#B:%no_block0_call_for_c
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            call @putchar(i8 46)
            enable next block when we return
            >#caller/%call_term_for_0
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >#constop_46
            ++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            <<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>]
    <<<<<<<]
    >#b
    [
        >>>>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/b
            >>>>>>-
            l20 <<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<<#mainloop_b
        >#F:c
        >#F:b
        >#F:a
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%2
        >#B:%call_term_for_2
        >#%3_=_phi_i32_{_i32_0__%0_}__{_i32_%4__%call_term_for_2_}
        >#%4_=_add_i32_%3__i32_1(mult)
        >#%5_=_icmp_eq_i32_%4__i32_2
        <<<<<<<#B:%0
        [
            -
            copy up args
            br label %2
            doing phi stuff
            %3 = phi i32 _ i32 0_ %0 __ _ i32 %4_ %call_term_for_2 _
            op_to_reg storing const value in temp address
            >>>>>>>>#constop_0
            
            <<<[-]
            m13/10 >>>[-<<<+>>>]
            <<<<<+
        <<<]
        >>#B:%1
        [
            -
            ret void
            zero all function allocs
            >>>>[-]
            <<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>]
        >#B:%2
        [
            -
            %3 = phi i32 _ i32 0_ %0 __ _ i32 %4_ %call_term_for_2 _
            call @c()
            enable next block when we return
            >#caller/%call_term_for_2
            +
            stack_width 20
            ret_pad_width 6
            give callee a stack pointer
            >>>>>>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++
            l1 <
            d0/28/29 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m29/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r20 >>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>>>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<<#===FRAME_c
            +
            >#c
            +
            >>>>#c/b0
            +
        >>>]
        >#B:%call_term_for_2
        [
            -
            %4 = add i32 %3_ i32 1
            >>[-]
            op_to_reg storing const value in temp address
            >>>#constop_1
            +
            m10/11 <<<<[->+<]
            >>>>[
                -
                <<<+
            >>>]
            %5 = icmp eq i32 %4_ i32 2
            d11/13/15 <<<[->>+>>+<<<<]
            m13/11 >>[-<<+>>]
            op_to_reg storing const value in temp address
            >#constop_2
            ++
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m14/17 <<<<<[->>>+<<<]
            >>>>>+
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
            <<<<<<<+
            >>>>>[
                [-]
                <<<<<[-]
            >>>>>]
            <[
                [-]
                <<<<[-]
            >>>>]
            br i1 %5_ label %1_ label %2
            doing phi stuff
            %3 = phi i32 _ i32 0_ %0 __ _ i32 %4_ %call_term_for_2 _
            d11/13/14 <<<<<[->>+>+<<<]
            m13/11 >>[-<<+>>]
            <<<[-]
            m14/10 >>>>[-<<<<+>>>>]
            <<<<<<<<+
            >>>>>>[
                -
                <<<<<<-
                >+
                #B:b/1_true
            >>>>>]
            <<<<<<[
                -
                >>+
                #B:b/2_false
            <<]
        >>>]
    <<<<<<<]
    >#a
    [
        >>>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/a
            >>>>>>-
            l20 <<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<<#mainloop_a
        >#F:c
        >#F:b
        >#F:a
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%2
        >#B:%call_term_for_2
        >#%3_=_phi_i32_{_i32_0__%0_}__{_i32_%4__%call_term_for_2_}
        >#%4_=_add_i32_%3__i32_1(mult)
        >#%5_=_icmp_eq_i32_%4__i32_2
        <<<<<<<#B:%0
        [
            -
            copy up args
            br label %2
            doing phi stuff
            %3 = phi i32 _ i32 0_ %0 __ _ i32 %4_ %call_term_for_2 _
            op_to_reg storing const value in temp address
            >>>>>>>>#constop_0
            
            <<<[-]
            m13/10 >>>[-<<<+>>>]
            <<<<<+
        <<<]
        >>#B:%1
        [
            -
            ret void
            zero all function allocs
            >>>>[-]
            <<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>]
        >#B:%2
        [
            -
            %3 = phi i32 _ i32 0_ %0 __ _ i32 %4_ %call_term_for_2 _
            call @b()
            enable next block when we return
            >#caller/%call_term_for_2
            +
            stack_width 20
            ret_pad_width 6
            give callee a stack pointer
            >>>>>>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++
            l1 <
            d0/28/29 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m29/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r20 >>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<<#===FRAME_b
            +
            >>#b
            +
            >>>#b/b0
            +
        >>>]
        >#B:%call_term_for_2
        [
            -
            %4 = add i32 %3_ i32 1
            >>[-]
            op_to_reg storing const value in temp address
            >>>#constop_1
            +
            m10/11 <<<<[->+<]
            >>>>[
                -
                <<<+
            >>>]
            %5 = icmp eq i32 %4_ i32 2
            d11/13/15 <<<[->>+>>+<<<<]
            m13/11 >>[-<<+>>]
            op_to_reg storing const value in temp address
            >#constop_2
            ++
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m14/17 <<<<<[->>>+<<<]
            >>>>>+
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
            <<<<<<<+
            >>>>>[
                [-]
                <<<<<[-]
            >>>>>]
            <[
                [-]
                <<<<[-]
            >>>>]
            br i1 %5_ label %1_ label %2
            doing phi stuff
            %3 = phi i32 _ i32 0_ %0 __ _ i32 %4_ %call_term_for_2 _
            d11/13/14 <<<<<[->>+>+<<<]
            m13/11 >>[-<<+>>]
            <<<[-]
            m14/10 >>>>[-<<<<+>>>>]
            <<<<<<<<+
            >>>>>>[
                -
                <<<<<<-
                >+
                #B:a/1_true
            >>>>>]
            <<<<<<[
                -
                >>+
                #B:a/2_false
            <<]
        >>>]
    <<<<<<]
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >>>>-
            <<<<#dead_fn_pad/main
            >>>>>>-
            l9 <<<<<<<<<
        ]
        <<<<<<#mainloop_main
        >#F:c
        >#F:b
        >#F:a
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
            call @a()
            enable next block when we return
            >#caller/%call_term_for_0
            +
            stack_width 9
            ret_pad_width 6
            give callee a stack pointer
            >>>>>>>>#stack_ptr
            ++++++++++++++++++
            l1 <
            d0/17/18 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
            m18/0 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            r1 >
            r9 >>>>>>>>>
            <<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<<#===FRAME_a
            +
            >>>#a
            +
            >>#a/b0
            +
        >>]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            <<<<<<<<-
            #dead_frame
            >>>>-
            l1 <
            <<<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>]
    <<<<]
<<<<]
