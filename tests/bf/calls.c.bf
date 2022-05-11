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
    >#c
    [
        >>>>>#c/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/c
            >>>>>>-
            l10 <<<<<<<<<<
        ]
        <#B:c/%call_never_first_forc
        [
            -
            br label %0
            >>#B:c/%0
            +
        <<]
        >>#B:c/%0
        [
            -
            call @putchar(i8 46)
            enable next
            >#c/%call_term_for_0
            +
            putchar intrinsic
            >++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<]
        >#B:c/%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            <<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>]
    <<<<<<<]
    >#b
    [
        >>>>#b/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/b
            >>>>>>-
            l18 <<<<<<<<<<<<<<<<<<
        ]
        <#B:b/%0
        [
            -
            %1 = alloca i32_ align 4
            >>>>>>>#alloca_%1
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_0
            
            and the destination
            op_to_reg giving known register address
            <[-]
            m13/12 >[-<+>]
            br label %2
            <<<<<<#B:b/%2
            +
        <<]
        >>#B:b/%2
        [
            -
            %3 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d12/14/28 <<[->>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            m14/12 >>[-<<+>>]
            %4 = icmp slt i32 %3_ i32 2
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <#constop_2
            ++
            >>>>>>>>>>>>>>>>#%4_icmp_%i32_%3_slt_i32_2
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/15 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>]
            <<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<]
            br i1 %4_ label %5_ label %9
            <<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:b/5_true
            >>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:b/9_false
            <<<<<]
        >]
        >#B:b/%5
        [
            -
            call @c()
            enable next
            >#b/%call_term_for_2
            +
            give callee a stack pointer
            >>>>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++
            l1 <
            d0/26/27 <<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m27/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r18 >>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#b
            +
            >>>>#b/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<<#===FRAME_c
            +
            >#c
            +
            >>>>#c/b0
            +
        >>>]
        >#B:b/%call_term_for_2
        [
            -
            br label %6
            >#B:b/%6
            +
        <]
        >#B:b/%6
        [
            -
            %7 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%7
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d12/13/30 <[->+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            m13/12 >[-<+>]
            %8 = add i32 %7_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>#%_Named(Number(8))_add_%_Named(Number(7))_c_Fixed(13)
            m30/31 <[->+<]
            <<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<]
            store i32 %8_ i32* %1_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m31/12 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            br label %2
            <<<<<<<<<<<<<<<<<<<<<<<<#B:b/%2
            +
        >>>]
        >#B:b/%9
        [
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>>]
    <<<<<<<<<]
    >#a
    [
        >>>#a/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/a
            >>>>>>-
            l18 <<<<<<<<<<<<<<<<<<
        ]
        <#B:a/%0
        [
            -
            %1 = alloca i32_ align 4
            >>>>>>>#alloca_%1
            store i32 0_ i32* %1_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg storing const value in temp address
            >#constop_0
            
            and the destination
            op_to_reg giving known register address
            <[-]
            m13/12 >[-<+>]
            br label %2
            <<<<<<#B:a/%2
            +
        <<]
        >>#B:a/%2
        [
            -
            %3 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%3
            op_to_reg giving known register address
            <<<<<<<<<<<<<<#tmp0_for_load
            d12/14/28 <<[->>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            m14/12 >>[-<<+>>]
            %4 = icmp slt i32 %3_ i32 2
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            <#constop_2
            ++
            >>>>>>>>>>>>>>>>#%4_icmp_%i32_%3_slt_i32_2
            <<<<<<<<<<<<<<#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/15 <<<<[->>+<<]
            >>>>+
            >>>>>>>>>>>[
                -
                
                <<<<<<<<<<<<<[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            >>>>>>>>>>>>>]
            <<<<<<<<<<<-
            <<[
                [-]
                >>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<]
            br i1 %4_ label %5_ label %9
            <<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<-
                >>+
                #B:a/5_true
            >>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>+
                #B:a/9_false
            <<<<<]
        >]
        >#B:a/%5
        [
            -
            call @b()
            enable next
            >#a/%call_term_for_2
            +
            give callee a stack pointer
            >>>>>>>>>>>>>>>>#stack_ptr
            +++++++++++++++++++++++++++
            l1 <
            d0/26/27 <<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m27/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r18 >>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>#a
            +
            >>>#a/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<<#===FRAME_b
            +
            >>#b
            +
            >>>#b/b0
            +
        >>>]
        >#B:a/%call_term_for_2
        [
            -
            br label %6
            >#B:a/%6
            +
        <]
        >#B:a/%6
        [
            -
            %7 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>#load_thru_%1_to_%7
            op_to_reg giving known register address
            <<<<<<<<<<<<<<<<<#tmp0_for_load
            d12/13/30 <[->+>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
            m13/12 >[-<+>]
            %8 = add i32 %7_ i32 1
            op_to_reg giving known register address
            op_to_reg storing const value in temp address
            #constop_1
            +
            >>>>>>>>>>>>>>>>>>#%_Named(Number(8))_add_%_Named(Number(7))_c_Fixed(13)
            m30/31 <[->+<]
            <<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>>>>>>>>>>>+
            <<<<<<<<<<<<<<<<<<]
            store i32 %8_ i32* %1_ align 4
            store sitch: alloca Some(12)
            grab the value we're storing
            op_to_reg giving known register address
            and the destination
            op_to_reg giving known register address
            <[-]
            m31/12 >>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
            br label %2
            <<<<<<<<<<<<<<<<<<<<<<<<#B:a/%2
            +
        >>>]
        >#B:a/%9
        [
            -
            ret void
            zero all function allocs
            >[-]
            <<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>>]
    <<<<<<<<]
    >#main
    [
        >>#main/RET_LANDING_PAD
        [
            <<<<<<-
            #dead_frame
            >>>>-
            <<<<#dead_fn_pad/main
            >>>>>>-
            l9 <<<<<<<<<
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
            call @a()
            enable next
            >#main/%call_term_for_0
            +
            give callee a stack pointer
            >>>>>>>>#stack_ptr
            ++++++++++++++++++
            l1 <
            d0/17/18 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
            m18/0 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            r1 >
            r9 >>>>>>>>>
            <<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>>>#main
            +
            >>#main/jump_pad_blk
            +
            r8 >>>>>>>>
            <<<<<<#===FRAME_a
            +
            >>>#a
            +
            >>#a/b0
            +
        >>]
        >#B:main/%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            <<<<<<<<-
            #dead_frame
            >>>>-
            l1 <
            <<<<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>]
    <<<<]
<<<<]
