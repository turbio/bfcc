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
            l19 <<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%2
        >#B:%call_term_for_2
        >#%3_=_phi_i8_{_i8_0__%0_}__{_i8_%5__%call_term_for_2_}(mult)
        >#%4_=_add_i8_%3__i8_65
        >#%5_=_add_i8_%3__i8_1(mult)
        >#%6_=_icmp_eq_i8_%5__i8_58
        <<<<<<<<#B:%0
        [
            -
            copy up args
            br label %2
            doing phi stuff
            %3 = phi i8 _ i8 0_ %0 __ _ i8 %5_ %call_term_for_2 _
            op_to_reg storing const value in temp address
            >>>>>>>>>#constop_0
            
            <<<<[-]
            m11/7 >>>>[-<<<<+>>>>]
            <<<<<<+
        <<<]
        >>#B:%1
        [
            -
            ret void
            zero all function allocs
            >>>[-]
            >>[-]
            <<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>]
        >#B:%2
        [
            -
            %3 = phi i8 _ i8 0_ %0 __ _ i8 %5_ %call_term_for_2 _
            %4 = add i8 %3_ i8 65
            d7/12/13 >>[->>>>>+>+<<<<<<]
            m12/7 >>>>>[-<<<<<+>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            m13/8 <[-<<<<<+>>>>>]
            >[
                -
                <<<<<<+
            >>>>>>]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            >>.
            [-]
        <<<]
        >#B:%call_term_for_2
        [
            -
            %5 = add i8 %3_ i8 1
            >>>[-]
            d7/11/12 <<[->>>>+>+<<<<<]
            m11/7 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m12/9 <[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            %6 = icmp eq i8 %5_ i8 58
            d9/11/12 <<<<[->>+>+<<<]
            m11/9 >>[-<<+>>]
            op_to_reg storing const value in temp address
            >>#constop_58
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m13/16 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<[
                -
                >>>+
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
            <<<<]
            >>>>>>-
            <<<<<<<<+
            >>>>>>[
                [-]
                <<<<<<[-]
            >>>>>>]
            <[
                [-]
                <<<<<[-]
            >>>>>]
            br i1 %6_ label %1_ label %2
            doing phi stuff
            %3 = phi i8 _ i8 0_ %0 __ _ i8 %5_ %call_term_for_2 _
            d9/11/12 <<<<<<[->>+>+<<<]
            m11/9 >>[-<<+>>]
            <<<<[-]
            m12/7 >>>>>[-<<<<<+>>>>>]
            <<<<<<<<<+
            >>>>>>>[
                -
                <<<<<<<-
                >+
                #B:main/1_true
            >>>>>>]
            <<<<<<<[
                -
                >>+
                #B:main/2_false
            <<]
        >>>]
    <<<<<]
<]
