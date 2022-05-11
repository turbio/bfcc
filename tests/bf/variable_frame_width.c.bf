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
            l7 <<<<<<<
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
            call @putchar(i8 46)
            enable next
            >#main/%call_term_for_0
            +
            putchar intrinsic
            >++++++++++++++++++++++++++++++++++++++++++++++
            .
            [-]
        <<]
        >#B:main/%call_term_for_0
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
