r6 >>>>>>
++++++
r1 >
runtime init:
#===TOP_FRAME
+
>>>#main
+
>#main/b0
+
<<<<[
    >#putstr
    [
        >>>>#B:%ret_lading_pad
        [
            <<<<<-
            #dead_frame
            >-
            <#dead_fn_pad/putstr
            >>>>>-
            l24 <<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_putstr
        >#F:putstr
        >#F:putdec
        >#F:main
        >#B:%1
        >#B:%ret_lading_pad
        >#B:%3
        >#B:%call_term_for_1
        >#B:%9
        >#%2_=_icmp_eq_i8*_%0__i8*_null(mult)
        >#%4_=_phi_i8*_{_i8*_%7__%call_term_for_1_}__{_i8*_%0__%1_}(mult)
        >#%5_=_ptrtoint_i8*_%4_to_i64(mult)
        >#%6_=_trunc_i64_%5_to_i8(mult)
        >#%7_=_getelementptr_i8*_%4__i64_1(mult)
        >#%8_=_icmp_eq_i8*_%7__i8*_null(mult)
        >#%0
        <<<<<<<<<<<#B:%1
        [
            -
            copy up args
            >>>>>>>>>>>#arg_%0
            l2 <<
            mov0/17 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
            r2 >>
            %2 = icmp eq i8* %0_ i8* null
            >>>>>>>>>[-]
            op_to_reg storing const value in temp address
            >>>>>>>#constop_0
            
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov16/18 <<<<[->>+<<]
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
            <<<<<<<<<<<+
            >>>>>>>>>[
                [-]
                <<<<<<<<<[-]
            >>>>>>>>>]
            <[
                [-]
                <<<<<<<<[-]
            >>>>>>>>]
            br i1 %2_ label %9_ label %3
            doing phi stuff
            %4 = phi i8* _ i8* %7_ %call_term_for_1 __ _ i8* %0_ %1 _
            dup15/16/17 <<[->+>+<<]
            mov16/15 >[-<+>]
            <<<<<<[-]
            mov17/10 >>>>>>>[-<<<<<<<+>>>>>>>]
            <<<<<<<<<<<<+
            >>>>[
                -
                <<<<-
                >>>+
                #B:putstr/9_true
            >]
            <<<<[
                -
                >+
                #B:putstr/3_false
            <]
        <]
        >>#B:%3
        [
            -
            %4 = phi i8* _ i8* %7_ %call_term_for_1 __ _ i8* %0_ %1 _
            %5 = ptrtoint i8* %4 to i64
            >>>>>[-]
            dup10/18/19 <[->>>>>>>>+>+<<<<<<<<<]
            mov18/10 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            mov19/11 >[-<<<<<<<<+>>>>>>>>]
            %6 = trunc i64 %5 to i8
            <<<<<<<[-]
            dup11/16/17 <[->>>>>+>+<<<<<<]
            mov16/11 >>>>>[-<<<<<+>>>>>]
            mov17/12 >[-<<<<<+>>>>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<<<<#caller/%call_term_for_1
            +
            putchar intrinsic
            dup12/16/17 >>>>>[->>>>+>+<<<<<]
            mov16/12 >>>>[-<<<<+>>>>]
            >.
            [-]
        <<<<<<<<<<<]
        >#B:%call_term_for_1
        [
            -
            %7 = getelementptr i8* %4_ i64 1
            >>>>>>[-]
            dup10/16/17 <<<[->>>>>>+>+<<<<<<<]
            mov16/10 >>>>>>[-<<<<<<+>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            mov17/13 <[-<<<<+>>>>]
            >[
                -
                <<<<<+
            >>>>>]
            %8 = icmp eq i8* %7_ i8* null
            <<<<[-]
            dup13/16/17 <[->>>+>+<<<<]
            mov16/13 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_0
            
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov18/21 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<[
                -
                >>+
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
            <<<<]
            >>>>>>-
            <<<<<<<<<+
            >>>>>>>[
                [-]
                <<<<<<<[-]
            >>>>>>>]
            <<[
                [-]
                <<<<<[-]
            >>>>>]
            br i1 %8_ label %9_ label %3
            doing phi stuff
            %4 = phi i8* _ i8* %7_ %call_term_for_1 __ _ i8* %0_ %1 _
            dup13/16/17 <<<<<<[->>>+>+<<<<]
            mov16/13 >>>[-<<<+>>>]
            <<<<<<[-]
            mov17/10 >>>>>>>[-<<<<<<<+>>>>>>>]
            <<<<<<<<<<<<+
            >>>>>>>>>[
                -
                <<<<<<<<<-
                >>>+
                #B:putstr/9_true
            >>>>>>]
            <<<<<<<<<[
                -
                >+
                #B:putstr/3_false
            <]
        >>]
        >#B:%9
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
            <<<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>]
    <<<<<<<]
    >#putdec
    [
        >>>#B:%ret_lading_pad
        [
            <<<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/putdec
            >>>>>-
            l45 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_putdec
        >#F:putstr
        >#F:putdec
        >#F:main
        >#B:%1
        >#B:%ret_lading_pad
        >#B:%3
        >#B:%5
        >#B:%call_term_for_2
        >#B:%6
        >#B:%9
        >#B:%14
        >#B:%call_term_for_6
        >#B:%23
        >#%2_=_icmp_eq_i32_%0__i32_0(mult)
        >#%4_=_icmp_sgt_i32_%0__i32_10(mult)
        >#%7_=_phi_i32_{_i32_1__%3_}__{_i32_%11__%9_}(mult)
        >#%8_=_icmp_eq_i32_%7__i32_0(mult)
        >#%10_=_phi_i32_{_i32_%11__%9_}__{_i32_1__%3_}(mult)
        >#%11_=_mul_i32_%10__i32_10(mult)
        >#%12_=_sdiv_i32_%0__i32_%11(mult)
        >#%13_=_icmp_sgt_i32_%12__i32_10(mult)
        >#%15_=_phi_i32_{_i32_%20__%call_term_for_6_}__{_i32_%7__%6_}(mult)
        >#%16_=_sdiv_i32_%0__i32_%15(mult)
        >#%17_=_srem_i32_%16__i32_10(mult)
        >#%18_=_trunc_i32_%17_to_i8(mult)
        >#%19_=_add_i8_%18__i8_48(mult)
        >#%20_=_sdiv_i32_%15__i32_10(mult)
        >#%21_=_add_i32_%15__i32_9(mult)
        >#%22_=_icmp_ult_i32_%21__i32_19(mult)
        >#%0
        <<<<<<<<<<<<<<<<<<<<<<<<<<#B:%1
        [
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            mov0/32 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            %2 = icmp eq i32 %0_ i32 0
            >>>>>>>>>>>>>>[-]
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>#constop_0
            
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov31/33 <<<<[->>+<<]
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
            <<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>[
                [-]
                <<<<<<<<<<<<<<<<<<<[-]
            >>>>>>>>>>>>>>>>>>>]
            <[
                [-]
                <<<<<<<<<<<<<<<<<<[-]
            >>>>>>>>>>>>>>>>>>]
            br i1 %2_ label %5_ label %3
            <<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>[
                -
                <<<<<<<<<-
                >>+
                #B:putdec/5_true
            >>>>>>>]
            <<<<<<<<<[
                -
                >+
                #B:putdec/3_false
            <]
        <]
        >>#B:%3
        [
            -
            %4 = icmp sgt i32 %0_ i32 10
            >>>>>>>>>[-]
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>#constop_10
            ++++++++++
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov30/32 <<<<[->>+<<]
            >>>>+
            <<<[
                -
                
                >[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <]
            >>>-
            <<[
                [-]
                <<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>]
            br i1 %4_ label %9_ label %6
            doing phi stuff
            %10 = phi i32 _ i32 %11_ %9 __ _ i32 1_ %3 _
            op_to_reg storing const value in temp address
            <#constop_1
            +
            <<<<<<<<<<<<<[-]
            mov31/18 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            doing phi stuff
            %7 = phi i32 _ i32 1_ %3 __ _ i32 %11_ %9 _
            op_to_reg storing const value in temp address
            >#constop_1
            +
            <<<<<<<<<<<<<<<<[-]
            mov32/16 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>[
                -
                <<<<<<<<<<-
                >>>>>+
                #B:putdec/9_true
            >>>>>]
            <<<<<<<<<<[
                -
                >>>>+
                #B:putdec/6_false
            <<<<]
        >]
        >#B:%5
        [
            -
            call @putchar(i8 48)
            enable next block when we return
            >#caller/%call_term_for_2
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>>>>>>#constop_48
            ++++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            br label %23
            >>>>>+
        <<<<<]
        >#B:%6
        [
            -
            %7 = phi i32 _ i32 1_ %3 __ _ i32 %11_ %9 _
            %8 = icmp eq i32 %7_ i32 0
            >>>>>>>>[-]
            dup16/31/32 <[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            mov31/16 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_0
            
            >>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov33/36 <<<<<[->>>+<<<]
            >>>>>+
            <<<<<<[
                -
                >>+
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
            <<<<]
            >>>>>>-
            <<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>[
                [-]
                <<<<<<<<<<<<<<<<<<<[-]
            >>>>>>>>>>>>>>>>>>>]
            <<[
                [-]
                <<<<<<<<<<<<<<<<<[-]
            >>>>>>>>>>>>>>>>>]
            br i1 %8_ label %23_ label %14
            doing phi stuff
            %15 = phi i32 _ i32 %20_ %call_term_for_6 __ _ i32 %7_ %6 _
            dup16/31/32 <<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            mov31/16 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            <<<<<<<<<[-]
            mov32/22 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>[
                -
                <<<<<<<<<<<<-
                >>>>>>>>+
                #B:putdec/23_true
            >>>>]
            <<<<<<<<<<<<[
                -
                >>>>>>+
                #B:putdec/14_false
            <<<<<<]
        >>>>]
        >#B:%9
        [
            -
            %10 = phi i32 _ i32 %11_ %9 __ _ i32 1_ %3 _
            %11 = mul i32 %10_ i32 10
            >>>>>>>>>[-]
            dup18/33/34 <[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            mov33/18 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_10
            ++++++++++
            [
                -
                dup34/19/36 <[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>+<<]
                mov36/34 >>[-<<+>>]
            <]
            <[-]
            %12 = sdiv i32 %0_ i32 %11
            <<<<<<<<<<<<<<[-]
            dup19/31/32 <[->>>>>>>>>>>>+>+<<<<<<<<<<<<<]
            mov31/19 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            dup32/34/35 >[->>+>+<<<]
            mov35/32 >>>[-<<<+>>>]
            <<<<<[
                >>>>>>>>>#subnu_tmpb
                >#subnu_tmp0
                >#subnu_tmp1
                mov30/39 <<<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
                >>>>>>>>>>>+
                <<<<<<<[
                    -
                    <+
                    >>>>>>[
                        -
                        <<<<<<-
                        r1 >
                    >>>>>>]
                    r1 >
                    [
                        l1 <
                    ]
                    l1 <
                <<<<<]
                >>>>>>>-
                <<<<<<<<<<<<<<<<<<<<<+
                >>>>>>>>>>>>>[
                    [-]
                    <<<<<<<<<<<<<-
                >>>>>>>>>>>>>]
                mov39/30 >>>>>>[-<<<<<<<<<+>>>>>>>>>]
                dup32/34/35 <<<<<<<[->>+>+<<<]
                mov35/32 >>>[-<<<+>>>]
            <<<<<]
            >>[-]
            >>[-]
            %13 = icmp sgt i32 %12_ i32 10
            <<<<<<<<<<<<<[-]
            dup20/31/32 <[->>>>>>>>>>>+>+<<<<<<<<<<<<]
            mov31/20 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_10
            ++++++++++
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov32/34 <<<<[->>+<<]
            >>>>+
            <<<[
                -
                
                >[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <]
            >>>-
            <<[
                [-]
                <<<<<<<<<<<<<+
            >>>>>>>>>>>>>]
            br i1 %13_ label %9_ label %6
            doing phi stuff
            %10 = phi i32 _ i32 %11_ %9 __ _ i32 1_ %3 _
            dup19/31/32 <<<<<<<<<<<<<<<[->>>>>>>>>>>>+>+<<<<<<<<<<<<<]
            mov31/19 >>>>>>>>>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
            <<<<<<<<<<<<<[-]
            mov32/18 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            doing phi stuff
            %7 = phi i32 _ i32 1_ %3 __ _ i32 %11_ %9 _
            dup19/33/34 <<<<<<<<<<<<<[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            mov33/19 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<[-]
            mov34/16 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<-
                >>>>>+
                #B:putdec/9_true
            >>>>>>>>>>>]
            <<<<<<<<<<<<<<<<[
                -
                >>>>+
                #B:putdec/6_false
            <<<<]
        >>>>>]
        >#B:%14
        [
            -
            %15 = phi i32 _ i32 %20_ %call_term_for_6 __ _ i32 %7_ %6 _
            %16 = sdiv i32 %0_ i32 %15
            >>>>>>>>>>>>[-]
            dup22/35/36 <[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
            mov35/22 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            dup36/38/39 >[->>+>+<<<]
            mov39/36 >>>[-<<<+>>>]
            <<<<<<<<<[
                >>>>>>>>>>>>#subnu_tmpb
                >#subnu_tmp0
                >#subnu_tmp1
                mov30/42 <<<<<<<<<<<<<<[->>>>>>>>>>>>+<<<<<<<<<<<<]
                >>>>>>>>>>>>>>+
                <<<<<<[
                    -
                    <+
                    >>>>>[
                        -
                        <<<<<-
                        r1 >
                    >>>>>]
                    r1 >
                    [
                        l1 <
                    ]
                    l1 <
                <<<<]
                >>>>>>-
                <<<<<<<<<<<<<<<<<<<<<+
                >>>>>>>>>>>>>>[
                    [-]
                    <<<<<<<<<<<<<<-
                >>>>>>>>>>>>>>]
                mov42/30 >>>>>[-<<<<<<<<<<<<+>>>>>>>>>>>>]
                dup36/38/39 <<<<<<[->>+>+<<<]
                mov39/36 >>>[-<<<+>>>]
            <<<<<<<<<]
            >>>>>>[-]
            >>[-]
            %17 = srem i32 %16_ i32 10
            <<<<<<<<<<<<<<[-]
            dup23/31/32 <[->>>>>>>>+>+<<<<<<<<<]
            mov31/23 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_10
            ++++++++++
            dup33/35/36 [->>+>+<<<]
            mov36/33 >>>[-<<<+>>>]
            <<<<#op0
            >#op1
            >#neg
            <<[
                >>>>>#subnu_tmpb
                >#subnu_tmp0
                >#subnu_tmp1
                mov32/37 <<<<<<<[->>>>>+<<<<<]
                >>>>>>>+
                <<<<[
                    -
                    <+
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
                <<]
                >>>>-
                mov37/32 <<[-<<<<<+>>>>>]
                dup33/35/36 <<<<[->>+>+<<<]
                mov36/33 >>>[-<<<+>>>]
            <<<<]
            >>#neg
            [
                mov35/24 >[-<<<<<<<<<<<+>>>>>>>>>>>]
                <[
                    -
                    <<<<<<<<<<-
                >>>>>>>>>>]
            ]
            mov34/24 [-<<<<<<<<<<+>>>>>>>>>>]
            <[-]
            >>[-]
            %18 = trunc i32 %17 to i8
            <<<<<<<<<<[-]
            dup24/31/32 <[->>>>>>>+>+<<<<<<<<]
            mov31/24 >>>>>>>[-<<<<<<<+>>>>>>>]
            mov32/25 >[-<<<<<<<+>>>>>>>]
            %19 = add i8 %18_ i8 48
            <<<<<<[-]
            dup25/31/32 <[->>>>>>+>+<<<<<<<]
            mov31/25 >>>>>>[-<<<<<<+>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_48
            ++++++++++++++++++++++++++++++++++++++++++++++++
            mov32/26 <[-<<<<<<+>>>>>>]
            >[
                -
                <<<<<<<+
            >>>>>>>]
            call @putchar(i8 %19)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_6
            +
            putchar intrinsic
            dup26/31/32 >>>>>>>>>>>>>>[->>>>>+>+<<<<<<]
            mov31/26 >>>>>[-<<<<<+>>>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_6
        [
            -
            %20 = sdiv i32 %15_ i32 10
            >>>>>>>>>>>>>>>[-]
            dup22/31/32 <<<<<[->>>>>>>>>+>+<<<<<<<<<<]
            mov31/22 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_10
            ++++++++++
            dup33/35/36 [->>+>+<<<]
            mov36/33 >>>[-<<<+>>>]
            <<<<[
                >>>>>#subnu_tmpb
                >#subnu_tmp0
                >#subnu_tmp1
                mov32/37 <<<<<<<[->>>>>+<<<<<]
                >>>>>>>+
                <<<<[
                    -
                    <+
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
                <<]
                >>>>-
                <<<<<<<<<<<<+
                >>>>>>>[
                    [-]
                    <<<<<<<-
                >>>>>>>]
                mov37/32 >>>[-<<<<<+>>>>>]
                dup33/35/36 <<<<[->>+>+<<<]
                mov36/33 >>>[-<<<+>>>]
            <<<<]
            >[-]
            >>[-]
            %21 = add i32 %15_ i32 9
            <<<<<<<[-]
            dup22/31/32 <<<<<<[->>>>>>>>>+>+<<<<<<<<<<]
            mov31/22 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_9
            +++++++++
            mov32/28 <[-<<<<+>>>>]
            >[
                -
                <<<<<+
            >>>>>]
            %22 = icmp ult i32 %21_ i32 19
            <<<<[-]
            dup28/31/32 <[->>>+>+<<<<]
            mov31/28 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_19
            +++++++++++++++++++
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov33/34 <<<[->+<]
            >>>+
            <<<<[
                -
                
                >>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<]
            >>>>-
            <<[
                [-]
                <<<<<+
            >>>>>]
            br i1 %22_ label %23_ label %14
            doing phi stuff
            %15 = phi i32 _ i32 %20_ %call_term_for_6 __ _ i32 %7_ %6 _
            <<<<<<<<<<<<[-]
            mov27/22 >>>>>[-<<<<<+>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>>>>>+
                #B:putdec/23_true
            >>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>+
                #B:putdec/14_false
            <<<<<<]
        >>>>>>>]
        >#B:%23
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
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l8 <<<<<<<<
        >>>>>>>>>>>>>]
    <<<<<<<<<<<]
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<<<-
            #dead_frame
            >>>-
            <<<#dead_fn_pad/main
            >>>>>-
            l25 <<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<<#mainloop_main
        >#F:putstr
        >#F:putdec
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%1
        >#B:%2
        >#B:%call_term_for_2
        >#%3_=_phi_i32_{_i32_1__%0_}__{_i32_%7__%call_term_for_2_}(mult)
        >#%4_=_udiv_i32_25__i32_%3(mult)
        >#%5_=_trunc_i32_%4_to_i8(mult)
        >#%6_=_add_i8_%5__i8_65(mult)
        >#%7_=_add_i32_%3__i32_1(mult)
        >#%8_=_icmp_eq_i32_%7__i32_60(mult)
        <<<<<<<<<<#B:%0
        [
            -
            copy up args
            br label %2
            doing phi stuff
            %3 = phi i32 _ i32 1_ %0 __ _ i32 %7_ %call_term_for_2 _
            op_to_reg storing const value in temp address
            >>>>>>>>>>>#constop_1
            +
            <<<<<<[-]
            mov15/9 >>>>>>[-<<<<<<+>>>>>>]
            <<<<<<<<+
        <<<]
        >>#B:%1
        [
            -
            ret void
            zero all function allocs
            >>>[-]
            >[-]
            >[-]
            >[-]
            >[-]
            >[-]
            <<<<<<<<<<<<<<-
            #dead_frame
            >>>-
            l1 <
            <<<[-]
            r1 >
            l7 <<<<<<<
        >>>>>>]
        >#B:%2
        [
            -
            %3 = phi i32 _ i32 1_ %0 __ _ i32 %7_ %call_term_for_2 _
            %4 = udiv i32 25_ i32 %3
            >>>[-]
            op_to_reg storing const value in temp address
            >>>>>>#constop_25
            +++++++++++++++++++++++++
            dup9/17/18 <<<<<<<[->>>>>>>>+>+<<<<<<<<<]
            mov17/9 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            dup18/20/21 >[->>+>+<<<]
            mov21/18 >>>[-<<<+>>>]
            <<<<<[
                >>>>>>#subnu_tmpb
                >#subnu_tmp0
                >#subnu_tmp1
                mov16/22 <<<<<<<<[->>>>>>+<<<<<<]
                >>>>>>>>+
                <<<<[
                    -
                    <+
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
                <<]
                >>>>-
                <<<<<<<<<<<<<<+
                >>>>>>>>>[
                    [-]
                    <<<<<<<<<-
                >>>>>>>>>]
                mov22/16 >>>[-<<<<<<+>>>>>>]
                dup18/20/21 <<<<[->>+>+<<<]
                mov21/18 >>>[-<<<+>>>]
            <<<<<]
            >>[-]
            >>[-]
            %5 = trunc i32 %4 to i8
            <<<<<<<<<[-]
            dup10/15/16 <[->>>>>+>+<<<<<<]
            mov15/10 >>>>>[-<<<<<+>>>>>]
            mov16/11 >[-<<<<<+>>>>>]
            %6 = add i8 %5_ i8 65
            <<<<[-]
            dup11/15/16 <[->>>>+>+<<<<<]
            mov15/11 >>>>[-<<<<+>>>>]
            op_to_reg storing const value in temp address
            >>#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            mov16/12 <[-<<<<+>>>>]
            >[
                -
                <<<<<+
            >>>>>]
            call @putchar(i8 %6)
            enable next block when we return
            <<<<<<<<<#caller/%call_term_for_2
            +
            putchar intrinsic
            dup12/15/16 >>>>[->>>+>+<<<<]
            mov15/12 >>>[-<<<+>>>]
            >.
            [-]
        <<<<<<<<<]
        >#B:%call_term_for_2
        [
            -
            %7 = add i32 %3_ i32 1
            >>>>>[-]
            dup9/15/16 <<<<[->>>>>>+>+<<<<<<<]
            mov15/9 >>>>>>[-<<<<<<+>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            mov16/13 <[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            %8 = icmp eq i32 %7_ i32 60
            <<<[-]
            dup13/15/16 <[->>+>+<<<]
            mov15/13 >>[-<<+>>]
            op_to_reg storing const value in temp address
            >>#constop_60
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            mov17/19 <<<<[->>+<<]
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
            br i1 %8_ label %1_ label %2
            doing phi stuff
            %3 = phi i32 _ i32 1_ %0 __ _ i32 %7_ %call_term_for_2 _
            dup13/15/16 <<<<<[->>+>+<<<]
            mov15/13 >>[-<<+>>]
            <<<<<<[-]
            mov16/9 >>>>>>>[-<<<<<<<+>>>>>>>]
            <<<<<<<<<<<+
            >>>>>>>>>[
                -
                <<<<<<<<<-
                >+
                #B:main/1_true
            >>>>>>>>]
            <<<<<<<<<[
                -
                >>+
                #B:main/2_false
            <<]
        >>>]
    <<<<<]
<<<]
