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
            l28 <<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%2
        >#B:%5
        >#B:%call_term_for_2
        >#B:%10
        >#alloc_%1
        >#%3_=_load_i8*_%1__align_1
        >#%4_=_icmp_ne_i8_%3__i8_0
        >#%6_=_load_i8*_%1__align_1
        >#%7_=_zext_i8_%6_to_i32
        >#%8_=_sub_i32_%7__i32_1
        >#%9_=_trunc_i32_%8_to_i8
        <<<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i8_ align 1
            store i8 10_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>#constop_10
            ++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/17/18 <<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
            m18/0 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++
            store sitch: alloca Some(8)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 10 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
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
                m25/20 [-<<<<<+>>>>>]
                <<<<<++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m15/21 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m19/18 <[-<+>]
                m20/19 >[-<+>]
                m21/20 >[-<+>]
                m17/21 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m21/17 >>>>[-<<<<+>>>>]
            <<[
                m22/18 >>>[-<<<<+>>>>]
                
                m19/20 <<<[->+<]
                r1 >
                -
            ]
            br label %2
            <<<<<<<<<<<<<<<+
        <<]
        >>#B:%2
        [
            -
            %3 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            >>>>>>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/21/22 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<]
            m21/0 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m21/23 <<<<[->>+<<]
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
                m23/19 [-<<<<+>>>>]
                <<<<+++++++++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
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
            m19/9 >[-<<<<<<<<<<+>>>>>>>>>>]
            %4 = icmp ne i8 %3_ i8 0
            op_to_reg storing const value in temp address
            <<<<#constop_0
            
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m9/17 <<<<<<<<<<[->>>>>>>>+<<<<<<<<]
            >>>>>>>>>>+
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
            <<[
                [-]
                <<<<<<<+
            >>>>>>>]
            <[
                [-]
                <<<<<<+
            >>>>>>]
            br i1 %4_ label %5_ label %10
            <<<<<<<<<<<<<+
            >>>>>>>[
                -
                <<<<<<<-
                >>+
                #B:main/5_true
            >>>>>]
            <<<<<<<[
                -
                >>>>+
                #B:main/10_false
            <<<<]
        >]
        >#B:%5
        [
            -
            call @putchar(i8 97)
            op_to_reg storing const value in temp address
            >>>>>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>.
            [-]
        <<<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            %6 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            >>>>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/21/22 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<]
            m21/0 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m21/23 <<<<[->>+<<]
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
                m23/19 [-<<<<+>>>>]
                <<<<+++++++++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
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
            %7 = zext i8 %6 to i32
            m11/12 <<<<<<<<[->+<]
            %8 = sub i32 %7_ i32 1
            op_to_reg storing const value in temp address
            >>>>#constop_1
            +
            m12/13 <<<[->+<]
            >>>[
                -
                <<-
            >>]
            %9 = trunc i32 %8 to i8
            m13/14 <<[->+<]
            store i8 %9_ i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            >>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/16/17 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++
            store sitch: alloca Some(8)
            store sitch: from LocalOperand { name: Number(9)_ ty: TypeRef(IntegerType { bits: 8 }) }
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/22/23 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<]
            m22/0 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m22/24 <<<<[->>+<<]
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
                m24/19 [-<<<<<+>>>>>]
                <<<<<+++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m14/20 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m18/17 <[-<+>]
                m19/18 >[-<+>]
                m20/19 >[-<+>]
                m16/20 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m20/16 >>>>[-<<<<+>>>>]
            <<[
                m21/17 >>>[-<<<<+>>>>]
                
                m18/19 <<<[->+<]
                r1 >
                -
            ]
            br label %2
            <<<<<<<<<<<<<<+
        >>]
        >#B:%10
        [
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
            l5 <<<<<
        >>>>>>>]
    <<<<<<]
<]
