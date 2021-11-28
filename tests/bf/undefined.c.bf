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
	>#f
	[
		>>>#f/RET_LANDING_PAD
		[
			<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/f
			>>>>-
			<<<<
			<<<<<<<<<<<<<<<
		>>>>]
		<#f/19500
		[
			-
			br label %0
			>>#f/%0
			+
		<<]
		>>#f/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>#alloca_%1
			%2 = alloca i32_ align 4
			>#alloca_%2
			%3 = alloca i32_ align 4
			>#alloca_%3
			%4 = alloca i32_ align 4
			>#alloca_%4
			%5 = ptrtoint i32* %1 to i32
			>#%%5_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
			>
			<<++++++++++
			%6 = trunc i32 %5 to i8
			>#%6_trunc_i32_%5
			<[->+<]
			call @putchar(i8 %6)
			enable next
			<<<<<<<#f/%4200
			+
			putchar intrinsic
			>>>>>>>>.
			[-]
		<<<<<<<<<]
		>#f/4200
		[
			-
			%7 = ptrtoint i32* %2 to i32
			>>>>>>>#%%7_ptrtoi_%i32*_%2
			<
			<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
			>
			<<+++++++++++
			%8 = trunc i32 %7 to i8
			>#%8_trunc_i32_%7
			<[->+<]
			call @putchar(i8 %8)
			enable next
			<<<<<<#f/%8400
			+
			putchar intrinsic
			>>>>>>>.
			[-]
		<<<<<<<<]
		>#f/8400
		[
			-
			%9 = ptrtoint i32* %3 to i32
			>>>>>>#%%9_ptrtoi_%i32*_%3
			<
			<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
			>
			<<++++++++++++
			%10 = trunc i32 %9 to i8
			>#%10_trunc_i32_%9
			<[->+<]
			call @putchar(i8 %10)
			enable next
			<<<<<#f/%12600
			+
			putchar intrinsic
			>>>>>>.
			[-]
		<<<<<<<]
		>#f/12600
		[
			-
			ret void
			>[-]
			>[-]
			>[-]
			>[-]
			<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<<
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
			<<<<<<<<<<<
		>>>>]
		<#main/15300
		[
			-
			br label %0
			>>#main/%0
			+
		<<]
		>>#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>#alloca_%1
			%2 = ptrtoint i32* %1 to i32
			>#%%2_ptrtoi_%i32*_%1
			<
			<<<<<<<<<[->>>>>>>>>>>+<+<<<<<<<<<<]
			>>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
			>
			<<+++++++++
			%3 = trunc i32 %2 to i8
			>#%3_trunc_i32_%2
			<[->+<]
			call @putchar(i8 %3)
			enable next
			<<<#main/%4200
			+
			putchar intrinsic
			>>>>.
			[-]
		<<<<<]
		>#main/4200
		[
			-
			call @f()
			enable next
			>#main/%8400
			+
			>>>>>>>>>+++++++++++++++
			<
			<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>
			<<<<#__FRAME_f__
			+
			>#f
			+
			>>#f/b0
			+
		>>>]
		>#main/8400
		[
			-
			ret i32 0
			>[-]
			<<<<<<<<-
			#dead_frame
			>>-
			<<
			<
			[-]
			>
			<<<<<<
		>>>>>>>]
	<<<<<]
<<]
