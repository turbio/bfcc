; ModuleID = './tests/ir/count_from_9.c.o1.bc'
source_filename = "./tests/cases/count_from_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define i32 @main() local_unnamed_addr #0 {
  br label %2

1:                                                ; preds = %7
  ret i32 0

2:                                                ; preds = %0, %7
  %3 = phi i8 [ 9, %0 ], [ %8, %7 ]
  %4 = add nuw nsw i8 %3, 48
  call void @putchar(i8 zeroext %4) #2
  %5 = icmp eq i8 %3, 1
  br i1 %5, label %7, label %6

6:                                                ; preds = %2
  call void @putchar(i8 zeroext 44) #2
  call void @putchar(i8 zeroext 32) #2
  br label %7

7:                                                ; preds = %2, %6
  %8 = add nsw i8 %3, -1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %1, label %2, !llvm.loop !3
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
