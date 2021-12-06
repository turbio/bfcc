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
			<<<<<<<<<<
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
			%1 = alloca i8_ align 1
			>>#alloca_%1
			store i8 97_ i8* %1_ align 1
			>#tmp_constop_97
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<[-]
			>[-<+>]
			%2 = load i8* %1_ align 1
			#load_%1_to_%2
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%3 = add i8 %2_ i8 1
			>#tmp_constop_1
			+
			<#%%3_add_%i8_%2_ci8_1
			<[->+<]
			>>[-<+>]
			store i8 %3_ i8* %1_ align 1
			<<<[-]
			>>[-<<+>>]
			%4 = load i8* %1_ align 1
			<#load_%1_to_%4
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			call @putchar(i8 %4)
			enable next
			<<<#main/%call_term_for_0
			+
			putchar intrinsic
			>>.
			[-]
		<<<]
		>#B:main/%call_term_for_0
		[
			-
			ret void
			>[-]
			<<<<<<-
			#dead_frame
			>-
			<
			<[-]
			>
			<<<<<
		>>>>>]
	<<<<]
<]
