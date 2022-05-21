; ModuleID = './tests/ir/snake.c.bc'
source_filename = "./tests/cases/snake.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @print_game() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @putchar(i8 zeroext 10)
  call void @putchar(i8 zeroext 32)
  store i32 0, i32* %1, align 4
  br label %5

5:                                                ; preds = %9, %0
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %6, 14
  br i1 %7, label %8, label %12

8:                                                ; preds = %5
  call void @putchar(i8 zeroext 95)
  br label %9

9:                                                ; preds = %8
  %10 = load i32, i32* %1, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %1, align 4
  br label %5, !llvm.loop !3

12:                                               ; preds = %5
  call void @putchar(i8 zeroext 32)
  call void @putchar(i8 zeroext 10)
  store i32 0, i32* %2, align 4
  br label %13

13:                                               ; preds = %25, %12
  %14 = load i32, i32* %2, align 4
  %15 = icmp slt i32 %14, 16
  br i1 %15, label %16, label %28

16:                                               ; preds = %13
  call void @putchar(i8 zeroext 124)
  store i32 0, i32* %3, align 4
  br label %17

17:                                               ; preds = %21, %16
  %18 = load i32, i32* %3, align 4
  %19 = icmp slt i32 %18, 14
  br i1 %19, label %20, label %24

20:                                               ; preds = %17
  call void @putchar(i8 zeroext 46)
  br label %21

21:                                               ; preds = %20
  %22 = load i32, i32* %3, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* %3, align 4
  br label %17, !llvm.loop !5

24:                                               ; preds = %17
  call void @putchar(i8 zeroext 124)
  call void @putchar(i8 zeroext 10)
  br label %25

25:                                               ; preds = %24
  %26 = load i32, i32* %2, align 4
  %27 = add i32 %26, 1
  store i32 %27, i32* %2, align 4
  br label %13, !llvm.loop !6

28:                                               ; preds = %13
  call void @putchar(i8 zeroext 39)
  store i32 0, i32* %4, align 4
  br label %29

29:                                               ; preds = %33, %28
  %30 = load i32, i32* %4, align 4
  %31 = icmp slt i32 %30, 14
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  call void @putchar(i8 zeroext 45)
  br label %33

33:                                               ; preds = %32
  %34 = load i32, i32* %4, align 4
  %35 = add i32 %34, 1
  store i32 %35, i32* %4, align 4
  br label %29, !llvm.loop !7

36:                                               ; preds = %29
  call void @putchar(i8 zeroext 39)
  call void @putchar(i8 zeroext 10)
  ret void
}

declare void @putchar(i8 zeroext) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  call void @print_game()
  ret void
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
!7 = distinct !{!7, !4}
