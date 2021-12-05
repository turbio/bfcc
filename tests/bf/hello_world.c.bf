>>>>
++++
>
runtime init:
#TOP_FRAME
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
			<<<
			<<<<<<<<<<<<<<<<<<
		>>>]
		<#B:main/%call_never_first_formain
		[
			-
			br label %0
			>>#main/%0
			+
		<<]
		>>#B:main/%0
		[
			-
			call @putchar(i8 104)
			enable next
			>#main/%call_term_for_0
			+
			putchar intrinsic
			>>>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<]
		>#B:main/%call_term_for_0
		[
			-
			call @putchar(i8 101)
			enable next
			>#main/%call_term_for_1
			+
			putchar intrinsic
			>>>>>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<]
		>#B:main/%call_term_for_1
		[
			-
			call @putchar(i8 108)
			enable next
			>#main/%call_term_for_2
			+
			putchar intrinsic
			>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<]
		>#B:main/%call_term_for_2
		[
			-
			call @putchar(i8 108)
			enable next
			>#main/%call_term_for_3
			+
			putchar intrinsic
			>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<]
		>#B:main/%call_term_for_3
		[
			-
			call @putchar(i8 111)
			enable next
			>#main/%call_term_for_4
			+
			putchar intrinsic
			>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<]
		>#B:main/%call_term_for_4
		[
			-
			call @putchar(i8 32)
			enable next
			>#main/%call_term_for_5
			+
			putchar intrinsic
			>>>>>>++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<]
		>#B:main/%call_term_for_5
		[
			-
			call @putchar(i8 119)
			enable next
			>#main/%call_term_for_6
			+
			putchar intrinsic
			>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<]
		>#B:main/%call_term_for_6
		[
			-
			call @putchar(i8 111)
			enable next
			>#main/%call_term_for_7
			+
			putchar intrinsic
			>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<]
		>#B:main/%call_term_for_7
		[
			-
			call @putchar(i8 114)
			enable next
			>#main/%call_term_for_8
			+
			putchar intrinsic
			>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<]
		>#B:main/%call_term_for_8
		[
			-
			call @putchar(i8 108)
			enable next
			>#main/%call_term_for_9
			+
			putchar intrinsic
			>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<]
		>#B:main/%call_term_for_9
		[
			-
			call @putchar(i8 100)
			enable next
			>#main/%call_term_for_10
			+
			putchar intrinsic
			>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<]
		>#B:main/%call_term_for_10
		[
			-
			ret i32 0
			<<<<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<
		>>>>>>>>>>>>>>>]
	<<<<<<<<<<<<<<]
<]
