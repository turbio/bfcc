>>>>>
++++
>
runtime init:
#__FRAME__ENTRY__
+
>>#main
+
>#main/b0
+
<<<[
	>#lol
	[
		>>>#lol/RET_LANDING_PAD
		[
			<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/lol
			>>>>-
			<<<<
			<<<<<<<<<<<<<<<<<
		>>>>]
		<#lol/15311
		[
			-
			>>>>>>>>#arg_%0
			<<
			<<<<<<<<<<<[->>>>>>>>>>>>>+<<<<<<<<<<<<<]
			>>
			br label %1
			>>>>>#lol/%1
			+
		<<]
		>>#lol/1
		[
			-
			%2 = alloca i32_ align 4
			>>>>>#alloca_%2
			store i32 %0_ i32* %2_ align 4
			[-]
			>[-<+>]
			%3 = load i32* %2_ align 4
			#load_%2_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = add i32 %3_ i32 97
			#tmp_constop_97
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>#%%4_add_%i32_%3_ci32_97
			<<[->>+<<]
			>[->+<]
			%5 = trunc i32 %4 to i8
			<#%5_trunc_i32_%4
			>>[-<<+>>]
			call @putchar(i8 %5)
			enable next
			<<<<<<<#lol/%4211
			+
			putchar intrinsic
			>>>>>.
			[-]
		<<<<<<]
		>#lol/4211
		[
			-
			%6 = load i32* %2_ align 4
			>>>>>#load_%2_to_%6
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%7 = icmp slt i32 %6_ i32 5
			#tmp_constop_5
			+++++
			>#%7_icmp_%i32_%6_slt_i32_5
			>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<[->>+<<]
			>>>>+
			<<<<<[
				-
				
				>>>[
					-
					
					>
				]
				>
				[
					<
				]
				<
			<<<]
			>>>>>[-]
			<<[
				[-]
				<+
			>]
			br i1 %7_ label %8_ label %11
			<<<<<<<<<<+
			>>>>>>>>>
			[-
			<<<<<<<<<
			-
			>>>+
			#lol/8_true
			>>>>>>
			]
			<<<<<<<<<
			[-
			>>>>>+
			#lol/11_false
			<<<<<
			]
		>>]
		>#lol/8
		[
			-
			%9 = load i32* %2_ align 4
			>>>>#load_%2_to_%9
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%10 = add i32 %9_ i32 1
			#tmp_constop_1
			+
			>#%%10_add_%i32_%9_ci32_1
			<<[->>+<<]
			>[->+<]
			call @lol(i32 %10)
			enable next
			<<<<#lol/%8411
			+
			>>>>>[->>>>>>>>>+<<<<<<<<<]
			>>>>>>>>>>+++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>#lol
			+
			>>>#lol/jump_pad_blk
			+
			>>>>>>>
			<<<<#__FRAME_lol__
			+
			>#lol
			+
			>>#lol/b0
			+
		>>>>]
		>#lol/8411
		[
			-
			br label %11
			>#lol/%11
			+
		<]
		>#lol/11
		[
			-
			ret void
			>[-]
			<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<<<
		>>>>>>>>>]
	<<<<<<<<]
	>#main
	[
		>>#main/RET_LANDING_PAD
		[
			<<<<-
			#dead_frame
			>>-
			<<#dead_fn_pad/main
			>>>>-
			<<<<
			<<<<<<<
		>>>>]
		<#main/11100
		[
			-
			br label %0
			>>#main/%0
			+
		<<]
		>>#main/0
		[
			-
			call @lol(i32 0)
			enable next
			>#main/%4200
			+
			>>>>>>
			>+++++++++++
			<
			<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			>
			
			>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>
			<<<<#__FRAME_lol__
			+
			>#lol
			+
			>>#lol/b0
			+
		>>]
		>#main/4200
		[
			-
			ret void
			<<<<<<-
			#dead_frame
			>>-
			<<
			<
			[-]
			>
			<<<<<<
		>>>>>>]
	<<<<]
<<]
