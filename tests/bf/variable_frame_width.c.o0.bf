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
            l7 <<<<<<<
        ]
        <<<#mainloop_main
        >#F:main
        >#B:%no_block0_call_for_main
        >#B:%ret_lading_pad
        >#B:%0
        >#B:%call_term_for_0
        <<<#B:%no_block0_call_for_main
        [
            -
            copy up args
            br label %0
            >>+
        <<]
        >>#B:%0
        [
            -
            call @putchar(i8 46)
            enable next block when we return
            >#caller/%call_term_for_0
            +
            putchar intrinsic
            op_to_reg storing const value in temp address
            >#constop_46
            ++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<]
        >#B:%call_term_for_0
        [
            -
            ret void
            zero all function allocs
            <<<<<-
            #dead_frame
            >-
            l1 <
            <[-]
            r1 >
            l5 <<<<<
        >>>>>]
    <<<<]
<]
