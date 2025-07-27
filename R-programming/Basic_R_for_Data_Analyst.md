# 🌻 Basic R Programming for Data Analyst
**📝 This section provides an overview of my foundational knowledge in R programming. It includes practical code examples and their outputs from the lessons learned.**
### 📑 overview 
- [ ]  **1.variable**
- [ ]  **2.data types**
- [ ]  **3.data structures**
- [ ]  **4.function**
- [ ]  **5.control flow**
## 🎄 [ 1 ] variable: การประกาศตัวแปร
- [ ] 🌵 ข้อดีของการประกาศตัวแปรคือ สามารถเรียกใช้ซ้ำได้ **(reusable)**
```r
## [1] variable
income <- 35000
new_income <- 35000 * 1.2
expense <- 22000
saving <- new_income - expense
print(saving)
```
### 🎄 remove variable
```r
## remove variable
rm(income)
```
## 🎄 [ 2 ] data types
- 1.numeric 1️⃣2️⃣
- 2.character 🆎🆗
- 3.logical ✅❎
- 4.date 📆⏰

```r
## [2] data types
## numeric , character, logical, date 

my_pocket_money <- 150
my_age <- 25
my_name <- "sunsun"
movie_lover <- TRUE
today_date <- as.Date("2024-11-25") 
```
### 🎄 check data types
```r
## check data type  
class(my_age)
class(my_name)
class(movie_lover)
class(today_date)

----
result:
> class(my_age)
[1] "numeric"
> class(my_name)
[1] "character"
> class(movie_lover)
[1] "logical"
> class(today_date)
[1] "Date"
```
### 🎄 change data types [ covert data types ]
- Using = `as.`  พิมพ์ as.แล้วลองเลื่อนขึ้นลงได้ 
```r
## change data types
as.numeric("100")
as.numeric(TRUE)
as.numeric(FALSE)
as.character(555)
as.logical(1)
as.logical(0)
-----------------------
result :
 ## change data types
> as.numeric("100")
[1] 100
> as.numeric(TRUE)
[1] 1
> as.numeric(FALSE)
[1] 0
> as.character(555)
[1] "555"
> as.logical(1)
[1] TRUE
> as.logical(0)
[1] FALSE
```
## 🎄 [ 3 ] data structures
- `1.vector:` เก็บข้อมูล 1 dimension และเก็บข้อมูลได้ 1 ประเภท [vector contains only single data type ex.c("alice","emily","frank") / c(1, 2, 3)]
- `2.matrix:` 2D vector = เก็บข้อมูล 2 dimension
- `3.list:` เทียบเท่ากับ playlist จะเก็บอะไรไว้ในนี้ก็ได้
- `4.dataframe:` table csv, มี column - row, table anything
```r
## [3] data structures
## 1. vector
## 2. matrix
## 3. list
## 4. dataframe
```
