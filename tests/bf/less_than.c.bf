>>>>>
++++
>
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
		>>>#lt/RET_LANDING_PAD
		[
			<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/lt
			>>>>-
			<<<<
			<<<<<<<<<<<<<<<<<<
		>>>>]
		<#lt/2
		[
			-
			>>>>>>>>>#arg_%0
			<<
			<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			>>
			>>>>>>>>>>>>>#arg_%1
			<<<
			<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
			>>>
			%3 = alloca i32_ align 4
			>>>>>>>>>>#alloca_%3
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
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%6 = load i32* %4_ align 4
			#load_%4_to_%6
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%7 = icmp slt i32 %5_ i32 %6
			#%7_icmp_%i32_%5_slt_i32_%6
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
			br i1 %7_ label %8_ label %9
			<<<<<<<<<<<+
			>>>>>>>>>>
			[-
			<<<<<<<<<<
			-
			>+
			#lt/8_true
			>>>>>>>>>
			]
			<<<<<<<<<<
			[-
			>>>+
			#lt/9_false
			<<<
			]
		<]
		>>#lt/8
		[
			-
			call @putchar(i8 108)
			enable next
			>#lt/%4210
			+
			putchar intrinsic
			>>>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<<<]
		>#lt/4210
		[
			-
			br label %10
			>>>#lt/%10
			+
		<<<]
		>#lt/9
		[
			-
			call @putchar(i8 114)
			enable next
			>#lt/%8410
			+
			putchar intrinsic
			>>>>++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		<<<<<]
		>#lt/8410
		[
			-
			br label %10
			>#lt/%10
			+
		<]
		>#lt/10
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<<<<
		>>>>>>>>>]
	<<<<<<<<]
	>#main
	[
		>>#main/RET_LANDING_PAD
		[
			<<<<-
			#dead_frame
			>>-
			<<#dead_fn_pad/main
			>>>>-
			<<<<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>>]
		<#main/48920
		[
			-
			br label %0
			>>#main/%0
			+
		<<]
		>>#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>>>>>>>>>>>>#alloca_%1
			%2 = alloca i32_ align 4
			>#alloca_%2
			call @lt(i32 1_ i32 2)
			enable next
			<<<<<<<<<<<<<<<<<<<#main/%4220
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+
			<++
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>]
		>#main/4220
		[
			-
			call @lt(i32 2_ i32 1)
			enable next
			>#main/%8420
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>++
			<+
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>]
		>#main/8420
		[
			-
			call @lt(i32 3_ i32 4)
			enable next
			>#main/%12620
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+++
			<++++
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>>]
		>#main/12620
		[
			-
			call @lt(i32 3_ i32 3)
			enable next
			>#main/%16820
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+++
			<+++
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>>>]
		>#main/16820
		[
			-
			call @lt(i32 4_ i32 5)
			enable next
			>#main/%21020
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>++++
			<+++++
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>>>>]
		>#main/21020
		[
			-
			call @lt(i32 5_ i32 6)
			enable next
			>#main/%25220
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+++++
			<++++++
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>>>>>]
		>#main/25220
		[
			-
			call @lt(i32 6_ i32 7)
			enable next
			>#main/%29420
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>++++++
			<+++++++
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>>>>>>]
		>#main/29420
		[
			-
			call @lt(i32 7_ i32 8)
			enable next
			>#main/%33620
			+
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>+++++++
			<++++++++
			>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>>>>>>>]
		>#main/33620
		[
			-
			call @putchar(i8 10)
			enable next
			>#main/%37820
			+
			putchar intrinsic
			>>>>>>>>>>>>++++++++++
			.
			[-]
		<<<<<<<<<<<<<]
		>#main/37820
		[
			-
			store i32 0_ i32* %1_ align 4
			>>>>>>>>>>>>#tmp_constop_0
			
			<<[-]
			>>[-<<+>>]
			br label %3
			<<<<<<<<<<<#main/%3
			+
		<]
		>#main/3
		[
			-
			%4 = load i32* %1_ align 4
			>>>>>>>>>>>#load_%1_to_%4
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%5 = icmp slt i32 %4_ i32 20
			#tmp_constop_20
			++++++++++++++++++++
			>#%5_icmp_%i32_%4_slt_i32_20
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
			br i1 %5_ label %6_ label %20
			<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>>>+
			#main/6_true
			>>>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>>>+
			#main/20_false
			<<<<<<<<<<<<<<<<<<<
			]
		>>>>>>>>>>>]
		>#main/6
		[
			-
			store i32 0_ i32* %2_ align 4
			>>>>>>>>>>#tmp_constop_0
			
			<[-]
			>[-<+>]
			br label %7
			<<<<<<<<<#main/%7
			+
		<]
		>#main/7
		[
			-
			%8 = load i32* %2_ align 4
			>>>>>>>>>#load_%2_to_%8
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%9 = icmp slt i32 %8_ i32 20
			#tmp_constop_20
			++++++++++++++++++++
			>#%9_icmp_%i32_%8_slt_i32_20
			>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
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
			>>>>>>>>[-]
			<<[
				[-]
				<<<<+
			>>>>]
			br i1 %9_ label %10_ label %16
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<+
			>>>>>>>>>>>>>>>>>>>>>>>>
			[-
			<<<<<<<<<<<<<<<<<<<<<<<<
			-
			>>>>>>>>>>>>>>+
			#main/10_true
			>>>>>>>>>>
			]
			<<<<<<<<<<<<<<<<<<<<<<<<
			[-
			>>>>>>>>>>>>>>>>>+
			#main/16_false
			<<<<<<<<<<<<<<<<<
			]
		>>>>>>>>>>>>>]
		>#main/10
		[
			-
			%11 = load i32* %1_ align 4
			>>>>>>>>#load_%1_to_%11
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%12 = load i32* %2_ align 4
			#load_%2_to_%12
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			call @lt(i32 %11_ i32 %12)
			enable next
			<<<<<<<<<#main/%42020
			+
			>>>>>>>[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]
			>[->>>>>>>>>>>>>+<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>+++++++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>
			
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<#__FRAME_lt__
			+
			>#lt
			+
			>>#lt/b0
			+
		>>>>>>>>>>>>>>>]
		>#main/42020
		[
			-
			br label %13
			>#main/%13
			+
		<]
		>#main/13
		[
			-
			%14 = load i32* %2_ align 4
			>>>>>>#load_%2_to_%14
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%15 = add i32 %14_ i32 1
			#tmp_constop_1
			+
			>#%%15_add_%i32_%14_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %15_ i32* %2_ align 4
			<<[-]
			>>>[-<<<+>>>]
			br label %7
			<<<<<<<<<<<#main/%7
			+
		>>>]
		>#main/16
		[
			-
			br label %17
			>#main/%17
			+
		<]
		>#main/17
		[
			-
			%18 = load i32* %1_ align 4
			>>>>#load_%1_to_%18
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%19 = add i32 %18_ i32 1
			#tmp_constop_1
			+
			>#%%19_add_%i32_%18_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %19_ i32* %1_ align 4
			<<<[-]
			>>>>[-<<<<+>>>>]
			br label %3
			<<<<<<<<<<<<<#main/%3
			+
		>>>>>>>]
		>#main/20
		[
			-
			ret void
			>[-]
			>[-]
			<<<<<<<<<<<<<<<<<<<<<<<<<-
			#dead_frame
			>>-
			<<
			<
			[-]
			>
			<<<<<<
		>>>>>>>>>>>>>>>>>>>>>>>]
	<<<<<<<<<<<<<<<<<<<<<]
<<]
