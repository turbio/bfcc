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
            l12 <<<<<<<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        >#alloc_%1
        >#%2_=_ptrtoint_i32*_%1_to_i32
        >#%3_=_add_i32_65__i32_%2
        >#%4_=_trunc_i32_%3_to_i8
        <<<<<<<#B:%no_block0_call_for_main
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
            store i32 112_ i32* %1_ align 4
            op_to_reg storing const value in temp address
            >>>>>>#constop_112
            ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            <<<<[-]
            m10/6 >>>>[-<<<<+>>>>]
            %2 = ptrtoint i32* %1 to i32
            resolve alloca addr storing pointer value in temp address
            l1 <
            d0/12/11 <<<<<<<<<<[->>>>>>>>>>>>+<+<<<<<<<<<<<]
            m11/0 >>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
            r1 >
            +++++++
            m11/7 [-<<<<+>>>>]
            %3 = add i32 65_ i32 %2
            op_to_reg storing const value in temp address
            <#constop_65
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            m10/8 [-<<+>>]
            <<<[
                -
                >+
            <]
            %4 = trunc i32 %3 to i8
            m8/9 >[->+<]
            call @putchar(i8 %4)
            enable next block when we return
            <<<#caller/%call_term_for_0
            +
            putchar intrinsic
            >>>>.
            [-]
        <<<<<]
        >#B:%call_term_for_0
        [
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
