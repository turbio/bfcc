>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
		>#main/2
		[
			-
			br label %0
			>#main/0
			+
		<]
		>#main/0
		[
			-
			call @putchar(i8 46)
			enable next
			>#main/1
			+
			putchar intrinsic
			<<++++++++++++++++++++++++++++++++++++++++++++++
			.
			[-]
		>]
		>#main/1
		[
			-
			ret void
			<<<<-
			#dead_frame
			>-
			<
			<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		>>>>]
	<<<]
<]
