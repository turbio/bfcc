r7 >>>>>>>
+++++++
r1 >
runtime init:
#===TOP_FRAME
+
>>>>#main
+
>#main/b0
+
<<<<<[
    >#deref_int_inc
    [
        >>>>>#deref_int_inc/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/deref_int_inc
            >>>>>>-
            l21 <<<<<<<<<<<<<<<<<<<<<
        ]
        <#B:deref_int_inc/%1
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/33 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            %2 = alloca i8_ align 1
            >>>>>>>#alloca_%2
            store i8 %0_ i8* %2_ align 1
            store sitch: alloca Some(7)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            [-]
            m31/7 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %3 = load i8* %2_ align 1
            >#load_thru_%2_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d7/8/32 <[->+>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m8/7 >[-<+>]
            %4 = zext i8 %3 to i64
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>#%4_zext_i8_%3
            m32/33 <[->+<]
            %5 = inttoptr i64 %4 to i32*
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<#%5_itoptr_i64_%4
            m33/8 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            %6 = load i32* %5_ align 4
            <<<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/13/14 <<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/15 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<[
                -
                >>>>>>+
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
            <<<<<<<]
            >>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m15/11 [-<<<<+>>>>]
                <<<<+++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m10/9 <[-<+>]
                m11/10 >[-<+>]
                
                m8/11 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d8/9/11 <<<[->+>>+<<<]
            m9/8 >[-<+>]
            >[
                m12/9 >>[-<<<+>>>]
                m11/12 <[->+<]
                m10/11 <[->+<]
                r1 >
                -
            ]
            m11/34 >[->>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            %7 = add i32 %6_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>>#%%7_add_%i32_%6_ci32_1
            m34/35 <[->+<]
            m9/35 <<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            store i32 %7_ i32* %5_ align 4
            store sitch: alloca None
            grab the value we're storing
            op_to_reg giving known register address
            #train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/14/15 <<<<<<<<<<<<<[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m14/18 <<<<<<[->>>>+<<<<]
            >>>>>>+
            <<<<<<<<<<<<[
                -
                >>>>>>>+
                >>>[
                    -
                    <<<-
                    r1 >
                >>>]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<<<<<]
            >>>>>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m18/11 [-<<<<<<<+>>>>>>>]
                <<<<<<<+++++++++
            >>>>>>>]
            <<<[
                if neg
                <<<<+++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m35/12 >>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            drive left! choo choo
            <<<<<<<<<<<<<<<<<<<<<<<<[
                m10/9 <[-<+>]
                m11/10 >[-<+>]
                m12/11 >[-<+>]
                m8/12 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m12/8 >>>>[-<<<<+>>>>]
            <<[
                m13/9 >>>[-<<<<+>>>>]
                
                m10/11 <<<[->+<]
                r1 >
                -
            ]
            ret void
            zero all function allocs
            <<<[-]
            <<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>]
    <<<<]
    >#deref_int_inc2
    [
        >>>>#deref_int_inc2/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/deref_int_inc2
            >>>>>>-
            l21 <<<<<<<<<<<<<<<<<<<<<
        ]
        <#B:deref_int_inc2/%1
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/33 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            %2 = alloca i8_ align 1
            >>>>>>>#alloca_%2
            store i8 %0_ i8* %2_ align 1
            store sitch: alloca Some(7)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            [-]
            m31/7 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %3 = load i8* %2_ align 1
            >#load_thru_%2_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d7/8/32 <[->+>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m8/7 >[-<+>]
            %4 = zext i8 %3 to i64
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>#%4_zext_i8_%3
            m32/33 <[->+<]
            %5 = inttoptr i64 %4 to i32*
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<#%5_itoptr_i64_%4
            m33/8 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            %6 = load i32* %5_ align 4
            <<<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/13/14 <<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/15 <<<<[->>+<<]
            >>>>+
            <<<<<<<<<[
                -
                >>>>>>+
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
            <<<<<<<]
            >>>>>>>>>-
            <<#subnu_to
            [
                if pos
                m15/11 [-<<<<+>>>>]
                <<<<+++++++++
            >>>>]
            <[
                if neg
                <<<+++++++++
                >>>[
                    -
                    <<<-
                >>>]
            ]
            drive left! choo choo
            <<<[
                m10/9 <[-<+>]
                m11/10 >[-<+>]
                
                m8/11 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d8/9/11 <<<[->+>>+<<<]
            m9/8 >[-<+>]
            >[
                m12/9 >>[-<<<+>>>]
                m11/12 <[->+<]
                m10/11 <[->+<]
                r1 >
                -
            ]
            m11/34 >[->>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            %7 = add i32 %6_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <<#constop_1
            +
            >>>>>>>>>>>>>>>>>>>>>>>>>>#%%7_add_%i32_%6_ci32_1
            m34/35 <[->+<]
            m9/35 <<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            %8 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>#load_thru_%2_to_%8
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d7/9/36 <<[->>+>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m9/7 >>[-<<+>>]
            %9 = zext i8 %8 to i64
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>#%9_zext_i8_%8
            m36/37 <[->+<]
            %10 = inttoptr i64 %9 to i32*
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#%10_itoptr_i64_%9
            m37/9 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 %7_ i32* %10_ align 4
            store sitch: alloca None
            grab the value we're storing
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#train_tmp
            >#train_ret
            >#train_ptr
            >#train_cargo
            >>#stackptr
            <#stackptr_tmp
            l1 <
            d0/15/16 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            >#ptr_underflow
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m15/18 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<<<<<<[
                -
                >>>>>>>+
                >>[
                    -
                    <<-
                    r1 >
                >>]
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
                m18/12 [-<<<<<<+>>>>>>]
                <<<<<<++++++++++
            >>>>>>]
            <<[
                if neg
                <<<<++++++++++
                >>>>[
                    -
                    <<<<-
                >>>>]
            ]
            m35/13 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            drive left! choo choo
            <<<<<<<<<<<<<<<<<<<<<<<[
                m11/10 <[-<+>]
                m12/11 >[-<+>]
                m13/12 >[-<+>]
                m9/13 <<<<[->>>>+<<<<]
                l1 <
                >>>-
                <+
            >]
            <<<[-]
            m13/9 >>>>[-<<<<+>>>>]
            <<[
                m14/10 >>>[-<<<<+>>>>]
                
                m11/12 <<<[->+<]
                r1 >
                -
            ]
            ret void
            zero all function allocs
            <<<<[-]
            <<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>]
    <<<]
    >#deref_int
    [
        >>>#deref_int/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/deref_int
            >>>>>>-
            l20 <<<<<<<<<<<<<<<<<<<<
        ]
        <#B:deref_int/%call_never_first_forderef_int
        [
            -
            >>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/32 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            br label %1
            >>>>>>>#B:deref_int/%1
            +
        <<]
        >>#B:deref_int/%1
        [
            -
            %2 = alloca i8_ align 1
            >>#alloca_%2
            store i8 %0_ i8* %2_ align 1
            store sitch: alloca Some(9)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            [-]
            m30/9 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            %3 = load i8* %2_ align 1
            >#load_thru_%2_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
            d9/10/31 <[->+>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<]
            m10/9 >[-<+>]
            %4 = zext i8 %3 to i64
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>>#%4_zext_i8_%3
            m31/32 <[->+<]
            %5 = inttoptr i64 %4 to i32*
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<<<<<#%5_itoptr_i64_%4
            m32/10 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            %6 = load i32* %5_ align 4
            <<<<<<<<<<<<<<<<<<<<<#train_tmp
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
            <<<<<<<<<[
                -
                >>>>>>+
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
            <<<<<<<]
            >>>>>>>>>-
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
            m13/33 >[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
            %7 = trunc i32 %6 to i8
            op_to_reg giving known register address
            >>>>>>>>>>>>>>>>>>>>>#%7_trunc_i32_%6
            m33/34 <[->+<]
            call @putchar(i8 %7)
            enable next
            <<<<<<<<<<<<<<<<<<<<<<<<<#deref_int/%call_term_for_0
            +
            putchar intrinsic
            >>>>>>>>>>>>>>>>>>>>>>>>>>.
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:deref_int/%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l9 <<<<<<<<<
        >>>>>>>>]
    <<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>>>-
            <<<<#dead_fn_pad/main
            >>>>>>-
            l14 <<<<<<<<<<<<<<
        ]
        <#B:main/%call_never_first_formain
        [
            -
            br label %0
            >>#B:main/%0
            +
        <<]
        >>#B:main/%0
        [
            -
            %1 = alloca i32_ align 4
            >>>>#alloca_%1
            store i32 97_ i32* %1_ align 4
            store sitch: alloca Some(11)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_97
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            and the destination
            op_to_reg giving known register address
            <[-]
            m12/11 >[-<+>]
            %2 = ptrtoint i32* %1 to i8
            >>>>>>>>>>>>#%%2_ptrtoi_%i32*_%1
            l1 <
            d0/14/25 <<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>+>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m14/0 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            r1 >
            >>>>>>>>>>++++++++++++
            call @deref_int(i8 %2)
            enable next
            <<<<<<<<<<<<<<<<#main/%call_term_for_0
            +
            copy up arg 0
            >>>>>>>>>>>>>#arg_0
            m24/21 >>>[-<<<+>>>]
            give callee a stack pointer
            <<#stack_ptr
            +++++++++++++++++++++++
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r14 >>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#main
            +
            >>#main/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<<#===FRAME_deref_int
            +
            >>>#deref_int
            +
            >>#deref_int/b0
            +
        >>]
        >#B:main/%call_term_for_0
        [
            -
            %3 = ptrtoint i32* %1 to i8
            >>>>>>>>>>>>>>>>>#%%3_ptrtoi_%i32*_%1
            l1 <
            d0/13/26 <<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>+>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            >>>>>>>>>>>>++++++++++++
            call @deref_int_inc(i8 %3)
            enable next
            <<<<<<<<<<<<<<<<#main/%call_term_for_1
            +
            copy up arg 0
            >>>>>>>>>>>>#arg_0
            m25/21 >>>>[-<<<<+>>>>]
            give callee a stack pointer
            <<<#stack_ptr
            +++++++++++++++++++++++
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r14 >>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#main
            +
            >>#main/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<<#===FRAME_deref_int_inc
            +
            >#deref_int_inc
            +
            >>>>#deref_int_inc/b0
            +
        >>>]
        >#B:main/%call_term_for_1
        [
            -
            %4 = ptrtoint i32* %1 to i8
            >>>>>>>>>>>>>>>>>#%%4_ptrtoi_%i32*_%1
            l1 <
            d0/13/27 <<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m13/0 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            r1 >
            >>>>>>>>>>>>>++++++++++++
            call @deref_int(i8 %4)
            enable next
            <<<<<<<<<<<<<<<<#main/%call_term_for_2
            +
            copy up arg 0
            >>>>>>>>>>>#arg_0
            m26/21 >>>>>[-<<<<<+>>>>>]
            give callee a stack pointer
            <<<<#stack_ptr
            +++++++++++++++++++++++
            l1 <
            d0/23/24 <<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m24/0 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r14 >>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#main
            +
            >>#main/jump_pad_blk
            +
            r9 >>>>>>>>>
            <<<<<<#===FRAME_deref_int
            +
            >>>#deref_int
            +
            >>#deref_int/b0
            +
        >>>>]
        >#B:main/%call_term_for_2
        [
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<<<-
            #dead_frame
            >>>>-
            l1 <
            <<<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>]
    <<<<<<]
<<<<]
