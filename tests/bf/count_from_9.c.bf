>>>>
++++
>
runtime init:
#TOP_FRAME
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
		<#B:main/%0
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
			store i8 9_ i8* %2_ align 1
			>#tmp_constop_9
			+++++++++
			<<[-]
			>>[-<<+>>]
			br label %3
			<<<<<<<<<<<<#main/%3
			+
		<<]
		>>#B:main/%3
		[
			-
			%4 = load i8* %2_ align 1
			>>>>>>>>>>>#load_%2_to_%4
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%5 = icmp ne i8 %4_ i8 0
			<#tmp_constop_0
			
			>#%5_icmp_%i8_%4_ne_i8_0
			>>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<<<<[->>>>+<<<<]
			>>>>>>+
			<<<<<[
				-
				>>+
				>[
					-
					<-
					>
				>]
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
			<[
				[-]
				<+
			>]
			br i1 %5_ label %6_ label %21
			<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<
			-
			>>+
			#main/6_true
			>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<
			[-
			>>>>>>>>>+
			#main/21_false
			<<<<<<<<<
			]
		>]
		>#B:main/%6
		[
			-
			%7 = load i8* %2_ align 1
			>>>>>>>>>>#load_%2_to_%7
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%8 = zext i8 %7 to i32
			#%8_zext_i8_%7
			<[->+<]
			%9 = add i32 48_ i32 %8
			#tmp_constop_48
			++++++++++++++++++++++++++++++++++++++++++++++++
			>>#%%9_add_%i32_48_ci32_%8
			<<[->>+<<]
			>[->+<]
			%10 = trunc i32 %9 to i8
			<#%10_trunc_i32_%9
			>>[-<<+>>]
			call @putchar(i8 %10)
			enable next
			<<<<<<<<<<<#main/%call_term_for_2
			+
			putchar intrinsic
			>>>>>>>>>.
			[-]
		<<<<<<<<<<]
		>#B:main/%call_term_for_2
		[
			-
			%11 = load i8* %2_ align 1
			>>>>>>>>>#load_%2_to_%11
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%12 = zext i8 %11 to i32
			#%12_zext_i8_%11
			<[->+<]
			%13 = icmp ne i32 %12_ i32 1
			#tmp_constop_1
			+
			>>#%13_icmp_%i32_%12_ne_i32_1
			>>>>>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<<<<<<[->>>>>>+<<<<<<]
			>>>>>>>>+
			<<<<<<<<<[
				-
				>>>+
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
			<<<<<<<]
			>>>>>>>>>-
			<<[
				[-]
				<<<<<+
			>>>>>]
			<<<<[
				[-]
				<+
			>]
			br i1 %13_ label %14_ label %15
			<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<
			-
			>>>>+
			#main/14_true
			>>>>>>>>>>
			]
			<<<<<<<<<<<<<<
			[-
			>>>>>>>+
			#main/15_false
			<<<<<<<
			]
		>>>]
		>#B:main/%14
		[
			-
			call @putchar(i8 44)
			enable next
			>#main/%call_term_for_4
			+
			putchar intrinsic
			>>>>>>>++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<]
		>#B:main/%call_term_for_4
		[
			-
			call @putchar(i8 32)
			enable next
			>#main/%call_term_for_5
			+
			putchar intrinsic
			>>>>>>++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<]
		>#B:main/%call_term_for_5
		[
			-
			br label %15
			>#main/%15
			+
		<]
		>#B:main/%15
		[
			-
			br label %16
			>#main/%16
			+
		<]
		>#B:main/%16
		[
			-
			%17 = load i8* %2_ align 1
			>>>>#load_%2_to_%17
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%18 = zext i8 %17 to i32
			#%18_zext_i8_%17
			<[->+<]
			%19 = sub i32 %18_ i32 1
			#tmp_constop_1
			+
			>>#%%19_sub_%i32_%18_ci32_1
			<[->+<]
			<
			[-
			>>
			-
			<<
			]
			%20 = trunc i32 %19 to i8
			#%20_trunc_i32_%19
			>>[-<<+>>]
			store i8 %20_ i8* %2_ align 1
			<<<[-]
			>[-<+>]
			br label %3
			<<<<<<<<<<<#main/%3
			+
		>>>>>>>]
		>#B:main/%21
		[
			-
			%22 = load i32* %1_ align 4
			>>>#load_%1_to_%22
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			ret i32 %22
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
