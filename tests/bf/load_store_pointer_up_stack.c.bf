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
	>#deref_int_set
	[
		>>>>#deref_int_set/RET_LANDING_PAD
		[
			<<<<<-
			#dead_frame
			>-
			<#dead_fn_pad/deref_int_set
			>>>>>-
			<<<<<<<<<<<<<<<<<<<<<
		]
		<#B:deref_int_set/%call_never_first_forderef_int_set
		[
			-
			>>>>>#arg_%0
			<<
			<<<<<<<<<[->>>>>>>>>>>+<<<<<<<<<<<]
			>>
			br label %1
			>>>>>>#deref_int_set/%1
			+
		<<]
		>>#B:deref_int_set/%1
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
			store i32 98_ i32* %5_ align 4
			>#tmp_constop_98
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			>#train_tmp
			>#train_ret
			>#train_ptr
			>#train_cargo
			>#stackptr
			<<<<<<#stackptr_tmp
			<
			<<<<<<<<<<[->>>>>>>>>>>+>>>>>>+<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]
			>
			>>>>>>#ptr_underflow
			>#subnu_tmpb
			>#subnu_tmp0
			>#subnu_tmp1
			<<<<[->>+<<]
			>>>>+
			<<<<<<<<<<<[
				-
				>>>>>>>>+
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
			<<<<<<<<<]
			>>>>>>>>>>>-
			<<#subnu_to
			[
				[-<<<<+>>>>]
				<<<<++++++++++++
			>>>>]
			<[
				<<<++++++++++++
				>>>[
					-
					<<<-
				>>>]
			]
			<<<<<<[->>>>+<<<<]
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
			%6 = load i8* %2_ align 1
			<<<<#load_%2_to_%6
			>#tmp0_for_load
			<<[->>+<+<]
			>>[-<<+>>]
			%7 = zext i8 %6 to i64
			#%7_zext_i8_%6
			<[->+<]
			%8 = inttoptr i64 %7 to i32*
			#%8_itoptr_i64_%7
			>[-<+>]
			%9 = load i32* %8_ align 4
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
			%10 = trunc i32 %9 to i8
			<<<<#%10_trunc_i32_%9
			>[-<+>]
			call @putchar(i8 %10)
			enable next
			<<<#deref_int_set/%call_term_for_0
			+
			putchar intrinsic
			>>.
			[-]
		<<<]
		>#B:deref_int_set/%call_term_for_0
		[
			-
			ret void
			>[-]
			<<<<<<<<-
			#dead_frame
			>-
			<
			<[-]
			>
			<<<<<<<<
		>>>>>>>]
	<<<<<<]
	>#deref_int
	[
		>>>#deref_int/RET_LANDING_PAD
		[
			<<<<<-
			#dead_frame
			>>-
			<<#dead_fn_pad/deref_int
			>>>>>-
			<<<<<<<<<<<<<<<<<<<<
		]
		<#B:deref_int/%call_never_first_forderef_int
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
		>>#B:deref_int/%1
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
			<<<<#%7_trunc_i32_%6
			>[-<+>]
			call @putchar(i8 %7)
			enable next
			<<<#deref_int/%call_term_for_0
			+
			putchar intrinsic
			>>.
			[-]
		<<<]
		>#B:deref_int/%call_term_for_0
		[
			-
			ret void
			>[-]
			<<<<<<<<-
			#dead_frame
			>>-
			<
			<<[-]
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
			<<<<<<<<<<<<<<<<<<<<
		]
		<#B:main/%call_never_first_formain
		[
			-
			br label %0
			>>#main/%0
			+
		<<]
		>>#B:main/%0
		[
			-
			%1 = alloca i32_ align 4
			>>>>>>>>#alloca_%1
			%2 = alloca i32_ align 4
			>#alloca_%2
			%3 = alloca i32_ align 4
			>#alloca_%3
			store i32 112_ i32* %1_ align 4
			>#tmp_constop_112
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<<<[-]
			>>>[-<<<+>>>]
			store i32 116_ i32* %2_ align 4
			>#tmp_constop_116
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<<<[-]
			>>>[-<<<+>>>]
			store i32 114_ i32* %3_ align 4
			<#tmp_constop_114
			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			<[-]
			>[-<+>]
			%4 = ptrtoint i32* %1 to i8
			#%%4_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]
			>
			<<<+++++++++++++++
			call @deref_int(i8 %4)
			enable next
			<<<<<<<<<<#main/%call_term_for_0
			+
			copy up arg 0
			>>>>>>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
		>#B:main/%call_term_for_0
		[
			-
			%5 = ptrtoint i32* %2 to i8
			>>>>>>>>>>#%%5_ptrtoi_%i32*_%2
			<
			<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
			>
			<<++++++++++++++++
			call @deref_int(i8 %5)
			enable next
			<<<<<<<<<#main/%call_term_for_1
			+
			copy up arg 0
			>>>>>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
		>>>]
		>#B:main/%call_term_for_1
		[
			-
			%6 = ptrtoint i32* %3 to i8
			>>>>>>>>>#%%6_ptrtoi_%i32*_%3
			<
			<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++++++++
			call @deref_int(i8 %6)
			enable next
			<<<<<<<<#main/%call_term_for_2
			+
			copy up arg 0
			>>>>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
		>#B:main/%call_term_for_2
		[
			-
			%7 = ptrtoint i32* %1 to i8
			>>>>>>>>#%%7_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++++++
			call @deref_int_set(i8 %7)
			enable next
			<<<<<<<#main/%call_term_for_3
			+
			copy up arg 0
			>>>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
			+
			>>>#main
			+
			>>#main/jump_pad_blk
			+
			>>>>>>>>
			<<<<<#__FRAME_deref_int_set__
			+
			>#deref_int_set
			+
			>>>#deref_int_set/b0
			+
		>>>>>]
		>#B:main/%call_term_for_3
		[
			-
			%8 = ptrtoint i32* %1 to i8
			>>>>>>>#%%8_ptrtoi_%i32*_%1
			<
			<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++++++
			call @deref_int(i8 %8)
			enable next
			<<<<<<#main/%call_term_for_4
			+
			copy up arg 0
			>>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
		>>>>>>]
		>#B:main/%call_term_for_4
		[
			-
			%9 = ptrtoint i32* %2 to i8
			>>>>>>#%%9_ptrtoi_%i32*_%2
			<
			<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
			>
			<<++++++++++++++++
			call @deref_int(i8 %9)
			enable next
			<<<<<#main/%call_term_for_5
			+
			copy up arg 0
			>>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
		>>>>>>>]
		>#B:main/%call_term_for_5
		[
			-
			%10 = ptrtoint i32* %3 to i8
			>>>>>#%%10_ptrtoi_%i32*_%3
			<
			<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>+<+<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>]
			>
			<<+++++++++++++++++
			call @deref_int(i8 %10)
			enable next
			<<<<#main/%call_term_for_6
			+
			copy up arg 0
			>>>>>>>>>>>>>#arg_0
			<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]
			give callee a stack pointer
			>>>>>>>>>>#stack_ptr
			++++++++++++++++++++++++++++
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>>+>+<<<<<<<<<<<<<<<<<<<<<<<<<<<<<]
			>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]
			>
			>>>>>>>>>>>>>>>>>>>>
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<#JUMP_PAD
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
		>>>>>>>>]
		>#B:main/%call_term_for_6
		[
			-
			ret void
			>[-]
			>[-]
			>[-]
			<<<<<<<<<<<<<<<<-
			#dead_frame
			>>>-
			<
			<<<[-]
			>
			<<<<<<<
		>>>>>>>>>>>>>]
	<<<<<<<<<<]
<<<]
