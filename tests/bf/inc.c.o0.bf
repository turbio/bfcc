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
            l23 <<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_=_load_i8*_%1__align_1
        >#%3_=_add_i8_%2__i8_1
        >#%4_=_load_i8*_%1__align_1
        <<<<<<<#B:%no_block0_call_for_main
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
            store i8 97_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/12/13 <<<<<<<<<<<<[->>>>>>>>>>>>+>+<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 97 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
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
                m20/15 [-<<<<<+>>>>>]
                <<<<<+++++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m10/16 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m14/13 <[-<+>]
                m15/14 >[-<+>]
                m16/15 >[-<+>]
                m12/16 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m16/12 >>>>[-<<<<+>>>>]
            <<[
                m17/13 >>>[-<<<<+>>>>]
                
                m14/15 <<<[->+<]
                r1 >
                -
            ]
            %2 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/11/12 <<<<<<<<<<<[->>>>>>>>>>>+>+<<<<<<<<<<<<]
            m12/0 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            r1 >
            <<+++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m16/18 <<<<[->>+<<]
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
            drive left! choo choo
            <<<[
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
            m14/7 >[-<<<<<<<+>>>>>>>]
            %3 = add i8 %2_ i8 1
            op_to_reg storing const value in temp address
            <<<<#constop_1
            +
            m7/8 <<<[->+<]
            >>>[
                -
                <<+
            >>]
            store i8 %3_ i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            #tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/11/12 <<<<<<<<<<<[->>>>>>>>>>>+>+<<<<<<<<<<<<]
            m12/0 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            r1 >
            <<+++++++
            store sitch: alloca Some(6)
            store sitch: from LocalOperand { name: Number(3)_ ty: TypeRef(IntegerType { bits: 8 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/17/18 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m17/19 <<<<[->>+<<]
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
                m19/14 [-<<<<<+>>>>>]
                <<<<<++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m8/15 <<<<<<<<<<[->>>>>>>+<<<<<<<]
            drive left! choo choo
            >>>>>>[
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
            %4 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            <<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/11/12 <<<<<<<<<<<[->>>>>>>>>>>+>+<<<<<<<<<<<<]
            m12/0 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            r1 >
            <<+++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m16/18 <<<<[->>+<<]
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
            drive left! choo choo
            <<<[
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
            m14/9 >[-<<<<<+>>>>>]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>.
            [-]
        <<<<<]
        >#B:%call_term_for_0
        [
            -
            ret void
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
