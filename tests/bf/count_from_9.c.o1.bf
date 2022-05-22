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
            l24 <<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%2
        >#B:%call_term_for_2
        >#B:%6
        >#B:%call_term_for_4
        >#B:%call_term_for_5
        >#B:%7
        >#%3_=_phi_i8_{_i8_9__%0_}__{_i8_%8__%7_}(mult)
        >#%4_=_add_i8_%3__i8_48(mult)
        >#%5_=_icmp_eq_i8_%3__i8_1(mult)
        >#%8_=_add_i8_%3__i8_255(mult)
        >#%9_=_icmp_eq_i8_%8__i8_0(mult)
        <<<<<<<<<<<<<#B:%0
        [
            -
            copy up args
            br label %2
            doing phi stuff
            %3 = phi i8 _ i8 9_ %0 __ _ i8 %8_ %7 _
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>#constop_9
            +++++++++
            <<<<<[-]
            m16/11 >>>>>[-<<<<<+>>>>>]
            <<<<<<<<<<<+
        <<<]
        >>#B:%1
        [
            -
            ret i32 0
            zero all function allocs
            >>>>>>>[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<-
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
            %3 = phi i8 _ i8 9_ %0 __ _ i8 %8_ %7 _
            %4 = add i8 %3_ i8 48
            >>>>>>>[-]
            d11/17/18 <[->>>>>>+>+<<<<<<<]
            m17/11 >>>>>>[-<<<<<<+>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_48
            ++++++++++++++++++++++++++++++++++++++++++++++++
            m18/12 <[-<<<<<<+>>>>>>]
            >[
                -
                <<<<<<<+
            >>>>>>>]
            call @putchar(i8 %4)
            enable next block when we return
            <<<<<<<<<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            d12/16/17 >>>>>>[->>>>+>+<<<<<]
            m16/12 >>>>[-<<<<+>>>>]
            >.
            [-]
        <<<<<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            %5 = icmp eq i8 %3_ i8 1
            >>>>>>>[-]
            d11/16/17 <<[->>>>>+>+<<<<<<]
            m16/11 >>>>>[-<<<<<+>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m18/21 <<<<<[->>>+<<<]
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
            <<<<<<<<<<+
            >>>>>>>>[
                [-]
                <<<<<<<<[-]
            >>>>>>>>]
            <[
                [-]
                <<<<<<<[-]
            >>>>>>>]
            br i1 %5_ label %7_ label %6
            <<<<<<<<<<<<<<<<<+
            >>>>>>>>>>[
                -
                <<<<<<<<<<-
                >>>>>>>+
                #B:main/7_true
            >>>]
            <<<<<<<<<<[
                -
                >>>>+
                #B:main/6_false
            <<<<]
        >>>]
        >#B:%6
        [
            -
            call @putchar(i8 44)
            enable next block when we return
            >#caller/%call_term_for_4
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>#constop_44
            ++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<]
        >#B:%call_term_for_4
        [
            -
            call @putchar(i8 32)
            enable next block when we return
            >#caller/%call_term_for_5
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>#constop_32
            ++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<]
        >#B:%call_term_for_5
        [
            -
            br label %7
            >+
        <]
        >#B:%7
        [
            -
            %8 = add i8 %3_ i8 255
            >>>>[-]
            d11/16/17 <<<[->>>>>+>+<<<<<<]
            m16/11 >>>>>[-<<<<<+>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_255
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            m17/14 <[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            %9 = icmp eq i8 %8_ i8 0
            <<<[-]
            d14/16/17 <[->>+>+<<<]
            m16/14 >>[-<<+>>]
            op_to_reg storing const value in temp address
            >>#constop_0
            
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m18/20 <<<<[->>+<<]
            >>>>+
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
            <<<<<<<+
            >>>>>[
                [-]
                <<<<<[-]
            >>>>>]
            <[
                [-]
                <<<<[-]
            >>>>]
            br i1 %9_ label %1_ label %2
            doing phi stuff
            %3 = phi i8 _ i8 9_ %0 __ _ i8 %8_ %7 _
            d14/16/17 <<<<<[->>+>+<<<]
            m16/14 >>[-<<+>>]
            <<<<<[-]
            m17/11 >>>>>>[-<<<<<<+>>>>>>]
            <<<<<<<<<<<<<<+
            >>>>>>>>>>>>[
                -
                <<<<<<<<<<<<-
                >+
                #B:main/1_true
            >>>>>>>>>>>]
            <<<<<<<<<<<<[
                -
                >>+
                #B:main/2_false
            <<]
        >>>>>>>]
    <<<<<<<<<]
<]
