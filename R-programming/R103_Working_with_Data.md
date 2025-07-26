# 🌻 R103 Working with Data 
**📝 This section provides an overview of my foundational knowledge in R programming. It includes practical code examples and their outputs from the lessons learned.**
## 🍁 CSV
- [ ] 🌵 `read_csv()` ใช้อ่านไฟล์ .csv comma separated values เป็น common data format ที่ data analyst เราใช้กันเป็นประจำ
```r
read_csv("fileName.csv")
```
```r
## Ex.
read_csv("student.csv")
```
## 🍁 Excel File → read excel file 
- [ ] 🌵 `read_excel()` ใช้อ่านไฟล์ Excel `.xlsx` อ่านทีละ sheet ได้เลย อย่าลืมโหลด library `readxl` ก่อน ไม่งั้น R จะหาฟังก์ชัน `read_excel()` ไม่เจอ
```r
# install packages
install.packages("readxl") ## ติดตั้งครั้งแรกเพียงครั้งเดียว

# load library
library(readxl)  ## โหลดใหม่ทุกครั้งที่เปิดโปรแกรมขึ้นมาใหม่

# read excel file
read_excel("name file.xlsx", sheet=1) --> refer to sheet 1
read_excel("name file.xlsx", sheet=2) --> refer to sheet 2
read_excel("name file.xlsx", sheet=3) --> refer to sheet 3

** หรือถ้ารู้ชื่อ sheet จะใส่ชื่อ sheet ไปเลยก็ได้ 👇🏻
read_excel("name file.xlsx", sheet="Data")
read_excel("name file.xlsx", sheet="Economic")
read_excel("name file.xlsx", sheet="Business")
```
```r
** how to loop เข้าไปแล้วอ่านทุก sheets

result <- list()

## อันนี้เรารู้ว่าไฟล์มี 3 sheets  [ i ] = 1, 2, 3
for (i in 1:3) {   
  result[[i]] <- read_excel("students.xlsx", sheet=i)
}

** subset list สกัด ออกมาทีละ sheets👇🏻

result[[1]]
result[[2]]
result[[3]]
```
## 🍁 Google sheets
- [ ] 🌵 `read_sheet()` ใช้อ่าน data จาก Google Sheets ถ้าเป็น public link ก่อนใช้คำสั่ง read_sheet() ให้เรารันคำสั่ง gs4_deauth() ก่อน (แปลว่า ลิ้งที่เราจะอ่านไฟล์เป็น public link ไม่ต้องมีการ login)
```r
library(googlesheets4)

url <- "url file from google sheets"

gs_deauth() ## Use this function for run before f( read_sheet() )

read_sheet(url, sheet="student")

df <- read_sheet(url, sheet="student") ## เราสามารถฝากค่าไว้ใน df ได้
##  แล้วเราก็จะได้ dataframe from google sheets มาอยู่ใน program R
```
## 🍁 JSON 
- [ ] 🌵 `fromJSON()` ใช้อ่านไฟล์ `.json` เข้ามาเป็น list ใน R แล้วค่อยใช้ฟังก์ชัน data.frame() เพื่อเปลี่ยน list -> data frame ได้
```r
##JAVASCRIPT ## Json file concept = "key": [ values pair ]

library(jsonlite) ## load before read file JSON

bp <- data.frame(fromJSON("blackpink.json")) ## fromJSON("name file .json")
## change convert list to dataframe 👆
View(bp)
```
## 🍁 Bind Rows (เท่ากับ UNION ALL in SQL)
- [ ] 🌵 `bind_rows()` เทียบเท่ากับการเขียน UNION ALL ใน SQL — ต่อ dataframe เข้าด้วยกัน หรือเอา dataframe มาเรียงต่อกัน
```r
library(dplyr)
library(readxl)

#read excel file
econ <- read_excel("student.xlsx", sheet=1)
business <- read_excel("student.xlsx", sheet=2)
data <- read_excel("student.xlsx", sheet=3)

---------------

#bind_rows == SQL UNION ALL
bind_rows(econ, business, data) ## standard

** 👇 ถ้าสมมติ dataframe เรามมีเป็น 10-20 df 
## แนะนำว่า ควรสร้างเป็น list ของ dataframe ขึ้นมาก่อน โดยการใช้ f(x) =list()
list_df <- list(econ, business, data, .....dataframe ก่อนอื่น สมมติถ้ามีอีก) 
full_df <- bind_rows(list_df)
```
