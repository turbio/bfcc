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
            l15 <<<<<<<<<<<<<<<
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
            store sitch: alloca Some(8)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 10 }))
            <[-]
            m9/8 >[-<+>]
            br label %2
            <<<<<+
        <<]
        >>[
            -
            %3 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>#load_ret_%3
            #load_thru_%1_to_%3
            <<<<<<<<<<<<<<<#tmp0_for_load
            d8/10/25 <<[->>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m10/8 >>[-<<+>>]
            %4 = icmp ne i8 %3_ i8 0
            op_to_reg storing const value in temp address
            <#constop_0
            
            >>>>>>>>>>>>>>>>#icmp_op0_i8_%3
            <<<<<<<<<<<<<<<<#icmp_op1_i8_0
            >>>>>>>>>>>>>>>>>#icmp_ret_%4
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m25/12 >>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            <<<<<<<<<<<+
            <<<<<[
                -
                >>+
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
            <<<]
            >>>>>-
            <<[
                [-]
                >>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<]
            <[
                [-]
                >>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<]
            br i1 %4_ label %5_ label %10
            <<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/5_true
            >>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<[
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
            >>>>>>>>>>>>>>>>>>>>>#load_ret_%6
            #load_thru_%1_to_%6
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d8/9/27 <[->+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m9/8 >[-<+>]
            %7 = zext i8 %6 to i32
            >>>>>>>>>>>>>>>>>>#zext_op_i8_%6
            >#zext_ret_%7
            m27/28 <[->+<]
            %8 = sub i32 %7_ i32 1
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>#sub_op0_i32_%7
            <<<<<<<<<<<<<<<<<<<#sub_op1_i32_1
            >>>>>>>>>>>>>>>>>>>>#sub_ret_%8
            m28/29 <[->+<]
            <<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>-
            <<<<<<<<<<<<<<<<<<<<]
            %9 = trunc i32 %8 to i8
            >>>>>>>>>>>>>>>>>>>>#trunc_op_i32_%8
            >#trunc_ret_%9
            m29/30 <[->+<]
            store i8 %9_ i8* %1_ align 1
            store sitch: alloca Some(8)
            store sitch: from LocalOperand { name: Number(9)_ ty: TypeRef(IntegerType { bits: 8 }) }
            <<<<<<<<<<<<<<<<<<<<<[-]
            m30/8 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            br label %2
            <<<<<<<<<<<<<<<<<<<<<<<<<<+
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
