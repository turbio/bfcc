; ModuleID = './tests/ir/add_some_immediates.c.o0.bc'
source_filename = "./tests/cases/add_some_immediates.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 0, i8* %1, align 1
  br label %3

3:                                                ; preds = %13, %0
  %4 = load i8, i8* %1, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp slt i32 %5, 58
  br i1 %6, label %7, label %16

7:                                                ; preds = %3
  %8 = load i8, i8* %1, align 1
  %9 = zext i8 %8 to i32
  %10 = add i32 %9, 65
  %11 = trunc i32 %10 to i8
  store i8 %11, i8* %2, align 1
  %12 = load i8, i8* %2, align 1
  call void @putchar(i8 zeroext %12)
  br label %13

13:                                               ; preds = %7
  %14 = load i8, i8* %1, align 1
  %15 = add i8 %14, 1
  store i8 %15, i8* %1, align 1
  br label %3, !llvm.loop !3

16:                                               ; preds = %3
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
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}