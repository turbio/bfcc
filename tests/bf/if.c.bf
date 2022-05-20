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
            l19 <<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%5
        >#B:%call_term_for_1
        >#B:%7
        >#B:%call_term_for_3
        >#B:%8
        >#alloc_%1
        >#alloc_%2
        <<<<<<<<[
            -
            copy up args
            %1 = alloca i32_ align 4
            %2 = alloca i8_ align 1
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(9)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_0
            
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 32_ value: 0 }))
            wowowowowo _Fixed(9) __
            <<<<<[-]
            m14/9 >>>>>[-<<<<<+>>>>>]
            store i8 98_ i8* %2_ align 1
            store sitch: alloca Some(10)
            op_to_reg storing const value in temp address
            >#constop_98
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 98 }))
            wowowowowo _Fixed(10) __
            <<<<<[-]
            m15/10 >>>>>[-<<<<<+>>>>>]
            %3 = load i8* %2_ align 1
            >>>>>>>>>>>>>>#load_ret_%3
            #load_thru_%2_to_%3
            <<<<<<<<<<<<<<<<#tmp0_for_load
            d10/13/29 <<<[->>>+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m13/10 >>>[-<<<+>>>]
            %4 = icmp ne i8 %3_ i8 0
            op_to_reg storing const value in temp address
            <<#constop_0
            
            >>>>>>>>>>>>>>>>>>#icmp_op0_i8_%3
            <<<<<<<<<<<<<<<<<<#icmp_op1_i8_0
            >>>>>>>>>>>>>>>>>>>#icmp_ret_%4
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m29/16 >>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            <<<<<<<<<<<+
            <<<<<<<[
                -
                >+
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
            <<<<<]
            >>>>>>>-
            <<[
                [-]
                >>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<]
            <<<<[
                [-]
                >>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<]
            br i1 %4_ label %5_ label %7
            <<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >+
                #B:main/5_true
            >>>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>+
                #B:main/7_false
            <<<]
        <]
        >>[
            -
            %6 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%6
            #load_thru_%2_to_%6
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/13/31 <<<[->>>+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m13/10 >>>[-<<<+>>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            br label %8
            >>>+
        <<<]
        >[
            -
            call @putchar(i8 110)
            op_to_reg storing const value in temp address
            >>>>>#constop_110
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            enable next block when we return
            <<<<#caller/%call_term_for_3
            +
            putchar intrinsic
            >>>>.
            [-]
        <<<<<]
        >[
            -
            br label %8
            >+
        <]
        >[
            -
            %9 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%9
            #load_thru_%1_to_%9
            <<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d9/13/32 <<<<[->>>>+>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m13/9 >>>>[-<<<<+>>>>]
            ret i32 %9
            zero all function allocs
            <<<<[-]
            >[-]
            <<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>>>>]
    <<<<<<<]
<]
