; ModuleID = './tests/ir/load_store_pointer_in_stack.c.o1.bc'
source_filename = "./tests/cases/load_store_pointer_in_stack.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @another_stack() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #3
  store i32 112, i32* %1, align 4, !tbaa !3
  %3 = ptrtoint i32* %1 to i64
  %4 = and i64 %3, 252
  %5 = icmp eq i64 %4, 0
  %6 = select i1 %5, i8 65, i8 66
  call void @putchar(i8 zeroext %6) #3
  call void @putchar(i8 zeroext 66) #3
  %7 = inttoptr i64 %4 to i32*
  %8 = icmp eq i32* %1, %7
  %9 = select i1 %8, i8 66, i8 65
  call void @putchar(i8 zeroext %9) #3
  %10 = load i32, i32* %1, align 4, !tbaa !3
  %11 = trunc i32 %10 to i8
  call void @putchar(i8 zeroext %11) #3
  store i32 97, i32* %1, align 4, !tbaa !3
  call void @putchar(i8 zeroext 97) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #3
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare void @putchar(i8 zeroext) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #3
  store i32 112, i32* %1, align 4, !tbaa !3
  %3 = ptrtoint i32* %1 to i64
  %4 = and i64 %3, 252
  %5 = icmp eq i64 %4, 0
  %6 = select i1 %5, i8 65, i8 66
  call void @putchar(i8 zeroext %6) #3
  call void @putchar(i8 zeroext 66) #3
  %7 = inttoptr i64 %4 to i32*
  %8 = icmp eq i32* %1, %7
  %9 = select i1 %8, i8 66, i8 65
  call void @putchar(i8 zeroext %9) #3
  %10 = load i32, i32* %1, align 4, !tbaa !3
  %11 = trunc i32 %10 to i8
  call void @putchar(i8 zeroext %11) #3
  store i32 97, i32* %1, align 4, !tbaa !3
  call void @putchar(i8 zeroext 97) #3
  call void @another_stack()
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #3
  ret void
}

attributes #0 = { nounwind sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
