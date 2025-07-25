# 🌻 R102 Control Flow and Function
**📝 This section provides an overview of my foundational knowledge in R programming. It includes practical code examples and their outputs from the lessons learned.**
## 🍁 Control Flow 
- คือหนึ่งใน building blocks ที่สำคัญของการเขียนโปรแกรม
- ใน R เรามี control flow สำคัญอยู่สามตัวคือ
  - 1.`if`
  - 2.`for`
  - 3.`while`
### 🌵 หน้าที่ของ Control Flow คือการควบคุมพฤติกรรมของโปรแกรมที่เราเขียน 
**ตัวอย่างเช่น**
- ถ้าคะแนนสอบมากกว่าหรือเท่ากับ 80 คะแนน สอบผ่าน "passed" แต่ถ้าคะแนนไม่ถึงเกณฑ์คือสอบตก "failed"
```r
score <- 85

ifelse (score >= 80, "Passed", "Failed")
```
## 🍁 การเขียนเงื่อนไข `IF`
- 🌵 การเขียนเงื่อนไข IF เป็นพื้นฐานของ computer program ทุกภาษาจะมีโครงสร้างการเขียนเหมือนกันเลย คือ condition, if TRUE, else FALSE
```r
#if 
# =IF() in google sheets

score <- 88   ## กดรันโค้ดนี้ก่อน แล้วค่อยกดรันโค้ด if ด้านล่าง (สิ่งนี้คือตัวแปรscore)

if (score >= 80) {
  print("Passed")
} else {
  print("Failed")
}
----
> score <- 88 

> if(score >= 90) {
+   print("Passed")
+ } else {
+   print("Failed")
+ }
[1] "Failed"
> 
!! Note - เวลาเราพิมพ์ keyword if for while ใน script จะมี highlight syntax ให้เราด้วย

-------------------------------------------------------------
score <- 95    ## กดรันโค้ดนี้ก่อน แล้วค่อยกดรันโค้ด If ด้านล่าง (สิ่งนี้คือตัวแปรscore)

if (score >= 90) {
  print("Passed")
} else {
  print("Failed")
}

แปล : ได้คะแนนสอบ95 ถ้าเงื่อนไขนี้เป็นจริง คือได้scoreมากกว่าหรือเท่ากับ90แสดงว่าผ่าน
แต่ถ้าเงื่อนไขนี้ไม่เป็นจริง ให้แสดงคำว่า Failed 
------------------------------------------------------------------

## การเขียน multiple If else   -- if else = ใส่เงื่อนไขถัดไปได้เลย

if(score >= 90){
  print("Passed")
} else if (score >= 50 ){
  print("OK")
} else {
  print("Enroll again!")
}

แปล : ถ้าได้คะแนนสอบ Failed ให้มาลงเรียนซ้ำใหม่  

```

## 🍁 การเขียน `FOR loop`
