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
=== Alloca ===================
store &#8 at #9     >>>>>>>>>[-]++++++++<<<<<<<<<
=== Alloca ===================
store &#10 at #11   >>>>>>>>>>>[-]++++++++++<<<<<<<<<<<
=== Alloca ===================
store &#12 at #13   >>>>>>>>>>>>>[-]++++++++++++<<<<<<<<<<<<<
=== Alloca ===================
store &#14 at #15   >>>>>>>>>>>>>>>[-]++++++++++++++<<<<<<<<<<<<<<<
=== Store ===================
store 0 at #16      >>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<<
store #16 at *#7    
copy addr to #3 	>>[-]>[-]>>>>[-<<<<<+>+>>>>]<<<<<<< >>>>>>>[-]<<<<<[->>>>>+<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<
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
store 42 at #16     >>>>>>>>>>>>>>>>[-]++++++++++++++++++++++++++++++++++++++++++<<<<<<<<<<<<<<<<
store #16 at *#9    
copy addr to #3 	>>[-]>[-]>>>>>>[-<<<<<<<+>+>>>>>>]<<<<<<<<< >>>>>>>>>[-]<<<<<<<[->>>>>>>+<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<
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
move #9 to #16 #17  >>>>>>>>>>>>>>>>[-]>[-]<<<<<<<<[->>>>>>>+>+<<<<<<<<]<<<<<<<<<
move #17 to #9      >>>>>>>>>[-]>>>>>>>>[-<<<<<<<<+>>>>>>>>]<<<<<<<<<<<<<<<<<
store #16 at *#11   
copy addr to #3 	>>[-]>[-]>>>>>>>>[-<<<<<<<<<+>+>>>>>>>>]<<<<<<<<<<< >>>>>>>>>>>[-]<<<<<<<<<[->>>>>>>>>+<<<<<<<<<]<<
dec #3 by 4     	>>>----<<<
copy v to #1    	>[-]>>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<<
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
load *#11 to #16    
copy addr to #2 	>[-]>[-]>>>>>>>>>[-<<<<<<<<<<+>+>>>>>>>>>]<<<<<<<<<<< >>>>>>>>>>>[-]<<<<<<<<<<[->>>>>>>>>>+<<<<<<<<<<]<
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
copy #2 to dest 	>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<[->>>>>>>>>>>>>>+<<<<<<<<<<<<<<]<<

=== Load ===================
load *#16 to #17    
copy addr to #2 	>[-]>[-]>>>>>>>>>>>>>>[-<<<<<<<<<<<<<<<+>+>>>>>>>>>>>>>>]<<<<<<<<<<<<<<<< >>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]<
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
copy #2 to dest 	>>>>>>>>>>>>>>>>>[-]<<<<<<<<<<<<<<<[->>>>>>>>>>>>>>>+<<<<<<<<<<<<<<<]<<

=== Call ===================
call "printf"       
=== Store ===================
