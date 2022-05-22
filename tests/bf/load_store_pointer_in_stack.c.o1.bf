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
    >#another_stack
    [
        >>>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/another_stack
            >>>>-
            l35 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_another_stack
        >#F:another_stack
        >#F:main
        >#B:%no_block0_call_for_another_stack
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#B:%call_term_for_1
        >#B:%call_term_for_2
        >#B:%call_term_for_3
        >#B:%call_term_for_4
        >#B:%call_term_for_5
        >#B:%call_term_for_6
        >#alloc_%1
        >#%2_=_bitcast_i32*_%1_to_i8*(mult)
        >#%3_=_ptrtoint_i32*_%1_to_i64(mult)
        >#%4_=_and_i64_%3__i64_252(mult)
        >#%5_=_icmp_eq_i64_%4__i64_0(mult)
        >#%6_=_select_i1_%5__i8_65__i8_66(mult)
        >#%7_=_inttoptr_i64_%4_to_i32*(mult)
        >#%8_=_icmp_eq_i32*_%1__i32*_%7(mult)
        >#%9_=_select_i1_%8__i8_66__i8_65(mult)
        >#%10_=_load_i32*_%1__align_4(mult)
        >#%11_=_trunc_i32_%10_to_i8(mult)
        <<<<<<<<<<<<<<<<<<<<#B:%no_block0_call_for_another_stack
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            %1 = alloca i32_ align 4
            %2 = bitcast i32* %1 to i8*
            >>>>>>>>>[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/25/26 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/0 >>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++
            m24/14 [-<<<<<<<<<<+>>>>>>>>>>]
            call @llvm_lifetime_start_p0i8(i64 4_ i8* %2)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            ignoring llvm intrinsic
        <]
        >#B:%call_term_for_0
        [
            -
            store i32 112_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>#constop_112
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<<<<<<[-]
            m24/13 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            %3 = ptrtoint i32* %1 to i64
            <<<<<<<<<[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/25/27 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m27/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<<++++++++++++++
            m24/15 [-<<<<<<<<<+>>>>>>>>>]
            %4 = and i64 %3_ i64 252
            <<<<<<<<[-]
            d15/24/25 <[->>>>>>>>>+>+<<<<<<<<<<]
            m24/15 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>>#constop_252
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<[
                >>[
                    <<<<<<<<<<<+
                    >>>>>>>>>>>[-]
                ]
                <<[-]
            ]
            >>[-]
            %5 = icmp eq i64 %4_ i64 0
            <<<<<<<<<<[-]
            d16/24/25 <[->>>>>>>>+>+<<<<<<<<<]
            m24/16 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_0
            
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m26/29 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<[
                -
                >>>+
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
            <<<<]
            >>>>>>-
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>[
                [-]
                <<<<<<<<<<<<[-]
            >>>>>>>>>>>>]
            <[
                [-]
                <<<<<<<<<<<[-]
            >>>>>>>>>>>]
            %6 = select i1 %5_ i8 65_ i8 66
            <<<<<<<<<<[-]
            d17/24/25 <[->>>>>>>+>+<<<<<<<<]
            m24/17 >>>>>>>[-<<<<<<<+>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing const value in temp address
            >#constop_66
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >+
            <<<[
                m26/18 >[-<<<<<<<<+>>>>>>>>]
                >[-]
                <<[-]
                >>>[-]
            <<<]
            >>>[
                -
                m27/18 <[-<<<<<<<<<+>>>>>>>>>]
                <[-]
                <[-]
            >>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            d18/24/25 >>>>>>>>>>>[->>>>>>+>+<<<<<<<]
            m24/18 >>>>>>[-<<<<<<+>>>>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            call @putchar(i8 66)
            enable next block when we return
            >#caller/%call_term_for_2
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>#constop_66
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            %7 = inttoptr i64 %4 to i32*
            >>>>>>>>>>>[-]
            d16/24/25 <<<[->>>>>>>>+>+<<<<<<<<<]
            m24/16 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            m25/19 >[-<<<<<<+>>>>>>]
            %8 = icmp eq i32* %1_ i32* %7
            <<<<<[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/25/26 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m26/0 >>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++
            d19/26/27 <<<<<[->>>>>>>+>+<<<<<<<<]
            m26/19 >>>>>>>[-<<<<<<<+>>>>>>>]
            >>>>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m27/32 <<<<<<<[->>>>>+<<<<<]
            >>>>>>>+
            <<<<<<<<<<[
                -
                >>>>+
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
            <<<<<<<<]
            >>>>>>>>>>-
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>[
                [-]
                <<<<<<<<<<<<[-]
            >>>>>>>>>>>>]
            <<<<[
                [-]
                <<<<<<<<[-]
            >>>>>>>>]
            %9 = select i1 %8_ i8 66_ i8 65
            <<<<<<<[-]
            d20/24/25 <[->>>>+>+<<<<<]
            m24/20 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >>#constop_66
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing const value in temp address
            >#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >+
            <<<[
                m26/21 >[-<<<<<+>>>>>]
                >[-]
                <<[-]
                >>>[-]
            <<<]
            >>>[
                -
                m27/21 <[-<<<<<<+>>>>>>]
                <[-]
                <[-]
            >>>]
            call @putchar(i8 %9)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<#caller/%call_term_for_3
            +
            putchar intrinsic
            d21/24/25 >>>>>>>>>>>>[->>>+>+<<<<]
            m24/21 >>>[-<<<+>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_3
        [
            -
            %10 = load i32* %1_ align 4
            >>>>>>>>>>>>>[-]
            d13/22/24 <<<<<<<<<[->>>>>>>>>+>>+<<<<<<<<<<<]
            m24/13 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            %11 = trunc i32 %10 to i8
            <[-]
            d22/24/25 <[->>+>+<<<]
            m24/22 >>[-<<+>>]
            m25/23 >[-<<+>>]
            call @putchar(i8 %11)
            enable next block when we return
            <<<<<<<<<<<<<<<#caller/%call_term_for_4
            +
            putchar intrinsic
            d23/24/25 >>>>>>>>>>>>>[->+>+<<]
            m24/23 >[-<+>]
            >.
            [-]
        <<<<<<<<<<<<<<<<]
        >#B:%call_term_for_4
        [
            -
            store i32 97_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<<<<<<[-]
            m24/13 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            call @putchar(i8 97)
            enable next block when we return
            <<<<<<<<<<<<<#caller/%call_term_for_5
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<]
        >#B:%call_term_for_5
        [
            -
            call @llvm_lifetime_end_p0i8(i64 4_ i8* %2)
            enable next block when we return
            >#caller/%call_term_for_6
            +
            ignoring llvm intrinsic
        <]
        >#B:%call_term_for_6
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
            <<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l6 <<<<<<
        >>>>>>>>>>>>]
    <<<<<<<<<<<]
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l36 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:another_stack
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#B:%call_term_for_1
        >#B:%call_term_for_2
        >#B:%call_term_for_3
        >#B:%call_term_for_4
        >#B:%call_term_for_5
        >#B:%call_term_for_6
        >#B:%call_term_for_7
        >#alloc_%1
        >#%2_=_bitcast_i32*_%1_to_i8*(mult)
        >#%3_=_ptrtoint_i32*_%1_to_i64(mult)
        >#%4_=_and_i64_%3__i64_252(mult)
        >#%5_=_icmp_eq_i64_%4__i64_0(mult)
        >#%6_=_select_i1_%5__i8_65__i8_66(mult)
        >#%7_=_inttoptr_i64_%4_to_i32*(mult)
        >#%8_=_icmp_eq_i32*_%1__i32*_%7(mult)
        >#%9_=_select_i1_%8__i8_66__i8_65(mult)
        >#%10_=_load_i32*_%1__align_4(mult)
        >#%11_=_trunc_i32_%10_to_i8(mult)
        <<<<<<<<<<<<<<<<<<<<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            %1 = alloca i32_ align 4
            %2 = bitcast i32* %1 to i8*
            >>>>>>>>>>[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/26/27 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m27/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            m25/15 [-<<<<<<<<<<+>>>>>>>>>>]
            call @llvm_lifetime_start_p0i8(i64 4_ i8* %2)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            ignoring llvm intrinsic
        <]
        >#B:%call_term_for_0
        [
            -
            store i32 112_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>#constop_112
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<<<<<<[-]
            m25/14 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            %3 = ptrtoint i32* %1 to i64
            <<<<<<<<<[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/26/28 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<<+++++++++++++++
            m25/16 [-<<<<<<<<<+>>>>>>>>>]
            %4 = and i64 %3_ i64 252
            <<<<<<<<[-]
            d16/25/26 <[->>>>>>>>>+>+<<<<<<<<<<]
            m25/16 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>>#constop_252
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<[
                >>[
                    <<<<<<<<<<<+
                    >>>>>>>>>>>[-]
                ]
                <<[-]
            ]
            >>[-]
            %5 = icmp eq i64 %4_ i64 0
            <<<<<<<<<<[-]
            d17/25/26 <[->>>>>>>>+>+<<<<<<<<<]
            m25/17 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_0
            
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m27/30 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<[
                -
                >>>+
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
            <<<<]
            >>>>>>-
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>[
                [-]
                <<<<<<<<<<<<[-]
            >>>>>>>>>>>>]
            <[
                [-]
                <<<<<<<<<<<[-]
            >>>>>>>>>>>]
            %6 = select i1 %5_ i8 65_ i8 66
            <<<<<<<<<<[-]
            d18/25/26 <[->>>>>>>+>+<<<<<<<<]
            m25/18 >>>>>>>[-<<<<<<<+>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing const value in temp address
            >#constop_66
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >+
            <<<[
                m27/19 >[-<<<<<<<<+>>>>>>>>]
                >[-]
                <<[-]
                >>>[-]
            <<<]
            >>>[
                -
                m28/19 <[-<<<<<<<<<+>>>>>>>>>]
                <[-]
                <[-]
            >>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            d19/25/26 >>>>>>>>>>>>[->>>>>>+>+<<<<<<<]
            m25/19 >>>>>>[-<<<<<<+>>>>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            call @putchar(i8 66)
            enable next block when we return
            >#caller/%call_term_for_2
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>#constop_66
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            %7 = inttoptr i64 %4 to i32*
            >>>>>>>>>>>>[-]
            d17/25/26 <<<[->>>>>>>>+>+<<<<<<<<<]
            m25/17 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            m26/20 >[-<<<<<<+>>>>>>]
            %8 = icmp eq i32* %1_ i32* %7
            <<<<<[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/26/27 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m27/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            d20/27/28 <<<<<[->>>>>>>+>+<<<<<<<<]
            m27/20 >>>>>>>[-<<<<<<<+>>>>>>>]
            >>>>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/33 <<<<<<<[->>>>>+<<<<<]
            >>>>>>>+
            <<<<<<<<<<[
                -
                >>>>+
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
            <<<<<<<<]
            >>>>>>>>>>-
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>[
                [-]
                <<<<<<<<<<<<[-]
            >>>>>>>>>>>>]
            <<<<[
                [-]
                <<<<<<<<[-]
            >>>>>>>>]
            %9 = select i1 %8_ i8 66_ i8 65
            <<<<<<<[-]
            d21/25/26 <[->>>>+>+<<<<<]
            m25/21 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >>#constop_66
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing const value in temp address
            >#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >+
            <<<[
                m27/22 >[-<<<<<+>>>>>]
                >[-]
                <<[-]
                >>>[-]
            <<<]
            >>>[
                -
                m28/22 <[-<<<<<<+>>>>>>]
                <[-]
                <[-]
            >>>]
            call @putchar(i8 %9)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_3
            +
            putchar intrinsic
            d22/25/26 >>>>>>>>>>>>>[->>>+>+<<<<]
            m25/22 >>>[-<<<+>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_3
        [
            -
            %10 = load i32* %1_ align 4
            >>>>>>>>>>>>>>[-]
            d14/23/25 <<<<<<<<<[->>>>>>>>>+>>+<<<<<<<<<<<]
            m25/14 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            %11 = trunc i32 %10 to i8
            <[-]
            d23/25/26 <[->>+>+<<<]
            m25/23 >>[-<<+>>]
            m26/24 >[-<<+>>]
            call @putchar(i8 %11)
            enable next block when we return
            <<<<<<<<<<<<<<<<#caller/%call_term_for_4
            +
            putchar intrinsic
            d24/25/26 >>>>>>>>>>>>>>[->+>+<<]
            m25/24 >[-<+>]
            >.
            [-]
        <<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_4
        [
            -
            store i32 97_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<<<<<<[-]
            m25/14 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            call @putchar(i8 97)
            enable next block when we return
            <<<<<<<<<<<<<<#caller/%call_term_for_5
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<]
        >#B:%call_term_for_5
        [
            -
            call @another_stack()
            enable next block when we return
            >#caller/%call_term_for_6
            +
            stack_width 36
            ret_pad_width 4
            give callee a stack pointer
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/42/43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m43/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r36 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r6 >>>>>>
            <<<<#===FRAME_another_stack
            +
            >#another_stack
            +
            >>#another_stack/b0
            +
        >>>>>>>>]
        >#B:%call_term_for_6
        [
            -
            call @llvm_lifetime_end_p0i8(i64 4_ i8* %2)
            enable next block when we return
            >#caller/%call_term_for_7
            +
            ignoring llvm intrinsic
        <]
        >#B:%call_term_for_7
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
            <<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>>>>>>>>]
    <<<<<<<<<<<]
<<]
