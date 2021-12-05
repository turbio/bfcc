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
			<<<<<<<<<<
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
			%1 = alloca i8_ align 1
			>>#alloca_%1
			store i8 81_ i8* %1_ align 1
			>#tmp_constop_81
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<[-]
			>[-<+>]
			%2 = load i8* %1_ align 1
			#load_%1_to_%2
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%3 = zext i8 %2 to i32
			#%3_zext_i8_%2
			<[->+<]
			%4 = add i32 %3_ i32 32
			#tmp_constop_32
			++++++++++++++++++++++++++++++++
			>>#%%4_add_%i32_%3_ci32_32
			<[->+<]
			<[->>+<<]
			%5 = trunc i32 %4 to i8
			#%5_trunc_i32_%4
			>>[-<<+>>]
			store i8 %5_ i8* %1_ align 1
			<<<[-]
			>[-<+>]
			%6 = load i8* %1_ align 1
			#load_%1_to_%6
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			call @putchar(i8 %6)
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
			ret i32 0
			>[-]
			<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<
		>>>>>]
	<<<<]
<]
