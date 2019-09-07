=== begin func blah ==============
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
=== end func blah ================

=== begin func convert_like_real ==============
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
=== Alloca ===================
store &#12 at #13   >>>>>>>>>>>>>[-]++++++++++++<<<<<<<<<<<<<
=== Store ===================
