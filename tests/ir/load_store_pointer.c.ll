; ModuleID = './tests/ir/load_store_pointer.c.bc'
source_filename = "./tests/cases/load_store_pointer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
  %11 = trunc i32 %10 to i8
  call void @putchar(i8 zeroext %11)
  %12 = ptrtoint i32* %1 to i8
  %13 = zext i8 %12 to i32
  %14 = load i8, i8* %2, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %13, %15
  %17 = zext i1 %16 to i32
  %18 = trunc i32 %17 to i8
  call void @putchar(i8 zeroext %18)
  %19 = load i8, i8* %2, align 1
  %20 = zext i8 %19 to i64
  %21 = inttoptr i64 %20 to i32*
  %22 = icmp eq i32* %1, %21
  %23 = zext i1 %22 to i32
  %24 = trunc i32 %23 to i8
  call void @putchar(i8 zeroext %24)
  %25 = load i32*, i32** %3, align 8
  %26 = load i32, i32* %25, align 4
  store i32 %26, i32* %4, align 4
  %27 = load i32, i32* %4, align 4
  %28 = trunc i32 %27 to i8
  call void @putchar(i8 zeroext %28)
  %29 = load i32*, i32** %3, align 8
  store i32 97, i32* %29, align 4
  %30 = load i32*, i32** %3, align 8
  %31 = load i32, i32* %30, align 4
  store i32 %31, i32* %5, align 4
  %32 = load i32, i32* %5, align 4
  %33 = trunc i32 %32 to i8
  call void @putchar(i8 zeroext %33)
  ret void
}

declare void @putchar(i8 zeroext) #1

attributes #0 = { noinline nounwind optnone sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
