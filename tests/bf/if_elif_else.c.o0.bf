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
            l38 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%6
        >#B:%call_term_for_1
        >#B:%7
        >#B:%11
        >#B:%call_term_for_4
        >#B:%12
        >#B:%call_term_for_6
        >#B:%13
        >#B:%14
        >#alloc_%1
        >#alloc_%2
        >#%3_=_load_i8*_%2__align_1
        >#%4_=_zext_i8_%3_to_i32
        >#%5_=_icmp_eq_i32_%4__i32_97
        >#%8_=_load_i8*_%2__align_1
        >#%9_=_zext_i8_%8_to_i32
        >#%10_=_icmp_eq_i32_%9__i32_98
        >#%15_=_load_i32*_%1__align_4
        <<<<<<<<<<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i32_ align 4
            %2 = alloca i8_ align 1
            store i32 0_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>#constop_0
            
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/24/25 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m25/0 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++
            store sitch: alloca Some(13)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 0 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m30/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m30/32 <<<<[->>+<<]
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
                m32/27 [-<<<<<+>>>>>]
                <<<<<+++++++++++++++++++++++++
            >>>>>]
            <[
                if neg
                <<<<+++++++++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m22/28 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m26/25 <[-<+>]
                m27/26 >[-<+>]
                m28/27 >[-<+>]
                m24/28 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m28/24 >>>>[-<<<<+>>>>]
            <<[
                m29/25 >>>[-<<<<+>>>>]
                
                m26/27 <<<[->+<]
                r1 >
                -
            ]
            store i8 98_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            <<<<#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            op_to_reg storing pointer value in temp address
            >#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/24/25 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m25/0 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            store sitch: alloca Some(14)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 98 }))
            >>#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/30/31 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m30/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m30/35 <<<<<<<[->>>>>+<<<<<]
            >>>>>>>+
            <<<<<<<<<<<<<<[
                -
                >>>>>>>>+
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
            <<<<<<<<<<<<]
            >>>>>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m35/27 [-<<<<<<<<+>>>>>>>>]
                <<<<<<<<+++++++++++++++++++++++++
            >>>>>>>>]
            <<<<[
                if neg
                <<<<+++++++++++++++++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m22/28 <<<<<<<<<[->>>>>>+<<<<<<]
            drive left! choo choo
            >>>>>[
                m26/25 <[-<+>]
                m27/26 >[-<+>]
                m28/27 >[-<+>]
                m24/28 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m28/24 >>>>[-<<<<+>>>>]
            <<[
                m29/25 >>>[-<<<<+>>>>]
                
                m26/27 <<<[->+<]
                r1 >
                -
            ]
            %3 = load i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            <<<<#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/28/29 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/30 <<<<[->>+<<]
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
                m30/26 [-<<<<+>>>>]
                <<<<++++++++++++++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m25/24 <[-<+>]
                m26/25 >[-<+>]
                
                m23/26 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d23/24/26 <<<[->+>>+<<<]
            m24/23 >[-<+>]
            >[
                m27/24 >>[-<<<+>>>]
                m26/27 <[->+<]
                m25/26 <[->+<]
                r1 >
                -
            ]
            m26/15 >[-<<<<<<<<<<<+>>>>>>>>>>>]
            %4 = zext i8 %3 to i32
            m15/16 <<<<<<<<<<<[->+<]
            %5 = icmp eq i32 %4_ i32 97
            op_to_reg storing const value in temp address
            >>>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m22/24 <<<<[->>+<<]
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
            <<<<<<<<<+
            >>>>>>>[
                [-]
                <<<<<<<[-]
            >>>>>>>]
            <[
                [-]
                <<<<<<[-]
            >>>>>>]
            br i1 %5_ label %6_ label %7
            <<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<-
                >+
                #B:main/6_true
            >>>>>>>>>>>>>]
            <<<<<<<<<<<<<<[
                -
                >>>+
                #B:main/7_false
            <<<]
        <]
        >>#B:%6
        [
            -
            call @putchar(i8 120)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>#constop_120
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<<<<<<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            br label %14
            >>>>>>>+
        <<<<<<<]
        >#B:%7
        [
            -
            %8 = load i8* %2_ align 1
            op_to_reg storing pointer value in temp address
            >>>>>>>>>>>>>>>>#tmp_allocptr_%2
            >#tmp_allocptr_tru_%2
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<+++++++++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/28/29 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/30 <<<<[->>+<<]
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
                m30/26 [-<<<<+>>>>]
                <<<<++++++++++++++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m25/24 <[-<+>]
                m26/25 >[-<+>]
                
                m23/26 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d23/24/26 <<<[->+>>+<<<]
            m24/23 >[-<+>]
            >[
                m27/24 >>[-<<<+>>>]
                m26/27 <[->+<]
                m25/26 <[->+<]
                r1 >
                -
            ]
            m26/18 >[-<<<<<<<<+>>>>>>>>]
            %9 = zext i8 %8 to i32
            m18/19 <<<<<<<<[->+<]
            %10 = icmp eq i32 %9_ i32 98
            op_to_reg storing const value in temp address
            >>>>#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m22/24 <<<<[->>+<<]
            >>>>+
            <<<<<<<[
                -
                >>>>+
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
            <<<<<]
            >>>>>>>-
            <<<<<<+
            >>>>[
                [-]
                <<<<[-]
            >>>>]
            <[
                [-]
                <<<[-]
            >>>]
            br i1 %10_ label %11_ label %12
            <<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/11_true
            >>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<[
                -
                >>>>>>+
                #B:main/12_false
            <<<<<<]
        >>>]
        >#B:%11
        [
            -
            call @putchar(i8 121)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>#constop_121
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<<<<<<<<<<<#caller/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<]
        >#B:%call_term_for_4
        [
            -
            br label %13
            >>>+
        <<<]
        >#B:%12
        [
            -
            call @putchar(i8 122)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>#constop_122
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<<<<<<<<<#caller/%call_term_for_6
            +
            putchar intrinsic
            >>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<]
        >#B:%call_term_for_6
        [
            -
            br label %13
            >+
        <]
        >#B:%13
        [
            -
            br label %14
            >+
        <]
        >#B:%14
        [
            -
            %15 = load i32* %1_ align 4
            op_to_reg storing pointer value in temp address
            >>>>>>>>>>#tmp_allocptr_%1
            >#tmp_allocptr_tru_%1
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            <<++++++++++++++
            >>#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/28/29 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m28/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/30 <<<<[->>+<<]
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
                m30/26 [-<<<<+>>>>]
                <<<<++++++++++++++++++++++++
            >>>>]
            <[
                if neg
                <<<++++++++++++++++++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m25/24 <[-<+>]
                m26/25 >[-<+>]
                
                m23/26 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d23/24/26 <<<[->+>>+<<<]
            m24/23 >[-<+>]
            >[
                m27/24 >>[-<<<+>>>]
                m26/27 <[->+<]
                m25/26 <[->+<]
                r1 >
                -
            ]
            m26/21 >[-<<<<<+>>>>>]
            ret i32 %15
            zero all function allocs
            <<<<<<<<<<<<<[-]
            >[-]
            <<<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>>>>>>>>]
    <<<<<<<<<<<]
<]