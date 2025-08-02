# 🔴🟡🟢 Intro to Data Visualization in R 
**📝 This section provides an overview of my foundational knowledge in data visualization in R. It includes practical code examples and their outputs from the lessons learned.**
## 💡 Why we need Data Visualization?
Data Visualization ช่วยให้เราเข้าใจข้อมูลที่ซับซ้อนได้ง่ายขึ้น เมื่อเราเปลี่ยนข้อมูลเหล่านั้นให้กลายเป็น กราฟ หรือ แผนภูมิ สมองของเราจะสามารถประมวลผลข้อมูลได้เร็วขึ้น หรือเห็นความสัมพันธ์ระหว่างข้อมูลได้แบบเร็วๆ เพราะ
- กราฟช่วยให้เรามองเห็นภาพรวมของข้อมูลได้ในทันที เช่น ยอดขายเพิ่มขึ้นหรือลดลงในช่วงเวลาไหน
- เราสามารถระบุแนวโน้ม (trends) ของข้อมูลได้ง่ายขึ้น เช่น ลูกค้าซื้อของช่วงวันหยุดสุดสัปดาห์มากกว่าวันธรรมดา
- Data Viz จะช่วยให้เราเจอข้อมูลที่น่าสนใจหรือข้อมูลที่ผิดปกติ (outliers) ได้เร็วขึ้น
- การใช้กราฟและแผนภูมิในการนำเสนอ ทำให้ผู้ฟังเข้าใจสิ่งที่เราต้องการจะสื่อได้ชัดเจนกว่าการอธิบายด้วยตัวเลขเพียงอย่างเดียว
- เมื่อเราเข้าใจข้อมูลได้ดีขึ้น การตัดสินใจทางธุรกิจหรือการแก้ปัญหาก็จะแม่นยำและมีประสิทธิภาพมากขึ้น
## 🔐 basic plot (base R)
```r
## basic plot (base R)
hist(mtcars$mpg)
```
![Image](https://github.com/user-attachments/assets/22303218-1b4b-45be-8cc1-bac18d0e04e3)

### 📩 Analyzing hourse power
- [x] 🌻 **Histogram** - One Quantitative Variable (ตัวแปรเชิงปริมาณ{ตัวเลข} 1 ตัว)
```r
## Analyzing hourse power
hist(mtcars$hp)
mean(mtcars$hp)
median(mtcars$hp)
----
result:
> mean(mtcars$hp)
[1] 146.6875
> median(mtcars$hp)
[1] 123
```
- จากกราฟจะเห็นว่ามีลักษณะเบ้ขวา ซึ่งสอดคล้องกับค่าสถิติ👆 ที่ค่าเฉลี่ย(mean)จะถูกดึงให้อยู่สูงกว่าค่ากลาง(median)
- การสร้างกราฟขึ้นมาดูควบคู่กับค่าสถิติ จะช่วยให้เราเห็นภาพรวมหรือแนวโน้มของข้อมูลเบื้องต้นได้เร็วมากขึ้น และช่วยให้เราสามารถสำรวจข้อมูลได้แบบเร็วๆทำให้เรามีความเข้าใจในข้อมูลมากขึ้น 
  
![Image](https://github.com/user-attachments/assets/ce0c911c-09a3-4bd4-9a1f-7dbe62b477ae)

## 📩 convert column `am` to factor
- [x] 🌻 **Bar plot** - One Quanlitative Variable (ตัวแปรเชิงคุณภาพ 1 ตัว)
```r
str(mtcars)
mtcars$am <- factor(mtcars$am, 
                    levels = c(0, 1),
                    labels = c("Auto", "Manual"))

## Bar plot One Quanlitative Variable
barplot(table(mtcars$am))
----
result:
> table(mtcars$am)
   Auto Manual 
    19     13 
```
![Image](https://github.com/user-attachments/assets/2a254804-89e8-4991-a336-a05b27a50727)

### 📩 Box Plot
```r
## Box Plot
boxplot(mtcars$hp)
fivenum(mtcars$hp)

min(mtcars$hp)
quantile(mtcars$hp, probs = c(.25, .5, .75))
max(mtcars$hp)
----
result:
> fivenum(mtcars$hp)
[1]  52  96 123 180 335
> min(mtcars$hp)
[1] 52
> quantile(mtcars$hp, probs = c(.25, .5, .75))
  25%   50%   75% 
 96.5 123.0 180.0 
> max(mtcars$hp)
[1] 335
```
![Image](https://github.com/user-attachments/assets/ce9d83fd-30dd-45ad-91bb-e4c3e1628095)

```r
## whisker calculation
q3 <- quantile(mtcars$hp, probs = .75)
q1 <- quantile(mtcars$hp, probs = .25)
IQR_hp <- q3 - q1

q3 + 1.5*IQR_hp
q1 - 1.5*IQR_hp

boxplot.stats(mtcars$hp, coef = 1.5)

## filter out outliers
mtcars_no_outlier <- mtcars %>% 
  filter(hp < 335)

boxplot(mtcars_no_outlier$hp)
```
![Image](https://github.com/user-attachments/assets/ce160cab-fe44-4642-a9f9-22f9cb322e46)

```r
## Box Plot 2 variable
## Quanlitative x Quantitative
boxplot(mpg ~ am , data = mtcars, 
       col = c("gold", "salmon"))
```
![Image](https://github.com/user-attachments/assets/6679b971-0d58-4584-864f-3c01edff4950)
### 📩 Scatter Plot

```r
## Scatter Plot
## 2 Quantitative
plot(mtcars$hp, mtcars$mpg, pch = 16,
     col="blue", 
     main = "Relationship between HP and MPG",
     xlab = "Hourse Power",
     ylab = "Miles Per Gallon")

cor(mtcars$hp, mtcars$mpg) # correlation เป็นลบ
lm(mpg ~ hp, data = mtcars) # slop ติดลบ
```
![Image](https://github.com/user-attachments/assets/c226b23a-c409-4077-8f7f-89a9d107bd0a)

```r
## Intro to data viz in R
## library tidyverse
library(tidyverse)
```







