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
			<<<<<<<<<<<<<<
		>>>]
		<#main/19500
		[
			-
			br label %0
			>>#main/0
			+
		<<]
		>>#main/0
		[
			-
			%1 = alloca i32_ align 4
			>>>>#alloca_%1
			%2 = alloca i8_ align 1
			>#alloca_%2
			%3 = alloca i32*_ align 8
			>#alloca_ptr_%3
			%4 = ptrtoint i32* %1 to i8
			>#%%4_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<[->>>>>>>>>>>>>+<+<<<<<<<<<<<<]
			>>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
			>
			<<++++++++
			store i8 %4_ i8* %2_ align 1
			<<[-]
			>>[-<<+>>]
			store i32* %1_ i32** %3_ align 8
			<[-]
			++++++++
			%5 = load i8* %2_ align 1
			>#load_%2_to_%5
			>#tmp0_for_load
			<<<[->>>+<+<<]
			>>>[-<<<+>>>]
			%6 = zext i8 %5 to i32
			#%6_zext_i8_%5
			<[->+<]
			%7 = icmp sgt i32 %6_ i32 0
			>>#tmp_constop_0
			
			<<#%7_icmp_%i32_%6_sgt_i32_0
			>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<<[->>+<<]
			>>>>+
			<<<[
				-
				
				>[
					-
					
					>
				]
				>
				[
					<
				]
				<
			<]
			>>>[-]
			<<[
				[-]
				<<<+
			>>>]
			%8 = zext i1 %7 to i32
			<<#%8_zext_i1_%7
			<[->+<]
			%9 = trunc i32 %8 to i8
			#%9_trunc_i32_%8
			>[-<+>]
			call @putchar(i8 %9)
			enable next
			<<<<<<<#main/4200
			+
			putchar intrinsic
			>>>>>>.
			[-]
		<<<<<<<]
		>#main/4200
		[
			-
			%10 = ptrtoint i32* %1 to i8
			>>>>>>#%%10_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<[->>>>>>>>>>>>>>+<<+<<<<<<<<<<<<]
			>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
			>
			<<<++++++++
			%11 = zext i8 %10 to i32
			>#%11_zext_i8_%10
			<[->+<]
			%12 = load i8* %2_ align 1
			#load_%2_to_%12
			>>#tmp0_for_load
			<<<<[->>>>+<<+<<]
			>>>>[-<<<<+>>>>]
			%13 = zext i8 %12 to i32
			#%13_zext_i8_%12
			<<[->>+<<]
			%14 = icmp eq i32 %11_ i32 %13
			#%14_icmp_%i32_%11_eq_i32_%13
			>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<[->+<]
			>>>+
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
			<<<<<+
			>>>[
				[-]
				<<<[-]
			>>>]
			>>>[
				[-]
				<<<<<<[-]
			>>>>>>]
			%15 = zext i1 %14 to i32
			<<<<<#%15_zext_i1_%14
			<[->+<]
			%16 = trunc i32 %15 to i8
			#%16_trunc_i32_%15
			>[-<+>]
			call @putchar(i8 %16)
			enable next
			<<<<<<#main/8400
			+
			putchar intrinsic
			>>>>>.
			[-]
		<<<<<<]
		>#main/8400
		[
			-
			%17 = load i8* %2_ align 1
			>>>>>#load_%2_to_%17
			>>>#tmp0_for_load
			<<<<<[->>>>>+<<<+<<]
			>>>>>[-<<<<<+>>>>>]
			%18 = zext i8 %17 to i64
			<<#%18_zext_i8_%17
			<[->+<]
			%19 = inttoptr i64 %18 to i32*
			%20 = icmp eq i32* %1_ i32* %19
			>>>#tmp_constptr_8
			++++++++
			>#tmp_constptr_12
			++++++++++++
			<<<<#%20_icmp_%i32*_%1_eq_i32*_%19
			>>>>>#icmp_tmpb
			>#icmp_tmp0
			>#icmp_tmp1
			<<<[->+<]
			>>>+
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
			<<<<<<<+
			>>>>>[
				[-]
				<<<<<[-]
			>>>>>]
			>>>[
				[-]
				<<<<<<<<[-]
			>>>>>>>>]
			%21 = zext i1 %20 to i32
			<<<<<<<#%21_zext_i1_%20
			<[->+<]
			%22 = trunc i32 %21 to i8
			#%22_trunc_i32_%21
			>[-<+>]
			call @putchar(i8 %22)
			enable next
			<<<<<#main/12600
			+
			putchar intrinsic
			>>>>.
			[-]
		<<<<<]
		>#main/12600
		[
			-
			ret void
			>[-]
			>[-]
			>[-]
			<<<<<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<
		>>>>>>>]
	<<<<<<]
<]
