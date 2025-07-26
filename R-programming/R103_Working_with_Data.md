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
