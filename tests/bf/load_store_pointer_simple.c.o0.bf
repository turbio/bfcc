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
            l25 <<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#alloc_%2
        >#%3_=_ptrtoint_i32*_%1_to_i32(mult)
        >#%4_=_load_i32*_%2__align_4(mult)
        >#%5_=_sext_i32_%4_to_i64(mult)
        >#%6_=_inttoptr_i64_%5_to_i32*(mult)
        >#%7_=_load_i32*_%6__align_4(mult)
        >#%8_=_trunc_i32_%7_to_i8(mult)
        <<<<<<<<<<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            %1 = alloca i32_ align 4
            %2 = alloca i32_ align 4
            store i32 112_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>#constop_112
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<<<<<[-]
            m14/6 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            %3 = ptrtoint i32* %1 to i32
            <<<<<<[-]
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/16/15 <<<<<<<<[->>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<]
            m15/0 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            r1 >
            +++++++
            m15/8 [-<<<<<<<+>>>>>>>]
            store i32 %3_ i32* %2_ align 4
            d8/14/16 <<<<<<<[->>>>>>+>>+<<<<<<<<]
            m14/8 >>>>>>[-<<<<<<+>>>>>>]
            <<<<<<<[-]
            m16/7 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            %4 = load i32* %2_ align 4
            <<<<<<<[-]
            d7/9/14 <<[->>+>>>>>+<<<<<<<]
            m14/7 >>>>>>>[-<<<<<<<+>>>>>>>]
            %5 = sext i32 %4 to i64
            <<<<[-]
            d9/14/15 <[->>>>>+>+<<<<<<]
            m14/9 >>>>>[-<<<<<+>>>>>]
            m15/10 >[-<<<<<+>>>>>]
            %6 = inttoptr i64 %5 to i32*
            <<<<[-]
            d10/14/15 <[->>>>+>+<<<<<]
            m14/10 >>>>[-<<<<+>>>>]
            m15/11 >[-<<<<+>>>>]
            %7 = load i32* %6_ align 4
            <<<[-]
            d11/14/15 <[->>>+>+<<<<]
            m14/11 >>>[-<<<+>>>]
            >>>#train_tmp
            >#train_ret
            >#train_ptr
            
            >#stackptr
            <<<<#stackptr_tmp
            l1 <
            d0/17/21 <<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>>>>+<<<<<<<<<<<<<<<<<<<<<]
            m17/0 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            r1 >
            >>>>#ptr_underflow
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m20/22 <<<<[->>+<<]
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
                m22/19 [-<<<+>>>]
                <<<+++++++++++++++++
            >>>]
            <[
                if neg
                <<+++++++++++++++++
                >>[
                    -
                    <<-
                >>]
            ]
            drive left! choo choo
            <<[
                m18/17 <[-<+>]
                m19/18 >[-<+>]
                
                m16/19 <<<[->>>+<<<]
                l1 <
                >>>-
                <+
            >]
            get our bag
            d16/17/19 <<<[->+>>+<<<]
            m17/16 >[-<+>]
            >[
                m20/17 >>[-<<<+>>>]
                m19/20 <[->+<]
                m18/19 <[->+<]
                r1 >
                -
            ]
            m19/12 >[-<<<<<<<+>>>>>>>]
            %8 = trunc i32 %7 to i8
            <<<<<<[-]
            d12/14/15 <[->>+>+<<<]
            m14/12 >>[-<<+>>]
            m15/13 >[-<<+>>]
            call @putchar(i8 %8)
            enable next block when we return
            <<<<<<<<<<#caller/%call_term_for_0
            +
            putchar intrinsic
            d13/14/15 >>>>>>>>[->+>+<<]
            m14/13 >[-<+>]
            >.
            [-]
        <<<<<<<<<<<]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
