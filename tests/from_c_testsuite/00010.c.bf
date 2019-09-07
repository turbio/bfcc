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
skip block
store 0 at #9       >>>>>>>>>[-]<<<<<<<<<
>>>>[<<<< ; begin func block

=== begin block #5 =========
check clear #5 >>>>>[[-]<<<<<
=== Alloca ===================
store &#10 at #11   >>>>>>>>>>>[-]++++++++++<<<<<<<<<<<
=== Store ===================
store 0 at #12      >>>>>>>>>>>>[-]<<<<<<<<<<<<
store #12 at *#11   
copy addr to #3 	>>[-]>[-]>>>>>>>>[-<<<<<<<<<+>+>>>>>>>>]<<<<<<<<<<< >>>>>>>>>>>[-]<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>[-<<<<<<<<<<<+>>>>>>>>>>>]<<<<<<<<<<<<
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

=== Br ===================
do block #6         >>>>>>[-]+<<<<<<
=== end block #5 ===========
check #5       >>>>>]<<<<<

=== begin block #6 =========
check clear #6 >>>>>>[[-]<<<<<<
=== Br ===================
do block #8         >>>>>>>>[-]+<<<<<<<<
=== end block #6 ===========
check #6       >>>>>>]<<<<<<

=== begin block #7 =========
check clear #7 >>>>>>>[[-]<<<<<<<
=== Return ===================
return #4 TODO      >>>>-<<<<
=== end block #7 ===========
check #7       >>>>>>>]<<<<<<<

=== begin block #8 =========
check clear #8 >>>>>>>>[[-]<<<<<<<<
=== Br ===================
do block #9         >>>>>>>>>[-]+<<<<<<<<<
=== end block #8 ===========
check #8       >>>>>>>>]<<<<<<<<

=== begin block #9 =========
check clear #9 >>>>>>>>>[[-]<<<<<<<<<
=== Br ===================
do block #7         >>>>>>>[-]+<<<<<<<
=== end block #9 ===========
check #9       >>>>>>>>>]<<<<<<<<<

>>>>]<<<< ; end func block
=== end func main ================

