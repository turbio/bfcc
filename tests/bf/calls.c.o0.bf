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
            l30 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
        >#%3_=_load_i32*_%1__align_4
        >#%4_=_icmp_slt_i32_%3__i32_2
        >#%7_=_load_i32*_%1__align_4
        >#%8_=_add_i32_%7__i32_1
        <<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i32_ align 4
            store i32 0_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_0
            
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            store sitch: alloca Some(12)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 0 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/25/26 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m25/0 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m25/27 <<<<[->>+<<]
            >>>>+
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
                m27/22 [-<<<<<+>>>>>]
                <<<<<++++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m17/23 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m21/20 <[-<+>]
                m22/21 >[-<+>]
                m23/22 >[-<+>]
                m19/23 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m23/19 >>>>[-<<<<+>>>>]
            <<[
                m24/20 >>>[-<<<<+>>>>]
                
                m21/22 <<<[->+<]
                r1 >
                -
            ]
            br label %2
            <<<<<<<<<<<<<<+
        <<]
        >>#B:%2
        [
            -
            %3 = load i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            >>>>>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m23/0 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m23/25 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<[
                -
                >>>>>>>+
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
            <<<<<<<<]
            >>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m25/21 [-<<<<+>>>>]
                <<<<+++++++++++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m20/19 <[-<+>]
                m21/20 >[-<+>]
                
                m18/21 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d18/19/21 <<<[->+>>+<<<]
            m19/18 >[-<+>]
            >[
                m22/19 >>[-<<<+>>>]
                m21/22 <[->+<]
                m20/21 <[->+<]
                r1 >
                -
            ]
            m21/13 >[-<<<<<<<<+>>>>>>>>]
            %4 = icmp slt i32 %3_ i32 2
            op_to_reg storing const value in temp address
            <<<<#constop_2
            ++
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m17/18 <<<[->+<]
            >>>+
            <<<<<<<[
                -
                
                >>>>>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<]
            >>>>>>>-
            <<[
                [-]
                <<<<+
            >>>>]
            br i1 %4_ label %5_ label %9
            <<<<<<<<<<<<+
            >>>>>>>>[
                -
                <<<<<<<<-
                >>+
                #B:b/5_true
            >>>>>>]
            <<<<<<<<[
                -
                >>>>>+
                #B:b/9_false
            <<<<<]
        >]
        >#B:%5
        [
            -
            call @c()
            enable next block when we return
            >#caller/%call_term_for_2
            +
            stack_width 30
            ret_pad_width 6
            give callee a stack pointer
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/38/39 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m39/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r30 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
            br label %6
            >+
        <]
        >#B:%6
        [
            -
            %7 = load i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            >>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m23/0 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m23/25 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<[
                -
                >>>>>>>+
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
            <<<<<<<<]
            >>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m25/21 [-<<<<+>>>>]
                <<<<+++++++++++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m20/19 <[-<+>]
                m21/20 >[-<+>]
                
                m18/21 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d18/19/21 <<<[->+>>+<<<]
            m19/18 >[-<+>]
            >[
                m22/19 >>[-<<<+>>>]
                m21/22 <[->+<]
                m20/21 <[->+<]
                r1 >
                -
            ]
            m21/15 >[-<<<<<<+>>>>>>]
            %8 = add i32 %7_ i32 1
            op_to_reg storing const value in temp address
            <<<<#constop_1
            +
            m15/16 <<[->+<]
            >>[
                -
                <+
            >]
            store i32 %8_ i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            #tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            store sitch: alloca Some(12)
            store sitch: from LocalOperand { name: Number(8)_ ty: TypeRef(IntegerType { bits: 32 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/24/25 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m24/26 <<<<[->>+<<]
            >>>>+
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
                m26/21 [-<<<<<+>>>>>]
                <<<<<+++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m16/22 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m20/19 <[-<+>]
                m21/20 >[-<+>]
                m22/21 >[-<+>]
                m18/22 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m22/18 >>>>[-<<<<+>>>>]
            <<[
                m23/19 >>>[-<<<<+>>>>]
                
                m20/21 <<<[->+<]
                r1 >
                -
            ]
            br label %2
            <<<<<<<<<<<<<+
        >>>]
        >#B:%9
        [
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
        >>>#B:%ret_lading_pad
        [
            <<<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/a
            >>>>>>-
            l30 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
        >#%3_=_load_i32*_%1__align_4
        >#%4_=_icmp_slt_i32_%3__i32_2
        >#%7_=_load_i32*_%1__align_4
        >#%8_=_add_i32_%7__i32_1
        <<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i32_ align 4
            store i32 0_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_0
            
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            store sitch: alloca Some(12)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 0 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/25/26 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m25/0 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m25/27 <<<<[->>+<<]
            >>>>+
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
                m27/22 [-<<<<<+>>>>>]
                <<<<<++++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m17/23 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m21/20 <[-<+>]
                m22/21 >[-<+>]
                m23/22 >[-<+>]
                m19/23 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m23/19 >>>>[-<<<<+>>>>]
            <<[
                m24/20 >>>[-<<<<+>>>>]
                
                m21/22 <<<[->+<]
                r1 >
                -
            ]
            br label %2
            <<<<<<<<<<<<<<+
        <<]
        >>#B:%2
        [
            -
            %3 = load i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            >>>>>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m23/0 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m23/25 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<[
                -
                >>>>>>>+
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
            <<<<<<<<]
            >>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m25/21 [-<<<<+>>>>]
                <<<<+++++++++++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m20/19 <[-<+>]
                m21/20 >[-<+>]
                
                m18/21 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d18/19/21 <<<[->+>>+<<<]
            m19/18 >[-<+>]
            >[
                m22/19 >>[-<<<+>>>]
                m21/22 <[->+<]
                m20/21 <[->+<]
                r1 >
                -
            ]
            m21/13 >[-<<<<<<<<+>>>>>>>>]
            %4 = icmp slt i32 %3_ i32 2
            op_to_reg storing const value in temp address
            <<<<#constop_2
            ++
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m17/18 <<<[->+<]
            >>>+
            <<<<<<<[
                -
                
                >>>>>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<]
            >>>>>>>-
            <<[
                [-]
                <<<<+
            >>>>]
            br i1 %4_ label %5_ label %9
            <<<<<<<<<<<<+
            >>>>>>>>[
                -
                <<<<<<<<-
                >>+
                #B:a/5_true
            >>>>>>]
            <<<<<<<<[
                -
                >>>>>+
                #B:a/9_false
            <<<<<]
        >]
        >#B:%5
        [
            -
            call @b()
            enable next block when we return
            >#caller/%call_term_for_2
            +
            stack_width 30
            ret_pad_width 6
            give callee a stack pointer
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/38/39 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m39/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r30 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
            br label %6
            >+
        <]
        >#B:%6
        [
            -
            %7 = load i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            >>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m23/0 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m23/25 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<<[
                -
                >>>>>>>+
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
            <<<<<<<<]
            >>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m25/21 [-<<<<+>>>>]
                <<<<+++++++++++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m20/19 <[-<+>]
                m21/20 >[-<+>]
                
                m18/21 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d18/19/21 <<<[->+>>+<<<]
            m19/18 >[-<+>]
            >[
                m22/19 >>[-<<<+>>>]
                m21/22 <[->+<]
                m20/21 <[->+<]
                r1 >
                -
            ]
            m21/15 >[-<<<<<<+>>>>>>]
            %8 = add i32 %7_ i32 1
            op_to_reg storing const value in temp address
            <<<<#constop_1
            +
            m15/16 <<[->+<]
            >>[
                -
                <+
            >]
            store i32 %8_ i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            #tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++
            store sitch: alloca Some(12)
            store sitch: from LocalOperand { name: Number(8)_ ty: TypeRef(IntegerType { bits: 32 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/24/25 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m24/26 <<<<[->>+<<]
            >>>>+
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
                m26/21 [-<<<<<+>>>>>]
                <<<<<+++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m16/22 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m20/19 <[-<+>]
                m21/20 >[-<+>]
                m22/21 >[-<+>]
                m18/22 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m22/18 >>>>[-<<<<+>>>>]
            <<[
                m23/19 >>>[-<<<<+>>>>]
                
                m20/21 <<<[->+<]
                r1 >
                -
            ]
            br label %2
            <<<<<<<<<<<<<+
        >>>]
        >#B:%9
        [
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
