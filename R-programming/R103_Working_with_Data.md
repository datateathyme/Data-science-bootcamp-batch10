# 🌻 R103 Working with Data 
**📝 This section provides an overview of my foundational knowledge in R programming. It includes practical code examples and their outputs from the lessons learned.**
## 🍁 CSV
- [ ] 🌵 `read_csv()` ใช้อ่านไฟล์ .csv comma separated values เป็น common data format ที่ data analyst เราใช้กันเป็นประจำ
```r
install.packages("readr")
library(readr)

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
- [ ] 🌵 `bind_rows()` เทียบเท่ากับการเขียน UNION ALL ใน SQL — ต่อ dataframe เข้าด้วยกัน หรือเอา dataframe มาเรียงต่อกันจากบนลงล่าง
- [ ] 🌵 `bind_rows()` อยู่ใน install.packages("dplyr")
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
list_df <- list(econ, business, data) 
full_df <- bind_rows(list_df)
```
## 🍁 Bind Cols (!= JOIN)
- [ ] 🌵 `bind_cols()` ไม่เทียบเท่ากับการเขียน join เพราะ bind columns ไม่จำเป็นต้องใช้ key ใดๆ แค่เอา data frame สองตัวมาวางต่อกัน ซ้าย-ขวา
- [ ] 🌵  `rep( )` = create duplicate something  Ex.``` city = c( rep("BKK",3), rep("London",2) ```
```r
# bind_cols() != JOIN



df1 <- data.frame(
    id = 1:5,
    name = c("John","Marry", "Anna",
             "David", "Lisa")
)

**👇🏻 rep = function ที่ช่วยสร้าง value ติดกัน เช่นในex. สร้าง "BKK" ติดกัน 3 ครั้ง 
df2 <- data.frame(
    city = c( rep("BKK",3), rep("London",2) ),  
    country = c( rep("TH",3), rep("UK",2))
)

-----------------------------------------------------------------
## just load  library(dplyr) first => step 1
## before use f(x) bind_cols() => step 2

library(dplyr) 
               
> df1
  id  name
1  1  John
2  2 Marry
3  3  Anna
4  4 David
5  5  Lisa
> df2
    city country
1    BKK      TH
2    BKK      TH
3    BKK      TH
4 London      UK
5 London      UK

> bind_cols(df1, df2)
  id  name   city country
1  1  John    BKK      TH
2  2 Marry    BKK      TH
3  3  Anna    BKK      TH
4  4 David London      UK
5  5  Lisa London      UK
> 
> bind_cols(df2, df1)
    city country id  name
1    BKK      TH  1  John
2    BKK      TH  2 Marry
3    BKK      TH  3  Anna
4 London      UK  4 David
5 London      UK  5  Lisa
> 
------
> left_join(df1,df2, by="id")
  id  name   city country
1  1  John    BKK      TH
2  2 Marry    BKK      TH
3  3  Anna    BKK      TH
4  4 David London      UK
5  5  Lisa London      UK
> 
** join ใช้ key แต่ bind_cols ไม่ใช้ key
```
## 🍁 SQL 
- [ ] 🌵 `sqldf()` ใช้เขียน SQL เพื่อจัดการกับ dataframe ที่อยู่ใน R
```r
# load library sqldf
library(sqldf)
library(readr)

school <- read_csv("school.csv")

sqldf("select * from school;")

sqldf("select avg(student), sum(student) from school;")

sqldf("select school_id, school_name, country from school;")

sql_query <- "select * from school where country = 'USA';"
usa_school <- sqldf(sql_query)

** เทคนิคที่พี่ทอยชอบทำคือการ ประกาศตัว query ขึ้นมาก่อน เหมือนในตัวอย่างด้านล่าง 👇
sql_query <- "select * from school where country = 'USA';"
sqldf(sql_query) ## หลังจากประกาศ query ขึ้นมาเสร็จแล้ว จังหวะที่จะรันก็เอามาใส่ใน sqldf()ได้เลย
usa_school <- sqldf(sql_query) ## ฝากค่าไว้ในสิ่งที่เราต้องการได้เลย ตามตัวอย่าง
```
