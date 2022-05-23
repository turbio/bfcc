; ModuleID = './tests/artifacts/o1/bitwise_or.c/ir.bc'
source_filename = "./tests/cases/bitwise_or.c"
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
define i32 @main() local_unnamed_addr #0 {
  call void @putchar(i8 zeroext 99) #2
  call void @putchar(i8 zeroext 99) #2
  call void @putchar(i8 zeroext 99) #2
  call void @putchar(i8 zeroext 101) #2
  call void @putchar(i8 zeroext 102) #2
  call void @putchar(i8 zeroext 58) #2
  br label %1

1:                                                ; preds = %0, %4
  %2 = phi i32 [ 0, %0 ], [ %5, %4 ]
  br label %7

3:                                                ; preds = %4
  ret i32 0

4:                                                ; preds = %7
  %5 = add nuw nsw i32 %2, 1
  %6 = icmp eq i32 %5, 20
  br i1 %6, label %3, label %1, !llvm.loop !8

7:                                                ; preds = %1, %7
  %8 = phi i32 [ 0, %1 ], [ %12, %7 ]
  %9 = or i32 %8, %2
  %10 = trunc i32 %9 to i8
  %11 = add i8 %10, 65
  call void @putchar(i8 zeroext %11) #2
  call void @putchar(i8 zeroext 44) #2
  %12 = add nuw nsw i32 %8, 1
  %13 = icmp eq i32 %12, 20
  br i1 %13, label %4, label %7, !llvm.loop !9
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
