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
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>]
		<#main/27900
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
			>>>>>>#alloca_%1
			%2 = alloca i8_ align 1
			>#alloca_%2
			%3 = alloca i32*_ align 8
			>#alloca_%3
			%4 = alloca i32_ align 4
			>#alloca_%4
			%5 = alloca i32_ align 4
			>#alloca_%5
			store i32 112_ i32* %1_ align 4
			>#tmp_constop_112
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<<<<<[-]
			>>>>>[-<<<<<+>>>>>]
			%6 = ptrtoint i32* %1 to i8
			#%%6_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++
			store i8 %6_ i8* %2_ align 1
			<<<<[-]
			>>>>[-<<<<+>>>>]
			store i32* %1_ i32** %3_ align 8
			#tmp_allocptr_%1
			<
			<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++
			<<<[-]
			>>>[-<<<+>>>]
			%7 = load i8* %2_ align 1
			#load_%2_to_%7
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			%8 = zext i8 %7 to i32
			#%8_zext_i8_%7
			<[->+<]
			%9 = icmp sgt i32 %8_ i32 0
			#tmp_constop_0
			
			>>#%9_icmp_%i32_%8_sgt_i32_0
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
			%10 = zext i1 %9 to i32
			<<<#%10_zext_i1_%9
			>>[-<<+>>]
			%11 = trunc i32 %10 to i8
			<#%11_trunc_i32_%10
			<[->+<]
			call @putchar(i8 %11)
			enable next
			<<<<<<<<<<#main/%4200
			+
			putchar intrinsic
			>>>>>>>>>>>.
			[-]
		<<<<<<<<<<<<]
		>#main/4200
		[
			-
			%12 = ptrtoint i32* %1 to i8
			>>>>>>>>>>#%%12_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++
			%13 = zext i8 %12 to i32
			>#%13_zext_i8_%12
			<[->+<]
			%14 = load i8* %2_ align 1
			#load_%2_to_%14
			>>#tmp0_for_load
			<<<<<<[->>>>>>+<<+<<<<]
			>>>>>>[-<<<<<<+>>>>>>]
			%15 = zext i8 %14 to i32
			#%15_zext_i8_%14
			<<[->>+<<]
			%16 = icmp eq i32 %13_ i32 %15
			#%16_icmp_%i32_%13_eq_i32_%15
			>>>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<<[->>>>+<<<<]
			>>>>>>+
			<<<<<<<[
				-
				>>+
				>>>[
					-
					<<<-
					>
				>>>]
				>
				[
					<
				]
				<
			<<<<<]
			>>>>>>>[-]
			<<<<<<<<+
			>>>>>>[
				[-]
				<<<<<<[-]
			>>>>>>]
			<<<[
				[-]
				<<<[-]
			>>>]
			%17 = zext i1 %16 to i32
			<<#%17_zext_i1_%16
			<[->+<]
			%18 = trunc i32 %17 to i8
			#%18_trunc_i32_%17
			>[-<+>]
			call @putchar(i8 %18)
			enable next
			<<<<<<<<<<#main/%8400
			+
			putchar intrinsic
			>>>>>>>>>.
			[-]
		<<<<<<<<<<]
		>#main/8400
		[
			-
			%19 = load i8* %2_ align 1
			>>>>>>>>>#load_%2_to_%19
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			%20 = zext i8 %19 to i64
			#%20_zext_i8_%19
			<[->+<]
			%21 = inttoptr i64 %20 to i32*
			#%21_itoptr_i64_%20
			>[-<+>]
			%22 = icmp eq i32* %1_ i32* %21
			#tmp_allocptr_%1
			<
			<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++
			>>#%22_icmp_%i32*_%1_eq_i32*_%21
			>>>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			>>>>>>>>>>>+
			<<<<<<<<<<[
				-
				>>>+
				>>>>>[
					-
					<<<<<-
					>
				>>>>>]
				>
				[
					<
				]
				<
			<<<<<<<<]
			>>>>>>>>>>[-]
			<<<<<<<<+
			>>>>>>[
				[-]
				<<<<<<[-]
			>>>>>>]
			<<<<<[
				[-]
				<[-]
			>]
			%23 = zext i1 %22 to i32
			<<<<#%23_zext_i1_%22
			>>>[-<<<+>>>]
			%24 = trunc i32 %23 to i8
			<<#%24_trunc_i32_%23
			<[->+<]
			call @putchar(i8 %24)
			enable next
			<<<<<<<<#main/%12600
			+
			putchar intrinsic
			>>>>>>>>>.
			[-]
		<<<<<<<<<<]
		>#main/12600
		[
			-
			%25 = load i32** %3_ align 8
			>>>>>>>>#load_%3_to_%25
			>#tmp0_for_load
			<<<<[->>>>+<+<<<]
			>>>>[-<<<<+>>>>]
			%26 = load i32* %25_ align 4
			>>>>>>>>>>>#train_tmp
			>#train_ret
			>#train_ptr
			+++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			<<<<<<<<<<<<<[->>>>>>>>>>>>+<<<<<<<<<<<<]
			>>>>>>>>>>>>>[
				-
				<-
			>]
			<[
				-
				>>-
			<<]
			drive left! choo choo
			>>[
				<[-<+>]
				>[-<+>]
				<<<[->>>+<<<]
				<
				>>>-
				<+
			>]
			get our bag
			<<<[->+>>+<<<]
			>[-<+>]
			drive baaaack
			>[
				>>[-<<<+>>>]
				<[->+<]
				<[->+<]
				>
				-
			]
			>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
			store i32 %26_ i32* %4_ align 4
			<<<<<<<<<<<<<<<<[-]
			>>>[-<<<+>>>]
			%27 = load i32* %4_ align 4
			#load_%4_to_%27
			>#tmp0_for_load
			<<<<[->>>>+<+<<<]
			>>>>[-<<<<+>>>>]
			%28 = trunc i32 %27 to i8
			#%28_trunc_i32_%27
			<[->+<]
			call @putchar(i8 %28)
			enable next
			<<<<<<<<#main/%16800
			+
			putchar intrinsic
			>>>>>>>>>.
			[-]
		<<<<<<<<<<]
		>#main/16800
		[
			-
			%29 = load i32** %3_ align 8
			>>>>>>>>#load_%3_to_%29
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			store i32 97_ i32* %29_ align 4
			#tmp_constop_97
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>>>>>>>>>>>>>#train_tmp
			>#train_ret
			>#train_ptr
			>#train_cargo
			<++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>[
				-
				<-
			>]
			<[
				-
				>>-
			<<]
			<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<]
			drive left! choo choo
			>>>>>>>>>>>>>>>[
				<[-<+>]
				>[-<+>]
				>[-<+>]
				<<<<[->>>>+<<<<]
				<
				>>>-
				<+
			>]
			<<<[-]
			>>>>[-<<<<+>>>>]
			<<[
				>>>[-<<<<+>>>>]
				<<<[->+<]
				>
				-
			]
			%30 = load i32** %3_ align 8
			<<<<<<<<<<<<<<#load_%3_to_%30
			>#tmp0_for_load
			<<<<<<[->>>>>>+<+<<<<<]
			>>>>>>[-<<<<<<+>>>>>>]
			%31 = load i32* %30_ align 4
			>>>>>>>>>>>>>>>>#train_tmp
			>#train_ret
			>#train_ptr
			++++++++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>[
				-
				<-
			>]
			<[
				-
				>>-
			<<]
			drive left! choo choo
			>>[
				<[-<+>]
				>[-<+>]
				<<<[->>>+<<<]
				<
				>>>-
				<+
			>]
			get our bag
			<<<[->+>>+<<<]
			>[-<+>]
			drive baaaack
			>[
				>>[-<<<+>>>]
				<[->+<]
				<[->+<]
				>
				-
			]
			>[-<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>]
			store i32 %31_ i32* %5_ align 4
			<<<<<<<<<<<<<<<<<<<<<<[-]
			>>>>[-<<<<+>>>>]
			%32 = load i32* %5_ align 4
			#load_%5_to_%32
			>#tmp0_for_load
			<<<<<[->>>>>+<+<<<<]
			>>>>>[-<<<<<+>>>>>]
			%33 = trunc i32 %32 to i8
			#%33_trunc_i32_%32
			<[->+<]
			call @putchar(i8 %33)
			enable next
			<<<<<<<<<#main/%21000
			+
			putchar intrinsic
			>>>>>>>>>>.
			[-]
		<<<<<<<<<<<]
		>#main/21000
		[
			-
			ret void
			>[-]
			>[-]
			>[-]
			>[-]
			>[-]
			<<<<<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<
		>>>>>>>>>]
	<<<<<<<<]
<]
