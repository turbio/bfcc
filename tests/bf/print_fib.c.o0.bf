r5 >>>>>
+++++
r1 >
runtime init:
#===TOP_FRAME
+
>>#main
+
>#main/b0
+
<<<[
    >#printi
    [
        >>>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >-
            <#dead_fn_pad/printi
            >>>>-
            l36 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_printi
        >#F:printi
        >#F:main
        >#B:%1
        >#B:%ret_lading_pad
        >#B:%4
        >#B:%5
        >#B:%8
        >#B:%13
        >#B:%call_term_for_4
        >#B:%18
        >#B:%21
        >#alloc_%2
        >#alloc_%3
        >#%6_=_load_i32*_%2__align_4(mult)
        >#%7_=_icmp_sgt_i32_%6__i32_10(mult)
        >#%9_=_load_i32*_%2__align_4(mult)
        >#%10_=_sub_i32_%9__i32_10(mult)
        >#%11_=_load_i32*_%3__align_4(mult)
        >#%12_=_add_i32_%11__i32_1(mult)
        >#%14_=_load_i32*_%2__align_4(mult)
        >#%15_=_add_i32_48__i32_%14(mult)
        >#%16_=_trunc_i32_%15_to_i8(mult)
        >#%17_=_load_i32*_%3__align_4(mult)
        >#%19_=_load_i32*_%3__align_4(mult)
        >#%20_=_icmp_ne_i32_%19__i32_0(mult)
        >#%0
        <<<<<<<<<<<<<<<<<<<<<<<#B:%1
        [
            -
            copy up args
            >>>>>>>>>>>>>>>>>>>>>>>#arg_%0
            l2 <<
            m0/28 <<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            r2 >>
            %2 = alloca i32_ align 4
            %3 = alloca i32_ align 4
            store i32 %0_ i32* %2_ align 4
            >>>>>>>>>>>>[-]
            m26/12 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            br label %4
            <<<<<<<<<<<<<<<<<<<<<+
        <<]
        >>#B:%4
        [
            -
            store i32 0_ i32* %3_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>>>#constop_0
            
            <<<<<<<<<<<<<<[-]
            m27/13 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            br label %5
            <<<<<<<<<<<<<<<<<<<<<+
        <]
        >#B:%5
        [
            -
            %6 = load i32* %2_ align 4
            >>>>>>>>[-]
            d12/14/28 <<[->>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
            m28/12 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            %7 = icmp sgt i32 %6_ i32 10
            <<<<<<<<<<<<<[-]
            d14/27/29 <[->>>>>>>>>>>>>+>>+<<<<<<<<<<<<<<<]
            m27/14 >>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
            op_to_reg storing const value in temp address
            >#constop_10
            ++++++++++
            >>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m29/30 <<<[->+<]
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
                <<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>]
            br i1 %7_ label %8_ label %13
            <<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>[
                -
                <<<<<<<<<<<-
                >>>+
                #B:printi/8_true
            >>>>>>>>]
            <<<<<<<<<<<[
                -
                >>>>+
                #B:printi/13_false
            <<<<]
        >>]
        >#B:%8
        [
            -
            %9 = load i32* %2_ align 4
            >>>>>>>>>[-]
            d12/16/27 <<<<[->>>>+>>>>>>>>>>>+<<<<<<<<<<<<<<<]
            m27/12 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            %10 = sub i32 %9_ i32 10
            <<<<<<<<<<[-]
            d16/27/28 <[->>>>>>>>>>>+>+<<<<<<<<<<<<]
            m27/16 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_10
            ++++++++++
            m28/17 <[-<<<<<<<<<<<+>>>>>>>>>>>]
            >[
                -
                <<<<<<<<<<<<-
            >>>>>>>>>>>>]
            store i32 %10_ i32* %2_ align 4
            d17/27/28 <<<<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m27/17 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            <<<<<<<<<<<<<<<[-]
            m28/12 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            %11 = load i32* %3_ align 4
            <<<<<<<<<<[-]
            d13/18/27 <<<<<[->>>>>+>>>>>>>>>+<<<<<<<<<<<<<<]
            m27/13 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            %12 = add i32 %11_ i32 1
            <<<<<<<<[-]
            d18/27/28 <[->>>>>>>>>+>+<<<<<<<<<<]
            m27/18 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m28/19 <[-<<<<<<<<<+>>>>>>>>>]
            >[
                -
                <<<<<<<<<<+
            >>>>>>>>>>]
            store i32 %12_ i32* %3_ align 4
            d19/27/28 <<<<<<<<<<[->>>>>>>>+>+<<<<<<<<<]
            m27/19 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            <<<<<<<<<<<<<<[-]
            m28/13 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            br label %5
            <<<<<<<<<<<<<<<<<<<<<<+
        >]
        >#B:%13
        [
            -
            %14 = load i32* %2_ align 4
            >>>>>>>>>>>>[-]
            d12/20/27 <<<<<<<<[->>>>>>>>+>>>>>>>+<<<<<<<<<<<<<<<]
            m27/12 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            %15 = add i32 48_ i32 %14
            <<<<<<[-]
            op_to_reg storing const value in temp address
            >>>>>>#constop_48
            ++++++++++++++++++++++++++++++++++++++++++++++++
            d20/28/29 <<<<<<<[->>>>>>>>+>+<<<<<<<<<]
            m28/20 >>>>>>>>[-<<<<<<<<+>>>>>>>>]
            m27/21 <[-<<<<<<+>>>>>>]
            >>[
                -
                <<<<<<<<+
            >>>>>>>>]
            %16 = trunc i32 %15 to i8
            <<<<<<<[-]
            d21/27/28 <[->>>>>>+>+<<<<<<<]
            m27/21 >>>>>>[-<<<<<<+>>>>>>]
            m28/22 >[-<<<<<<+>>>>>>]
            call @putchar(i8 %16)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<#caller/%call_term_for_4
            +
            putchar intrinsic
            d22/27/28 >>>>>>>>>>>>>[->>>>>+>+<<<<<<]
            m27/22 >>>>>[-<<<<<+>>>>>]
            >.
            [-]
        <<<<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_4
        [
            -
            %17 = load i32* %3_ align 4
            >>>>>>>>>>>>>>[-]
            d13/23/27 <<<<<<<<<<[->>>>>>>>>>+>>>>+<<<<<<<<<<<<<<]
            m27/13 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            store i32 %17_ i32* %2_ align 4
            d23/27/28 <<<<[->>>>+>+<<<<<]
            m27/23 >>>>[-<<<<+>>>>]
            <<<<<<<<<<<<<<<[-]
            m28/12 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            br label %18
            <<<<<<<<<<<<<<<<<<+
        <]
        >#B:%18
        [
            -
            %19 = load i32* %3_ align 4
            >>>>>>>>>>>>>>[-]
            d13/24/27 <<<<<<<<<<<[->>>>>>>>>>>+>>>+<<<<<<<<<<<<<<]
            m27/13 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            %20 = icmp ne i32 %19_ i32 0
            <<[-]
            d24/27/28 <[->>>+>+<<<<]
            m27/24 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_0
            
            >>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m28/33 <<<<<<<[->>>>>+<<<<<]
            >>>>>>>+
            <<<<<<[
                -
                >+
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
            <<<<]
            >>>>>>-
            <<[
                [-]
                <<<<<<<<+
            >>>>>>>>]
            <<<[
                [-]
                <<<<<+
            >>>>>]
            br i1 %20_ label %4_ label %21
            <<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<-
                >+
                #B:printi/4_true
            >>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>+
                #B:printi/21_false
            <<<<<<<]
        >>>>>>]
        >#B:%21
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
            <<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l7 <<<<<<<
        >>>>>>>>>>>]
    <<<<<<<<<<]
    >#main
    [
        >>#B:%ret_lading_pad
        [
            <<<<-
            #dead_frame
            >>-
            <<#dead_fn_pad/main
            >>>>-
            l51 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        ]
        <<<<#mainloop_main
        >#F:printi
        >#F:main
        >#B:%0
        >#B:%ret_lading_pad
        >#B:%7
        >#B:%12
        >#B:%call_term_for_2
        >#B:%20
        >#B:%call_term_for_4
        >#B:%21
        >#B:%30
        >#B:%33
        >#alloc_%1
        >#alloc_%2
        >#alloc_%3
        >#alloc_%4
        >#alloc_%5
        >#alloc_%6
        >#%8_=_load_i8*_%5__align_1(mult)
        >#%9_=_zext_i8_%8_to_i32(mult)
        >#%10_=_load_i32*_%4__align_4(mult)
        >#%11_=_icmp_slt_i32_%9__i32_%10(mult)
        >#%13_=_load_i8*_%2__align_1(mult)
        >#%14_=_zext_i8_%13_to_i32(mult)
        >#%15_=_load_i8*_%5__align_1(mult)
        >#%16_=_zext_i8_%15_to_i32(mult)
        >#%17_=_load_i32*_%4__align_4(mult)
        >#%18_=_sub_i32_%17__i32_1(mult)
        >#%19_=_icmp_slt_i32_%16__i32_%18(mult)
        >#%22_=_load_i8*_%3__align_1(mult)
        >#%23_=_load_i8*_%2__align_1(mult)
        >#%24_=_load_i8*_%6__align_1(mult)
        >#%25_=_zext_i8_%24_to_i32(mult)
        >#%26_=_load_i8*_%2__align_1(mult)
        >#%27_=_zext_i8_%26_to_i32(mult)
        >#%28_=_add_i32_%27__i32_%25(mult)
        >#%29_=_trunc_i32_%28_to_i8(mult)
        >#%31_=_load_i8*_%5__align_1(mult)
        >#%32_=_add_i8_%31__i8_1(mult)
        >#%34_=_load_i32*_%1__align_4(mult)
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#B:%0
        [
            -
            copy up args
            %1 = alloca i32_ align 4
            %2 = alloca i8_ align 1
            %3 = alloca i8_ align 1
            %4 = alloca i32_ align 4
            %5 = alloca i8_ align 1
            %6 = alloca i8_ align 1
            store i32 0_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#constop_0
            
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m41/13 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            store i8 1_ i8* %2_ align 1
            op_to_reg storing const value in temp address
            >#constop_1
            +
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m42/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            store i8 0_ i8* %3_ align 1
            op_to_reg storing const value in temp address
            <#constop_0
            
            <<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m41/15 >>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>]
            store i32 10_ i32* %4_ align 4
            op_to_reg storing const value in temp address
            #constop_10
            ++++++++++
            <<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m41/16 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            store i8 0_ i8* %5_ align 1
            op_to_reg storing const value in temp address
            #constop_0
            
            <<<<<<<<<<<<<<<<<<<<<<<<[-]
            m41/17 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %7
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
        <<]
        >>#B:%7
        [
            -
            %8 = load i8* %5_ align 1
            >>>>>>>>>>>>>>[-]
            d17/19/41 <<[->>+>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/17 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %9 = zext i8 %8 to i32
            <<<<<<<<<<<<<<<<<<<<<[-]
            d19/41/43 <[->>>>>>>>>>>>>>>>>>>>>>+>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/19 >>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
            m43/20 >>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            %10 = load i32* %4_ align 4
            <<<<<<<<<<<<<<<<<<<<<<[-]
            d16/21/41 <<<<<[->>>>>+>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/16 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            %11 = icmp slt i32 %9_ i32 %10
            <<<<<<<<<<<<<<<<<<<[-]
            d20/41/42 <<[->>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<]
            m41/20 >>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
            d21/44/43 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<<<<<<<]
            m44/21 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            >#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m43/45 <<<<[->>+<<]
            >>>>+
            <<<<<[
                -
                
                >>>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<]
            >>>>>-
            <<[
                [-]
                <<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>]
            br i1 %11_ label %12_ label %33
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<-
                >>+
                #B:main/12_true
            >>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<[
                -
                >>>>>>>>+
                #B:main/33_false
            <<<<<<<<]
        >]
        >#B:%12
        [
            -
            %13 = load i8* %2_ align 1
            >>>>>>>>>>>>>>>>>[-]
            d14/23/41 <<<<<<<<<[->>>>>>>>>+>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            %14 = zext i8 %13 to i32
            <<<<<<<<<<<<<<<<<[-]
            d23/41/42 <[->>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<]
            m41/23 >>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            m42/24 >[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
            call @printi(i32 %14)
            enable next block when we return
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#caller/%call_term_for_2
            +
            stack_width 51
            ret_pad_width 4
            copy up arg 0
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
            d24/41/42 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
            m41/24 >>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
            m42/56 >[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
            give callee a stack pointer
            >>>>>>>>>>>>>>>#stack_ptr
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            l1 <
            d0/58/59 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m59/0 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            r1 >
            r51 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
            +
            >>#caller
            +
            >>#caller/jump_pad_blk
            +
            r7 >>>>>>>
            <<<<#===FRAME_printi
            +
            >#printi
            +
            >>#printi/b0
            +
        >>>]
        >#B:%call_term_for_2
        [
            -
            %15 = load i8* %5_ align 1
            >>>>>>>>>>>>>>>>>>[-]
            d17/25/41 <<<<<<<<[->>>>>>>>+>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/17 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %16 = zext i8 %15 to i32
            <<<<<<<<<<<<<<<[-]
            d25/41/42 <[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
            m41/25 >>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            m42/26 >[-<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>]
            %17 = load i32* %4_ align 4
            <<<<<<<<<<<<<<<[-]
            d16/27/41 <<<<<<<<<<<[->>>>>>>>>>>+>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/16 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            %18 = sub i32 %17_ i32 1
            <<<<<<<<<<<<<[-]
            d27/41/42 <[->>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<]
            m41/27 >>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m42/28 <[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
            >[
                -
                <<<<<<<<<<<<<<<-
            >>>>>>>>>>>>>>>]
            %19 = icmp slt i32 %16_ i32 %18
            <<<<<<<<<<<<<<[-]
            d26/41/42 <<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m41/26 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            d28/43/44 <<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
            m43/28 >>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
            >>>>>#subnu_tmpb
            >#subnu_tmp0
            >#subnu_tmp1
            m44/48 <<<<<<[->>>>+<<<<]
            >>>>>>+
            <<<<<<<<[
                -
                
                >>>>>>[
                    -
                    
                    r1 >
                ]
                r1 >
                [
                    l1 <
                ]
                l1 <
            <<<<<<]
            >>>>>>>>-
            <<[
                [-]
                <<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>]
            br i1 %19_ label %20_ label %21
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
            >>>>>>>>>>>>>>>>>>>>>>>>>[
                -
                <<<<<<<<<<<<<<<<<<<<<<<<<-
                >>>>+
                #B:main/20_true
            >>>>>>>>>>>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<[
                -
                >>>>>>+
                #B:main/21_false
            <<<<<<]
        >>>]
        >#B:%20
        [
            -
            call @putchar(i8 32)
            enable next block when we return
            >#caller/%call_term_for_4
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#constop_32
            ++++++++++++++++++++++++++++++++
            .
            [-]
        <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
        >#B:%call_term_for_4
        [
            -
            br label %21
            >+
        <]
        >#B:%21
        [
            -
            %22 = load i8* %3_ align 1
            >>>>>>>>>>>>>>>>>>>>[-]
            d15/30/41 <<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/15 >>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>]
            store i8 %22_ i8* %6_ align 1
            d30/41/42 <<<<<<<<<<<[->>>>>>>>>>>+>+<<<<<<<<<<<<]
            m41/30 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<[-]
            m42/18 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %23 = load i8* %2_ align 1
            <<<<<<<<<<<[-]
            d14/31/41 <<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            store i8 %23_ i8* %3_ align 1
            d31/41/42 <<<<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m41/31 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m42/15 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            %24 = load i8* %6_ align 1
            <<<<<<<<<<[-]
            d18/32/41 <<<<<<<<<<<<<<[->>>>>>>>>>>>>>+>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
            m41/18 >>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
            %25 = zext i8 %24 to i32
            <<<<<<<<[-]
            d32/41/42 <[->>>>>>>>>+>+<<<<<<<<<<]
            m41/32 >>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
            m42/33 >[-<<<<<<<<<+>>>>>>>>>]
            %26 = load i8* %2_ align 1
            <<<<<<<<[-]
            d14/34/41 <<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            %27 = zext i8 %26 to i32
            <<<<<<[-]
            d34/41/42 <[->>>>>>>+>+<<<<<<<<]
            m41/34 >>>>>>>[-<<<<<<<+>>>>>>>]
            m42/35 >[-<<<<<<<+>>>>>>>]
            %28 = add i32 %27_ i32 %25
            <<<<<<[-]
            d35/41/42 <[->>>>>>+>+<<<<<<<]
            m41/35 >>>>>>[-<<<<<<+>>>>>>]
            d33/43/44 <<<<<<<<[->>>>>>>>>>+>+<<<<<<<<<<<]
            m43/33 >>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
            m42/36 <[-<<<<<<+>>>>>>]
            >>[
                -
                <<<<<<<<+
            >>>>>>>>]
            %29 = trunc i32 %28 to i8
            <<<<<<<[-]
            d36/41/42 <[->>>>>+>+<<<<<<]
            m41/36 >>>>>[-<<<<<+>>>>>]
            m42/37 >[-<<<<<+>>>>>]
            store i8 %29_ i8* %2_ align 1
            d37/41/42 <<<<<[->>>>+>+<<<<<]
            m41/37 >>>>[-<<<<+>>>>]
            <<<<<<<<<<<<<<<<<<<<<<<<<<<[-]
            m42/14 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %30
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
        <]
        >#B:%30
        [
            -
            %31 = load i8* %5_ align 1
            >>>>>>>>>>>>>>>>>>>>>>>>>>>[-]
            d17/38/41 <<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/17 >>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
            %32 = add i8 %31_ i8 1
            <<[-]
            d38/41/42 <[->>>+>+<<<<]
            m41/38 >>>[-<<<+>>>]
            op_to_reg storing const value in temp address
            >>#constop_1
            +
            m42/39 <[-<<<+>>>]
            >[
                -
                <<<<+
            >>>>]
            store i8 %32_ i8* %5_ align 1
            d39/41/42 <<<<[->>+>+<<<]
            m41/39 >>[-<<+>>]
            <<<<<<<<<<<<<<<<<<<<<<<<[-]
            m42/17 >>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>]
            br label %7
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
        >>>>>>]
        >#B:%33
        [
            -
            %34 = load i32* %1_ align 4
            >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]
            d13/40/41 <<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
            m41/13 >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
            ret i32 %34
            zero all function allocs
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<[-]
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
            <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
            #dead_frame
            >>-
            l1 <
            <<[-]
            r1 >
            l6 <<<<<<
        >>>>>>>>>>>>]
    <<<<<<<<<<]
<<]
