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
			<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>]
		<#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>>>#alloca_%1
			%2 = alloca i8_ align 1
			>#alloca_%2
			%3 = alloca i8_ align 1
			>#alloca_%3
			%4 = alloca i8_ align 1
			>#alloca_%4
			%5 = alloca i8_ align 1
			>#alloca_%5
			store i32 0_ i32* %1_ align 4
			>#tmp_constop_0
			
			<<<<<[-]
			>>>>>[-<<<<<+>>>>>]
			store i8 1_ i8* %2_ align 1
			#tmp_constop_1
			+
			<<<<[-]
			>>>>[-<<<<+>>>>]
			store i8 0_ i8* %3_ align 1
			#tmp_constop_0
			
			<<<[-]
			>>>[-<<<+>>>]
			store i8 6_ i8* %4_ align 1
			#tmp_constop_6
			++++++
			<<[-]
			>>[-<<+>>]
			br label %6
			<<<<<<<<<<<<<#main/%6
			+
		<<]
		>>#main/6
		[
			-
			%7 = load i8* %4_ align 1
			>>>>>>>>>>>>>#load_%4_to_%7
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%8 = icmp ne i8 %7_ i8 0
			#tmp_constop_0
			
			>#%8_icmp_%i8_%7_ne_i8_0
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
			br i1 %8_ label %9_ label %32
			<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<
			-
			>>+
			#main/9_true
			>>>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>+
			#main/32_false
			<<<<<<<<
			]
		>]
		>#main/9
		[
			-
			%10 = load i8* %2_ align 1
			>>>>>>>>>>>>#load_%2_to_%10
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			%11 = zext i8 %10 to i32
			#%11_zext_i8_%10
			<[->+<]
			%12 = add i32 48_ i32 %11
			#tmp_constop_48
			++++++++++++++++++++++++++++++++++++++++++++++++
			>>#%%12_add_%i32_48_ci32_%11
			<<[->>+<<]
			>[->+<]
			%13 = trunc i32 %12 to i8
			<#%13_trunc_i32_%12
			>>[-<<+>>]
			call @putchar(i8 %13)
			enable next
			<<<<<<<<<<<<<#main/%4232
			+
			putchar intrinsic
			>>>>>>>>>>>.
			[-]
		<<<<<<<<<<<<]
		>#main/4232
		[
			-
			%14 = load i8* %4_ align 1
			>>>>>>>>>>>#load_%4_to_%14
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%15 = zext i8 %14 to i32
			#%15_zext_i8_%14
			<[->+<]
			%16 = icmp ne i32 %15_ i32 1
			#tmp_constop_1
			+
			>>#%16_icmp_%i32_%15_ne_i32_1
			>>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
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
			>>>>>>>>>[-]
			<<[
				[-]
				<<<<<+
			>>>>>]
			<<<<[
				[-]
				<+
			>]
			br i1 %16_ label %17_ label %18
			<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<
			-
			>>>>+
			#main/17_true
			>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<
			[-
			>>>>>>+
			#main/18_false
			<<<<<<
			]
		>>>]
		>#main/17
		[
			-
			call @putchar(i8 32)
			enable next
			>#main/%8432
			+
			putchar intrinsic
			>>>>>>>>>++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<<<<]
		>#main/8432
		[
			-
			br label %18
			>#main/%18
			+
		<]
		>#main/18
		[
			-
			%19 = load i8* %3_ align 1
			>>>>>>>>#load_%3_to_%19
			>#tmp0_for_load
			<<<<[->>>>+<+<<<]
			>>>>[-<<<<+>>>>]
			store i8 %19_ i8* %5_ align 1
			<<[-]
			>[-<+>]
			%20 = load i8* %2_ align 1
			#load_%2_to_%20
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			store i8 %20_ i8* %3_ align 1
			<<<<[-]
			>>>[-<<<+>>>]
			%21 = load i8* %5_ align 1
			#load_%5_to_%21
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%22 = zext i8 %21 to i32
			#%22_zext_i8_%21
			<[->+<]
			%23 = load i8* %2_ align 1
			#load_%2_to_%23
			>>#tmp0_for_load
			<<<<<<[->>>>>>+<<+<<<<]
			>>>>>>[-<<<<<<+>>>>>>]
			%24 = zext i8 %23 to i32
			#%24_zext_i8_%23
			<<[->>+<<]
			%25 = add i32 %24_ i32 %22
			#%%25_add_%i32_%24_ci32_%22
			>>[-<<+>>]
			<[-<+>]
			%26 = trunc i32 %25 to i8
			#%26_trunc_i32_%25
			<[->+<]
			store i8 %26_ i8* %2_ align 1
			<<<<[-]
			>>>>>[-<<<<<+>>>>>]
			br label %27
			<<<<<<<<#main/%27
			+
		<]
		>#main/27
		[
			-
			%28 = load i8* %4_ align 1
			>>>>>>>#load_%4_to_%28
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%29 = zext i8 %28 to i32
			#%29_zext_i8_%28
			<[->+<]
			%30 = sub i32 %29_ i32 1
			#tmp_constop_1
			+
			>>#%%30_sub_%i32_%29_ci32_1
			<[->+<]
			<
			[-
			>>
			-
			<<
			]
			%31 = trunc i32 %30 to i8
			#%31_trunc_i32_%30
			>>[-<<+>>]
			store i8 %31_ i8* %4_ align 1
			<<<<[-]
			>>[-<<+>>]
			br label %6
			<<<<<<<<<<<<<#main/%6
			+
		>>>>>>]
		>#main/32
		[
			-
			%33 = load i32* %1_ align 4
			>>>>>>#load_%1_to_%33
			>#tmp0_for_load
			<<<<<<[->>>>>>+<+<<<<<]
			>>>>>>[-<<<<<<+>>>>>>]
			ret i32 %33
			<<<<<<[-]
			>[-]
			>[-]
			>[-]
			>[-]
			<<<<<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<
		>>>>>>>>>>>]
	<<<<<<<<<<]
<]
