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
			<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>]
		<#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>>>>#alloca_%1
			%2 = alloca i8_ align 1
			>#alloca_%2
			store i32 0_ i32* %1_ align 4
			>#tmp_constop_0
			
			<<[-]
			>>[-<<+>>]
			store i8 98_ i8* %2_ align 1
			#tmp_constop_98
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<[-]
			>[-<+>]
			%3 = load i8* %2_ align 1
			#load_%2_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = zext i8 %3 to i32
			#%4_zext_i8_%3
			<[->+<]
			%5 = icmp eq i32 %4_ i32 97
			#tmp_constop_97
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>>#%5_icmp_%i32_%4_eq_i32_97
			>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<[->>>+<<<]
			>>>>>+
			<<<<[
				-
				>>>>>+
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
			<<]
			>>>>[-]
			<<<+
			>[
				[-]
				<[-]
			>]
			>>>[
				[-]
				<<<<[-]
			>>>>]
			br i1 %5_ label %6_ label %7
			<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<
			-
			>+
			#main/6_true
			>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<
			[-
			>>>+
			#main/7_false
			<<<
			]
		<]
		>>#main/6
		[
			-
			call @putchar(i8 120)
			enable next
			>#main/%4214
			+
			putchar intrinsic
			>>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<]
		>#main/4214
		[
			-
			br label %14
			>>>>>>>#main/%14
			+
		<<<<<<<]
		>#main/7
		[
			-
			%8 = load i8* %2_ align 1
			>>>>>>>>>#load_%2_to_%8
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%9 = zext i8 %8 to i32
			#%9_zext_i8_%8
			<[->+<]
			%10 = icmp eq i32 %9_ i32 98
			#tmp_constop_98
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>>#%10_icmp_%i32_%9_eq_i32_98
			>>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<<<<<[->>>>>>>+<<<<<<<]
			>>>>>>>>>+
			<<<<<<<<[
				-
				>>+
				>>>>[
					-
					<<<<-
					>
				>>>>]
				>
				[
					<
				]
				<
			<<<<<<]
			>>>>>>>>[-]
			<<<<<<<+
			>>>>>[
				[-]
				<<<<<[-]
			>>>>>]
			<<<<[
				[-]
				<[-]
			>]
			br i1 %10_ label %11_ label %12
			<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<
			-
			>>>>+
			#main/11_true
			>>>>>>>>>>
			]
			<<<<<<<<<<<<<<
			[-
			>>>>>>+
			#main/12_false
			<<<<<<
			]
		>>>]
		>#main/11
		[
			-
			call @putchar(i8 121)
			enable next
			>#main/%8414
			+
			putchar intrinsic
			>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<]
		>#main/8414
		[
			-
			br label %13
			>>>#main/%13
			+
		<<<]
		>#main/12
		[
			-
			call @putchar(i8 122)
			enable next
			>#main/%12614
			+
			putchar intrinsic
			>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<]
		>#main/12614
		[
			-
			br label %13
			>#main/%13
			+
		<]
		>#main/13
		[
			-
			br label %14
			>#main/%14
			+
		<]
		>#main/14
		[
			-
			%15 = load i32* %1_ align 4
			>>>#load_%1_to_%15
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			ret i32 %15
			<<<[-]
			>[-]
			<<<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<
		>>>>>>>>>>>>]
	<<<<<<<<<<<]
<]
