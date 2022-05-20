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
            l18 <<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%3
        >#B:%7
        >#B:%call_term_for_2
        >#B:%13
        >#B:%16
        >#alloc_%1
        >#alloc_%2
        <<<<<<<<[
            -
            copy up args
            %1 = alloca i8_ align 1
            %2 = alloca i8_ align 1
            store i8 0_ i8* %1_ align 1
            store sitch: alloca Some(9)
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>#constop_0
            
            store sitch: from ConstantOperand(ConstantRef(Int { bits: 8_ value: 0 }))
            wowowowowo _Fixed(9) __
            <<<<<[-]
            m14/9 >>>>>[-<<<<<+>>>>>]
            br label %3
            <<<<<<<<<<+
        <<]
        >>[
            -
            %4 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%4
            #load_thru_%1_to_%4
            <<<<<<<<<<<<<<<#tmp0_for_load
            d9/13/28 <<<<[->>>>+>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<]
            m13/9 >>>>[-<<<<+>>>>]
            %5 = zext i8 %4 to i32
            >>>>>>>>>>>>>>>#zext_op_i8_%4
            >#zext_ret_%5
            m28/29 <[->+<]
            %6 = icmp slt i32 %5_ i32 58
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<#constop_58
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>#icmp_op0_i32_%5
            <<<<<<<<<<<<<<<<<<#icmp_op1_i32_58
            >>>>>>>>>>>>>>>>>>>#icmp_ret_%6
            <<<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m11/15 <<<<<<[->>>>+<<<<]
            >>>>>>+
            >>>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>>]
            <<<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<]
            br i1 %6_ label %7_ label %16
            <<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/7_true
            >>>>>>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:main/16_false
            <<<<<]
        >]
        >[
            -
            %8 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%8
            #load_thru_%1_to_%8
            <<<<<<<<<<<<<<<<<<#tmp0_for_load
            d9/13/31 <<<<[->>>>+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m13/9 >>>>[-<<<<+>>>>]
            %9 = zext i8 %8 to i32
            >>>>>>>>>>>>>>>>>>#zext_op_i8_%8
            >#zext_ret_%9
            m31/32 <[->+<]
            %10 = add i32 %9_ i32 65
            op_to_reg storing const value in temp address
            <<<<<<<<<<<<<<<<<<<<#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>>>>>>>>>>>>>>>>>>>#add_op0_i32_%9
            <<<<<<<<<<<<<<<<<<<<<#add_op1_i32_65
            >>>>>>>>>>>>>>>>>>>>>>#add_ret_%10
            m32/33 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<]
            %11 = trunc i32 %10 to i8
            >>>>>>>>>>>>>>>>>>>>>>#trunc_op_i32_%10
            >#trunc_ret_%11
            m33/34 <[->+<]
            store i8 %11_ i8* %2_ align 1
            store sitch: alloca Some(10)
            store sitch: from LocalOperand { name: Number(11)_ ty: TypeRef(IntegerType { bits: 8 }) }
            wowowowowo _Fixed(10) __
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m34/10 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %12 = load i8* %2_ align 1
            >#load_ret_%12
            #load_thru_%2_to_%12
            <<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d10/13/35 <<<[->>>+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m13/10 >>>[-<<<+>>>]
            call @putchar(i8 %12)
            enable next block when we return
            <<<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >[
            -
            br label %13
            >+
        <]
        >[
            -
            %14 = load i8* %1_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_ret_%14
            #load_thru_%1_to_%14
            <<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d9/13/36 <<<<[->>>>+>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m13/9 >>>>[-<<<<+>>>>]
            %15 = add i8 %14_ i8 1
            op_to_reg storing const value in temp address
            <<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>#add_op0_i8_%14
            <<<<<<<<<<<<<<<<<<<<<<<<<#add_op1_i8_1
            >>>>>>>>>>>>>>>>>>>>>>>>>>#add_ret_%15
            m36/37 <[->+<]
            <<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<<<<<<<<<]
            store i8 %15_ i8* %1_ align 1
            store sitch: alloca Some(9)
            store sitch: from LocalOperand { name: Number(15)_ ty: TypeRef(IntegerType { bits: 8 }) }
            wowowowowo _Fixed(9) __
            <<[-]
            m37/9 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %3
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
        >>>]
        >[
            -
            ret void
            zero all function allocs
            >[-]
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
