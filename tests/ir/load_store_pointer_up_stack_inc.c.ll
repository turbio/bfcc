; ModuleID = './tests/ir/load_store_pointer_up_stack_inc.c.bc'
source_filename = "./tests/cases/load_store_pointer_up_stack_inc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @deref_int_inc(i8 zeroext %0) #0 {
  %2 = alloca i8, align 1
  store i8 %0, i8* %2, align 1
  %3 = load i8, i8* %2, align 1
  %4 = zext i8 %3 to i64
  %5 = inttoptr i64 %4 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = add i32 %6, 1
  store i32 %7, i32* %5, align 4
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

declare void @putchar(i8 zeroext) #1

; Function Attrs: noinline nounwind optnone sspstrong uwtable
define void @main() #0 {
  %1 = alloca i32, align 4
  store i32 97, i32* %1, align 4
  %2 = ptrtoint i32* %1 to i8
  call void @deref_int(i8 zeroext %2)
  %3 = ptrtoint i32* %1 to i8
  call void @deref_int_inc(i8 zeroext %3)
  %4 = ptrtoint i32* %1 to i8
  call void @deref_int(i8 zeroext %4)
  ret void
}

attributes #0 = { noinline nounwind optnone sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
