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
        >>>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/lt
            >>>>-
            l24 <<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_lt
        >#F:lt
        >#F:main
        >#B:%2
        >#B:%ret_lading_pad
        >#B:%8
        >#B:%call_term_for_1
        >#B:%9
        >#B:%call_term_for_3
        >#B:%10
        >#alloc_%3
        >#alloc_%4
        >#%5_=_load_i32*_%3__align_4(mult)
        >#%6_=_load_i32*_%4__align_4(mult)
        >#%7_=_icmp_slt_i32_%5__i32_%6(mult)
        >#%0
        >#%1
        <<<<<<<<<<<<<#B:%2
        [
            -
            copy up args
            >>>>>>>>>>>>#arg_%0
            l2 <<
            m0/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/19 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            %3 = alloca i32_ align 4
            %4 = alloca i32_ align 4
            store i32 %0_ i32* %3_ align 4
            >>>>>>>>>>[-]
            m15/10 >>>>>[-<<<<<+>>>>>]
            store i32 %1_ i32* %4_ align 4
            <<<<[-]
            m16/11 >>>>>[-<<<<<+>>>>>]
            %5 = load i32* %3_ align 4
            <<<<[-]
            d10/12/17 <<[->>+>>>>>+<<<<<<<]
            m17/10 >>>>>>>[-<<<<<<<+>>>>>>>]
            %6 = load i32* %4_ align 4
            <<<<[-]
            d11/13/18 <<[->>+>>>>>+<<<<<<<]
            m18/11 >>>>>>>[-<<<<<<<+>>>>>>>]
            %7 = icmp slt i32 %5_ i32 %6
            <<<<[-]
            d12/17/19 <<[->>>>>+>>+<<<<<<<]
            m17/12 >>>>>[-<<<<<+>>>>>]
            d13/18/20 <<<<[->>>>>+>>+<<<<<<<]
            m18/13 >>>>>[-<<<<<+>>>>>]
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m20/21 <<<[->+<]
            >>>+
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
                <<<<<<<+
            >>>>>>>]
            br i1 %7_ label %8_ label %9
            <<<<<<<<<<<<<<<<<+
            >>>>>>>>>>[
                -
                <<<<<<<<<<-
                >+
                #B:lt/8_true
            >>>>>>>>>]
            <<<<<<<<<<[
                -
                >>>+
                #B:lt/9_false
            <<<]
        <]
        >>#B:%8
        [
            -
            call @putchar(i8 108)
            enable next block when we return
            >#caller/%call_term_for_1
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>#constop_108
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            br label %10
            >>>+
        <<<]
        >#B:%9
        [
            -
            call @putchar(i8 114)
            enable next block when we return
            >#caller/%call_term_for_3
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>#constop_114
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<]
        >#B:%call_term_for_3
        [
            -
            br label %10
            >+
        <]
        >#B:%10
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<-
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
        >>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l43 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:lt
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
        >#B:%call_term_for_8
        >#B:%3
        >#B:%6
        >#B:%7
        >#B:%10
        >#B:%call_term_for_13
        >#B:%13
        >#B:%16
        >#B:%17
        >#B:%20
        >#alloc_%1
        >#alloc_%2
        >#%4_=_load_i32*_%1__align_4(mult)
        >#%5_=_icmp_slt_i32_%4__i32_30(mult)
        >#%8_=_load_i32*_%2__align_4(mult)
        >#%9_=_icmp_slt_i32_%8__i32_30(mult)
        >#%11_=_load_i32*_%1__align_4(mult)
        >#%12_=_load_i32*_%2__align_4(mult)
        >#%14_=_load_i32*_%2__align_4(mult)
        >#%15_=_add_i32_%14__i32_1(mult)
        >#%18_=_load_i32*_%1__align_4(mult)
        >#%19_=_add_i32_%18__i32_1(mult)
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:%no_block0_call_for_main
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
            %2 = alloca i32_ align 4
            call @lt(i32 1_ i32 2)
            enable next block when we return
            >#caller/%call_term_for_0
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_1
            +
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_2
            ++
            m37/48 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>]
        >#B:%call_term_for_0
        [
            -
            call @lt(i32 2_ i32 1)
            enable next block when we return
            >#caller/%call_term_for_1
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_2
            ++
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<#constop_1
            +
            m38/48 [->>>>>>>>>>+<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>]
        >#B:%call_term_for_1
        [
            -
            call @lt(i32 3_ i32 4)
            enable next block when we return
            >#caller/%call_term_for_2
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_3
            +++
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_4
            ++++
            m37/48 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>]
        >#B:%call_term_for_2
        [
            -
            call @lt(i32 3_ i32 3)
            enable next block when we return
            >#caller/%call_term_for_3
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_3
            +++
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_3
            +++
            m37/48 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>]
        >#B:%call_term_for_3
        [
            -
            call @lt(i32 4_ i32 5)
            enable next block when we return
            >#caller/%call_term_for_4
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_4
            ++++
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_5
            +++++
            m37/48 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>]
        >#B:%call_term_for_4
        [
            -
            call @lt(i32 5_ i32 6)
            enable next block when we return
            >#caller/%call_term_for_5
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_5
            +++++
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_6
            ++++++
            m37/48 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>]
        >#B:%call_term_for_5
        [
            -
            call @lt(i32 6_ i32 7)
            enable next block when we return
            >#caller/%call_term_for_6
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_6
            ++++++
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_7
            +++++++
            m37/48 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>]
        >#B:%call_term_for_6
        [
            -
            call @lt(i32 7_ i32 8)
            enable next block when we return
            >#caller/%call_term_for_7
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<#constop_7
            +++++++
            m36/49 [->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>>#arg_1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<#constop_8
            ++++++++
            m37/48 [->>>>>>>>>>>+<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>>]
        >#B:%call_term_for_7
        [
            -
            call @putchar(i8 10)
            enable next block when we return
            >#caller/%call_term_for_8
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>>>#constop_10
            ++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_8
        [
            -
            store i32 0_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>>>#constop_0
            
            <<<<<<<<<<<<[-]
            m36/24 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            br label %3
            <<<<<<<<<<<<<<<<<<<<<+
        <]
        >#B:%3
        [
            -
            %4 = load i32* %1_ align 4
            >>>>>>>>>>>[-]
            d24/26/36 <<[->>+>>>>>>>>>>+<<<<<<<<<<<<]
            m36/24 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            %5 = icmp slt i32 %4_ i32 30
            <<<<<<<<<[-]
            d26/36/37 <[->>>>>>>>>>+>+<<<<<<<<<<<]
            m36/26 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>>#constop_30
            ++++++++++++++++++++++++++++++
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m39/40 <<<[->+<]
            >>>+
            <<<<<[
                -
                
                >>>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<]
            >>>>>-
            <<[
                [-]
                <<<<<<<<<<<<<+
            >>>>>>>>>>>>>]
            br i1 %5_ label %6_ label %20
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>>+
                #B:main/6_true
            >>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>+
                #B:main/20_false
            <<<<<<<<<<<<<<<<<<<]
        >>>>>>>>>>>]
        >#B:%6
        [
            -
            store i32 0_ i32* %2_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>#constop_0
            
            <<<<<<<<<<<[-]
            m36/25 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            br label %7
            <<<<<<<<<<<<<<<<<<<+
        <]
        >#B:%7
        [
            -
            %8 = load i32* %2_ align 4
            >>>>>>>>>>>[-]
            d25/28/36 <<<[->>>+>>>>>>>>+<<<<<<<<<<<]
            m36/25 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            %9 = icmp slt i32 %8_ i32 30
            <<<<<<<[-]
            d28/36/37 <[->>>>>>>>+>+<<<<<<<<<]
            m36/28 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_30
            ++++++++++++++++++++++++++++++
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m38/39 <<<[->+<]
            >>>+
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
                <<<<<<<<<<+
            >>>>>>>>>>]
            br i1 %9_ label %10_ label %16
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>>>>>>>+
                #B:main/10_true
            >>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>+
                #B:main/16_false
            <<<<<<<<<<<<<<<<<]
        >>>>>>>>>>>>>]
        >#B:%10
        [
            -
            %11 = load i32* %1_ align 4
            >>>>>>>>>>>>[-]
            d24/30/36 <<<<<<[->>>>>>+>>>>>>+<<<<<<<<<<<<]
            m36/24 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            %12 = load i32* %2_ align 4
            <<<<<[-]
            d25/31/36 <<<<<<[->>>>>>+>>>>>+<<<<<<<<<<<]
            m36/25 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            call @lt(i32 %11_ i32 %12)
            enable next block when we return
            <<<<<<<<<<<<<<<<<#caller/%call_term_for_13
            +
            stack_width 43
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            d30/36/37 <<<<<<<<<<<<<<<<<<<[->>>>>>+>+<<<<<<<]
            m36/30 >>>>>>[-<<<<<<+>>>>>>]
            m37/49 >[->>>>>>>>>>>>+<<<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>>>#arg_1
            d31/38/39 <<<<<<<<<<<<<<<<<[->>>>>>>+>+<<<<<<<<]
            m38/31 >>>>>>>[-<<<<<<<+>>>>>>>]
            m39/48 >[->>>>>>>>>+<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/51/52 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m52/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r43 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<#===FRAME_lt
            +
            >#lt
            +
            >>#lt/b0
            +
        >>>>>>>>>>>>>>>]
        >#B:%call_term_for_13
        [
            -
            br label %13
            >+
        <]
        >#B:%13
        [
            -
            %14 = load i32* %2_ align 4
            >>>>>>>>>>>>[-]
            d25/32/36 <<<<<<<[->>>>>>>+>>>>+<<<<<<<<<<<]
            m36/25 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            %15 = add i32 %14_ i32 1
            <<<[-]
            d32/36/37 <[->>>>+>+<<<<<]
            m36/32 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m37/33 <[-<<<<+>>>>]
            >[
                -
                <<<<<+
            >>>>>]
            store i32 %15_ i32* %2_ align 4
            d33/36/37 <<<<<[->>>+>+<<<<]
            m36/33 >>>[-<<<+>>>]
            <<<<<<<<<<<[-]
            m37/25 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            br label %7
            <<<<<<<<<<<<<<<<<<<<+
        >>>]
        >#B:%16
        [
            -
            br label %17
            >+
        <]
        >#B:%17
        [
            -
            %18 = load i32* %1_ align 4
            >>>>>>>>>>>>[-]
            d24/34/36 <<<<<<<<<<[->>>>>>>>>>+>>+<<<<<<<<<<<<]
            m36/24 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            %19 = add i32 %18_ i32 1
            <[-]
            d34/36/37 <[->>+>+<<<]
            m36/34 >>[-<<+>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m37/35 <[-<<+>>]
            >[
                -
                <<<+
            >>>]
            store i32 %19_ i32* %1_ align 4
            d35/36/37 <<<[->+>+<<]
            m36/35 >[-<+>]
            <<<<<<<<<<<<[-]
            m37/24 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            br label %3
            <<<<<<<<<<<<<<<<<<<<<<+
        >>>>>>>]
        >#B:%20
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
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>>>>>>>>>>>>>>>>>>]
    <<<<<<<<<<<<<<<<<<<<<]
<<]
