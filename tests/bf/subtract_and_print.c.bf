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
            l10 <<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_b0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#alloc_%2
        <<<<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            %1 = alloca i8_ align 1
            %2 = alloca i8_ align 1
            store i8 122_ i8* %1_ align 1
            op_to_reg storing const value in temp address
            >>>>#constop_122
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: alloca Some(6)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 122 }))
            <<[-]
            m8/6 >>[-<<+>>]
            store i8 32_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            >#constop_32
            ++++++++++++++++++++++++++++++++
            store sitch: alloca Some(7)
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 32 }))
            <<[-]
            m9/7 >>[-<<+>>]
            %3 = load i8* %1_ align 1
            >>>>>>>>>>>#load_ret_%3
            #load_thru_%1_to_%3
            <<<<<<<<<<<<#tmp0_for_load
            d6/8/20 <<[->>+>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            m8/6 >>[-<<+>>]
            %4 = zext i8 %3 to i32
            >>>>>>>>>>>>#zext_op_i8_%3
            >#zext_ret_%4
            m20/21 <[->+<]
            %5 = load i8* %2_ align 1
            >>#load_ret_%5
            #load_thru_%2_to_%5
            <<<<<<<<<<<<<<#tmp0_for_load
            d7/8/22 <[->+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            m8/7 >[-<+>]
            %6 = zext i8 %5 to i32
            >>>>>>>>>>>>>>#zext_op_i8_%5
            >#zext_ret_%6
            m22/23 <[->+<]
            %7 = sub i32 %4_ i32 %6
            <#sub_op0_i32_%4
            >>#sub_op1_i32_%6
            >#sub_ret_%7
            m21/24 <<<[->>>+<<<]
            >>[
                -
                >-
            <]
            %8 = trunc i32 %7 to i8
            >#trunc_op_i32_%7
            >#trunc_ret_%8
            m24/25 <[->+<]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            ret i32 0
            zero all function allocs
            >[-]
            >[-]
            <<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
