; ModuleID = './tests/artifacts/o1/icmp_const.c/ir.bc'
source_filename = "./tests/cases/icmp_const.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @putstr(i8* %0) local_unnamed_addr #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %9, label %3

3:                                                ; preds = %1, %3
  %4 = phi i8* [ %7, %3 ], [ %0, %1 ]
  %5 = ptrtoint i8* %4 to i64
  %6 = trunc i64 %5 to i8
  call void @putchar(i8 zeroext %6) #2
  %7 = getelementptr i8, i8* %4, i64 1
  %8 = icmp eq i8* %7, null
  br i1 %8, label %9, label %3, !llvm.loop !3

9:                                                ; preds = %3, %1
  ret void
}

declare void @putchar(i8 zeroext) local_unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
define void @putdec(i32 %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %5, label %3

3:                                                ; preds = %1
  %4 = icmp sgt i32 %0, 10
  br i1 %4, label %9, label %6

5:                                                ; preds = %1
  call void @putchar(i8 zeroext 48) #2
  br label %23

6:                                                ; preds = %9, %3
  %7 = phi i32 [ 1, %3 ], [ %11, %9 ]
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %23, label %14

9:                                                ; preds = %3, %9
  %10 = phi i32 [ %11, %9 ], [ 1, %3 ]
  %11 = mul i32 %10, 10
  %12 = sdiv i32 %0, %11
  %13 = icmp sgt i32 %12, 10
  br i1 %13, label %9, label %6, !llvm.loop !6

14:                                               ; preds = %6, %14
  %15 = phi i32 [ %20, %14 ], [ %7, %6 ]
  %16 = sdiv i32 %0, %15
  %17 = srem i32 %16, 10
  %18 = trunc i32 %17 to i8
  %19 = add i8 %18, 48
  call void @putchar(i8 zeroext %19) #2
  %20 = sdiv i32 %15, 10
  %21 = add i32 %15, 9
  %22 = icmp ult i32 %21, 19
  br i1 %22, label %23, label %14, !llvm.loop !7

23:                                               ; preds = %14, %6, %5
  ret void
}

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
  br i1 %18, label %20, label %1, !llvm.loop !8

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
  br i1 %37, label %19, label %20, !llvm.loop !9
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
!7 = distinct !{!7, !4, !5}
!8 = distinct !{!8, !4, !5}
!9 = distinct !{!9, !4, !5}
