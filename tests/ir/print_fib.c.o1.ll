; ModuleID = './tests/ir/print_fib.c.o1.bc'
source_filename = "./tests/cases/print_fib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @printi(i32 %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %12, %1
  %3 = phi i32 [ %0, %1 ], [ %14, %12 ]
  %4 = icmp sgt i32 %3, 10
  br i1 %4, label %5, label %12

5:                                                ; preds = %2
  %6 = add i32 %3, -11
  %7 = udiv i32 %6, 10
  %8 = add i32 %3, -10
  %9 = mul i32 %7, -10
  %10 = add i32 %9, %8
  %11 = add nuw nsw i32 %7, 1
  br label %12

12:                                               ; preds = %5, %2
  %13 = phi i32 [ %3, %2 ], [ %10, %5 ]
  %14 = phi i32 [ 0, %2 ], [ %11, %5 ]
  %15 = trunc i32 %13 to i8
  %16 = add i8 %15, 48
  call void @putchar(i8 zeroext %16) #2
  %17 = icmp eq i32 %14, 0
  br i1 %17, label %18, label %2, !llvm.loop !3

18:                                               ; preds = %12
  ret void
}

declare void @putchar(i8 zeroext) local_unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
define i32 @main() local_unnamed_addr #0 {
  br label %2

1:                                                ; preds = %9
  ret i32 0

2:                                                ; preds = %0, %9
  %3 = phi i8 [ 1, %0 ], [ %10, %9 ]
  %4 = phi i8 [ 0, %0 ], [ %11, %9 ]
  %5 = phi i8 [ 0, %0 ], [ %3, %9 ]
  %6 = zext i8 %3 to i32
  call void @printi(i32 %6)
  %7 = icmp eq i8 %4, 9
  br i1 %7, label %9, label %8

8:                                                ; preds = %2
  call void @putchar(i8 zeroext 32) #2
  br label %9

9:                                                ; preds = %8, %2
  %10 = add i8 %3, %5
  %11 = add nuw nsw i8 %4, 1
  %12 = icmp eq i8 %11, 10
  br i1 %12, label %1, label %2, !llvm.loop !6
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
