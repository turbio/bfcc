; ModuleID = './tests/ir/icmp.c.o1.bc'
source_filename = "./tests/cases/icmp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %4
  %2 = phi i32 [ 0, %0 ], [ %5, %4 ]
  br label %7

3:                                                ; preds = %4
  ret void

4:                                                ; preds = %16
  %5 = add nuw nsw i32 %2, 1
  %6 = icmp eq i32 %5, 50
  br i1 %6, label %3, label %1, !llvm.loop !3

7:                                                ; preds = %1, %16
  %8 = phi i32 [ 0, %1 ], [ %18, %16 ]
  %9 = icmp ult i32 %2, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  call void @putchar(i8 zeroext 108) #2
  call void @putchar(i8 zeroext 110) #2
  br label %16

11:                                               ; preds = %7
  %12 = icmp eq i32 %2, %8
  %13 = select i1 %12, i8 101, i8 110
  call void @putchar(i8 zeroext %13) #2
  %14 = icmp ugt i32 %2, %8
  %15 = select i1 %14, i8 103, i8 76
  call void @putchar(i8 zeroext %15) #2
  br label %16

16:                                               ; preds = %10, %11
  %17 = phi i8 [ 76, %10 ], [ 71, %11 ]
  call void @putchar(i8 zeroext %17) #2
  call void @putchar(i8 zeroext 44) #2
  %18 = add nuw nsw i32 %8, 1
  %19 = icmp eq i32 %18, 50
  br i1 %19, label %4, label %7, !llvm.loop !6
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
