>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
		>#main/0
		[
			-
			%1 = alloca i8_ align 1
			>>>>>>#alloca_%1
			%2 = alloca i8_ align 1
			>#alloca_%2
			store i8 0_ i8* %1_ align 1
			<[-]
			
			br label %3
			<<<<<#main/3
			+
		<]
		>#main/3
		[
			-
			%4 = load i8* %1_ align 1
			>>>>>>>#load_%1_to_%4
			<<<<<<<<#tmp0_for_load
			>>>>>>[-<<<<<<+>>>>>>>>+<<]
			<<<<<<[->>>>>>+<<<<<<]
			%5 = zext i8 %4 to i32
			>>>>>>>>>#%%5_zext_%i8_%4
			<[->+<]
			%6 = icmp slt i32 %5_ i32 58
			<<<<<<<<++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>#temp0
			>#temp1_a
			>#temp1_b
			>#temp1_c
			>>>>#%6_icmp_%i32_%5_lt_i32_58
			>[-<+>]
			<<<<<<+
			<<<[->+>+<<]
			>[-<+>]
			>>>>>>>[-<<<<<<<+>>>>>>>]
			+
			<<<<<<
			[>-]> [<
			>>>>>>
			-
			<<<<<<<
			[-]
			>
			>->]<+<
			<
			[
			>
			- [>-]> [<
			>>>>>>
			-
			<<<<<<<
			[-]+
			>
			>->]<+<
			<
			-]
			<[-]
			>>[-]
			>[-]
			>[-]
			br i1 %6_ label %7_ label %16
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			#main/7_true
			>>>>>>
			]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			#main/16_false
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			]
		<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
		>#main/7
		[
			-
			%8 = load i8* %1_ align 1
			>>>>>>#load_%1_to_%8
			<<<<<<<<#tmp0_for_load
			>>>>>>[-<<<<<<+>>>>>>>>+<<]
			<<<<<<[->>>>>>+<<<<<<]
			%9 = zext i8 %8 to i32
			>>>>>>>>>#%%9_zext_%i8_%8
			<[->+<]
			%10 = add i32 %9_ i32 65
			<<<<<<<<+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>>>>>>>>#%%10_add_%i32_%9_ci32_65
			>[-<+>]
			<<<<<<<<<[->>>>>>>>+<<<<<<<<]
			%11 = trunc i32 %10 to i8
			>>>>>>>>>#%%11_trunc_%i32_%10
			<[->+<]
			store i8 %11_ i8* %2_ align 1
			<[-]
			>>[-<<+>>]
			%12 = load i8* %2_ align 1
			<#load_%2_to_%12
			<<<<<<<<#tmp0_for_load
			>>>>>>>[-<<<<<<<+>>>>>>>>+<]
			<<<<<<<[->>>>>>>+<<<<<<<]
			call @putchar(i8 %12)
			enable next
			>>>#main/17
			+
			putchar intrinsic
			>>>>>.
			[-]
		<<<<<<]
		>#main/17
		[
			-
			br label %13
			>#main/13
			+
		<]
		>#main/13
		[
			-
			%14 = load i8* %1_ align 1
			>>>>#load_%1_to_%14
			<<<<<<<<#tmp0_for_load
			>>>>>>[-<<<<<<+>>>>>>>>+<<]
			<<<<<<[->>>>>>+<<<<<<]
			%15 = add i8 %14_ i8 1
			+
			>>>>>>>>>#%%15_add_%i8_%14_ci8_1
			<[->+<]
			<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			store i8 %15_ i8* %1_ align 1
			>>>>>>[-]
			>>>[-<<<+>>>]
			br label %3
			<<<<<<<<#main/3
			+
		>>>]
		>#main/16
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<-
			#dead_frame
			>-
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>>>>>]
	<<<<<<]
<]