>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
runtime init:
#__FRAME__ENTRY__
+
>>#main
+
>#main/b0
+

<<<[
	>#lt
	[
		>>>>>>>>>>#arg_%0
		<
		<<<<<<<<<<<[->>>>>>>>>>>>+<<<<<<<<<<<<]
		>
		>>>>>>>>>>>>#arg_%1
		<<
		<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
		>>
		>>>#lt/2
		[
			-
			%3 = alloca i32_ align 4
			>>>>>>#alloca_%3
			%4 = alloca i32_ align 4
			>#alloca_%4
			store i32 %0_ i32* %3_ align 4
			<[-]
			>>[-<<+>>]
			store i32 %1_ i32* %4_ align 4
			<[-]
			>>[-<<+>>]
			%5 = load i32* %3_ align 4
			<#load_%3_to_%5
			<<<<<<<<#tmp0_for_load
			>>>>>>[-<<<<<<+>>>>>>>>+<<]
			<<<<<<[->>>>>>+<<<<<<]
			%6 = load i32* %4_ align 4
			>>>>>>>>>#load_%4_to_%6
			<<<<<<<<<#tmp0_for_load
			>>>>>>>[-<<<<<<<+>>>>>>>>>+<<]
			<<<<<<<[->>>>>>>+<<<<<<<]
			%7 = icmp slt i32 %5_ i32 %6
			#temp0
			>#temp1_a
			>#temp1_b
			>#temp1_c
			>>>>>>>#%7_icmp_%i32_%5_lt_i32_%6
			<<[->>+<<]
			<<<<<<+
			>>>>>>>[-<<<<<<<<<+>+>>>>>>>>]
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			>>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]
			+
			<<<<<<<<<
			[>-]> [<
			>>>>>>>>>
			-
			<<<<<<<<<<
			[-]
			>
			>->]<+<
			<
			[
			>
			- [>-]> [<
			>>>>>>>>>
			-
			<<<<<<<<<<
			[-]+
			>
			>->]<+<
			<
			-]
			>>>>>>>>>[-]
			<[-]
			<<<<<<<<[-]
			>[-]
			>[-]
			>[-]
			br i1 %7_ label %8_ label %9
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+
			<<<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			#lt/8_true
			>>>>>>>>>
			]
			>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			#lt/9_false
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			]
		<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
		>#lt/8
		[
			-
			call @putchar(i8 108)
			enable next
			>#lt/11
			+
			putchar intrinsic
			<<++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		>]
		>#lt/11
		[
			-
			br label %10
			>>>#lt/10
			+
		<<<]
		>#lt/9
		[
			-
			call @putchar(i8 114)
			enable next
			>#lt/12
			+
			putchar intrinsic
			<<<<++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		>>>]
		>#lt/12
		[
			-
			br label %10
			>#lt/10
			+
		<]
		>#lt/10
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<<-
			#dead_frame
			>-
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>>>>>>]
	<<<<<<<]
	>#main
	[
		>#main/4
		[
			-
			br label %0
			>#main/0
			+
		<]
		>#main/0
		[
			-
			call @lt(i32 1_ i32 2)
			enable next
			>#main/1
			+
			>>>>>>>>>>>>>>>>>>>>>>>>+
			<++
			next frame
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>]
		>#main/1
		[
			-
			call @lt(i32 2_ i32 1)
			enable next
			>#main/2
			+
			>>>>>>>>>>>>>>>>>>>>>>>++
			<+
			next frame
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>]
		>#main/2
		[
			-
			call @lt(i32 3_ i32 4)
			enable next
			>#main/3
			+
			>>>>>>>>>>>>>>>>>>>>>>+++
			<++++
			next frame
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>]
		>#main/3
		[
			-
			ret void
			<<<<<<<-
			#dead_frame
			>>-
			<<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>>>>>]
	<<<<<]
<<]
