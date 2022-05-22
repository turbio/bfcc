; ModuleID = './tests/ir/bitwise.c.o1.bc'
source_filename = "./tests/cases/bitwise.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %5
  %2 = phi i32 [ 0, %0 ], [ %6, %5 ]
  %3 = icmp ne i32 %2, 0
  br label %8

4:                                                ; preds = %5
  ret void

5:                                                ; preds = %17
  %6 = add nuw nsw i32 %2, 1
  %7 = icmp eq i32 %6, 2
  br i1 %7, label %4, label %1, !llvm.loop !3

8:                                                ; preds = %1, %17
  %9 = phi i32 [ 0, %1 ], [ %18, %17 ]
  %10 = icmp ne i32 %9, 0
  %11 = or i32 %9, %2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %14, label %13

13:                                               ; preds = %8
  call void @putchar(i8 zeroext 111) #2
  br label %14

14:                                               ; preds = %8, %13
  %15 = and i1 %3, %10
  br i1 %15, label %16, label %17

16:                                               ; preds = %14
  call void @putchar(i8 zeroext 97) #2
  br label %17

17:                                               ; preds = %16, %14
  call void @putchar(i8 zeroext 44) #2
  %18 = add nuw nsw i32 %9, 1
  %19 = icmp eq i32 %18, 2
  br i1 %19, label %5, label %8, !llvm.loop !6
}

declare void @putchar(i8 zeroext) local_unnamed_addr #1

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
