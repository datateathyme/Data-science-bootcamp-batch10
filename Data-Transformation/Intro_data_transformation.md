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
