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
			<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>]
		<#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>>>>>>>>>>>>#alloca_%1
			%2 = alloca i32_ align 4
			>#alloca_%2
			store i32 0_ i32* %1_ align 4
			<[-]
			
			br label %3
			<<<<<<<<<<<<<<<<<#main/3
			+
		<<]
		>>#main/3
		[
			-
			%4 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>>>#load_%1_to_%4
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%5 = icmp ule i32 %4_ i32 1
			>+
			<#%5_icmp_%i32_%4_ule_i32_1
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<<<[->>>>>+<<<<<]
			>>>>>>>+
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
			<+
			>>>>[
				[-]
				<<<<[-]
			>>>>]
			>>[-]
			br i1 %5_ label %6_ label %32
			<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<
			-
			>>+
			#main/6_true
			>>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>+
			#main/32_false
			<<<<<<<<<<<<<<<<<
			]
		>]
		>#main/6
		[
			-
			store i32 0_ i32* %2_ align 4
			>>>>>>>>>>>>>>>>>[-]
			
			br label %7
			<<<<<<<<<<<<<<<<#main/7
			+
		<]
		>#main/7
		[
			-
			%8 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>#load_%2_to_%8
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%9 = icmp ule i32 %8_ i32 1
			+
			<#%9_icmp_%i32_%8_ule_i32_1
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<<<[->>>>>+<<<<<]
			>>>>>>>+
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
			<+
			>>>>[
				[-]
				<<<<[-]
			>>>>]
			>>[-]
			br i1 %9_ label %10_ label %28
			<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>+
			#main/10_true
			>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>+
			#main/28_false
			<<<<<<<<<<<<<<<
			]
		>>>]
		>#main/10
		[
			-
			%11 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>#load_%1_to_%11
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%12 = icmp ne i32 %11_ i32 0
			
			<#%12_icmp_%i32_%11_ne_i32_0
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			>#icmp_under
			<<<<<<[->>>+<<<]
			>>>>>+
			<<<<<<<[
				-
				>>>>>>>>+
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
			<<<<<]
			>>>>>[
				[-]
				<<<<+
			>>>>]
			>>>[
				[-]
				<<<<<<<+
			>>>>>>>]
			<[-]
			br i1 %12_ label %16_ label %13
			<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>+
			#main/16_true
			>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>+
			#main/13_false
			<<<<<
			]
		>>>>]
		>#main/13
		[
			-
			%14 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>#load_%2_to_%14
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%15 = icmp ne i32 %14_ i32 0
			
			<#%15_icmp_%i32_%14_ne_i32_0
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			>#icmp_under
			<<<<<<[->>>+<<<]
			>>>>>+
			<<<<<<<[
				-
				>>>>>>>>+
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
			<<<<<]
			>>>>>[
				[-]
				<<<<+
			>>>>]
			>>>[
				[-]
				<<<<<<<+
			>>>>>>>]
			<[-]
			br i1 %15_ label %16_ label %17
			<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>+
			#main/16_true
			>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>+
			#main/17_false
			<<<<<<<<
			]
		>>>>>]
		>#main/16
		[
			-
			call @putchar(i8 111)
			enable next
			>#main/4232
			+
			putchar intrinsic
			>>>>>>>>>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<<<<<]
		>#main/4232
		[
			-
			br label %17
			>#main/17
			+
		<]
		>#main/17
		[
			-
			%18 = load i32* %1_ align 4
			>>>>>>>>>>>>#load_%1_to_%18
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%19 = icmp ne i32 %18_ i32 0
			
			<#%19_icmp_%i32_%18_ne_i32_0
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			>#icmp_under
			<<<<<<[->>>+<<<]
			>>>>>+
			<<<<<<<[
				-
				>>>>>>>>+
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
			<<<<<]
			>>>>>[
				[-]
				<<<<+
			>>>>]
			>>>[
				[-]
				<<<<<<<+
			>>>>>>>]
			<[-]
			br i1 %19_ label %20_ label %24
			<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>+
			#main/20_true
			>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>+
			#main/24_false
			<<<<<<<<<<<<
			]
		>>>>>>>>]
		>#main/20
		[
			-
			%21 = load i32* %2_ align 4
			>>>>>>>>>>>#load_%2_to_%21
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%22 = icmp ne i32 %21_ i32 0
			
			<#%22_icmp_%i32_%21_ne_i32_0
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			>#icmp_under
			<<<<<<[->>>+<<<]
			>>>>>+
			<<<<<<<[
				-
				>>>>>>>>+
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
			<<<<<]
			>>>>>[
				[-]
				<<<<+
			>>>>]
			>>>[
				[-]
				<<<<<<<+
			>>>>>>>]
			<[-]
			br i1 %22_ label %23_ label %24
			<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>+
			#main/23_true
			>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>+
			#main/24_false
			<<<<<<<<<<<<
			]
		>>>>>>>>>]
		>#main/23
		[
			-
			call @putchar(i8 97)
			enable next
			>#main/8432
			+
			putchar intrinsic
			>>>>>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<]
		>#main/8432
		[
			-
			br label %24
			>#main/24
			+
		<]
		>#main/24
		[
			-
			call @putchar(i8 44)
			enable next
			>#main/12632
			+
			putchar intrinsic
			>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<]
		>#main/12632
		[
			-
			br label %25
			>#main/25
			+
		<]
		>#main/25
		[
			-
			%26 = load i32* %2_ align 4
			>>>>>>#load_%2_to_%26
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%27 = add i32 %26_ i32 1
			+
			<#%%27_add_%i32_%26_ci32_1
			<[->+<]
			>>[-<+>]
			store i32 %27_ i32* %2_ align 4
			<<<[-]
			>>[-<<+>>]
			br label %7
			<<<<<<<<<<<<<<<<<<#main/7
			+
		>>>>>>>>>>>]
		>#main/28
		[
			-
			br label %29
			>#main/29
			+
		<]
		>#main/29
		[
			-
			%30 = load i32* %1_ align 4
			>>>>#load_%1_to_%30
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%31 = add i32 %30_ i32 1
			+
			<#%%31_add_%i32_%30_ci32_1
			<[->+<]
			>>[-<+>]
			store i32 %31_ i32* %1_ align 4
			<<<<[-]
			>>>[-<<<+>>>]
			br label %3
			<<<<<<<<<<<<<<<<<<<<#main/3
			+
		>>>>>>>>>>>>>>>]
		>#main/32
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<<<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<<<<
		>>>>>>>>>>>>>>>>>>>>]
	<<<<<<<<<<<<<<<<<<<]
<]
