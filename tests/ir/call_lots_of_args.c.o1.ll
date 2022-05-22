; ModuleID = './tests/ir/call_lots_of_args.c.o1.bc'
source_filename = "./tests/cases/call_lots_of_args.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @three_args(i32 %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = trunc i32 %0 to i8
  call void @putchar(i8 zeroext %4) #2
  %5 = trunc i32 %1 to i8
  call void @putchar(i8 zeroext %5) #2
  %6 = trunc i32 %2 to i8
  call void @putchar(i8 zeroext %6) #2
  ret void
}

declare void @putchar(i8 zeroext) local_unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
define void @five_args(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = trunc i32 %0 to i8
  call void @putchar(i8 zeroext %6) #2
  %7 = trunc i32 %1 to i8
  call void @putchar(i8 zeroext %7) #2
  %8 = trunc i32 %2 to i8
  call void @putchar(i8 zeroext %8) #2
  %9 = trunc i32 %3 to i8
  call void @putchar(i8 zeroext %9) #2
  %10 = trunc i32 %4 to i8
  call void @putchar(i8 zeroext %10) #2
  ret void
}

; Function Attrs: nounwind sspstrong uwtable
define void @twelve_args(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  call void @three_args(i32 %0, i32 %1, i32 %2)
  call void @five_args(i32 %3, i32 %4, i32 %5, i32 %6, i32 %7)
  %13 = trunc i32 %8 to i8
  call void @putchar(i8 zeroext %13) #2
  %14 = trunc i32 %9 to i8
  call void @putchar(i8 zeroext %14) #2
  %15 = trunc i32 %10 to i8
  call void @putchar(i8 zeroext %15) #2
  %16 = trunc i32 %11 to i8
  call void @putchar(i8 zeroext %16) #2
  ret void
}

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #0 {
  call void @three_args(i32 79, i32 119, i32 79)
  call void @putchar(i8 zeroext 10) #2
  call void @five_args(i32 122, i32 97, i32 100, i32 100, i32 121)
  call void @putchar(i8 zeroext 10) #2
  call void @twelve_args(i32 108, i32 109, i32 97, i32 111, i32 109, i32 121, i32 100, i32 117, i32 100, i32 101, i32 33, i32 63)
  ret void
}

attributes #0 = { nounwind sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
