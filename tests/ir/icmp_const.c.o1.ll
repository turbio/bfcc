; ModuleID = './tests/ir/icmp_const.c.o1.bc'
source_filename = "./tests/cases/icmp_const.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %16
  %2 = phi i32 [ 0, %0 ], [ %17, %16 ]
  %3 = icmp ult i32 %2, 5
  br i1 %3, label %4, label %5

4:                                                ; preds = %1
  call void @putchar(i8 zeroext 108) #2
  br label %5

5:                                                ; preds = %4, %1
  %6 = icmp eq i32 %2, 5
  %7 = select i1 %6, i8 101, i8 110
  call void @putchar(i8 zeroext %7) #2
  %8 = icmp ugt i32 %2, 5
  br i1 %8, label %9, label %10

9:                                                ; preds = %5
  call void @putchar(i8 zeroext 103) #2
  br label %10

10:                                               ; preds = %9, %5
  %11 = icmp ult i32 %2, 6
  br i1 %11, label %12, label %13

12:                                               ; preds = %10
  call void @putchar(i8 zeroext 76) #2
  br label %13

13:                                               ; preds = %12, %10
  %14 = icmp ugt i32 %2, 4
  br i1 %14, label %15, label %16

15:                                               ; preds = %13
  call void @putchar(i8 zeroext 71) #2
  br label %16

16:                                               ; preds = %15, %13
  call void @putchar(i8 zeroext 44) #2
  %17 = add nuw nsw i32 %2, 1
  %18 = icmp eq i32 %17, 10
  br i1 %18, label %20, label %1, !llvm.loop !3

19:                                               ; preds = %35
  ret void

20:                                               ; preds = %16, %35
  %21 = phi i32 [ %36, %35 ], [ 0, %16 ]
  %22 = icmp ugt i32 %21, 5
  br i1 %22, label %23, label %24

23:                                               ; preds = %20
  call void @putchar(i8 zeroext 108) #2
  br label %24

24:                                               ; preds = %23, %20
  %25 = icmp eq i32 %21, 5
  %26 = select i1 %25, i8 101, i8 110
  call void @putchar(i8 zeroext %26) #2
  %27 = icmp ult i32 %21, 5
  br i1 %27, label %28, label %29

28:                                               ; preds = %24
  call void @putchar(i8 zeroext 103) #2
  br label %29

29:                                               ; preds = %28, %24
  %30 = icmp ugt i32 %21, 4
  br i1 %30, label %31, label %32

31:                                               ; preds = %29
  call void @putchar(i8 zeroext 76) #2
  br label %32

32:                                               ; preds = %31, %29
  %33 = icmp ult i32 %21, 6
  br i1 %33, label %34, label %35

34:                                               ; preds = %32
  call void @putchar(i8 zeroext 71) #2
  br label %35

35:                                               ; preds = %34, %32
  call void @putchar(i8 zeroext 44) #2
  %36 = add nuw nsw i32 %21, 1
  %37 = icmp eq i32 %36, 10
  br i1 %37, label %19, label %20, !llvm.loop !6
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
