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
	>#deref_int_inc
	[
		>>>>#deref_int_inc/RET_LANDING_PAD
		[
			<<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/deref_int_inc
			>>>>>-
			<<<<<
			<<<<<<<<<<<<<<<<<<<<<
		>>>>>]
		<#deref_int_inc/%1
		[
			-
			>>>#arg_%0
			<<
			<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			>>
			%2 = alloca i8_ align 1
			>>>>>>#alloca_%2
			store i8 %0_ i8* %2_ align 1
			[-]
			>[-<+>]
			%3 = load i8* %2_ align 1
			#load_%2_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = zext i8 %3 to i64
			#%4_zext_i8_%3
			<[->+<]
			%5 = inttoptr i64 %4 to i32*
			#%5_itoptr_i64_%4
			>[-<+>]
			%6 = load i32* %5_ align 4
			>#train_tmp
			>#train_ret
			>#train_ptr
			
			>>#stackptr
			<#stackptr_tmp
			<
			<<<<<<<<<<<<[->>>>>>>>>>>>>+>+<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
			>
			>#ptr_underflow
			>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<<[->>+<<]
			>>>>+
			<<<<<<<<<<[
				-
				>>>>>>>+
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
			<<<<<<<<]
			>>>>>>>>>>-
			<<#subnu_to
			[
				[-<<<<+>>>>]
				<<<<+++++++++
			>>>>]
			<[
				<<<+++++++++
				>>>[
					-
					<<<-
				>>>]
			]
			drive left! choo choo
			<<<[
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
			>[
				>>[-<<<+>>>]
				<[->+<]
				<[->+<]
				>
				-
			]
			>[-<<<+>>>]
			%7 = add i32 %6_ i32 1
			<<#tmp_constop_1
			+
			>#%%7_add_%i32_%6_ci32_1
			<<[->>+<<]
			>[->+<]
			store i32 %7_ i32* %5_ align 4
			>>#train_tmp
			>#train_ret
			>#train_ptr
			>#train_cargo
			<<<<<#stackptr
			<#stackptr_tmp
			<
			<<<<<<<<[->>>>>>>>>+>+<<<<<<<<<<]
			>>>>>>>>>[-<<<<<<<<<+>>>>>>>>>]
			>
			>>>>>>#ptr_underflow
			>>>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			>>>>>>>>>>>+
			<<<<<<<<<<<<<[
				-
				>>>>>>>>+
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
			<<<<<<<<<<<]
			>>>>>>>>>>>>>-
			<<#subnu_to
			[
				[-<<<<<+>>>>>]
				<<<<<+++++++++++
			>>>>>]
			<<<[
				<<+++++++++++
				>>[
					-
					<<-
				>>]
			]
			<<<<<[->>>>+<<<<]
			drive left! choo choo
			>>>[
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
			ret void
			<<<<<<[-]
			<<<<<<-
			#dead_frame
			>-
			<
			<
			[-]
			>
			<<<<<<<<
		>>>>]
	<<<]
	>#deref_int
	[
		>>>#deref_int/RET_LANDING_PAD
		[
			<<<<<-
			#dead_frame
			>>-
			<<#dead_fn_pad/deref_int
			>>>>>-
			<<<<<
			<<<<<<<<<<<<<<<<<<<<
		>>>>>]
		<#deref_int/%call_never_first_forderef_int
		[
			-
			>>>>>#arg_%0
			<<
			<<<<<<<<<[->>>>>>>>>>>+<<<<<<<<<<<]
			>>
			br label %1
			>>>>>>#deref_int/%1
			+
		<<]
		>>#deref_int/%1
		[
			-
			%2 = alloca i8_ align 1
			>>#alloca_%2
			store i8 %0_ i8* %2_ align 1
			[-]
			>[-<+>]
			%3 = load i8* %2_ align 1
			#load_%2_to_%3
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%4 = zext i8 %3 to i64
			#%4_zext_i8_%3
			<[->+<]
			%5 = inttoptr i64 %4 to i32*
			#%5_itoptr_i64_%4
			>[-<+>]
			%6 = load i32* %5_ align 4
			>#train_tmp
			>#train_ret
			>#train_ptr
			
			>>#stackptr
			<#stackptr_tmp
			<
			<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]
			>
			>#ptr_underflow
			>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<<[->>+<<]
			>>>>+
			<<<<<<<<<<[
				-
				>>>>>>>+
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
			<<<<<<<<]
			>>>>>>>>>>-
			<<#subnu_to
			[
				[-<<<<+>>>>]
				<<<<+++++++++++
			>>>>]
			<[
				<<<+++++++++++
				>>>[
					-
					<<<-
				>>>]
			]
			drive left! choo choo
			<<<[
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
			>[
				>>[-<<<+>>>]
				<[->+<]
				<[->+<]
				>
				-
			]
			>[-<<<+>>>]
			%7 = trunc i32 %6 to i8
			<<#%7_trunc_i32_%6
			<[->+<]
			call @putchar(i8 %7)
			enable next
			<<<#deref_int/%call_term_for_0
			+
			putchar intrinsic
			>>>>.
			[-]
		<<<<<]
		>#deref_int/%call_term_for_0
		[
			-
			ret void
			>[-]
			<<<<<<<<-
			#dead_frame
			>>-
			<<
			<
			[-]
			>
			<<<<<<<<
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
			<<<<<
			<<<<<<<<<<<<<<
		>>>>>]
		<#main/%call_never_first_formain
		[
			-
			br label %0
			>>#main/%0
			+
		<<]
		>>#main/%0
		[
			-
			%1 = alloca i32_ align 4
			>>>>#alloca_%1
			store i32 97_ i32* %1_ align 4
			>#tmp_constop_97
			+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<[-]
			>[-<+>]
			%2 = ptrtoint i32* %1 to i8
			#%%2_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<[->>>>>>>>>>>>>+<+<<<<<<<<<<<<]
			>>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
			>
			<<+++++++++++
			call @deref_int(i8 %2)
			enable next
			<<<<#main/%call_term_for_0
			+
			copy up arg 0
			>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
			>
			<<<<<<<<<<<<<<<<<<<<<<<
			>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<<#__FRAME_deref_int__
			+
			>>#deref_int
			+
			>>#deref_int/b0
			+
		>>]
		>#main/%call_term_for_0
		[
			-
			%3 = ptrtoint i32* %1 to i8
			>>>>#%%3_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<[->>>>>>>>>>>>>>+<<+<<<<<<<<<<<<]
			>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<+>>>>>>>>>>>>>>]
			>
			<<<+++++++++++
			call @deref_int_inc(i8 %3)
			enable next
			<<<#main/%call_term_for_1
			+
			copy up arg 0
			>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
			>
			<<<<<<<<<<<<<<<<<<<<<<<
			>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<<#__FRAME_deref_int_inc__
			+
			>#deref_int_inc
			+
			>>>#deref_int_inc/b0
			+
		>>>]
		>#main/%call_term_for_1
		[
			-
			%4 = ptrtoint i32* %1 to i8
			>>>#%%4_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<[->>>>>>>>>>>>>+<+<<<<<<<<<<<<]
			>>>>>>>>>>>>>[-<<<<<<<<<<<<<+>>>>>>>>>>>>>]
			>
			<<+++++++++++
			call @deref_int(i8 %4)
			enable next
			<<#main/%call_term_for_2
			+
			copy up arg 0
			>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>]
			>
			<<<<<<<<<<<<<<<<<<<<<<<
			>>>>>>>>>>>>>>
			#JUMP_PAD
			+
			>>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<<#__FRAME_deref_int__
			+
			>>#deref_int
			+
			>>#deref_int/b0
			+
		>>>>]
		>#main/%call_term_for_2
		[
			-
			ret void
			>[-]
			<<<<<<<<<<-
			#dead_frame
			>>>-
			<<<
			<
			[-]
			>
			<<<<<<<
		>>>>>>>>>]
	<<<<<<]
<<<]
