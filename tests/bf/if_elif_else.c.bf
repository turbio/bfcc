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
            l23 <<<<<<<<<<<<<<<<<<<<<<<
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
        <<<<<<<<<<<<[
            -
            copy up args
            %1 = alloca i32_ align 4
            %2 = alloca i8_ align 1
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(13)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>#constop_0
            
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 0 }))
            wowowowowo _Fixed(13) __
            <<<<<[-]
            m18/13 >>>>>[-<<<<<+>>>>>]
            store i8 98_ i8* %2_ align 1
            store sitch: alloca Some(14)
            op_to_reg storing const value in temp address
            >#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 98 }))
            wowowowowo _Fixed(14) __
            <<<<<[-]
            m19/14 >>>>>[-<<<<<+>>>>>]
            %3 = load i8* %2_ align 1
            >>>>>>>>>>>>>>#load_ret_%3
            #load_thru_%2_to_%3
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d14/17/33 <<<[->>>+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m17/14 >>>[-<<<+>>>]
            %4 = zext i8 %3 to i32
            >>>>>>>>>>>>>>>>#zext_op_i8_%3
            >#zext_ret_%4
            m33/34 <[->+<]
            %5 = icmp eq i32 %4_ i32 97
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>>#icmp_op0_i32_%4
            <<<<<<<<<<<<<<<<<<<#icmp_op1_i32_97
            >>>>>>>>>>>>>>>>>>>>#icmp_ret_%5
            <<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/20 <<<<<<<[->>>>>+<<<<<]
            >>>>>>>+
            >>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<+
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
            >>>>>>>>>>>>>>]
            <<<<<<<<<<<<-
            >>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<[
                [-]
                >>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<]
            <<<<[
                [-]
                >>>>>>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<<<<<]
            br i1 %5_ label %6_ label %7
            <<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >+
                #B:main/6_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>+
                #B:main/7_false
            <<<]
        <]
        >>[
            -
            call @putchar(i8 120)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>#constop_120
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>.
            [-]
        <<<<<<<<<<<]
        >[
            -
            br label %14
            >>>>>>>+
        <<<<<<<]
        >[
            -
            %8 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%8
            #load_thru_%2_to_%8
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d14/17/36 <<<[->>>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m17/14 >>>[-<<<+>>>]
            %9 = zext i8 %8 to i32
            >>>>>>>>>>>>>>>>>>>#zext_op_i8_%8
            >#zext_ret_%9
            m36/37 <[->+<]
            %10 = icmp eq i32 %9_ i32 98
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<<#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>>>>>#icmp_op0_i32_%9
            <<<<<<<<<<<<<<<<<<<<<<#icmp_op1_i32_98
            >>>>>>>>>>>>>>>>>>>>>>>#icmp_ret_%10
            <<<<<<<<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/17 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<+
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
            >>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<-
            >>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<[
                [-]
                >>>>>>>>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<<<<<<<]
            <[
                [-]
                >>>>>>>>>>>>>>>>>>>>>>[-]
            <<<<<<<<<<<<<<<<<<<<<<]
            br i1 %10_ label %11_ label %12
            <<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/11_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>+
                #B:main/12_false
            <<<<<<]
        >>>]
        >[
            -
            call @putchar(i8 121)
            op_to_reg storing const value in temp address
            >>>>>>>>#constop_121
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<<<<#caller/%call_term_for_4
            +
            putchar intrinsic
            >>>>>>>.
            [-]
        <<<<<<<<]
        >[
            -
            br label %13
            >>>+
        <<<]
        >[
            -
            call @putchar(i8 122)
            op_to_reg storing const value in temp address
            >>>>>>#constop_122
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<<#caller/%call_term_for_6
            +
            putchar intrinsic
            >>>>>.
            [-]
        <<<<<<]
        >[
            -
            br label %13
            >+
        <]
        >[
            -
            br label %14
            >+
        <]
        >[
            -
            %15 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%15
            #load_thru_%1_to_%15
            <<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d13/17/39 <<<<[->>>>+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m17/13 >>>>[-<<<<+>>>>]
            ret i32 %15
            zero all function allocs
            <<<<[-]
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
