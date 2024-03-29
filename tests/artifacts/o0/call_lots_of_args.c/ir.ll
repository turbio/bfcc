; ModuleID = './tests/artifacts/o0/call_lots_of_args.c/ir.bc'
source_filename = "./tests/cases/call_lots_of_args.c"
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
define void @three_args(i32 %0, i32 %1, i32 %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %4, align 4
  %8 = trunc i32 %7 to i8
  call void @putchar(i8 zeroext %8)
  %9 = load i32, i32* %5, align 4
  %10 = trunc i32 %9 to i8
  call void @putchar(i8 zeroext %10)
  %11 = load i32, i32* %6, align 4
  %12 = trunc i32 %11 to i8
  call void @putchar(i8 zeroext %12)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @five_args(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %11 = load i32, i32* %6, align 4
  %12 = trunc i32 %11 to i8
  call void @putchar(i8 zeroext %12)
  %13 = load i32, i32* %7, align 4
  %14 = trunc i32 %13 to i8
  call void @putchar(i8 zeroext %14)
  %15 = load i32, i32* %8, align 4
  %16 = trunc i32 %15 to i8
  call void @putchar(i8 zeroext %16)
  %17 = load i32, i32* %9, align 4
  %18 = trunc i32 %17 to i8
  call void @putchar(i8 zeroext %18)
  %19 = load i32, i32* %10, align 4
  %20 = trunc i32 %19 to i8
  call void @putchar(i8 zeroext %20)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @twelve_args(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11) #0 {
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  store i32 %0, i32* %13, align 4
  store i32 %1, i32* %14, align 4
  store i32 %2, i32* %15, align 4
  store i32 %3, i32* %16, align 4
  store i32 %4, i32* %17, align 4
  store i32 %5, i32* %18, align 4
  store i32 %6, i32* %19, align 4
  store i32 %7, i32* %20, align 4
  store i32 %8, i32* %21, align 4
  store i32 %9, i32* %22, align 4
  store i32 %10, i32* %23, align 4
  store i32 %11, i32* %24, align 4
  %25 = load i32, i32* %13, align 4
  %26 = load i32, i32* %14, align 4
  %27 = load i32, i32* %15, align 4
  call void @three_args(i32 %25, i32 %26, i32 %27)
  %28 = load i32, i32* %16, align 4
  %29 = load i32, i32* %17, align 4
  %30 = load i32, i32* %18, align 4
  %31 = load i32, i32* %19, align 4
  %32 = load i32, i32* %20, align 4
  call void @five_args(i32 %28, i32 %29, i32 %30, i32 %31, i32 %32)
  %33 = load i32, i32* %21, align 4
  %34 = trunc i32 %33 to i8
  call void @putchar(i8 zeroext %34)
  %35 = load i32, i32* %22, align 4
  %36 = trunc i32 %35 to i8
  call void @putchar(i8 zeroext %36)
  %37 = load i32, i32* %23, align 4
  %38 = trunc i32 %37 to i8
  call void @putchar(i8 zeroext %38)
  %39 = load i32, i32* %24, align 4
  %40 = trunc i32 %39 to i8
  call void @putchar(i8 zeroext %40)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  call void @three_args(i32 79, i32 119, i32 79)
  call void @putchar(i8 zeroext 10)
  call void @five_args(i32 122, i32 97, i32 100, i32 100, i32 121)
  call void @putchar(i8 zeroext 10)
  call void @twelve_args(i32 108, i32 109, i32 97, i32 111, i32 109, i32 121, i32 100, i32 117, i32 100, i32 101, i32 33, i32 63)
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
