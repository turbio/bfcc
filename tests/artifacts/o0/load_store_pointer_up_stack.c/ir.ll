; ModuleID = './tests/artifacts/o0/load_store_pointer_up_stack.c/ir.bc'
source_filename = "./tests/cases/load_store_pointer_up_stack.c"
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
define void @deref_int_set(i8 zeroext %0) #0 {
  %2 = alloca i8, align 1
  store i8 %0, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = zext i8 %3 to i64
  %5 = inttoptr i64 %4 to i32*
  store i32 98, i32* %5, align 4
  %6 = load i8, i8* %2, align 1
  %7 = zext i8 %6 to i64
  %8 = inttoptr i64 %7 to i32*
  %9 = load i32, i32* %8, align 4
  %10 = trunc i32 %9 to i8
  call void @putchar(i8 zeroext %10)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @deref_int(i8 zeroext %0) #0 {
  %2 = alloca i8, align 1
  store i8 %0, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = zext i8 %3 to i64
  %5 = inttoptr i64 %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = trunc i32 %6 to i8
  call void @putchar(i8 zeroext %7)
  ret void
}

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 112, i32* %1, align 4
  store i32 116, i32* %2, align 4
  store i32 114, i32* %3, align 4
  %4 = ptrtoint i32* %1 to i8
  call void @deref_int(i8 zeroext %4)
  %5 = ptrtoint i32* %2 to i8
  call void @deref_int(i8 zeroext %5)
  %6 = ptrtoint i32* %3 to i8
  call void @deref_int(i8 zeroext %6)
  %7 = ptrtoint i32* %1 to i8
  call void @deref_int_set(i8 zeroext %7)
  %8 = ptrtoint i32* %1 to i8
  call void @deref_int(i8 zeroext %8)
  %9 = ptrtoint i32* %2 to i8
  call void @deref_int(i8 zeroext %9)
  %10 = ptrtoint i32* %3 to i8
  call void @deref_int(i8 zeroext %10)
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
