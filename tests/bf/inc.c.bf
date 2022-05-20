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
            l11 <<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_b0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        <<<<[
            -
            copy up args
            br label %0
            >>+
        <<]
        >>[
            -
            %1 = alloca i8_ align 1
            store i8 97_ i8* %1_ align 1
            store sitch: alloca Some(6)
            op_to_reg storing const value in temp address
            >>>>>>#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 97 }))
            wowowowowo _Fixed(6) __
            <<<<[-]
            m10/6 >>>>[-<<<<+>>>>]
            %2 = load i8* %1_ align 1
            >>>>>>>>>>>#load_ret_%2
            #load_thru_%1_to_%2
            <<<<<<<<<<<<#tmp0_for_load
            d6/9/21 <<<[->>>+>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            m9/6 >>>[-<<<+>>>]
            %3 = add i8 %2_ i8 1
            op_to_reg storing const value in temp address
            <<#constop_1
            +
            >>>>>>>>>>>>>>#add_op0_i8_%2
            <<<<<<<<<<<<<<#add_op1_i8_1
            >>>>>>>>>>>>>>>#add_ret_%3
            m21/22 <[->+<]
            <<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<]
            store i8 %3_ i8* %1_ align 1
            store sitch: alloca Some(6)
            store sitch: from LocalOperand { name: Number(3)_ ty: TypeRef(IntegerType { bits: 8 }) }
            wowowowowo _Fixed(6) __
            <[-]
            m22/6 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            %4 = load i8* %1_ align 1
            >#load_ret_%4
            #load_thru_%1_to_%4
            <<<<<<<<<<<<<<#tmp0_for_load
            d6/9/23 <<<[->>>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            m9/6 >>>[-<<<+>>>]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<]
        >[
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
