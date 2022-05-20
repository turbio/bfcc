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
            l13 <<<<<<<<<<<<<
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
            store i8 65_ i8* %1_ align 1
            store sitch: alloca Some(6)
            op_to_reg storing const value in temp address
            >>>>>>>#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 65 }))
            wowowowowo _Fixed(6) __
            <<<<<[-]
            m11/6 >>>>>[-<<<<<+>>>>>]
            store i8 32_ i8* %2_ align 1
            store sitch: alloca Some(7)
            op_to_reg storing const value in temp address
            >#constop_32
            ++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 32 }))
            wowowowowo _Fixed(7) __
            <<<<<[-]
            m12/7 >>>>>[-<<<<<+>>>>>]
            %3 = load i8* %1_ align 1
            >>>>>>>>>>>#load_ret_%3
            #load_thru_%1_to_%3
            <<<<<<<<<<<<<#tmp0_for_load
            d6/10/23 <<<<[->>>>+>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m10/6 >>>>[-<<<<+>>>>]
            %4 = zext i8 %3 to i32
            >>>>>>>>>>>>>#zext_op_i8_%3
            >#zext_ret_%4
            m23/24 <[->+<]
            %5 = load i8* %2_ align 1
            >>#load_ret_%5
            #load_thru_%2_to_%5
            <<<<<<<<<<<<<<<#tmp0_for_load
            d7/10/25 <<<[->>>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            m10/7 >>>[-<<<+>>>]
            %6 = zext i8 %5 to i32
            >>>>>>>>>>>>>>>#zext_op_i8_%5
            >#zext_ret_%6
            m25/26 <[->+<]
            %7 = add i32 %4_ i32 %6
            <#add_op0_i32_%4
            >>#add_op1_i32_%6
            >#add_ret_%7
            m24/27 <<<[->>>+<<<]
            >>[
                -
                >+
            <]
            %8 = trunc i32 %7 to i8
            >#trunc_op_i32_%7
            >#trunc_ret_%8
            m27/28 <[->+<]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<]
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
