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
			<<<<<<<
		]
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
			<<<<<-
			#dead_frame
			>-
			<
			<[-]
			>
			<<<<<
		>>>>>]
	<<<<]
<]
