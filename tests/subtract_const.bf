=== begin func main ==============
pointer train station
store 0 at #0       [-]
store 0 at #1       >[-]<
store 0 at #2       >>[-]<<
store 0 at #3       >>>[-]<<<
=== func prelude ============
do func
store 1 at #4       >>>>[-]+<<<<
do block
store 1 at #5       >>>>>[-]+<<<<<
>>>>[<<<< ; begin func block

=== begin block #5 =========
check clear #5 >>>>>[[-]<<<<<
=== Alloca ===================
store &#6 at #7     >>>>>>>[-]++++++<<<<<<<
=== Store ===================
store 97 at #8      >>>>>>>>[-]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<<<<<<<<
store #8 at *#7     
copy addr to #3 	>>[-]>[-]>>>>[-<<<<<+>+>>>>]<<<<<<< >>>>>>>[-]<<<<<[->>>>>+<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>[-<<<<<<<+>>>>>>>]<<<<<<<<
dec #3 inc #2   	>>>[-<+<<
move #4 to #0   	[-]>>>>[-<<<<+>>>>]<<<<
move #3 to #4   	>>>>[-]<[->+<]<<<
move #2 to #3   	>>>[-]<[->+<]<<
move #1 to #2   	>>[-]<[->+<]<
drive right     	>
                	>>>]<<<
move #1 to #4   	>>>>[-]<<<[->>>+<<<]<
                	>>[-<<
move #2 to #1   	>[-]>[-<+>]<<
drive left      	<
move #0 to #3   	>>>>[-]<<<<[->>>>+<<<<]
                	>>]<<

=== Load ===================
load *#7 to #8      
copy addr to #2 	>[-]>[-]>>>>>[-<<<<<<+>+>>>>>]<<<<<<< >>>>>>>[-]<<<<<<[->>>>>>+<<<<<<]<
dec #2 by 3     	>>---<<
dec #2 inc #1   	>>[-<+<
move #3 to #0   	[-]>>>[-<<<+>>>]<<<
move #2 to #3   	>>>[-]<[->+<]<<
move #1 to #2   	>>[-]<[->+<]<
drive right     	>
                	>>]<<
copy #3 to #2   	[-]>>[-]>[-<<<+>>+>]<<< >>>[-]<<<[->>>+<<<]
                	>[-<
move #1 to #0   	[-]>[-<+>]<
move #2 to #1   	>[-]>[-<+>]<<
drive left      	<
move #0 to #3   	>>>[-]<<<[->>>+<<<]
                	>]<
copy #2 to dest 	>>>>>>>>[-]<<<<<<[->>>>>>+<<<<<<]<<

=== ZExt ===================
move #8 to #9 #10   >>>>>>>>>[-]>[-]<<[->+>+<<]<<<<<<<<
move #10 to #8      >>>>>>>>[-]>>[-<<+>>]<<<<<<<<<<
=== Sub ===================
move #9 to #10 #11  >>>>>>>>>>[-]>[-]<<[->+>+<<]<<<<<<<<<
move #11 to #9      >>>>>>>>>[-]>>[-<<+>>]<<<<<<<<<<<
sub 32 from #10     >>>>>>>>>>--------------------------------<<<<<<<<<<
=== Trunc ===================
move #10 to #11 #12 >>>>>>>>>>>[-]>[-]<<[->+>+<<]<<<<<<<<<<
move #12 to #10     >>>>>>>>>>[-]>>[-<<+>>]<<<<<<<<<<<<
=== Call ===================
putc #11            >>>>>>>>>>>.<<<<<<<<<<<
=== Return ===================
return #4 TODO      >>>>-<<<<
=== end block #5 ===========
check #5       >>>>>]<<<<<

>>>>]<<<< ; end func block
=== end func main ================

=== begin func putc ==============
=== end func putc ================

