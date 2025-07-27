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
