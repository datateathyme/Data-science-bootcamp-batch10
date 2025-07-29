# 💾 Data Transformation with `"dplyr"` 🌻
**📝 This section provides an overview of my foundational knowledge in data transformation using dplyr. It includes practical code examples and their outputs from the lessons learned.**
## 🍫 Data Transformation 
📝 การทำ Data Transformation with dplyr คือการที่เราเปลี่ยนรูปหน้าตาของข้อมูล (original data) ให้เป็นไปตามที่เราต้องการ ไม่ว่าจะเป็นการ สร้างหรือเพิ่ม columns หรือ rows ใหม่เข้าไปในข้อมูล การเรียงลำดับ (sort) ข้อมูล หรือการ กรองข้อมูล (filter) เพื่อเลือกเฉพาะส่วนที่เราสนใจ ทุกอย่างนี้สามารถทำได้โดยใช้ภาษา R และแพ็กเกจ dplyr
## 🛠 install.packages("dplyr") 
```r
## Core Packages ที่ R Programer ทุกคนต้องเขียนได้คือ "dplyr" อ่านว่า ดี - พาย - อาร์

## Install Packages
## install new package in RStudio
install.packages("dplyr")    --> Package นี้ติดตั้งแค่ครั้งเดียว เปิดโปรแกรมแล้วรันคำสั่ง

## load library
library(dplyr)    --> run ทุกครั้งที่เปิดโปรแกรมใช้งานขึ้นมาใหม่

```
## 🔐 Core Function in dplyr
| **Function** | **What is does?** | 
|---|---|
| select() | เลือกคอลัมน์ | 
| filter() | ฟิลเตอร์ข้อมูลด้วยเงื่อนไข | 
| mutate() | สร้างคอลัมน์ใหม่ | 
| arrange() | เรียงข้อมูล | 
| summarise() | สรุปผลสถิติ | 
| group_by() | จับกลุ่มข้อมูล | 

## 🔐 Load data 
### 📩 read csv file 'imdb.csv' into R studio
```r
## read csv file 'imdb.csv' into R studio
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE) ## คอลัมน์ที่เป็นตัวอักษรไม่เปลี่ยนเป็น factor เก็บไว้เป็นตัวอักษรเหมือนเดิม
View(imdb) 
```
## 🔐 Review data structure
```r
## review data structure
glimpse(imdb)

----
result:
Rows: 100
Columns: 7
$ NO         <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, …
$ MOVIE_NAME <chr> "The Shawshank Redemption",…
$ YEAR       <int> 1994, 1972, 2008, 1974, 200…
$ RATING     <chr> "R", "R", "PG-13", "R", "PG…
$ LENGTH     <int> 142, 175, 152, 202, 201, 15…
$ GENRE      <chr> "Drama", "Crime, Drama", "A…
$ SCORE      <dbl> 9.3, 9.2, 9.0, 9.0, 8.9, 8.…

```
