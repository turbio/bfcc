; ModuleID = './tests/ir/if_elif_else.c.bc'
source_filename = "./tests/cases/if_elif_else.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8, align 1
  store i32 0, i32* %1, align 4
  store i8 98, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp eq i32 %4, 97
  br i1 %5, label %6, label %7

6:                                                ; preds = %0
  call void @putchar(i8 zeroext 120)
  br label %14

7:                                                ; preds = %0
  %8 = load i8, i8* %2, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp eq i32 %9, 98
  br i1 %10, label %11, label %12

11:                                               ; preds = %7
  call void @putchar(i8 zeroext 121)
  br label %13

12:                                               ; preds = %7
  call void @putchar(i8 zeroext 122)
  br label %13

13:                                               ; preds = %12, %11
  br label %14

14:                                               ; preds = %13, %6
  %15 = load i32, i32* %1, align 4
  ret i32 %15
}

declare void @putchar(i8 zeroext) #1

attributes #0 = { noinline nounwind optnone sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
