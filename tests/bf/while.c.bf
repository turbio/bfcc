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
        >>#main/RET_LANDING_PAD
        [
            <<<-
            #dead_frame
            >-
            <#dead_fn_pad/main
            >>>-
            l22 <<<<<<<<<<<<<<<<<<<<<<
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
        <<<<<<[
            -
            copy up args
            %1 = alloca i8_ align 1
            store i8 10_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>>>>#constop_10
            ++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/11/12 <<<<<<<<<<<[->>>>>>>>>>>+>+<<<<<<<<<<<<]
            m12/0 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
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
            m9/15 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
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
            br label %2
            <<<<<<<<<+
        <<]
        >>[
            -
            %3 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            >>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
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
                m17/13 [-<<<<+>>>>]
                <<<<+++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                
                m10/13 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d10/11/13 <<<[->+>>+<<<]
            m11/10 >[-<+>]
            >[
                m14/11 >>[-<<<+>>>]
                m13/14 <[->+<]
                m12/13 <[->+<]
                r1 >
                -
            ]
            m13/32 >[->>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            %4 = icmp ne i8 %3_ i8 0
            op_to_reg storing const value in temp address
            <<<<#constop_0
            
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m32/11 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<+
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
                >>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<]
            <[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<]
            br i1 %4_ label %5_ label %10
            <<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/5_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>+
                #B:main/10_false
            <<<<]
        >]
        >[
            -
            call @putchar(i8 97)
            op_to_reg storing const value in temp address
            >>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<#caller/%call_term_for_2
            +
            putchar intrinsic
            >>>.
            [-]
        <<<<]
        >[
            -
            %6 = load i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            >>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            <<+++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
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
                m17/13 [-<<<<+>>>>]
                <<<<+++++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                
                m10/13 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d10/11/13 <<<[->+>>+<<<]
            m11/10 >[-<+>]
            >[
                m14/11 >>[-<<<+>>>]
                m13/14 <[->+<]
                m12/13 <[->+<]
                r1 >
                -
            ]
            m13/34 >[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            %7 = zext i8 %6 to i32
            m34/35 >>>>>>>>>>>>>>>>>>>>>[->+<]
            %8 = sub i32 %7_ i32 1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<<<<<#constop_1
            +
            m35/36 >>>>>>>>>>>>>>>>>>>>>>>>>>[->+<]
            <<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>>>>>>-
            <<<<<<<<<<<<<<<<<<<<<<<<<<<]
            %9 = trunc i32 %8 to i8
            m36/37 >>>>>>>>>>>>>>>>>>>>>>>>>>>[->+<]
            store i8 %9_ i8* %1_ align 1
            op_to_reg storing pointer value in temp address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/10/11 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
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
            d0/16/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m16/0 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m16/18 <<<<[->>+<<]
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
                m18/13 [-<<<<<+>>>>>]
                <<<<<+++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m37/14 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            drive left! choo choo
            <<<<<<<<<<<<<<<<<<<<<<<<[
                m12/11 <[-<+>]
                m13/12 >[-<+>]
                m14/13 >[-<+>]
                m10/14 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m14/10 >>>>[-<<<<+>>>>]
            <<[
                m15/11 >>>[-<<<<+>>>>]
                
                m12/13 <<<[->+<]
                r1 >
                -
            ]
            br label %2
            <<<<<<<<+
        >>]
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
            l5 <<<<<
        >>>>>>>]
    <<<<<<]
<]
