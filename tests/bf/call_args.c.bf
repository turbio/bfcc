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
    >#call_me
    [
        >>>#call_me/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/call_me
            >>>>-
            l16 <<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_call_me
        >#F:call_me
        >#F:main
        >#B:%no_b0_call_for_call_me
        >#B:%ret_lading_pad
        >#B:%3
        >#B:%call_term_for_0
        >#B:%call_term_for_1
        >#B:%call_term_for_2
        >#alloc_%4
        >#alloc_%5
        >#alloc_%6
        <<<<<<<<[
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/28 <<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%1
            l3 <<<
            m0/30 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r3 >>>
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%2
            l4 <<<<
            m0/32 <<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r4 >>>>
            br label %3
            >>>>>+
        <<]
        >>[
            -
            %4 = alloca i32_ align 4
            %5 = alloca i32_ align 4
            %6 = alloca i32_ align 4
            store i32 %0_ i32* %4_ align 4
            store sitch: alloca Some(9)
            store sitch: from LocalOperand { name: Number(0)_ ty: TypeRef(IntegerType { bits: 32 }) }
            wowowowowo _Fixed(9) __
            >>>>[-]
            m26/9 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            store i32 %1_ i32* %5_ align 4
            store sitch: alloca Some(10)
            store sitch: from LocalOperand { name: Number(1)_ ty: TypeRef(IntegerType { bits: 32 }) }
            wowowowowo _Fixed(10) __
            <<<<<<<<<<<<<<<<[-]
            m27/10 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            store i32 %2_ i32* %6_ align 4
            store sitch: alloca Some(11)
            store sitch: from LocalOperand { name: Number(2)_ ty: TypeRef(IntegerType { bits: 32 }) }
            wowowowowo _Fixed(11) __
            <<<<<<<<<<<<<<<<[-]
            m28/11 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            %7 = load i32* %4_ align 4
            >#load_ret_%7
            #load_thru_%4_to_%7
            <<<<<<<<<<<<<<#tmp0_for_load
            d9/15/29 <<<<<<[->>>>>>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m15/9 >>>>>>[-<<<<<<+>>>>>>]
            %8 = trunc i32 %7 to i8
            >>>>>>>>>>>>>>#trunc_op_i32_%7
            >#trunc_ret_%8
            m29/30 <[->+<]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            %9 = load i32* %5_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%9
            #load_thru_%5_to_%9
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/14/31 <<<<[->>>>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m14/10 >>>>[-<<<<+>>>>]
            %10 = trunc i32 %9 to i8
            >>>>>>>>>>>>>>>>>#trunc_op_i32_%9
            >#trunc_ret_%10
            m31/32 <[->+<]
            call @putchar(i8 %10)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            %11 = load i32* %6_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%11
            #load_thru_%6_to_%11
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d11/14/33 <<<[->>>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m14/11 >>>[-<<<+>>>]
            %12 = trunc i32 %11 to i8
            >>>>>>>>>>>>>>>>>>>#trunc_op_i32_%11
            >#trunc_ret_%12
            m33/34 <[->+<]
            call @putchar(i8 %12)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_2
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
            >[-]
            >[-]
            <<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>>>>]
    <<<<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l10 <<<<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:call_me
        >#F:main
        >#B:%no_b0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        <<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            call @call_me(i32 49_ i32 50_ i32 51)
            op_to_reg storing const value in temp address
            >>#constop_49
            +++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing const value in temp address
            >#constop_50
            ++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing const value in temp address
            >#constop_51
            +++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<#caller/%call_term_for_0
            +
            stack_width 10
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>#arg_0
            m7/17 <<<<<<<<<<[->>>>>>>>>>+<<<<<<<<<<]
            copy up arg 1
            >>>>>>>>>#arg_1
            m8/16 <<<<<<<<[->>>>>>>>+<<<<<<<<]
            copy up arg 2
            >>>>>>>#arg_2
            m9/15 <<<<<<[->>>>>>+<<<<<<]
            give callee a stack pointer
            >>>>>>>>>#stack_ptr
            +++++++++++++++++
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r10 >>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<#===FRAME_call_me
            +
            >#call_me
            +
            >>#call_me/b0
            +
        >>]
        >[
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
