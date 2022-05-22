; ModuleID = './tests/ir/load_store_pointer_up_stack_inc.c.o1.bc'
source_filename = "./tests/cases/load_store_pointer_up_stack_inc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nounwind sspstrong uwtable willreturn
define void @deref_int_inc(i8 zeroext %0) local_unnamed_addr #0 {
  %2 = zext i8 %0 to i64
  %3 = inttoptr i64 %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !3
  %5 = add i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !3
  ret void
}

; Function Attrs: nofree norecurse nounwind sspstrong uwtable willreturn
define void @deref_int_inc2(i8 zeroext %0) local_unnamed_addr #0 {
  %2 = zext i8 %0 to i64
  %3 = inttoptr i64 %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !3
  %5 = add i32 %4, 1
  store i32 %5, i32* %3, align 4, !tbaa !3
  ret void
}

; Function Attrs: nounwind sspstrong uwtable
define void @deref_int(i8 zeroext %0) local_unnamed_addr #1 {
  %2 = zext i8 %0 to i64
  %3 = inttoptr i64 %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !3
  %5 = trunc i32 %4 to i8
  call void @putchar(i8 zeroext %5) #4
  ret void
}

declare void @putchar(i8 zeroext) local_unnamed_addr #2

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #1 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #4
  store i32 97, i32* %1, align 4, !tbaa !3
  %3 = ptrtoint i32* %1 to i64
  %4 = trunc i64 %3 to i8
  call void @deref_int(i8 zeroext %4)
  call void @deref_int_inc(i8 zeroext %4)
  call void @deref_int(i8 zeroext %4)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #4
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

attributes #0 = { nofree norecurse nounwind sspstrong uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
