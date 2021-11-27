>>>>
++++
>
runtime init:
#__FRAME__ENTRY__
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
			<<<<<<<<<<<
		>>>]
		<#main/11100
		[
			-
			br label %0
			>>#main/0
			+
		<<]
		>>#main/0
		[
			-
			%1 = alloca i8_ align 1
			>>#alloca_%1
			%2 = alloca i8_ align 1
			>#alloca_%2
			store i8 65_ i8* %1_ align 1
			<[-]
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			store i8 32_ i8* %2_ align 1
			>[-]
			++++++++++++++++++++++++++++++++
			%3 = load i8* %1_ align 1
			>#load_%1_to_%3
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%4 = zext i8 %3 to i32
			#%4_zext_i8_%3
			<[->+<]
			%5 = load i8* %2_ align 1
			#load_%2_to_%5
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%6 = zext i8 %5 to i32
			#%6_zext_i8_%5
			<<[->>+<<]
			%7 = add i32 %4_ i32 %6
			#%%7_add_%i32_%4_ci32_%6
			>[-<+>]
			>[-<<+>>]
			%8 = trunc i32 %7 to i8
			<#%8_trunc_i32_%7
			<[->+<]
			call @putchar(i8 %8)
			enable next
			<<<#main/4200
			+
			putchar intrinsic
			>>>>.
			[-]
		<<<<<]
		>#main/4200
		[
			-
			ret i32 0
			>[-]
			>[-]
			<<<<<<<-
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
