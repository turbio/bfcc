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
			<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>]
		<#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>>>>>>>>>>>>>#alloca_%1
			%2 = alloca i32_ align 4
			>#alloca_%2
			store i32 0_ i32* %1_ align 4
			<[-]
			
			br label %3
			<<<<<<<<<<<<<<<<<<#main/3
			+
		<<]
		>>#main/3
		[
			-
			%4 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>>>>#load_%1_to_%4
			<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
			%5 = icmp slt i32 %4_ i32 20
			++++++++++++++++++++
			>>>>>>>>>>>>>>>>>>>>>>>#%5_icmp_%i32_%4_slt_i32_20
			<<<<<<<<<<<<<<<<<<<<<<#temp0
			>#temp1_a
			>#temp1_b
			>#temp1_c
			>>>>>>>>>>>>>>>>>>[->+<]
			<<<<<<<<<<<<<<<<<<<+
			<<<[->+>+<<]
			>[-<+>]
			>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
			+
			<<<<<<<<<<<<<<<<<<<<<
			[>-]> [<
			>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<
			[-]
			>
			>->]<+<
			<
			[
			>
			- [>-]> [<
			>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<
			[-]+
			>
			>->]<+<
			<
			-]
			<[-]
			>>[-]
			>[-]
			>[-]
			br i1 %5_ label %6_ label %33
			<<<+
			>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<
			-
			>>+
			#main/6_true
			>>>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>+
			#main/33_false
			<<<<<<<<<<<<<<<<<<
			]
		>]
		>#main/6
		[
			-
			store i32 0_ i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>[-]
			
			br label %7
			<<<<<<<<<<<<<<<<<#main/7
			+
		<]
		>#main/7
		[
			-
			%8 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>#load_%2_to_%8
			<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>+<]
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
			%9 = icmp slt i32 %8_ i32 20
			++++++++++++++++++++
			>>>>>>>>>>>>>>>>>>>>>>>#%9_icmp_%i32_%8_slt_i32_20
			<<<<<<<<<<<<<<<<<<<<<<#temp0
			>#temp1_a
			>#temp1_b
			>#temp1_c
			>>>>>>>>>>>>>>>>>>[->+<]
			<<<<<<<<<<<<<<<<<<<+
			<<<[->+>+<<]
			>[-<+>]
			>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>]
			+
			<<<<<<<<<<<<<<<<<<<<<
			[>-]> [<
			>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<
			[-]
			>
			>->]<+<
			<
			[
			>
			- [>-]> [<
			>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<
			[-]+
			>
			>->]<+<
			<
			-]
			<[-]
			>>[-]
			>[-]
			>[-]
			br i1 %9_ label %10_ label %29
			<<<+
			>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>+
			#main/10_true
			>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>+
			#main/29_false
			<<<<<<<<<<<<<<<<
			]
		>>>]
		>#main/10
		[
			-
			%11 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>#load_%1_to_%11
			<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
			%12 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>#load_%2_to_%12
			<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
			%13 = icmp slt i32 %11_ i32 %12
			>>>>>>>>>>>>>>>>>>>>>>>>#%13_icmp_%i32_%11_slt_i32_%12
			<<<<<<<<<<<<<<<<<<<<<<<<#temp0
			>#temp1_a
			>#temp1_b
			>#temp1_c
			>>>>>>>>>>>>>>>>>>>[->>+<<]
			<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>+>>>>>>>>>>>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>]
			+
			<<<<<<<<<<<<<<<<<<<<<<<
			[>-]> [<
			>>>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<<<
			[-]
			>
			>->]<+<
			<
			[
			>
			- [>-]> [<
			>>>>>>>>>>>>>>>>>>>>>>>
			-
			<<<<<<<<<<<<<<<<<<<<<<<<
			[-]+
			>
			>->]<+<
			<
			-]
			>>>>>>>>>>>>>>>>>>>>>>>[-]
			<<<<<<<<<<<<<<<<<<<<<<[-]
			>[-]
			>[-]
			br i1 %13_ label %14_ label %15
			<<+
			>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>+
			#main/14_true
			>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>+
			#main/15_false
			<<<<<<<
			]
		>>>>]
		>#main/14
		[
			-
			call @putchar(i8 108)
			enable next
			>#main/4233
			+
			putchar intrinsic
			<<<<<<<++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		>>>>>>]
		>#main/4233
		[
			-
			br label %15
			>#main/15
			+
		<]
		>#main/15
		[
			-
			%16 = load i32* %1_ align 4
			>>>>>>>>>>>>>>#load_%1_to_%16
			<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
			%17 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>#load_%2_to_%17
			<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
			%18 = icmp ne i32 %16_ i32 %17
			>>>>>>>>>>>>>>>>>>>>>>>>#%18_icmp_%i32_%16_ne_i32_%17
			<<<<<<<<<<<<<<<<<<<<<<#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			>#icmp_under
			>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>[
				-
				<<<<<<<<<<<<<<<<<+
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
			>>>>>>>>>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<<[
				[-]
				>>>>>>>>>>>>>>>>>>>>>>+
			<<<<<<<<<<<<<<<<<<<<<<]
			>>>[
				[-]
				>>>>>>>>>>>>>>>>>>>+
			<<<<<<<<<<<<<<<<<<<]
			<[-]
			br i1 %18_ label %19_ label %20
			<<<+
			>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>+
			#main/19_true
			>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>+
			#main/20_false
			<<<<<<<<<<
			]
		>>>>>>>]
		>#main/19
		[
			-
			call @putchar(i8 110)
			enable next
			>#main/8433
			+
			putchar intrinsic
			<<<<<<<<<<++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		>>>>>>>>>]
		>#main/8433
		[
			-
			br label %20
			>#main/20
			+
		<]
		>#main/20
		[
			-
			%21 = load i32* %1_ align 4
			>>>>>>>>>>>#load_%1_to_%21
			<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
			%22 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>#load_%2_to_%22
			<<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
			%23 = icmp eq i32 %21_ i32 %22
			>>>>>>>>>>>>>>>>>>>>>>>>#%23_icmp_%i32_%21_eq_i32_%22
			<<<<<<<<<<<<<<<<<<<<<<#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			>#icmp_under
			>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>[
				-
				<<<<<<<<<<<<<<<<<+
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
			>>>>>>>>>>>>>>>>>>>>]
			>>+
			<<<<<<<<<<<<<<<<<<<<<<[
				[-]
				>>>>>>>>>>>>>>>>>>>>>>[-]
			<<<<<<<<<<<<<<<<<<<<<<]
			>>>[
				[-]
				>>>>>>>>>>>>>>>>>>>[-]
			<<<<<<<<<<<<<<<<<<<]
			<[-]
			br i1 %23_ label %24_ label %25
			<<<+
			>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>>+
			#main/24_true
			>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>+
			#main/25_false
			<<<<<<<<<<<<<
			]
		>>>>>>>>>>]
		>#main/24
		[
			-
			call @putchar(i8 101)
			enable next
			>#main/12633
			+
			putchar intrinsic
			<<<<<<<<<<<<<+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		>>>>>>>>>>>>]
		>#main/12633
		[
			-
			br label %25
			>#main/25
			+
		<]
		>#main/25
		[
			-
			call @putchar(i8 44)
			enable next
			>#main/16833
			+
			putchar intrinsic
			<<<<<<<<<<<<<<<++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		>>>>>>>>>>>>>>]
		>#main/16833
		[
			-
			br label %26
			>#main/26
			+
		<]
		>#main/26
		[
			-
			%27 = load i32* %2_ align 4
			>>>>>>#load_%2_to_%27
			<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>+<]
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]
			%28 = add i32 %27_ i32 1
			+
			>>>>>>>>>>>>>>>>>>>>>>>#%%28_add_%i32_%27_ci32_1
			<[->+<]
			<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
			store i32 %28_ i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>>[-]
			>>[-<<+>>]
			br label %7
			<<<<<<<<<<<<<<<<<<<#main/7
			+
		>>>>>>>>>>>>]
		>#main/29
		[
			-
			br label %30
			>#main/30
			+
		<]
		>#main/30
		[
			-
			%31 = load i32* %1_ align 4
			>>>>#load_%1_to_%31
			<<<<<<<<<<<<<<<<<<<<<<#tmp0_for_load
			>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>+<<]
			<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]
			%32 = add i32 %31_ i32 1
			+
			>>>>>>>>>>>>>>>>>>>>>>>#%%32_add_%i32_%31_ci32_1
			<[->+<]
			<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<]
			store i32 %32_ i32* %1_ align 4
			>>>>>>>>>>>>>>>>>>>>[-]
			>>>[-<<<+>>>]
			br label %3
			<<<<<<<<<<<<<<<<<<<<<#main/3
			+
		>>>>>>>>>>>>>>>>]
		>#main/33
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<<<<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<<<<
		>>>>>>>>>>>>>>>>>>>>>]
	<<<<<<<<<<<<<<<<<<<<]
<]