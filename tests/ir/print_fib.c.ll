; ModuleID = './tests/ir/print_fib.c.bc'
source_filename = "./tests/cases/print_fib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  store i8 1, i8* %2, align 1
  store i8 0, i8* %3, align 1
  store i8 6, i8* %4, align 1
  br label %6

6:                                                ; preds = %27, %0
  %7 = load i8, i8* %4, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %32

9:                                                ; preds = %6
  %10 = load i8, i8* %2, align 1
  %11 = zext i8 %10 to i32
  %12 = add i32 48, %11
  %13 = trunc i32 %12 to i8
  call void @putchar(i8 zeroext %13)
  %14 = load i8, i8* %4, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %17, label %18

17:                                               ; preds = %9
  call void @putchar(i8 zeroext 32)
  br label %18

18:                                               ; preds = %17, %9
  %19 = load i8, i8* %3, align 1
  store i8 %19, i8* %5, align 1
  %20 = load i8, i8* %2, align 1
  store i8 %20, i8* %3, align 1
  %21 = load i8, i8* %5, align 1
  %22 = zext i8 %21 to i32
  %23 = load i8, i8* %2, align 1
  %24 = zext i8 %23 to i32
  %25 = add i32 %24, %22
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* %2, align 1
  br label %27

27:                                               ; preds = %18
  %28 = load i8, i8* %4, align 1
  %29 = zext i8 %28 to i32
  %30 = sub i32 %29, 1
  %31 = trunc i32 %30 to i8
  store i8 %31, i8* %4, align 1
  br label %6, !llvm.loop !3

32:                                               ; preds = %6
  %33 = load i32, i32* %1, align 4
  ret i32 %33
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
