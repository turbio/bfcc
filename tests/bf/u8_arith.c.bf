>>>>>>
++++++
>
runtime init:
#TOP_FRAME
+
>>>#main
+
>#main/b0
+
<<<<[
	>#add
	[
		>>>>#add/RET_LANDING_PAD
		[
			<<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/add
			>>>>>-
			<<<<<<<<<<<<<
		]
		<#B:add/%call_never_first_foradd
		[
			-
			>>>>>>#arg_%0
			<<
			<<<<<<<<<<[->>>>>>>>>>>>+<<<<<<<<<<<<]
			>>
			>>>>>>>>>>>#arg_%1
			<<<
			<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			>>>
			br label %2
			>>>>>>#add/%2
			+
		<<]
		>>#B:add/%2
		[
			-
			%3 = alloca i32_ align 4
			>>#alloca_%3
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
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%6 = add i32 65_ i32 %5
			<#tmp_constop_65
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>#%%6_add_%i32_65_ci32_%5
			<[->+<]
			<[->>+<<]
			%7 = load i32* %4_ align 4
			#load_%4_to_%7
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%8 = add i32 %6_ i32 %7
			#%%8_add_%i32_%6_ci32_%7
			>[-<+>]
			<<[->+<]
			%9 = trunc i32 %8 to i8
			#%9_trunc_i32_%8
			>[-<+>]
			call @putchar(i8 %9)
			enable next
			<<<<#add/%call_term_for_0
			+
			putchar intrinsic
			>>>.
			[-]
		<<<<]
		>#B:add/%call_term_for_0
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<-
			#dead_frame
			>-
			<
			<[-]
			>
			<<<<<<<<<
		>>>>>>>]
	<<<<<<]
	>#sub
	[
		>>>#sub/RET_LANDING_PAD
		[
			<<<<<-
			#dead_frame
			>>-
			<<#dead_fn_pad/sub
			>>>>>-
			<<<<<<<<<<<<<
		]
		<#B:sub/%call_never_first_forsub
		[
			-
			>>>>>>#arg_%0
			<<
			<<<<<<<<<<[->>>>>>>>>>>>+<<<<<<<<<<<<]
			>>
			>>>>>>>>>>>#arg_%1
			<<<
			<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			>>>
			br label %2
			>>>>>>#sub/%2
			+
		<<]
		>>#B:sub/%2
		[
			-
			%3 = alloca i32_ align 4
			>>#alloca_%3
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
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%6 = add i32 65_ i32 %5
			<#tmp_constop_65
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>#%%6_add_%i32_65_ci32_%5
			<[->+<]
			<[->>+<<]
			%7 = load i32* %4_ align 4
			#load_%4_to_%7
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%8 = sub i32 %6_ i32 %7
			#%%8_sub_%i32_%6_ci32_%7
			>[-<+>]
			<<[
				-
				>-
			<]
			%9 = trunc i32 %8 to i8
			#%9_trunc_i32_%8
			>[-<+>]
			call @putchar(i8 %9)
			enable next
			<<<<#sub/%call_term_for_0
			+
			putchar intrinsic
			>>>.
			[-]
		<<<<]
		>#B:sub/%call_term_for_0
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<-
			#dead_frame
			>>-
			<
			<<[-]
			>
			<<<<<<<<<
		>>>>>>>]
	<<<<<]
	>#main
	[
		>>#main/RET_LANDING_PAD
		[
			<<<<<-
			#dead_frame
			>>>-
			<<<#dead_fn_pad/main
			>>>>>-
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		]
		<#B:main/%0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>>>>>>>>>>>>>#alloca_%1
			%2 = alloca i32_ align 4
			>#alloca_%2
			%3 = alloca i32_ align 4
			>#alloca_%3
			%4 = alloca i32_ align 4
			>#alloca_%4
			store i32 0_ i32* %1_ align 4
			>#tmp_constop_0
			
			<<<<[-]
			>>>>[-<<<<+>>>>]
			br label %5
			<<<<<<<<<<<<<<<<<<<<<<#main/%5
			+
		<<]
		>>#B:main/%5
		[
			-
			%6 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>>>>>>#load_%1_to_%6
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			%7 = icmp slt i32 %6_ i32 16
			>#tmp_constop_16
			++++++++++++++++
			<#%7_icmp_%i32_%6_slt_i32_16
			>>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
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
			>>>>>-
			<<[
				[-]
				<<+
			>>]
			br i1 %7_ label %8_ label %22
			<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>[
				-
				<<<<<<<<<<<<<<<<<<<<<<<<-
				>>+
				#main/8_true
			>>>>>>>>>>>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<<<<<<[
				-
				>>>>>>>>>+
				#main/22_false
			<<<<<<<<<]
		>]
		>#B:main/%8
		[
			-
			store i32 0_ i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>>#tmp_constop_0
			
			<<<[-]
			>>>[-<<<+>>>]
			br label %9
			<<<<<<<<<<<<<<<<<<<<#main/%9
			+
		<]
		>#B:main/%9
		[
			-
			%10 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>>>>#load_%2_to_%10
			>#tmp0_for_load
			<<<<[->>>>+<+<<<]
			>>>>[-<<<<+>>>>]
			%11 = icmp slt i32 %10_ i32 16
			#tmp_constop_16
			++++++++++++++++
			>#%11_icmp_%i32_%10_slt_i32_16
			>>>>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<<<<<[->>>>>+<<<<<]
			>>>>>>>+
			<<<<<<<<[
				-
				
				>>>>>>[
					-
					
					>
				]
				>
				[
					<
				]
				<
			<<<<<<]
			>>>>>>>>-
			<<[
				[-]
				<<<<+
			>>>>]
			br i1 %11_ label %12_ label %18
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>[
				-
				<<<<<<<<<<<<<<<<<<<<<<<<<-
				>>>>+
				#main/12_true
			>>>>>>>>>>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<<<<<<<[
				-
				>>>>>>>+
				#main/18_false
			<<<<<<<]
		>>>]
		>#B:main/%12
		[
			-
			%13 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>>>>>#load_%1_to_%13
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			%14 = load i32* %2_ align 4
			#load_%2_to_%14
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			call @add(i32 %13_ i32 %14)
			enable next
			<<<<<<<<<<<<<<<<<<<<#main/%call_term_for_4
			+
			copy up arg 0
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
			copy up arg 1
			>>>>>>>>>>>>>>>#arg_1
			<<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>>>>>>>#stack_ptr
			+++++++++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
			+
			>>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>>
			<<<<<#__FRAME_add__
			+
			>#add
			+
			>>>#add/b0
			+
		>>>>>]
		>#B:main/%call_term_for_4
		[
			-
			br label %15
			>#main/%15
			+
		<]
		>#B:main/%15
		[
			-
			%16 = load i32* %2_ align 4
			>>>>>>>>>>>>>>>>>#load_%2_to_%16
			>#tmp0_for_load
			<<<<[->>>>+<+<<<]
			>>>>[-<<<<+>>>>]
			%17 = add i32 %16_ i32 1
			#tmp_constop_1
			+
			>#%%17_add_%i32_%16_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %17_ i32* %2_ align 4
			<<<<[-]
			>>>>>[-<<<<<+>>>>>]
			br label %9
			<<<<<<<<<<<<<<<<<<<<<<#main/%9
			+
		>>>]
		>#B:main/%18
		[
			-
			br label %19
			>#main/%19
			+
		<]
		>#B:main/%19
		[
			-
			%20 = load i32* %1_ align 4
			>>>>>>>>>>>>>>>#load_%1_to_%20
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			%21 = add i32 %20_ i32 1
			#tmp_constop_1
			+
			>#%%21_add_%i32_%20_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %21_ i32* %1_ align 4
			<<<<<[-]
			>>>>>>[-<<<<<<+>>>>>>]
			br label %5
			<<<<<<<<<<<<<<<<<<<<<<<<#main/%5
			+
		>>>>>>>]
		>#B:main/%22
		[
			-
			store i32 0_ i32* %3_ align 4
			>>>>>>>>>>>>>>#tmp_constop_0
			
			<<[-]
			>>[-<<+>>]
			br label %23
			<<<<<<<<<<<<<#main/%23
			+
		<]
		>#B:main/%23
		[
			-
			%24 = load i32* %3_ align 4
			>>>>>>>>>>>>>#load_%3_to_%24
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%25 = icmp slt i32 %24_ i32 16
			#tmp_constop_16
			++++++++++++++++
			>#%25_icmp_%i32_%24_slt_i32_16
			>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
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
			>>>>>-
			<<[
				[-]
				<+
			>]
			br i1 %25_ label %26_ label %40
			<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>[
				-
				<<<<<<<<<<<<<<<<<<<<<<<<<-
				>>>>>>>>>>>+
				#main/26_true
			>>>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<<<<<<<[
				-
				>>>>>>>>>>>>>>>>>>+
				#main/40_false
			<<<<<<<<<<<<<<<<<<]
		>>>>>>>>>>]
		>#B:main/%26
		[
			-
			store i32 0_ i32* %4_ align 4
			>>>>>>>>>>>>#tmp_constop_0
			
			<[-]
			>[-<+>]
			br label %27
			<<<<<<<<<<<#main/%27
			+
		<]
		>#B:main/%27
		[
			-
			%28 = load i32* %4_ align 4
			>>>>>>>>>>>#load_%4_to_%28
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%29 = icmp slt i32 %28_ i32 16
			#tmp_constop_16
			++++++++++++++++
			>#%29_icmp_%i32_%28_slt_i32_16
			>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
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
			>>>>>-
			<<[
				[-]
				<+
			>]
			br i1 %29_ label %30_ label %36
			<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>>[
				-
				<<<<<<<<<<<<<<<<<<<<<<<<<-
				>>>>>>>>>>>>>+
				#main/30_true
			>>>>>>>>>>>>]
			<<<<<<<<<<<<<<<<<<<<<<<<<[
				-
				>>>>>>>>>>>>>>>>+
				#main/36_false
			<<<<<<<<<<<<<<<<]
		>>>>>>>>>>>>]
		>#B:main/%30
		[
			-
			%31 = load i32* %3_ align 4
			>>>>>>>>>>#load_%3_to_%31
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%32 = load i32* %4_ align 4
			#load_%4_to_%32
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			call @sub(i32 %31_ i32 %32)
			enable next
			<<<<<<<<<<<#main/%call_term_for_13
			+
			copy up arg 0
			>>>>>>>>>>>>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
			copy up arg 1
			>>>>>>>>>>>>>>>#arg_1
			<<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>>>>>>>#stack_ptr
			+++++++++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
			+
			>>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>>
			<<<<<#__FRAME_sub__
			+
			>>#sub
			+
			>>#sub/b0
			+
		>>>>>>>>>>>>>>]
		>#B:main/%call_term_for_13
		[
			-
			br label %33
			>#main/%33
			+
		<]
		>#B:main/%33
		[
			-
			%34 = load i32* %4_ align 4
			>>>>>>>>#load_%4_to_%34
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%35 = add i32 %34_ i32 1
			#tmp_constop_1
			+
			>#%%35_add_%i32_%34_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %35_ i32* %4_ align 4
			<<[-]
			>>>[-<<<+>>>]
			br label %27
			<<<<<<<<<<<<<#main/%27
			+
		>>>]
		>#B:main/%36
		[
			-
			br label %37
			>#main/%37
			+
		<]
		>#B:main/%37
		[
			-
			%38 = load i32* %3_ align 4
			>>>>>>#load_%3_to_%38
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%39 = add i32 %38_ i32 1
			#tmp_constop_1
			+
			>#%%39_add_%i32_%38_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %39_ i32* %3_ align 4
			<<<[-]
			>>>>[-<<<<+>>>>]
			br label %23
			<<<<<<<<<<<<<<<#main/%23
			+
		>>>>>>>]
		>#B:main/%40
		[
			-
			ret void
			>[-]
			>[-]
			>[-]
			>[-]
			<<<<<<<<<<<<<<<<<<<<<<<<<<<-
			#dead_frame
			>>>-
			<
			<<<[-]
			>
			<<<<<<<
		>>>>>>>>>>>>>>>>>>>>>>>]
	<<<<<<<<<<<<<<<<<<<<]
<<<]