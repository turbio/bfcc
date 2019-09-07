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
skip block
store 0 at #6       >>>>>>[-]<<<<<<
skip block
store 0 at #7       >>>>>>>[-]<<<<<<<
skip block
store 0 at #8       >>>>>>>>[-]<<<<<<<<
>>>>[<<<< ; begin func block

=== begin block #5 =========
check clear #5 >>>>>[[-]<<<<<
=== Alloca ===================
store &#9 at #10    >>>>>>>>>>[-]+++++++++<<<<<<<<<<
=== Store ===================
store 0 at #11      >>>>>>>>>>>[-]<<<<<<<<<<<
store #11 at *#10   
copy addr to #3 	>>[-]>[-]>>>>>>>[-<<<<<<<<+>+>>>>>>>]<<<<<<<<<< >>>>>>>>>>[-]<<<<<<<<[->>>>>>>>+<<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>[-<<<<<<<<<<+>>>>>>>>>>]<<<<<<<<<<<
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
