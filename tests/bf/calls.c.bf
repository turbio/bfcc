>>>>>>>
runtime init:
#__FRAME__ENTRY__
+
>>>>#main
+
>#main/b0
+
<<<<<[
	>#c
	[
		>>>>>#c/RET_LANDING_PAD
		[
			<<<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/c
			>>>>>>-
			<<<<<<
			<<<<<<<<<
		>>>>>>]
		<#c/11100
		[
			-
			br label %0
			>>#c/0
			+
		<<]
		>>#c/0
		[
			-
			call @putchar(i8 46)
			enable next
			>#c/4200
			+
			putchar intrinsic
			>++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<]
		>#c/4200
		[
			-
			ret void
			<<<<<<<<-
			#dead_frame
			>-
			<
			<<<<<<<
		>>>>>>>>]
	<<<<<<<]
	>#b
	[
		>>>>#b/RET_LANDING_PAD
		[
			<<<<<<-
			#dead_frame
			>>-
			<<#dead_fn_pad/b
			>>>>>>-
			<<<<<<
			<<<<<<<<<<<<<<<
		>>>>>>]
		<#b/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>#alloca_%1
			store i32 0_ i32* %1_ align 4
			[-]
			
			br label %2
			<<<<<#b/2
			+
		<<]
		>>#b/2
		[
			-
			%3 = load i32* %1_ align 4
			>>>>>>#load_%1_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = icmp slt i32 %3_ i32 2
			>++
			<#%4_icmp_%i32_%3_slt_i32_2
			>>#temp0
			>#temp1_a
			>#temp1_b
			>#temp1_c
			<<<<<<[->+<]
			>>>>>+
			<<<[->+>+<<]
			>[-<+>]
			<<[->>+<<]
			+
			>>>
			[>-]> [<
			<<<
			-
			>>
			[-]
			>
			>->]<+<
			<
			[
			>
			- [>-]> [<
			<<<
			-
			>>
			[-]+
			>
			>->]<+<
			<
			-]
			<[-]
			>>[-]
			>[-]
			>[-]
			br i1 %4_ label %5_ label %9
			<<<<<<<<<<<<<+
			>>>>>>>>
			[-
			<<<<<<<<
			-
			>>+
			#b/5_true
			>>>>>>
			]
			<<<<<<<<
			[-
			>>>>>+
			#b/9_false
			<<<<<
			]
		>]
		>#b/5
		[
			-
			call @c()
			enable next
			>#b/4209
			+
			next frame
			<<<<<<<<<
			>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#b
			+
			>>>>#b/jump
			+
			>>>>>>>
			<<<<<<#__FRAME_c__
			+
			>#c
			+
			>>>>#c/b0
			+
		>>>]
		>#b/4209
		[
			-
			br label %6
			>#b/6
			+
		<]
		>#b/6
		[
			-
			%7 = load i32* %1_ align 4
			>>>#load_%1_to_%7
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%8 = add i32 %7_ i32 1
			+
			<#%%8_add_%i32_%7_ci32_1
			<[->+<]
			>>[-<+>]
			store i32 %8_ i32* %1_ align 4
			<<<[-]
			>>[-<<+>>]
			br label %2
			<<<<<<<#b/2
			+
		>>>]
		>#b/9
		[
			-
			ret void
			>[-]
			<<<<<<<<<<<<-
			#dead_frame
			>>-
			<<
			<<<<<<<
		>>>>>>>>>>>]
	<<<<<<<<<]
	>#a
	[
		>>>#a/RET_LANDING_PAD
		[
			<<<<<<-
			#dead_frame
			>>>-
			<<<#dead_fn_pad/a
			>>>>>>-
			<<<<<<
			<<<<<<<<<<<<<<<
		>>>>>>]
		<#a/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>#alloca_%1
			store i32 0_ i32* %1_ align 4
			[-]
			
			br label %2
			<<<<<#a/2
			+
		<<]
		>>#a/2
		[
			-
			%3 = load i32* %1_ align 4
			>>>>>>#load_%1_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = icmp slt i32 %3_ i32 2
			>++
			<#%4_icmp_%i32_%3_slt_i32_2
			>>#temp0
			>#temp1_a
			>#temp1_b
			>#temp1_c
			<<<<<<[->+<]
			>>>>>+
			<<<[->+>+<<]
			>[-<+>]
			<<[->>+<<]
			+
			>>>
			[>-]> [<
			<<<
			-
			>>
			[-]
			>
			>->]<+<
			<
			[
			>
			- [>-]> [<
			<<<
			-
			>>
			[-]+
			>
			>->]<+<
			<
			-]
			<[-]
			>>[-]
			>[-]
			>[-]
			br i1 %4_ label %5_ label %9
			<<<<<<<<<<<<<+
			>>>>>>>>
			[-
			<<<<<<<<
			-
			>>+
			#a/5_true
			>>>>>>
			]
			<<<<<<<<
			[-
			>>>>>+
			#a/9_false
			<<<<<
			]
		>]
		>#a/5
		[
			-
			call @b()
			enable next
			>#a/4209
			+
			next frame
			<<<<<<<<<
			>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>>#a
			+
			>>>#a/jump
			+
			>>>>>>>
			<<<<<<#__FRAME_b__
			+
			>>#b
			+
			>>>#b/b0
			+
		>>>]
		>#a/4209
		[
			-
			br label %6
			>#a/6
			+
		<]
		>#a/6
		[
			-
			%7 = load i32* %1_ align 4
			>>>#load_%1_to_%7
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%8 = add i32 %7_ i32 1
			+
			<#%%8_add_%i32_%7_ci32_1
			<[->+<]
			>>[-<+>]
			store i32 %8_ i32* %1_ align 4
			<<<[-]
			>>[-<<+>>]
			br label %2
			<<<<<<<#a/2
			+
		>>>]
		>#a/9
		[
			-
			ret void
			>[-]
			<<<<<<<<<<<<-
			#dead_frame
			>>>-
			<<<
			<<<<<<<
		>>>>>>>>>>>]
	<<<<<<<<]
	>#main
	[
		>>#main/RET_LANDING_PAD
		[
			<<<<<<-
			#dead_frame
			>>>>-
			<<<<#dead_fn_pad/main
			>>>>>>-
			<<<<<<
			<<<<<<<<<
		>>>>>>]
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
			call @a()
			enable next
			>#main/4200
			+
			next frame
			<<<<<<<<
			>>>>>>>>>
			#JUMP_PAD
			+
			>>>>#main
			+
			>>#main/jump
			+
			>>>>>>>
			<<<<<<#__FRAME_a__
			+
			>>>#a
			+
			>>#a/b0
			+
		>>]
		>#main/4200
		[
			-
			ret void
			<<<<<<<<-
			#dead_frame
			>>>>-
			<<<<
			<<<<<<<
		>>>>>>>>]
	<<<<]
<<<<]
