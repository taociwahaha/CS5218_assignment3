; ModuleID = 'standardtest3.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %sink = alloca i32, align 4
  %source = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %b, align 4
  store i32 1234, i32* %source, align 4
  %2 = load i32* %a, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = load i32* %source, align 4
  store i32 %5, i32* %c, align 4
  br label %10

; <label>:6                                       ; preds = %0
  %7 = load i32* %source, align 4
  %8 = load i32* %d, align 4
  %9 = add nsw i32 %7, %8
  store i32 %9, i32* %c, align 4
  br label %10

; <label>:10                                      ; preds = %6, %4
  %11 = load i32* %c, align 4
  store i32 %11, i32* %sink, align 4
  %12 = load i32* %sink, align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %12)
  %14 = load i32* %1
  ret i32 %14
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.2 (tags/RELEASE_352/final)"}
