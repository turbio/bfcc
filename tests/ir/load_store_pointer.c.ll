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
  store i32 112, i32* %1, align 4
  %5 = ptrtoint i32* %1 to i8
  store i8 %5, i8* %2, align 1
  store i32* %1, i32** %3, align 8
  %6 = load i8, i8* %2, align 1
  %7 = zext i8 %6 to i32
  %8 = icmp sgt i32 %7, 0
  %9 = zext i1 %8 to i32
  %10 = trunc i32 %9 to i8
  call void @putchar(i8 zeroext %10)
  %11 = ptrtoint i32* %1 to i8
  %12 = zext i8 %11 to i32
  %13 = load i8, i8* %2, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp eq i32 %12, %14
  %16 = zext i1 %15 to i32
  %17 = trunc i32 %16 to i8
  call void @putchar(i8 zeroext %17)
  %18 = load i8, i8* %2, align 1
  %19 = zext i8 %18 to i64
  %20 = inttoptr i64 %19 to i32*
  %21 = icmp eq i32* %1, %20
  %22 = zext i1 %21 to i32
  %23 = trunc i32 %22 to i8
  call void @putchar(i8 zeroext %23)
  %24 = load i32*, i32** %3, align 8
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %4, align 4
  %26 = load i32, i32* %4, align 4
  %27 = trunc i32 %26 to i8
  call void @putchar(i8 zeroext %27)
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
