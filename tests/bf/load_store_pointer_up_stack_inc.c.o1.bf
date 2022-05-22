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
    >#deref_int_inc
    [
        >>>>>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/deref_int_inc
            >>>>>>-
            l27 <<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<<#mainloop_deref_int_inc
        >#F:deref_int_inc
        >#F:deref_int_inc2
        >#F:deref_int
        >#F:main
        >#B:%1
        >#B:%ret_lading_pad
        >#%2_=_zext_i8_%0_to_i64(mult)
        >#%3_=_inttoptr_i64_%2_to_i32*(mult)
        >#%4_=_load_i32*_%3__align_4(mult)
        >#%5_=_add_i32_%4__i32_1(mult)
        >#%0
        <<<<<<#B:%1
        [
            -
            copy up args
            >>>>>>#arg_%0
            l2 <<
            m0/13 <<<<<<<<<<<[->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            r2 >>
            %2 = zext i8 %0 to i64
            >>>>>>>[-]
            m11/7 >>>>[-<<<<+>>>>]
            %3 = inttoptr i64 %2 to i32*
            <<<[-]
            d7/12/13 <[->>>>>+>+<<<<<<]
            m12/7 >>>>>[-<<<<<+>>>>>]
            m13/8 >[-<<<<<+>>>>>]
            %4 = load i32* %3_ align 4
            <<<<[-]
            d8/12/14 <[->>>>+>>+<<<<<<]
            m12/8 >>>>[-<<<<+>>>>]
            >>>#train_tmp
            >#train_ret
            >#train_ptr
            
            >#stackptr
            <<<<<#stackptr_tmp
            l1 <
            d0/14/19 <<<<<<<<<<<<<[->>>>>>>>>>>>>>+>>>>>+<<<<<<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            >>>>>#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m18/20 <<<<[->>+<<]
            >>>>+
            <<<<<<<<[
                -
                >>>>>+
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
            <<<<<<]
            >>>>>>>>-
            <<#subnu_to
            [
                if pos
                m20/17 [-<<<+>>>]
                <<<+++++++++++++++
            >>>]
            <[
                if neg
                <<+++++++++++++++
                >>[
                    -
                    <<-
                >>]
            ]
            drive left! choo choo
            <<[
                m16/15 <[-<+>]
                m17/16 >[-<+>]
                
                m14/17 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d14/15/17 <<<[->+>>+<<<]
            m15/14 >[-<+>]
            >[
                m18/15 >>[-<<<+>>>]
                m17/18 <[->+<]
                m16/17 <[->+<]
                r1 >
                -
            ]
            m17/9 >[-<<<<<<<<+>>>>>>>>]
            %5 = add i32 %4_ i32 1
            <<<<<<<[-]
            d9/12/13 <[->>>+>+<<<<]
            m12/9 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m13/10 <[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            store i32 %5_ i32* %3_ align 4
            d10/12/13 <<<<[->>+>+<<<]
            m12/10 >>[-<<+>>]
            d8/14/15 <<<<[->>>>>>+>+<<<<<<<]
            m14/8 >>>>>>[-<<<<<<+>>>>>>]
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/21/22 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<]
            m21/0 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >>#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m21/24 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>>+
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
            <<<<<<<<<]
            >>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m24/18 [-<<<<<<+>>>>>>]
                <<<<<<++++++++++++++++
            >>>>>>]
            <[
                if neg
                <<<<<++++++++++++++++
                >>>>>[
                    -
                    <<<<<-
                >>>>>]
            ]
            m13/19 <<<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m17/16 <[-<+>]
                m18/17 >[-<+>]
                m19/18 >[-<+>]
                m15/19 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m19/15 >>>>[-<<<<+>>>>]
            <<[
                m20/16 >>>[-<<<<+>>>>]
                
                m17/18 <<<[->+<]
                r1 >
                -
            ]
            ret void
            zero all function allocs
            <<<<<<<<<<[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>]
    <<<<]
    >#deref_int_inc2
    [
        >>>>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/deref_int_inc2
            >>>>>>-
            l27 <<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<<#mainloop_deref_int_inc2
        >#F:deref_int_inc
        >#F:deref_int_inc2
        >#F:deref_int
        >#F:main
        >#B:%1
        >#B:%ret_lading_pad
        >#%2_=_zext_i8_%0_to_i64(mult)
        >#%3_=_inttoptr_i64_%2_to_i32*(mult)
        >#%4_=_load_i32*_%3__align_4(mult)
        >#%5_=_add_i32_%4__i32_1(mult)
        >#%0
        <<<<<<#B:%1
        [
            -
            copy up args
            >>>>>>#arg_%0
            l2 <<
            m0/13 <<<<<<<<<<<[->>>>>>>>>>>>>+<<<<<<<<<<<<<]
            r2 >>
            %2 = zext i8 %0 to i64
            >>>>>>>[-]
            m11/7 >>>>[-<<<<+>>>>]
            %3 = inttoptr i64 %2 to i32*
            <<<[-]
            d7/12/13 <[->>>>>+>+<<<<<<]
            m12/7 >>>>>[-<<<<<+>>>>>]
            m13/8 >[-<<<<<+>>>>>]
            %4 = load i32* %3_ align 4
            <<<<[-]
            d8/12/14 <[->>>>+>>+<<<<<<]
            m12/8 >>>>[-<<<<+>>>>]
            >>>#train_tmp
            >#train_ret
            >#train_ptr
            
            >#stackptr
            <<<<<#stackptr_tmp
            l1 <
            d0/14/19 <<<<<<<<<<<<<[->>>>>>>>>>>>>>+>>>>>+<<<<<<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            >>>>>#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m18/20 <<<<[->>+<<]
            >>>>+
            <<<<<<<<[
                -
                >>>>>+
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
            <<<<<<]
            >>>>>>>>-
            <<#subnu_to
            [
                if pos
                m20/17 [-<<<+>>>]
                <<<+++++++++++++++
            >>>]
            <[
                if neg
                <<+++++++++++++++
                >>[
                    -
                    <<-
                >>]
            ]
            drive left! choo choo
            <<[
                m16/15 <[-<+>]
                m17/16 >[-<+>]
                
                m14/17 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d14/15/17 <<<[->+>>+<<<]
            m15/14 >[-<+>]
            >[
                m18/15 >>[-<<<+>>>]
                m17/18 <[->+<]
                m16/17 <[->+<]
                r1 >
                -
            ]
            m17/9 >[-<<<<<<<<+>>>>>>>>]
            %5 = add i32 %4_ i32 1
            <<<<<<<[-]
            d9/12/13 <[->>>+>+<<<<]
            m12/9 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m13/10 <[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            store i32 %5_ i32* %3_ align 4
            d10/12/13 <<<<[->>+>+<<<]
            m12/10 >>[-<<+>>]
            d8/14/15 <<<<[->>>>>>+>+<<<<<<<]
            m14/8 >>>>>>[-<<<<<<+>>>>>>]
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/21/22 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<]
            m21/0 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >>#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m21/24 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>>+
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
            <<<<<<<<<]
            >>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m24/18 [-<<<<<<+>>>>>>]
                <<<<<<++++++++++++++++
            >>>>>>]
            <[
                if neg
                <<<<<++++++++++++++++
                >>>>>[
                    -
                    <<<<<-
                >>>>>]
            ]
            m13/19 <<<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m17/16 <[-<+>]
                m18/17 >[-<+>]
                m19/18 >[-<+>]
                m15/19 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m19/15 >>>>[-<<<<+>>>>]
            <<[
                m20/16 >>>[-<<<<+>>>>]
                
                m17/18 <<<[->+<]
                r1 >
                -
            ]
            ret void
            zero all function allocs
            <<<<<<<<<<[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>]
    <<<]
    >#deref_int
    [
        >>>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/deref_int
            >>>>>>-
            l25 <<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<<#mainloop_deref_int
        >#F:deref_int_inc
        >#F:deref_int_inc2
        >#F:deref_int
        >#F:main
        >#B:%no_block0_call_for_deref_int
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%call_term_for_0
        >#%2_=_zext_i8_%0_to_i64(mult)
        >#%3_=_inttoptr_i64_%2_to_i32*(mult)
        >#%4_=_load_i32*_%3__align_4(mult)
        >#%5_=_trunc_i32_%4_to_i8(mult)
        >#%0
        <<<<<<<<#B:%no_block0_call_for_deref_int
        [
            -
            copy up args
            >>>>>>>>#arg_%0
            l2 <<
            m0/15 <<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>>>+
        <<]
        >>#B:%1
        [
            -
            %2 = zext i8 %0 to i64
            >>[-]
            m13/9 >>>>[-<<<<+>>>>]
            %3 = inttoptr i64 %2 to i32*
            <<<[-]
            d9/14/15 <[->>>>>+>+<<<<<<]
            m14/9 >>>>>[-<<<<<+>>>>>]
            m15/10 >[-<<<<<+>>>>>]
            %4 = load i32* %3_ align 4
            <<<<[-]
            d10/14/16 <[->>>>+>>+<<<<<<]
            m14/10 >>>>[-<<<<+>>>>]
            >>>#train_tmp
            >#train_ret
            >#train_ptr
            
            >#stackptr
            <<<<<#stackptr_tmp
            l1 <
            d0/16/21 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            >>>>>#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m20/22 <<<<[->>+<<]
            >>>>+
            <<<<<<<<[
                -
                >>>>>+
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
            <<<<<<]
            >>>>>>>>-
            <<#subnu_to
            [
                if pos
                m22/19 [-<<<+>>>]
                <<<+++++++++++++++++
            >>>]
            <[
                if neg
                <<+++++++++++++++++
                >>[
                    -
                    <<-
                >>]
            ]
            drive left! choo choo
            <<[
                m18/17 <[-<+>]
                m19/18 >[-<+>]
                
                m16/19 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d16/17/19 <<<[->+>>+<<<]
            m17/16 >[-<+>]
            >[
                m20/17 >>[-<<<+>>>]
                m19/20 <[->+<]
                m18/19 <[->+<]
                r1 >
                -
            ]
            m19/11 >[-<<<<<<<<+>>>>>>>>]
            %5 = trunc i32 %4 to i8
            <<<<<<<[-]
            d11/14/15 <[->>>+>+<<<<]
            m14/11 >>>[-<<<+>>>]
            m15/12 >[-<<<+>>>]
            call @putchar(i8 %5)
            enable next block when we return
            <<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            d12/14/15 >>>>[->>+>+<<<]
            m14/12 >>[-<<+>>]
            >.
            [-]
        <<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>>>>]
    <<<<<]
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >>>>-
            <<<<#dead_fn_pad/main
            >>>>>>-
            l20 <<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<<#mainloop_main
        >#F:deref_int_inc
        >#F:deref_int_inc2
        >#F:deref_int
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#B:%call_term_for_1
        >#B:%call_term_for_2
        >#B:%call_term_for_3
        >#B:%call_term_for_4
        >#alloc_%1
        >#%2_=_bitcast_i32*_%1_to_i8*(mult)
        >#%3_=_ptrtoint_i32*_%1_to_i64(mult)
        >#%4_=_trunc_i64_%3_to_i8(mult)
        <<<<<<<<<<<#B:%no_block0_call_for_main
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
            >>>>>>>[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/18/19 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++
            m17/14 [-<<<+>>>]
            call @llvm_lifetime_start_p0i8(i64 4_ i8* %2)
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_0
            +
            ignoring llvm intrinsic
        <]
        >#B:%call_term_for_0
        [
            -
            store i32 97_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<[-]
            m17/13 >>>>[-<<<<+>>>>]
            %3 = ptrtoint i32* %1 to i64
            <<[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/18/20 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<<++++++++++++++
            m17/15 [-<<+>>]
            %4 = trunc i64 %3 to i8
            <[-]
            d15/17/18 <[->>+>+<<<]
            m17/15 >>[-<<+>>]
            m18/16 >[-<<+>>]
            call @deref_int(i8 %4)
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_1
            +
            stack_width 20
            ret_pad_width 6
            copy up arg 0
            >>>>>>>>>>>>>>>>>>#arg_0
            d16/17/18 <<<<<<<<<<<[->+>+<<]
            m17/16 >[-<+>]
            m18/27 >[->>>>>>>>>+<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++
            l1 <
            d0/29/30 <<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m30/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r20 >>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<<#===FRAME_deref_int
            +
            >>>#deref_int
            +
            >>#deref_int/b0
            +
        >>>]
        >#B:%call_term_for_1
        [
            -
            call @deref_int_inc(i8 %4)
            enable next block when we return
            >#caller/%call_term_for_2
            +
            stack_width 20
            ret_pad_width 6
            copy up arg 0
            >>>>>>>>>>>>>>>>>#arg_0
            d16/17/18 <<<<<<<<<<<[->+>+<<]
            m17/16 >[-<+>]
            m18/27 >[->>>>>>>>>+<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++
            l1 <
            d0/29/30 <<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m30/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r20 >>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<<#===FRAME_deref_int_inc
            +
            >#deref_int_inc
            +
            >>>>#deref_int_inc/b0
            +
        >>>>]
        >#B:%call_term_for_2
        [
            -
            call @deref_int(i8 %4)
            enable next block when we return
            >#caller/%call_term_for_3
            +
            stack_width 20
            ret_pad_width 6
            copy up arg 0
            >>>>>>>>>>>>>>>>#arg_0
            d16/17/18 <<<<<<<<<<<[->+>+<<]
            m17/16 >[-<+>]
            m18/27 >[->>>>>>>>>+<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++
            l1 <
            d0/29/30 <<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m30/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r20 >>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<<#===FRAME_deref_int
            +
            >>>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>>]
        >#B:%call_term_for_3
        [
            -
            call @llvm_lifetime_end_p0i8(i64 4_ i8* %2)
            enable next block when we return
            >#caller/%call_term_for_4
            +
            ignoring llvm intrinsic
        <]
        >#B:%call_term_for_4
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<-
            #dead_frame
            >>>>-
            l1 <
            <<<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>>>]
    <<<<<<<<]
<<<<]
