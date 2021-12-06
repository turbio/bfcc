>>>>>>>
+++++++
>
runtime init:
#TOP_FRAME
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
			<<<<<<<<<<
		]
		<#B:c/%call_never_first_forc
		[
			-
			br label %0
			>>#c/%0
			+
		<<]
		>>#B:c/%0
		[
			-
			call @putchar(i8 46)
			enable next
			>#c/%call_term_for_0
			+
			putchar intrinsic
			>++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<]
		>#B:c/%call_term_for_0
		[
			-
			ret void
			<<<<<<<<-
			#dead_frame
			>-
			<
			<[-]
			>
			<<<<<<<<
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
			<<<<<<<<<<<<<<<<<<<
		]
		<#B:b/%0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>#alloca_%1
			store i32 0_ i32* %1_ align 4
			>#tmp_constop_0
			
			<[-]
			>[-<+>]
			br label %2
			<<<<<<#b/%2
			+
		<<]
		>>#B:b/%2
		[
			-
			%3 = load i32* %1_ align 4
			>>>>>>#load_%1_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = icmp slt i32 %3_ i32 2
			>#tmp_constop_2
			++
			<#%4_icmp_%i32_%3_slt_i32_2
			>>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<[->+<]
			>>>+
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
			>>>>>-
			<<[
				[-]
				<<+
			>>]
			br i1 %4_ label %5_ label %9
			<<<<<<<<<<+
			>>>>>>>>[
				-
				<<<<<<<<-
				>>+
				#b/5_true
			>>>>>>]
			<<<<<<<<[
				-
				>>>>>+
				#b/9_false
			<<<<<]
		>]
		>#B:b/%5
		[
			-
			call @c()
			enable next
			>#b/%call_term_for_2
			+
			give callee a stack pointer
			>>>>>>>>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
			+
			>>#b
			+
			>>>>#b/jump_pad_blk
			+
			>>>>>>>>
			<<<<<<#__FRAME_c__
			+
			>#c
			+
			>>>>#c/b0
			+
		>>>]
		>#B:b/%call_term_for_2
		[
			-
			br label %6
			>#b/%6
			+
		<]
		>#B:b/%6
		[
			-
			%7 = load i32* %1_ align 4
			>>>#load_%1_to_%7
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%8 = add i32 %7_ i32 1
			#tmp_constop_1
			+
			>#%%8_add_%i32_%7_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %8_ i32* %1_ align 4
			<<[-]
			>>>[-<<<+>>>]
			br label %2
			<<<<<<<<#b/%2
			+
		>>>]
		>#B:b/%9
		[
			-
			ret void
			>[-]
			<<<<<<<<<<<<-
			#dead_frame
			>>-
			<
			<<[-]
			>
			<<<<<<<<
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
			<<<<<<<<<<<<<<<<<<<
		]
		<#B:a/%0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>#alloca_%1
			store i32 0_ i32* %1_ align 4
			>#tmp_constop_0
			
			<[-]
			>[-<+>]
			br label %2
			<<<<<<#a/%2
			+
		<<]
		>>#B:a/%2
		[
			-
			%3 = load i32* %1_ align 4
			>>>>>>#load_%1_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = icmp slt i32 %3_ i32 2
			>#tmp_constop_2
			++
			<#%4_icmp_%i32_%3_slt_i32_2
			>>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<[->+<]
			>>>+
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
			>>>>>-
			<<[
				[-]
				<<+
			>>]
			br i1 %4_ label %5_ label %9
			<<<<<<<<<<+
			>>>>>>>>[
				-
				<<<<<<<<-
				>>+
				#a/5_true
			>>>>>>]
			<<<<<<<<[
				-
				>>>>>+
				#a/9_false
			<<<<<]
		>]
		>#B:a/%5
		[
			-
			call @b()
			enable next
			>#a/%call_term_for_2
			+
			give callee a stack pointer
			>>>>>>>>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
			+
			>>>#a
			+
			>>>#a/jump_pad_blk
			+
			>>>>>>>>
			<<<<<<#__FRAME_b__
			+
			>>#b
			+
			>>>#b/b0
			+
		>>>]
		>#B:a/%call_term_for_2
		[
			-
			br label %6
			>#a/%6
			+
		<]
		>#B:a/%6
		[
			-
			%7 = load i32* %1_ align 4
			>>>#load_%1_to_%7
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%8 = add i32 %7_ i32 1
			#tmp_constop_1
			+
			>#%%8_add_%i32_%7_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %8_ i32* %1_ align 4
			<<[-]
			>>>[-<<<+>>>]
			br label %2
			<<<<<<<<#a/%2
			+
		>>>]
		>#B:a/%9
		[
			-
			ret void
			>[-]
			<<<<<<<<<<<<-
			#dead_frame
			>>>-
			<
			<<<[-]
			>
			<<<<<<<<
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
			<<<<<<<<<
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
			call @a()
			enable next
			>#main/%call_term_for_0
			+
			give callee a stack pointer
			>>>>>>>>#stack_ptr
			++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>
			<<<<<<<<<<<<<<<<<<#JUMP_PAD
			+
			>>>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<<<#__FRAME_a__
			+
			>>>#a
			+
			>>#a/b0
			+
		>>]
		>#B:main/%call_term_for_0
		[
			-
			ret void
			<<<<<<<<-
			#dead_frame
			>>>>-
			<
			<<<<[-]
			>
			<<<<<<<<
		>>>>>>>>]
	<<<<]
<<<<]
