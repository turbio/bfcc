; ModuleID = './tests/count_from_9.c'
source_filename = "./tests/count_from_9.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind optsize sspstrong uwtable
define i32 @main() local_unnamed_addr #0 {
  tail call void @putc(i8 zeroext 57) #2
  br label %2

; <label>:1:                                      ; preds = %2
  ret i32 0

; <label>:2:                                      ; preds = %0, %2
  %3 = phi i8 [ 9, %0 ], [ %4, %2 ]
  tail call void @putc(i8 zeroext 44) #2
  tail call void @putc(i8 zeroext 32) #2
  %4 = add nsw i8 %3, -1
  %5 = add nsw i8 %3, 47
  tail call void @putc(i8 zeroext %5) #2
  %6 = icmp eq i8 %4, 1
  br i1 %6, label %1, label %2
}

; Function Attrs: optsize
declare void @putc(i8 zeroext) local_unnamed_addr #1

attributes #0 = { nounwind optsize sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { optsize "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind optsize }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.1.0 (tags/RELEASE_710/final)"}
