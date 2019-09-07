=== begin func fred ==============
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
>>>>[<<<< ; begin func block

=== begin block #5 =========
check clear #5 >>>>>[[-]<<<<<
=== Call ===================
call "printf"       
=== Br ===================
do block #6         >>>>>>[-]+<<<<<<
=== end block #5 ===========
check #5       >>>>>]<<<<<

=== begin block #6 =========
check clear #6 >>>>>>[[-]<<<<<<
=== Call ===================
call "printf"       
=== Return ===================
return #4 TODO      >>>>-<<<<
=== end block #6 ===========
check #6       >>>>>>]<<<<<<

>>>>]<<<< ; end func block
=== end func fred ================

=== begin func printf ==============
=== end func printf ================

=== begin func joe ==============
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
>>>>[<<<< ; begin func block

=== begin block #5 =========
check clear #5 >>>>>[[-]<<<<<
=== Alloca ===================
store &#7 at #8     >>>>>>>>[-]+++++++<<<<<<<<
=== Alloca ===================
store &#9 at #10    >>>>>>>>>>[-]+++++++++<<<<<<<<<<
=== Store ===================
