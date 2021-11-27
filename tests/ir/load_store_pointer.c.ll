; ModuleID = './tests/ir/load_store_pointer.c.bc'
source_filename = "./tests/cases/load_store_pointer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32*, align 8
  %4 = ptrtoint i32* %1 to i8
  store i8 %4, i8* %2, align 1
  store i32* %1, i32** %3, align 8
  %5 = load i8, i8* %2, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp sgt i32 %6, 0
  %8 = zext i1 %7 to i32
  %9 = trunc i32 %8 to i8
  call void @putchar(i8 zeroext %9)
  %10 = ptrtoint i32* %1 to i8
  %11 = zext i8 %10 to i32
  %12 = load i8, i8* %2, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp eq i32 %11, %13
  %15 = zext i1 %14 to i32
  %16 = trunc i32 %15 to i8
  call void @putchar(i8 zeroext %16)
  %17 = load i8, i8* %2, align 1
  %18 = zext i8 %17 to i64
  %19 = inttoptr i64 %18 to i32*
  %20 = icmp eq i32* %1, %19
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i8
  call void @putchar(i8 zeroext %22)
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
