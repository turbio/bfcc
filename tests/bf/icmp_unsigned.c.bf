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
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>]
		<#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#alloca_%1
			%2 = alloca i32_ align 4
			>#alloca_%2
			store i32 0_ i32* %1_ align 4
			<[-]
			
			br label %3
			<<<<<<<<<<<<<<<<<<<<<<<<<<<#main/3
			+
		<<]
		>>#main/3
		[
			-
			%4 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_%1_to_%4
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%5 = icmp ult i32 %4_ i32 20
			>++++++++++++++++++++
			<#%5_icmp_%i32_%4_ult_i32_20
			>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
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
			>>>>>[-]
			<<[
				[-]
				<<+
			>>]
			br i1 %5_ label %6_ label %48
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>+
			#main/6_true
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>>>>>>>>>>+
			#main/48_false
			<<<<<<<<<<<<<<<<<<<<<<<<<<<
			]
		>]
		>#main/6
		[
			-
			store i32 0_ i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]
			
			br label %7
			<<<<<<<<<<<<<<<<<<<<<<<<<<#main/7
			+
		<]
		>#main/7
		[
			-
			%8 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>>>>>#load_%2_to_%8
			>>#tmp0_for_load
			<<<[->>>+<<+<]
			>>>[-<<<+>>>]
			%9 = icmp ult i32 %8_ i32 20
			++++++++++++++++++++
			<#%9_icmp_%i32_%8_ult_i32_20
			>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
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
			>>>>>[-]
			<<[
				[-]
				<<+
			>>]
			br i1 %9_ label %10_ label %44
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>+
			#main/10_true
			>>>>>>>>>>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>>>>>>>>+
			#main/44_false
			<<<<<<<<<<<<<<<<<<<<<<<<<
			]
		>>>]
		>#main/10
		[
			-
			%11 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>>>>>>>>>>#load_%1_to_%11
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%12 = load i32* %2_ align 4
			<#load_%2_to_%12
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%13 = icmp ult i32 %11_ i32 %12
			#%13_icmp_%i32_%11_ult_i32_%12
			>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<[->>+<<]
			>>>>+
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
			>>>>>[-]
			<<[
				[-]
				<+
			>]
			br i1 %13_ label %14_ label %15
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>+
			#main/14_true
			>>>>>>>>>>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
			>#main/4248
			+
			putchar intrinsic
			>>>>>>>>>>>>>>>>>>>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
		>#main/4248
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
			>>>>>>>>>>>>>>>>>>>>>>>#load_%1_to_%16
			>>>#tmp0_for_load
			<<<<<[->>>>>+<<<+<<]
			>>>>>[-<<<<<+>>>>>]
			%17 = load i32* %2_ align 4
			<<#load_%2_to_%17
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%18 = icmp ne i32 %16_ i32 %17
			<#%18_icmp_%i32_%16_ne_i32_%17
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
			<<[
				[-]
				<+
			>]
			>>>[
				[-]
				<<<<+
			>>>>]
			br i1 %18_ label %19_ label %20
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>+
			#main/19_true
			>>>>>>>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
			>#main/8448
			+
			putchar intrinsic
			>>>>>>>>>>>>>>>>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<<<<<<<<<<<<<<]
		>#main/8448
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
			>>>>>>>>>>>>>>>>>>>>#load_%1_to_%21
			>>>#tmp0_for_load
			<<<<<[->>>>>+<<<+<<]
			>>>>>[-<<<<<+>>>>>]
			%22 = load i32* %2_ align 4
			<<#load_%2_to_%22
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%23 = icmp eq i32 %21_ i32 %22
			<#%23_icmp_%i32_%21_eq_i32_%22
			>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<[->>+<<]
			>>>>+
			<<<<<[
				-
				>>>>>>+
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
			<<<]
			>>>>>[-]
			<<<+
			>[
				[-]
				<[-]
			>]
			>>>[
				[-]
				<<<<[-]
			>>>>]
			br i1 %23_ label %24_ label %25
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>>+
			#main/24_true
			>>>>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
			>#main/12648
			+
			putchar intrinsic
			>>>>>>>>>>>>>>>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<<<<<<<<<<<]
		>#main/12648
		[
			-
			br label %25
			>#main/25
			+
		<]
		>#main/25
		[
			-
			%26 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>#load_%1_to_%26
			>>>#tmp0_for_load
			<<<<<[->>>>>+<<<+<<]
			>>>>>[-<<<<<+>>>>>]
			%27 = load i32* %2_ align 4
			<<#load_%2_to_%27
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%28 = icmp ugt i32 %26_ i32 %27
			<#%28_icmp_%i32_%26_ugt_i32_%27
			>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<[->>>+<<<]
			>>>>>+
			<<<<[
				-
				
				>>[
					-
					
					>
				]
				>
				[
					<
				]
				<
			<<]
			>>>>[-]
			<<[
				[-]
				<+
			>]
			br i1 %28_ label %29_ label %30
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>>>>>+
			#main/29_true
			>>>>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>+
			#main/30_false
			<<<<<<<<<<<<<<<<
			]
		>>>>>>>>>>>>>]
		>#main/29
		[
			-
			call @putchar(i8 103)
			enable next
			>#main/16848
			+
			putchar intrinsic
			>>>>>>>>>>>>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<<<<<<<<]
		>#main/16848
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
			>>>>>>>>>>>>>>#load_%1_to_%31
			>>>#tmp0_for_load
			<<<<<[->>>>>+<<<+<<]
			>>>>>[-<<<<<+>>>>>]
			%32 = load i32* %2_ align 4
			<<#load_%2_to_%32
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%33 = icmp ule i32 %31_ i32 %32
			<#%33_icmp_%i32_%31_ule_i32_%32
			>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<[->>>+<<<]
			>>>>>+
			<<<<[
				-
				
				>>[
					-
					
					>
				]
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
			br i1 %33_ label %34_ label %35
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>>>>>>>>+
			#main/34_true
			>>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>>+
			#main/35_false
			<<<<<<<<<<<<<<<<<<<
			]
		>>>>>>>>>>>>>>>>]
		>#main/34
		[
			-
			call @putchar(i8 76)
			enable next
			>#main/21048
			+
			putchar intrinsic
			>>>>>>>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<<<<<]
		>#main/21048
		[
			-
			br label %35
			>#main/35
			+
		<]
		>#main/35
		[
			-
			%36 = load i32* %1_ align 4
			>>>>>>>>>>>#load_%1_to_%36
			>>>#tmp0_for_load
			<<<<<[->>>>>+<<<+<<]
			>>>>>[-<<<<<+>>>>>]
			%37 = load i32* %2_ align 4
			<<#load_%2_to_%37
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%38 = icmp uge i32 %36_ i32 %37
			<#%38_icmp_%i32_%36_uge_i32_%37
			>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<[->>+<<]
			>>>>+
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
			>>>>>[-]
			<<<+
			>[
				[-]
				<[-]
			>]
			br i1 %38_ label %39_ label %40
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>>>>>>>>>>>+
			#main/39_true
			>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>>>>>+
			#main/40_false
			<<<<<<<<<<<<<<<<<<<<<<
			]
		>>>>>>>>>>>>>>>>>>>]
		>#main/39
		[
			-
			call @putchar(i8 71)
			enable next
			>#main/25248
			+
			putchar intrinsic
			>>>>>>>>>>>>+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<<<]
		>#main/25248
		[
			-
			br label %40
			>#main/40
			+
		<]
		>#main/40
		[
			-
			call @putchar(i8 44)
			enable next
			>#main/29448
			+
			putchar intrinsic
			>>>>>>>>>>++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<<]
		>#main/29448
		[
			-
			br label %41
			>#main/41
			+
		<]
		>#main/41
		[
			-
			%42 = load i32* %2_ align 4
			>>>>>>#load_%2_to_%42
			>>>#tmp0_for_load
			<<<<[->>>>+<<<+<]
			>>>>[-<<<<+>>>>]
			%43 = add i32 %42_ i32 1
			+
			<<#%%43_add_%i32_%42_ci32_1
			<[->+<]
			>>>[-<<+>>]
			store i32 %43_ i32* %2_ align 4
			<<<<[-]
			>>[-<<+>>]
			br label %7
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<#main/7
			+
		>>>>>>>>>>>>>>>>>>>>>]
		>#main/44
		[
			-
			br label %45
			>#main/45
			+
		<]
		>#main/45
		[
			-
			%46 = load i32* %1_ align 4
			>>>>#load_%1_to_%46
			>>>#tmp0_for_load
			<<<<<[->>>>>+<<<+<<]
			>>>>>[-<<<<<+>>>>>]
			%47 = add i32 %46_ i32 1
			+
			<<#%%47_add_%i32_%46_ci32_1
			<[->+<]
			>>>[-<<+>>]
			store i32 %47_ i32* %1_ align 4
			<<<<<[-]
			>>>[-<<<+>>>]
			br label %3
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#main/3
			+
		>>>>>>>>>>>>>>>>>>>>>>>>>]
		>#main/48
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<<<<
		>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
<]
