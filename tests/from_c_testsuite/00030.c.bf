=== begin func f ==============
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
=== Return ===================
return #4 TODO      >>>>-<<<<
=== end block #5 ===========
check #5       >>>>>]<<<<<

>>>>]<<<< ; end func block
=== end func f ================

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
skip block
store 0 at #10      >>>>>>>>>>[-]<<<<<<<<<<
skip block
store 0 at #11      >>>>>>>>>>>[-]<<<<<<<<<<<
skip block
store 0 at #12      >>>>>>>>>>>>[-]<<<<<<<<<<<<
skip block
store 0 at #13      >>>>>>>>>>>>>[-]<<<<<<<<<<<<<
skip block
store 0 at #14      >>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<
skip block
store 0 at #15      >>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<
skip block
store 0 at #16      >>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<
skip block
store 0 at #17      >>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<
skip block
store 0 at #18      >>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<
>>>>[<<<< ; begin func block

=== begin block #5 =========
check clear #5 >>>>>[[-]<<<<<
=== Alloca ===================
store &#19 at #20   >>>>>>>>>>>>>>>>>>>>[-]+++++++++++++++++++<<<<<<<<<<<<<<<<<<<<
=== Store ===================
store 0 at #21      >>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<
store #21 at *#20   
copy addr to #3 	>>[-]>[-]>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>+>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<
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

=== Call ===================
call "f"            
=== ICmp ===================
