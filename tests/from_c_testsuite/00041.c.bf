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
=== Alloca ===================
store &#21 at #22   >>>>>>>>>>>>>>>>>>>>>>[-]+++++++++++++++++++++<<<<<<<<<<<<<<<<<<<<<<
=== Alloca ===================
store &#23 at #24   >>>>>>>>>>>>>>>>>>>>>>>>[-]+++++++++++++++++++++++<<<<<<<<<<<<<<<<<<<<<<<<
=== Alloca ===================
store &#25 at #26   >>>>>>>>>>>>>>>>>>>>>>>>>>[-]+++++++++++++++++++++++++<<<<<<<<<<<<<<<<<<<<<<<<<<
=== Alloca ===================
store &#27 at #28   >>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]+++++++++++++++++++++++++++<<<<<<<<<<<<<<<<<<<<<<<<<<<<
=== Store ===================
store 0 at #29      >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
store #29 at *#20   
copy addr to #3 	>>[-]>[-]>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<+>+>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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

=== Store ===================
store 0 at #29      >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
store #29 at *#26   
copy addr to #3 	>>[-]>[-]>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<+>+>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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

=== Store ===================
store 2 at #29      >>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]++<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
store #29 at *#22   
copy addr to #3 	>>[-]>[-]>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<+>+>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
=== Load ===================
load *#22 to #29    
copy addr to #2 	>[-]>[-]>>>>>>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<<<<<<<+>+>>>>>>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<]<
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
copy #2 to dest 	>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<<<<<<<<<<<<<]<<

=== ICmp ===================
