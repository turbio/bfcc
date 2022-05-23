; ModuleID = './tests/artifacts/o0/icmp_const.c/ir.bc'
source_filename = "./tests/cases/icmp_const.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @putstr(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  br label %3

3:                                                ; preds = %6, %1
  %4 = load i8*, i8** %2, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %11

6:                                                ; preds = %3
  %7 = load i8*, i8** %2, align 8
  %8 = ptrtoint i8* %7 to i8
  call void @putchar(i8 zeroext %8)
  %9 = load i8*, i8** %2, align 8
  %10 = getelementptr i8, i8* %9, i32 1
  store i8* %10, i8** %2, align 8
  br label %3, !llvm.loop !3

11:                                               ; preds = %3
  ret void
}

declare void @putchar(i8 zeroext) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @putdec(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  call void @putchar(i8 zeroext 48)
  br label %29

7:                                                ; preds = %1
  store i32 1, i32* %3, align 4
  br label %8

8:                                                ; preds = %13, %7
  %9 = load i32, i32* %2, align 4
  %10 = load i32, i32* %3, align 4
  %11 = sdiv i32 %9, %10
  %12 = icmp sgt i32 %11, 10
  br i1 %12, label %13, label %16

13:                                               ; preds = %8
  %14 = load i32, i32* %3, align 4
  %15 = mul i32 %14, 10
  store i32 %15, i32* %3, align 4
  br label %8, !llvm.loop !5

16:                                               ; preds = %8
  br label %17

17:                                               ; preds = %20, %16
  %18 = load i32, i32* %3, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %29

20:                                               ; preds = %17
  %21 = load i32, i32* %2, align 4
  %22 = load i32, i32* %3, align 4
  %23 = sdiv i32 %21, %22
  %24 = srem i32 %23, 10
  %25 = add i32 48, %24
  %26 = trunc i32 %25 to i8
  call void @putchar(i8 zeroext %26)
  %27 = load i32, i32* %3, align 4
  %28 = sdiv i32 %27, 10
  store i32 %28, i32* %3, align 4
  br label %17, !llvm.loop !6

29:                                               ; preds = %6, %17
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %3

3:                                                ; preds = %31, %0
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %34

6:                                                ; preds = %3
  %7 = load i32, i32* %1, align 4
  %8 = icmp slt i32 %7, 5
  br i1 %8, label %9, label %10

9:                                                ; preds = %6
  call void @putchar(i8 zeroext 108)
  br label %10

10:                                               ; preds = %9, %6
  %11 = load i32, i32* %1, align 4
  %12 = icmp ne i32 %11, 5
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  call void @putchar(i8 zeroext 110)
  br label %14

14:                                               ; preds = %13, %10
  %15 = load i32, i32* %1, align 4
  %16 = icmp eq i32 %15, 5
  br i1 %16, label %17, label %18

17:                                               ; preds = %14
  call void @putchar(i8 zeroext 101)
  br label %18

18:                                               ; preds = %17, %14
  %19 = load i32, i32* %1, align 4
  %20 = icmp sgt i32 %19, 5
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  call void @putchar(i8 zeroext 103)
  br label %22

22:                                               ; preds = %21, %18
  %23 = load i32, i32* %1, align 4
  %24 = icmp sle i32 %23, 5
  br i1 %24, label %25, label %26

25:                                               ; preds = %22
  call void @putchar(i8 zeroext 76)
  br label %26

26:                                               ; preds = %25, %22
  %27 = load i32, i32* %1, align 4
  %28 = icmp sge i32 %27, 5
  br i1 %28, label %29, label %30

29:                                               ; preds = %26
  call void @putchar(i8 zeroext 71)
  br label %30

30:                                               ; preds = %29, %26
  call void @putchar(i8 zeroext 44)
  br label %31

31:                                               ; preds = %30
  %32 = load i32, i32* %1, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %1, align 4
  br label %3, !llvm.loop !7

34:                                               ; preds = %3
  store i32 0, i32* %2, align 4
  br label %35

35:                                               ; preds = %63, %34
  %36 = load i32, i32* %2, align 4
  %37 = icmp slt i32 %36, 10
  br i1 %37, label %38, label %66

38:                                               ; preds = %35
  %39 = load i32, i32* %2, align 4
  %40 = icmp slt i32 5, %39
  br i1 %40, label %41, label %42

41:                                               ; preds = %38
  call void @putchar(i8 zeroext 108)
  br label %42

42:                                               ; preds = %41, %38
  %43 = load i32, i32* %2, align 4
  %44 = icmp ne i32 5, %43
  br i1 %44, label %45, label %46

45:                                               ; preds = %42
  call void @putchar(i8 zeroext 110)
  br label %46

46:                                               ; preds = %45, %42
  %47 = load i32, i32* %2, align 4
  %48 = icmp eq i32 5, %47
  br i1 %48, label %49, label %50

49:                                               ; preds = %46
  call void @putchar(i8 zeroext 101)
  br label %50

50:                                               ; preds = %49, %46
  %51 = load i32, i32* %2, align 4
  %52 = icmp sgt i32 5, %51
  br i1 %52, label %53, label %54

53:                                               ; preds = %50
  call void @putchar(i8 zeroext 103)
  br label %54

54:                                               ; preds = %53, %50
  %55 = load i32, i32* %2, align 4
  %56 = icmp sle i32 5, %55
  br i1 %56, label %57, label %58

57:                                               ; preds = %54
  call void @putchar(i8 zeroext 76)
  br label %58

58:                                               ; preds = %57, %54
  %59 = load i32, i32* %2, align 4
  %60 = icmp sge i32 5, %59
  br i1 %60, label %61, label %62

61:                                               ; preds = %58
  call void @putchar(i8 zeroext 71)
  br label %62

62:                                               ; preds = %61, %58
  call void @putchar(i8 zeroext 44)
  br label %63

63:                                               ; preds = %62
  %64 = load i32, i32* %2, align 4
  %65 = add i32 %64, 1
  store i32 %65, i32* %2, align 4
  br label %35, !llvm.loop !8

66:                                               ; preds = %35
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
!8 = distinct !{!8, !4}
