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
        >>>>>#c/RET_LANDING_PAD
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
        >#B:%no_b0_call_for_c
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
            call @putchar(i8 46)
            op_to_reg storing const value in temp address
            >>#constop_46
            ++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <#caller/%call_term_for_0
            +
            putchar intrinsic
            >.
            [-]
        <<]
        >[
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
        >>>>#b/RET_LANDING_PAD
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
        >#B:%2
        >#B:%5
        >#B:%call_term_for_2
        >#B:%6
        >#B:%9
        >#alloc_%1
        <<<<<<<[
            -
            copy up args
            %1 = alloca i32_ align 4
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(12)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>#constop_0
            
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 0 }))
            wowowowowo _Fixed(12) __
            <<<<[-]
            m16/12 >>>>[-<<<<+>>>>]
            br label %2
            <<<<<<<<<+
        <<]
        >>[
            -
            %3 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>#load_ret_%3
            #load_thru_%1_to_%3
            <<<<<<<<<<<<<<<#tmp0_for_load
            d12/15/30 <<<[->>>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            m15/12 >>>[-<<<+>>>]
            %4 = icmp slt i32 %3_ i32 2
            op_to_reg storing const value in temp address
            <<#constop_2
            ++
            >>>>>>>>>>>>>>>>>#icmp_op0_i32_%3
            <<<<<<<<<<<<<<<<<#icmp_op1_i32_2
            >>>>>>>>>>>>>>>>>>#icmp_ret_%4
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/17 <<<<<<[->>>>+<<<<]
            >>>>>>+
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
            br i1 %4_ label %5_ label %9
            <<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:b/5_true
            >>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:b/9_false
            <<<<<]
        >]
        >[
            -
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
        >[
            -
            br label %6
            >+
        <]
        >[
            -
            %7 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>#load_ret_%7
            #load_thru_%1_to_%7
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d12/15/32 <<<[->>>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m15/12 >>>[-<<<+>>>]
            %8 = add i32 %7_ i32 1
            op_to_reg storing const value in temp address
            <<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>#add_op0_i32_%7
            <<<<<<<<<<<<<<<<<<<#add_op1_i32_1
            >>>>>>>>>>>>>>>>>>>>#add_ret_%8
            m32/33 <[->+<]
            <<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<]
            store i32 %8_ i32* %1_ align 4
            store sitch: alloca Some(12)
            store sitch: from LocalOperand { name: Number(8)_ ty: TypeRef(IntegerType { bits: 32 }) }
            wowowowowo _Fixed(12) __
            <[-]
            m33/12 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            br label %2
            <<<<<<<<<<<<<<<<<<<<<<<<<<+
        >>>]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>>]
    <<<<<<<<<]
    >#a
    [
        >>>#a/RET_LANDING_PAD
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
        >#B:%2
        >#B:%5
        >#B:%call_term_for_2
        >#B:%6
        >#B:%9
        >#alloc_%1
        <<<<<<<[
            -
            copy up args
            %1 = alloca i32_ align 4
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(12)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>#constop_0
            
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 0 }))
            wowowowowo _Fixed(12) __
            <<<<[-]
            m16/12 >>>>[-<<<<+>>>>]
            br label %2
            <<<<<<<<<+
        <<]
        >>[
            -
            %3 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>#load_ret_%3
            #load_thru_%1_to_%3
            <<<<<<<<<<<<<<<#tmp0_for_load
            d12/15/30 <<<[->>>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            m15/12 >>>[-<<<+>>>]
            %4 = icmp slt i32 %3_ i32 2
            op_to_reg storing const value in temp address
            <<#constop_2
            ++
            >>>>>>>>>>>>>>>>>#icmp_op0_i32_%3
            <<<<<<<<<<<<<<<<<#icmp_op1_i32_2
            >>>>>>>>>>>>>>>>>>#icmp_ret_%4
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/17 <<<<<<[->>>>+<<<<]
            >>>>>>+
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
            br i1 %4_ label %5_ label %9
            <<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:a/5_true
            >>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:a/9_false
            <<<<<]
        >]
        >[
            -
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
        >[
            -
            br label %6
            >+
        <]
        >[
            -
            %7 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>#load_ret_%7
            #load_thru_%1_to_%7
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d12/15/32 <<<[->>>+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            m15/12 >>>[-<<<+>>>]
            %8 = add i32 %7_ i32 1
            op_to_reg storing const value in temp address
            <<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>#add_op0_i32_%7
            <<<<<<<<<<<<<<<<<<<#add_op1_i32_1
            >>>>>>>>>>>>>>>>>>>>#add_ret_%8
            m32/33 <[->+<]
            <<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<]
            store i32 %8_ i32* %1_ align 4
            store sitch: alloca Some(12)
            store sitch: from LocalOperand { name: Number(8)_ ty: TypeRef(IntegerType { bits: 32 }) }
            wowowowowo _Fixed(12) __
            <[-]
            m33/12 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            br label %2
            <<<<<<<<<<<<<<<<<<<<<<<<<<+
        >>>]
        >[
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>>]
    <<<<<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
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
        >[
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
