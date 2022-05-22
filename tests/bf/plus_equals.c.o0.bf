r4 >>>>
++++
r1 >
runtime init:
#===TOP_FRAME
+
>#main
+
>#main/b0
+
<<[
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<-
            #dead_frame
            >-
            <#dead_fn_pad/main
            >>>-
            l25 <<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_=_load_i8*_%1__align_1
        >#%3_=_zext_i8_%2_to_i32
        >#%4_=_add_i32_%3__i32_32
        >#%5_=_trunc_i32_%4_to_i8
        >#%6_=_load_i8*_%1__align_1
        <<<<<<<<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            %1 = alloca i8_ align 1
            store i8 81_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>>>#constop_81
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/14/15 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 81 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/20/21 <<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<]
            m20/0 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m20/22 <<<<[->>+<<]
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
                m22/17 [-<<<<<+>>>>>]
                <<<<<+++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m12/18 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m16/15 <[-<+>]
                m17/16 >[-<+>]
                m18/17 >[-<+>]
                m14/18 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m18/14 >>>>[-<<<<+>>>>]
            <<[
                m19/15 >>>[-<<<<+>>>>]
                
                m16/17 <<<[->+<]
                r1 >
                -
            ]
            %2 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/13/14 <<<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m18/0 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m18/20 <<<<[->>+<<]
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
                m20/16 [-<<<<+>>>>]
                <<<<++++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m15/14 <[-<+>]
                m16/15 >[-<+>]
                
                m13/16 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d13/14/16 <<<[->+>>+<<<]
            m14/13 >[-<+>]
            >[
                m17/14 >>[-<<<+>>>]
                m16/17 <[->+<]
                m15/16 <[->+<]
                r1 >
                -
            ]
            m16/7 >[-<<<<<<<<<+>>>>>>>>>]
            %3 = zext i8 %2 to i32
            m7/8 <<<<<<<<<[->+<]
            %4 = add i32 %3_ i32 32
            op_to_reg storing const value in temp address
            >>>>>#constop_32
            ++++++++++++++++++++++++++++++++
            m8/9 <<<<[->+<]
            >>>>[
                -
                <<<+
            >>>]
            %5 = trunc i32 %4 to i8
            m9/10 <<<[->+<]
            store i8 %5_ i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            >>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/13/14 <<<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from LocalOperand { name: Number(5)_ ty: TypeRef(IntegerType { bits: 8 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/19/20 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<]
            m19/0 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m19/21 <<<<[->>+<<]
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
                m21/16 [-<<<<<+>>>>>]
                <<<<<++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m10/17 <<<<<<<<<<[->>>>>>>+<<<<<<<]
            drive left! choo choo
            >>>>>>[
                m15/14 <[-<+>]
                m16/15 >[-<+>]
                m17/16 >[-<+>]
                m13/17 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m17/13 >>>>[-<<<<+>>>>]
            <<[
                m18/14 >>>[-<<<<+>>>>]
                
                m15/16 <<<[->+<]
                r1 >
                -
            ]
            %6 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            <<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/13/14 <<<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/18/19 <<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m18/0 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m18/20 <<<<[->>+<<]
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
                m20/16 [-<<<<+>>>>]
                <<<<++++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m15/14 <[-<+>]
                m16/15 >[-<+>]
                
                m13/16 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d13/14/16 <<<[->+>>+<<<]
            m14/13 >[-<+>]
            >[
                m17/14 >>[-<<<+>>>]
                m16/17 <[->+<]
                m15/16 <[->+<]
                r1 >
                -
            ]
            m16/11 >[-<<<<<+>>>>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>.
            [-]
        <<<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret i32 0
            zero all function allocs
            >[-]
            <<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
