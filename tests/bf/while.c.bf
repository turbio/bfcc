>>>>
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
		<#main/0
		[
			-
			%1 = alloca i8_ align 1
			>>>>>>#alloca_%1
			store i8 10_ i8* %1_ align 1
			[-]
			++++++++++
			br label %2
			<<<<#main/2
			+
		<<]
		>>#main/2
		[
			-
			%3 = load i8* %1_ align 1
			>>>>>#load_%1_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = icmp ne i8 %3_ i8 0
			>
			<#%4_icmp_%i8_%3_ne_i8_0
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			>#icmp_under
			<<<<<<[->>>+<<<]
			>>>>>+
			<<<<<<<[
				-
				>>>>>>>>+
				<<<[
					-
					>>>-
					>
				<<<]
				>
				[
					<
				]
				<
			<<<<<]
			>>>>>[
				[-]
				<<<<+
			>>>>]
			>>>[
				[-]
				<<<<<<<+
			>>>>>>>]
			<[-]
			br i1 %4_ label %5_ label %10
			<<<<<<<<<<<<<+
			>>>>>>>
			[-
			<<<<<<<
			-
			>>+
			#main/5_true
			>>>>>
			]
			<<<<<<<
			[-
			>>>>+
			#main/10_false
			<<<<
			]
		>]
		>#main/5
		[
			-
			call @putchar(i8 97)
			enable next
			>#main/4210
			+
			putchar intrinsic
			>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<]
		>#main/4210
		[
			-
			%6 = load i8* %1_ align 1
			>>>#load_%1_to_%6
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%7 = zext i8 %6 to i32
			<#%%7_zext_%i8_%6
			<[->+<]
			%8 = sub i32 %7_ i32 1
			>>+
			<<#%%8_sub_%i32_%7_ci32_1
			>[-<+>]
			>
			[-
			<<
			-
			>>
			]
			%9 = trunc i32 %8 to i8
			<#%%9_trunc_%i32_%8
			<[->+<]
			store i8 %9_ i8* %1_ align 1
			<[-]
			>>[-<<+>>]
			br label %2
			<<<<<<#main/2
			+
		>>]
		>#main/10
		[
			-
			ret void
			>[-]
			<<<<<<<<-
			#dead_frame
			>-
			<
			<<<<
		>>>>>>>]
	<<<<<<]
<]
