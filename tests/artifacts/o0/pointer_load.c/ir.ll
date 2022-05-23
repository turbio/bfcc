; ModuleID = './tests/artifacts/o0/pointer_load.c/ir.bc'
source_filename = "./tests/cases/pointer_load.c"
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
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32**, align 8
  %4 = alloca i32***, align 8
  %5 = alloca i32****, align 8
  store i32 112, i32* %1, align 4
  store i32* %1, i32** %2, align 8
  %6 = load i32*, i32** %2, align 8
  %7 = load i32, i32* %6, align 4
  %8 = trunc i32 %7 to i8
  call void @putchar(i8 zeroext %8)
  store i32** %2, i32*** %3, align 8
  %9 = load i32**, i32*** %3, align 8
  %10 = load i32*, i32** %9, align 8
  %11 = load i32, i32* %10, align 4
  %12 = trunc i32 %11 to i8
  call void @putchar(i8 zeroext %12)
  store i32*** %3, i32**** %4, align 8
  %13 = load i32***, i32**** %4, align 8
  %14 = load i32**, i32*** %13, align 8
  %15 = load i32*, i32** %14, align 8
  %16 = load i32, i32* %15, align 4
  %17 = trunc i32 %16 to i8
  call void @putchar(i8 zeroext %17)
  store i32**** %4, i32***** %5, align 8
  %18 = load i32****, i32***** %5, align 8
  %19 = load i32***, i32**** %18, align 8
  %20 = load i32**, i32*** %19, align 8
  %21 = load i32*, i32** %20, align 8
  %22 = load i32, i32* %21, align 4
  %23 = trunc i32 %22 to i8
  call void @putchar(i8 zeroext %23)
  ret i32 0
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
