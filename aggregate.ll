; ModuleID = 'aggregate.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hoge2 = type { i8, double, %struct.hoge1 }
%struct.hoge1 = type { float, [10 x [20 x i32]] }

; Function Attrs: nounwind uwtable
define i32* @getelem(%struct.hoge2* %hoge) #0 {
entry:
  %hoge.addr = alloca %struct.hoge2*, align 8
  store %struct.hoge2* %hoge, %struct.hoge2** %hoge.addr, align 8
  %0 = load %struct.hoge2*, %struct.hoge2** %hoge.addr, align 8
  %arrayidx = getelementptr inbounds %struct.hoge2, %struct.hoge2* %0, i64 1
  %c = getelementptr inbounds %struct.hoge2, %struct.hoge2* %arrayidx, i32 0, i32 2
  %y = getelementptr inbounds %struct.hoge1, %struct.hoge1* %c, i32 0, i32 1
  %arrayidx1 = getelementptr inbounds [10 x [20 x i32]], [10 x [20 x i32]]* %y, i32 0, i64 5
  %arrayidx2 = getelementptr inbounds [20 x i32], [20 x i32]* %arrayidx1, i32 0, i64 13
  ret i32* %arrayidx2
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 3fb626d1f815b94bb2110fa04ba5b903e064659f) (http://llvm.org/git/llvm.git 9dd5b1fbd8126e0b101f3f142952fecb2084c1d5)"}
