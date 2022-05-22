; ModuleID = './tests/ir/count_from_9.c.o0.bc'
source_filename = "./tests/cases/count_from_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  store i8 9, i8* %2, align 1
  br label %3

3:                                                ; preds = %16, %0
  %4 = load i8, i8* %2, align 1
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %6, label %21

6:                                                ; preds = %3
  %7 = load i8, i8* %2, align 1
  %8 = zext i8 %7 to i32
  %9 = add i32 48, %8
  %10 = trunc i32 %9 to i8
  call void @putchar(i8 zeroext %10)
  %11 = load i8, i8* %2, align 1
  %12 = zext i8 %11 to i32
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %14, label %15

14:                                               ; preds = %6
  call void @putchar(i8 zeroext 44)
  call void @putchar(i8 zeroext 32)
  br label %15

15:                                               ; preds = %14, %6
  br label %16

16:                                               ; preds = %15
  %17 = load i8, i8* %2, align 1
  %18 = zext i8 %17 to i32
  %19 = sub i32 %18, 1
  %20 = trunc i32 %19 to i8
  store i8 %20, i8* %2, align 1
  br label %3, !llvm.loop !3

21:                                               ; preds = %3
  %22 = load i32, i32* %1, align 4
  ret i32 %22
}

declare void @putchar(i8 zeroext) #1

attributes #0 = { noinline nounwind optnone sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
