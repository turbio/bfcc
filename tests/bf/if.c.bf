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
			<<<<<<<<<<<<<<<<<<
		]
		<#B:main/%0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>#alloca_%1
			%2 = alloca i8_ align 1
			>#alloca_%2
			store i32 0_ i32* %1_ align 4
			>#tmp_constop_0
			
			<<[-]
			>>[-<<+>>]
			store i8 98_ i8* %2_ align 1
			>#tmp_constop_98
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<<[-]
			>>[-<<+>>]
			%3 = load i8* %2_ align 1
			<#load_%2_to_%3
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%4 = icmp ne i8 %3_ i8 0
			<#tmp_constop_0
			
			>#%4_icmp_%i8_%3_ne_i8_0
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
			br i1 %4_ label %5_ label %7
			<<<<<<<<<<<+
			>>>>>>>>>>[
				-
				<<<<<<<<<<-
				>+
				#main/5_true
			>>>>>>>>>]
			<<<<<<<<<<[
				-
				>>>+
				#main/7_false
			<<<]
		<]
		>>#B:main/%5
		[
			-
			%6 = load i8* %2_ align 1
			>>>>>>>#load_%2_to_%6
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			call @putchar(i8 %6)
			enable next
			<<<<<<<#main/%call_term_for_1
			+
			putchar intrinsic
			>>>>>>.
			[-]
		<<<<<<<]
		>#B:main/%call_term_for_1
		[
			-
			br label %8
			>>>#main/%8
			+
		<<<]
		>#B:main/%7
		[
			-
			call @putchar(i8 110)
			enable next
			>#main/%call_term_for_3
			+
			putchar intrinsic
			>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<]
		>#B:main/%call_term_for_3
		[
			-
			br label %8
			>#main/%8
			+
		<]
		>#B:main/%8
		[
			-
			%9 = load i32* %1_ align 4
			>>>#load_%1_to_%9
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			ret i32 %9
			<<<[-]
			>[-]
			<<<<<<<<<<-
			#dead_frame
			>-
			<
			<[-]
			>
			<<<<<
		>>>>>>>>]
	<<<<<<<]
<]
