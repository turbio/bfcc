; ModuleID = './tests/ir/load_store_pointer_in_stack.c.bc'
source_filename = "./tests/cases/load_store_pointer_in_stack.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @another_stack() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 112, i32* %1, align 4
  %6 = ptrtoint i32* %1 to i8
  store i8 %6, i8* %2, align 1
  store i32* %1, i32** %3, align 8
  %7 = load i8, i8* %2, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp sgt i32 %8, 0
  %10 = zext i1 %9 to i32
  %11 = add i32 65, %10
  %12 = trunc i32 %11 to i8
  call void @putchar(i8 zeroext %12)
  %13 = ptrtoint i32* %1 to i8
  %14 = zext i8 %13 to i32
  %15 = load i8, i8* %2, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp eq i32 %14, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 65, %18
  %20 = trunc i32 %19 to i8
  call void @putchar(i8 zeroext %20)
  %21 = load i8, i8* %2, align 1
  %22 = zext i8 %21 to i64
  %23 = inttoptr i64 %22 to i32*
  %24 = icmp eq i32* %1, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 65, %25
  %27 = trunc i32 %26 to i8
  call void @putchar(i8 zeroext %27)
  %28 = load i32*, i32** %3, align 8
  %29 = load i32, i32* %28, align 4
  store i32 %29, i32* %4, align 4
  %30 = load i32, i32* %4, align 4
  %31 = trunc i32 %30 to i8
  call void @putchar(i8 zeroext %31)
  %32 = load i32*, i32** %3, align 8
  store i32 97, i32* %32, align 4
  %33 = load i32*, i32** %3, align 8
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %5, align 4
  %35 = load i32, i32* %5, align 4
  %36 = trunc i32 %35 to i8
  call void @putchar(i8 zeroext %36)
  ret void
}

declare void @putchar(i8 zeroext) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 112, i32* %1, align 4
  %6 = ptrtoint i32* %1 to i8
  store i8 %6, i8* %2, align 1
  store i32* %1, i32** %3, align 8
  %7 = load i8, i8* %2, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp sgt i32 %8, 0
  %10 = zext i1 %9 to i32
  %11 = add i32 65, %10
  %12 = trunc i32 %11 to i8
  call void @putchar(i8 zeroext %12)
  %13 = ptrtoint i32* %1 to i8
  %14 = zext i8 %13 to i32
  %15 = load i8, i8* %2, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp eq i32 %14, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 65, %18
  %20 = trunc i32 %19 to i8
  call void @putchar(i8 zeroext %20)
  %21 = load i8, i8* %2, align 1
  %22 = zext i8 %21 to i64
  %23 = inttoptr i64 %22 to i32*
  %24 = icmp eq i32* %1, %23
  %25 = zext i1 %24 to i32
  %26 = add i32 65, %25
  %27 = trunc i32 %26 to i8
  call void @putchar(i8 zeroext %27)
  %28 = load i32*, i32** %3, align 8
  %29 = load i32, i32* %28, align 4
  store i32 %29, i32* %4, align 4
  %30 = load i32, i32* %4, align 4
  %31 = trunc i32 %30 to i8
  call void @putchar(i8 zeroext %31)
  %32 = load i32*, i32** %3, align 8
  store i32 97, i32* %32, align 4
  %33 = load i32*, i32** %3, align 8
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %5, align 4
  %35 = load i32, i32* %5, align 4
  %36 = trunc i32 %35 to i8
  call void @putchar(i8 zeroext %36)
  call void @another_stack()
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
