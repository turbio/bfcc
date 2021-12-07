; ModuleID = './tests/ir/print_fib.c.bc'
source_filename = "./tests/cases/print_fib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @printi(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  br label %4

4:                                                ; preds = %18, %1
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %8, %4
  %6 = load i32, i32* %2, align 4
  %7 = icmp sgt i32 %6, 10
  br i1 %7, label %8, label %13

8:                                                ; preds = %5
  %9 = load i32, i32* %2, align 4
  %10 = sub i32 %9, 10
  store i32 %10, i32* %2, align 4
  %11 = load i32, i32* %3, align 4
  %12 = add i32 %11, 1
  store i32 %12, i32* %3, align 4
  br label %5, !llvm.loop !3

13:                                               ; preds = %5
  %14 = load i32, i32* %2, align 4
  %15 = add i32 48, %14
  %16 = trunc i32 %15 to i8
  call void @putchar(i8 zeroext %16)
  %17 = load i32, i32* %3, align 4
  store i32 %17, i32* %2, align 4
  br label %18

18:                                               ; preds = %13
  %19 = load i32, i32* %3, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %4, label %21, !llvm.loop !5

21:                                               ; preds = %18
  ret void
}

declare void @putchar(i8 zeroext) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  store i8 1, i8* %2, align 1
  store i8 0, i8* %3, align 1
  store i32 10, i32* %4, align 4
  store i8 0, i8* %5, align 1
  br label %7

7:                                                ; preds = %30, %0
  %8 = load i8, i8* %5, align 1
  %9 = zext i8 %8 to i32
  %10 = load i32, i32* %4, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %33

12:                                               ; preds = %7
  %13 = load i8, i8* %2, align 1
  %14 = zext i8 %13 to i32
  call void @printi(i32 %14)
  %15 = load i8, i8* %5, align 1
  %16 = zext i8 %15 to i32
  %17 = load i32, i32* %4, align 4
  %18 = sub i32 %17, 1
  %19 = icmp slt i32 %16, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %12
  call void @putchar(i8 zeroext 32)
  br label %21

21:                                               ; preds = %20, %12
  %22 = load i8, i8* %3, align 1
  store i8 %22, i8* %6, align 1
  %23 = load i8, i8* %2, align 1
  store i8 %23, i8* %3, align 1
  %24 = load i8, i8* %6, align 1
  %25 = zext i8 %24 to i32
  %26 = load i8, i8* %2, align 1
  %27 = zext i8 %26 to i32
  %28 = add i32 %27, %25
  %29 = trunc i32 %28 to i8
  store i8 %29, i8* %2, align 1
  br label %30

30:                                               ; preds = %21
  %31 = load i8, i8* %5, align 1
  %32 = add i8 %31, 1
  store i8 %32, i8* %5, align 1
  br label %7, !llvm.loop !6

33:                                               ; preds = %7
  %34 = load i32, i32* %1, align 4
  ret i32 %34
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
!5 = distinct !{!5, !4}
!6 = distinct !{!6, !4}
