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
    >#deref_int_set
    [
        >>>>#deref_int_set/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/deref_int_set
            >>>>>-
            l21 <<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_deref_int_set
        >#F:deref_int_set
        >#F:deref_int
        >#F:main
        >#B:%no_b0_call_for_deref_int_set
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%call_term_for_0
        >#alloc_%2
        <<<<[
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/33 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>>+
        <<]
        >>[
            -
            %2 = alloca i8_ align 1
            store i8 %0_ i8* %2_ align 1
            store sitch: alloca Some(8)
            store sitch: from LocalOperand { name: Number(0)_ ty: TypeRef(IntegerType { bits: 8 }) }
            wowowowowo _Fixed(8) __
            >>[-]
            m31/8 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            %3 = load i8* %2_ align 1
            >#load_ret_%3
            #load_thru_%2_to_%3
            <<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d8/10/32 <<[->>+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m10/8 >>[-<<+>>]
            %4 = zext i8 %3 to i64
            >>>>>>>>>>>>>>>>>>>>>>#zext_op_i8_%3
            >#zext_ret_%4
            m32/33 <[->+<]
            %5 = inttoptr i64 %4 to i32*
            >#inttoptr_op_i64_%4
            >#inttoptr_ret_%5
            m33/34 <[->+<]
            store i32 98_ i32* %5_ align 4
            store sitch: alloca None
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<<<#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 98 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >#stackptr
            <<<<<#stackptr_tmp
            l1 <
            d0/12/17 <<<<<<<<<<<[->>>>>>>>>>>>+>>>>>+<<<<<<<<<<<<<<<<<]
            m12/0 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            r1 >
            >>>>>#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m16/18 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<+
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
            >>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<-
            <<#subnu_to
            [
                if pos
                m18/14 [-<<<<+>>>>]
                <<<<++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            m10/15 <<<<<<<[->>>>>+<<<<<]
            drive left! choo choo
            >>>>[
                m13/12 <[-<+>]
                m14/13 >[-<+>]
                m15/14 >[-<+>]
                m11/15 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m15/11 >>>>[-<<<<+>>>>]
            <<[
                m16/12 >>>[-<<<<+>>>>]
                
                m13/14 <<<[->+<]
                r1 >
                -
            ]
            %6 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>#load_ret_%6
            #load_thru_%2_to_%6
            <<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d8/11/35 <<<[->>>+>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m11/8 >>>[-<<<+>>>]
            %7 = zext i8 %6 to i64
            >>>>>>>>>>>>>>>>>>>>>>>>#zext_op_i8_%6
            >#zext_ret_%7
            m35/36 <[->+<]
            %8 = inttoptr i64 %7 to i32*
            >#inttoptr_op_i64_%7
            >#inttoptr_ret_%8
            m36/37 <[->+<]
            %9 = load i32* %8_ align 4
            >>#load_ret_%9
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/13/14 <<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/15 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<+
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
            >>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<-
            <<#subnu_to
            [
                if pos
                m15/11 [-<<<<+>>>>]
                <<<<+++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m10/9 <[-<+>]
                m11/10 >[-<+>]
                
                m8/11 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d8/9/11 <<<[->+>>+<<<]
            m9/8 >[-<+>]
            >[
                m12/9 >>[-<<<+>>>]
                m11/12 <[->+<]
                m10/11 <[->+<]
                r1 >
                -
            ]
            m11/38 >[->>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            %10 = trunc i32 %9 to i8
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#trunc_op_i32_%9
            >#trunc_ret_%10
            m38/39 <[->+<]
            call @putchar(i8 %10)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>]
    <<<<<<]
    >#deref_int
    [
        >>>#deref_int/RET_LANDING_PAD
        [
            <<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/deref_int
            >>>>>-
            l18 <<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_deref_int
        >#F:deref_int_set
        >#F:deref_int
        >#F:main
        >#B:%no_b0_call_for_deref_int
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%call_term_for_0
        >#alloc_%2
        <<<<[
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/30 <<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>>+
        <<]
        >>[
            -
            %2 = alloca i8_ align 1
            store i8 %0_ i8* %2_ align 1
            store sitch: alloca Some(8)
            store sitch: from LocalOperand { name: Number(0)_ ty: TypeRef(IntegerType { bits: 8 }) }
            wowowowowo _Fixed(8) __
            >>[-]
            m28/8 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            %3 = load i8* %2_ align 1
            >#load_ret_%3
            #load_thru_%2_to_%3
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d8/10/29 <<[->>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m10/8 >>[-<<+>>]
            %4 = zext i8 %3 to i64
            >>>>>>>>>>>>>>>>>>>#zext_op_i8_%3
            >#zext_ret_%4
            m29/30 <[->+<]
            %5 = inttoptr i64 %4 to i32*
            >#inttoptr_op_i64_%4
            >#inttoptr_ret_%5
            m30/31 <[->+<]
            %6 = load i32* %5_ align 4
            >>#load_ret_%6
            <<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            <<<<#stackptr
            <#stackptr_tmp
            l1 <
            d0/10/11 <<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m10/0 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m10/15 <<<<<<<[->>>>>+<<<<<]
            >>>>>>>+
            >>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<+
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
            >>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<-
            <<#subnu_to
            [
                if pos
                m15/14 [-<+>]
                <++++++++++++
            >]
            <<<<[
                if neg
                >>>++++++++++++
                <<<[
                    -
                    >>>-
                <<<]
            ]
            drive left! choo choo
            >>>[
                m13/12 <[-<+>]
                m14/13 >[-<+>]
                
                m11/14 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d11/12/14 <<<[->+>>+<<<]
            m12/11 >[-<+>]
            >[
                m15/12 >>[-<<<+>>>]
                m14/15 <[->+<]
                m13/14 <[->+<]
                r1 >
                -
            ]
            m14/32 >[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            %7 = trunc i32 %6 to i8
            >>>>>>>>>>>>>>>>>>#trunc_op_i32_%6
            >#trunc_ret_%7
            m32/33 <[->+<]
            call @putchar(i8 %7)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l8 <<<<<<<<
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
            l22 <<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_main
        >#F:deref_int_set
        >#F:deref_int
        >#F:main
        >#B:%no_b0_call_for_main
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
        >#alloc_%2
        >#alloc_%3
        <<<<<<<<<<<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            %1 = alloca i32_ align 4
            %2 = alloca i32_ align 4
            %3 = alloca i32_ align 4
            store i32 112_ i32* %1_ align 4
            store sitch: alloca Some(14)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>#constop_112
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 112 }))
            wowowowowo _Fixed(14) __
            <<<<<<[-]
            m20/14 >>>>>>[-<<<<<<+>>>>>>]
            store i32 116_ i32* %2_ align 4
            store sitch: alloca Some(15)
            op_to_reg storing const value in temp address
            >#constop_116
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 116 }))
            wowowowowo _Fixed(15) __
            <<<<<<[-]
            m21/15 >>>>>>[-<<<<<<+>>>>>>]
            store i32 114_ i32* %3_ align 4
            store sitch: alloca Some(16)
            op_to_reg storing const value in temp address
            <#constop_114
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 114 }))
            wowowowowo _Fixed(16) __
            <<<<[-]
            m20/16 >>>>[-<<<<+>>>>]
            %4 = ptrtoint i32* %1 to i8
            op_to_reg storing pointer value in temp address
            <<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            #ptrtoint_op_i32*_%1
            >>>>>>>>>>>>>>>#ptrtoint_ret_%4
            m17/32 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            call @deref_int(i8 %4)
            enable next block when we return
            <<<<<<<<<<#caller/%call_term_for_0
            +
            stack_width 22
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>#arg_0
            m32/28 >>>>[-<<<<+>>>>]
            give callee a stack pointer
            <<<#stack_ptr
            ++++++++++++++++++++++++++++++
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m31/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r22 >>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>]
        >[
            -
            %5 = ptrtoint i32* %2 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>>>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++++
            #ptrtoint_op_i32*_%2
            >>>>>>>>>>>>>>>>#ptrtoint_ret_%5
            m17/33 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %5)
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_1
            +
            stack_width 22
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>#arg_0
            m33/28 >>>>>[-<<<<<+>>>>>]
            give callee a stack pointer
            <<<<#stack_ptr
            ++++++++++++++++++++++++++++++
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m31/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r22 >>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>]
        >[
            -
            %6 = ptrtoint i32* %3 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>>>#tmp_allocptr_%3
            >#tmp_allocptr_tru_%3
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++++
            #ptrtoint_op_i32*_%3
            >>>>>>>>>>>>>>>>>#ptrtoint_ret_%6
            m17/34 <<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %6)
            enable next block when we return
            <<<<<<<<#caller/%call_term_for_2
            +
            stack_width 22
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>#arg_0
            m34/28 >>>>>>[-<<<<<<+>>>>>>]
            give callee a stack pointer
            <<<<<#stack_ptr
            ++++++++++++++++++++++++++++++
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m31/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r22 >>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>]
        >[
            -
            %7 = ptrtoint i32* %1 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            #ptrtoint_op_i32*_%1
            >>>>>>>>>>>>>>>>>>#ptrtoint_ret_%7
            m17/35 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            call @deref_int_set(i8 %7)
            enable next block when we return
            <<<<<<<#caller/%call_term_for_3
            +
            stack_width 22
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>>#arg_0
            m35/28 >>>>>>>[-<<<<<<<+>>>>>>>]
            give callee a stack pointer
            <<<<<<#stack_ptr
            ++++++++++++++++++++++++++++++
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m31/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r22 >>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int_set
            +
            >#deref_int_set
            +
            >>>#deref_int_set/b0
            +
        >>>>>]
        >[
            -
            %8 = ptrtoint i32* %1 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            #ptrtoint_op_i32*_%1
            >>>>>>>>>>>>>>>>>>>#ptrtoint_ret_%8
            m17/36 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %8)
            enable next block when we return
            <<<<<<#caller/%call_term_for_4
            +
            stack_width 22
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>>#arg_0
            m36/28 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            give callee a stack pointer
            <<<<<<<#stack_ptr
            ++++++++++++++++++++++++++++++
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m31/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r22 >>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>>>]
        >[
            -
            %9 = ptrtoint i32* %2 to i8
            op_to_reg storing pointer value in temp address
            >>>>>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++++
            #ptrtoint_op_i32*_%2
            >>>>>>>>>>>>>>>>>>>>#ptrtoint_ret_%9
            m17/37 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %9)
            enable next block when we return
            <<<<<#caller/%call_term_for_5
            +
            stack_width 22
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>>#arg_0
            m37/28 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<#stack_ptr
            ++++++++++++++++++++++++++++++
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m31/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r22 >>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>>>>]
        >[
            -
            %10 = ptrtoint i32* %3 to i8
            op_to_reg storing pointer value in temp address
            >>>>>#tmp_allocptr_%3
            >#tmp_allocptr_tru_%3
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++++
            #ptrtoint_op_i32*_%3
            >>>>>>>>>>>>>>>>>>>>>#ptrtoint_ret_%10
            m17/38 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            call @deref_int(i8 %10)
            enable next block when we return
            <<<<#caller/%call_term_for_6
            +
            stack_width 22
            ret_pad_width 5
            copy up arg 0
            >>>>>>>>>>>>>>>#arg_0
            m38/28 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            give callee a stack pointer
            <<<<<<<<<#stack_ptr
            ++++++++++++++++++++++++++++++
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m31/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r22 >>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#caller
            +
            >>#caller/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<#===FRAME_deref_int
            +
            >>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>>>>>]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l7 <<<<<<<
        >>>>>>>>>>>>>]
    <<<<<<<<<<]
<<<]
