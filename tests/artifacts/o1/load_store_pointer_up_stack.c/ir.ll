; ModuleID = './tests/artifacts/o1/load_store_pointer_up_stack.c/ir.bc'
source_filename = "./tests/cases/load_store_pointer_up_stack.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define void @putstr(i8* %0) local_unnamed_addr #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %9, label %3

3:                                                ; preds = %1, %3
  %4 = phi i8* [ %7, %3 ], [ %0, %1 ]
  %5 = ptrtoint i8* %4 to i64
  %6 = trunc i64 %5 to i8
  call void @putchar(i8 zeroext %6) #3
  %7 = getelementptr i8, i8* %4, i64 1
  %8 = icmp eq i8* %7, null
  br i1 %8, label %9, label %3, !llvm.loop !3

9:                                                ; preds = %3, %1
  ret void
}

declare void @putchar(i8 zeroext) local_unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
define void @putdec(i32 %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %5, label %3

3:                                                ; preds = %1
  %4 = icmp sgt i32 %0, 10
  br i1 %4, label %9, label %6

5:                                                ; preds = %1
  call void @putchar(i8 zeroext 48) #3
  br label %23

6:                                                ; preds = %9, %3
  %7 = phi i32 [ 1, %3 ], [ %11, %9 ]
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %23, label %14

9:                                                ; preds = %3, %9
  %10 = phi i32 [ %11, %9 ], [ 1, %3 ]
  %11 = mul i32 %10, 10
  %12 = sdiv i32 %0, %11
  %13 = icmp sgt i32 %12, 10
  br i1 %13, label %9, label %6, !llvm.loop !6

14:                                               ; preds = %6, %14
  %15 = phi i32 [ %20, %14 ], [ %7, %6 ]
  %16 = sdiv i32 %0, %15
  %17 = srem i32 %16, 10
  %18 = trunc i32 %17 to i8
  %19 = add i8 %18, 48
  call void @putchar(i8 zeroext %19) #3
  %20 = sdiv i32 %15, 10
  %21 = add i32 %15, 9
  %22 = icmp ult i32 %21, 19
  br i1 %22, label %23, label %14, !llvm.loop !7

23:                                               ; preds = %14, %6, %5
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind sspstrong uwtable
define void @deref_int_set(i8 zeroext %0) local_unnamed_addr #0 {
  %2 = zext i8 %0 to i64
  %3 = inttoptr i64 %2 to i32*
  store i32 98, i32* %3, align 4, !tbaa !8
  call void @putchar(i8 zeroext 98) #3
  ret void
}

; Function Attrs: nounwind sspstrong uwtable
define void @deref_int(i8 zeroext %0) local_unnamed_addr #0 {
  %2 = zext i8 %0 to i64
  %3 = inttoptr i64 %2 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !8
  %5 = trunc i32 %4 to i8
  call void @putchar(i8 zeroext %5) #3
  ret void
}

; Function Attrs: nounwind sspstrong uwtable
define void @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #3
  store i32 112, i32* %1, align 4, !tbaa !8
  %5 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #3
  store i32 116, i32* %2, align 4, !tbaa !8
  %6 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #3
  store i32 114, i32* %3, align 4, !tbaa !8
  %7 = ptrtoint i32* %1 to i64
  %8 = trunc i64 %7 to i8
  call void @deref_int(i8 zeroext %8)
  %9 = ptrtoint i32* %2 to i64
  %10 = trunc i64 %9 to i8
  call void @deref_int(i8 zeroext %10)
  %11 = ptrtoint i32* %3 to i64
  %12 = trunc i64 %11 to i8
  call void @deref_int(i8 zeroext %12)
  call void @deref_int_set(i8 zeroext %8)
  call void @deref_int(i8 zeroext %8)
  call void @deref_int(i8 zeroext %10)
  call void @deref_int(i8 zeroext %12)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #3
  ret void
}

attributes #0 = { nounwind sspstrong uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 12.0.1"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.mustprogress"}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = distinct !{!6, !4, !5}
!7 = distinct !{!7, !4, !5}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
