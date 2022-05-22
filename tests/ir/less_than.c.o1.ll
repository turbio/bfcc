; ModuleID = './tests/ir/less_than.c.o1.bc'
source_filename = "./tests/cases/less_than.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @lt(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp slt i32 %0, %1
  %4 = select i1 %3, i8 108, i8 114
  call void @putchar(i8 zeroext %4) #2
  ret void
}

declare void @putchar(i8 zeroext) local_unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #0 {
  call void @lt(i32 1, i32 2)
  call void @lt(i32 2, i32 1)
  call void @lt(i32 3, i32 4)
  call void @lt(i32 3, i32 3)
  call void @lt(i32 4, i32 5)
  call void @lt(i32 5, i32 6)
  call void @lt(i32 6, i32 7)
  call void @lt(i32 7, i32 8)
  call void @putchar(i8 zeroext 10) #2
  br label %1

1:                                                ; preds = %0, %4
  %2 = phi i32 [ 0, %0 ], [ %5, %4 ]
  br label %7

3:                                                ; preds = %4
  ret void

4:                                                ; preds = %7
  %5 = add nuw nsw i32 %2, 1
  %6 = icmp eq i32 %5, 30
  br i1 %6, label %3, label %1, !llvm.loop !3

7:                                                ; preds = %1, %7
  %8 = phi i32 [ 0, %1 ], [ %9, %7 ]
  call void @lt(i32 %2, i32 %8)
  %9 = add nuw nsw i32 %8, 1
  %10 = icmp eq i32 %9, 30
  br i1 %10, label %4, label %7, !llvm.loop !6
}

attributes #0 = { nounwind sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.mustprogress"}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !4, !5}
