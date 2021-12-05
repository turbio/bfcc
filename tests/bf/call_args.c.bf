>>>>>
+++++
>
runtime init:
#TOP_FRAME
+
>>#main
+
>#main/b0
+
<<<[
	>#call_me
	[
		>>>#call_me/RET_LANDING_PAD
		[
			<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/call_me
			>>>>-
			<<<<
			<<<<<<<<<<<<<<<
		>>>>]
		<#B:call_me/%call_never_first_forcall_me
		[
			-
			>>>>>>>>>#arg_%0
			<<
			<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			>>
			>>>>>>>>>>>>>#arg_%1
			<<<
			<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
			>>>
			>>>>>>>>>>>>>>#arg_%2
			<<<<
			<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]
			>>>>
			br label %3
			>>>>>#call_me/%3
			+
		<<]
		>>#B:call_me/%3
		[
			-
			%4 = alloca i32_ align 4
			>>>>#alloca_%4
			%5 = alloca i32_ align 4
			>#alloca_%5
			%6 = alloca i32_ align 4
			>#alloca_%6
			store i32 %0_ i32* %4_ align 4
			<<[-]
			>>>[-<<<+>>>]
			store i32 %1_ i32* %5_ align 4
			<<[-]
			>>>[-<<<+>>>]
			store i32 %2_ i32* %6_ align 4
			<<[-]
			>>>[-<<<+>>>]
			%7 = load i32* %4_ align 4
			<<#load_%4_to_%7
			>#tmp0_for_load
			<<<<[->>>>+<+<<<]
			>>>>[-<<<<+>>>>]
			%8 = trunc i32 %7 to i8
			#%8_trunc_i32_%7
			<[->+<]
			call @putchar(i8 %8)
			enable next
			<<<<<<#call_me/%call_term_for_0
			+
			putchar intrinsic
			>>>>>>>.
			[-]
		<<<<<<<<]
		>#B:call_me/%call_term_for_0
		[
			-
			%9 = load i32* %5_ align 4
			>>>>>>#load_%5_to_%9
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%10 = trunc i32 %9 to i8
			#%10_trunc_i32_%9
			<[->+<]
			call @putchar(i8 %10)
			enable next
			<<<<<#call_me/%call_term_for_1
			+
			putchar intrinsic
			>>>>>>.
			[-]
		<<<<<<<]
		>#B:call_me/%call_term_for_1
		[
			-
			%11 = load i32* %6_ align 4
			>>>>>#load_%6_to_%11
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%12 = trunc i32 %11 to i8
			#%12_trunc_i32_%11
			<[->+<]
			call @putchar(i8 %12)
			enable next
			<<<<#call_me/%call_term_for_2
			+
			putchar intrinsic
			>>>>>.
			[-]
		<<<<<<]
		>#B:call_me/%call_term_for_2
		[
			-
			ret void
			>[-]
			>[-]
			>[-]
			<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<<<<<
		>>>>>>>>]
	<<<<<<<]
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
			call @call_me(i32 49_ i32 50_ i32 51)
			enable next
			>#main/%call_term_for_0
			+
			copy up arg 0
			>>>>>>>>#arg_0
			+++++++++++++++++++++++++++++++++++++++++++++++++
			copy up arg 1
			<#arg_1
			++++++++++++++++++++++++++++++++++++++++++++++++++
			copy up arg 2
			<#arg_2
			+++++++++++++++++++++++++++++++++++++++++++++++++++
			give callee a stack pointer
			>>>#stack_ptr
			++++++++++++++
			<
			<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
			>
			<<<<<<<<<<<<<<<<<
			>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>>
			<<<<#__FRAME_call_me__
			+
			>#call_me
			+
			>>#call_me/b0
			+
		>>]
		>#B:main/%call_term_for_0
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
