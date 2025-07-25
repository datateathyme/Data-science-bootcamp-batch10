# 🌻 R101 Getting Started with R programming 
**📝 This section provides an overview of my foundational knowledge in R programming. It includes practical code examples and their outputs from the lessons learned.**
## 🍁 create variables
```r
income <- 50000
expense <- 30000
saving <- income - expense
```
## 🍁 remove variables 
```r
rm(saving)
```
## 🍁 comparison operators
- เราสามารถเขียน comparison operators ต่อไปนี้เพื่อเปรียบเทียบสองฝั่งของสมการได้ใน R
  - [ ] `>`
  - [ ] `>=`
  - [ ] `<`
  - [ ] `<=`
  - [ ] `==` (equal)
  - [ ] `!=` (not equal)
```r
## compare values
1 + 1 == 2
2 * 2 <= 4
5 >= 10
5 - 2 != 3 ## not equal
10 < 2
10 > 2
```
## 🍁 compare text / characters
```r
"Hello" == "Hello"
"Hello" == "hello"

----
result:
> "Hello" == "Hello"
[1] TRUE
> "Hello" == "hello"
[1] FALSE
```
## 🍁 data types 📑
### 🌻 1. numeric
```r
age <- 25
print(age)
class(age)

----
result:
> age <- 25
> print(age)
[1] 25
> class(age)
[1] "numeric"
```
### 🌻 2. character
```r
my_name <- "Sunsun"
my_university <- "Rangsit University"
print(my_name)
print(my_university)
class(my_name); class(my_university) -- ; print result พร้อมกัน

----
result:
> print(my_name)
[1] "Sunsun"
> print(my_university)
[1] "Rangsit University"
> class(my_name); class(my_university)
[1] "character"
[1] "character"
```
### 🌻 3. logical
```r
result <- 1 + 1 == 2
print(result); class(result)

----
result:
> result <- 1 + 1 == 2
> print(result); class(result)
[1] TRUE
[1] "logical"
```
### 🌻 4. factor
- คือ ตัวแปรประเภทข้อมูลเชิงหมวดหมู่ (categorical data) เช่น
  - เพศ: "ชาย", "หญิง"
  - ระดับการศึกษา: "ประถม", "มัธยม", "ปริญญาตรี", "ปริญญาโท"
```r
animals <- c("dog", "cat", "cat", "hippo")
class(animals)

animals <- factor(animals)
class(animals)

----
result:
> animals <- c("dog", "cat", "cat", "hippo")
> class(animals)
[1] "character"
> 
> animals <- factor(animals)
> class(animals)
[1] "factor"
```
### 🌻 5. date / time
```r
time_now <- Sys.time()
class(time_now)
```
## 🍁 convert data types
### 🌻 main functions
- [ ] as.numeric()
- [ ] as.character()
- [ ] as.logical()
```r
## as.numeric()
## as.character()
## as.logical()

x <- 100
class(x)

# convert data type
char_x <- as.character(x)
num_x <- as.numeric(char_x)
class(char_x)

----
result:
> class(x)
[1] "numeric"
> class(char_x)
[1] "character"
```
### 🌻 logical: TRUE / FALSE
```r
## logical: TRUE / FALSE
# convert data type
as.logical(1)
as.logical(0)
as.numeric(TRUE)
as.numeric(FALSE)
```
## 🍁 Data structures
- [ ] 1. vector
- [ ] 2. matrix
- [ ] 3. list
- [ ] 4. data frame
### 🌻1. vector
- 1 vector จะเก็บข้อมูลได้หนึ่งประเภทเท่านั้น! เช่น ถ้าเป็นตัวเลขก็เป็นตัวเลขทั้งหมด

```r
## 1. vector

1:10
16:25

## sequence generation 
seq(from=1 , to =100 ,by=5) -- เริ่มต้นที่เลข 1 ถึง(สิ้นสุด) 100 เพิ่มขึ้นทีละ 5

## help file
help("seq")

## function c
friends <- c("david", "marry", "anna", "john", "william")
ages <- c(30, 32, 25, 29, 32)
is_male <- c(T, F, F, T, T)
```
### 🌻 2. matrix 
```r
## 2. matrix
x <- 1:25 
length(x) -- length ใช้นับจำนวน หรือความยาวของข้อมูล
dim(x) <- c(5,5) -- dim(dimension) = ในตัวอย่างคือ 5 row 5 column

## create matrix
matrix(1:25, ncol=5 , byrow=TRUE) -- byrow = เปลี่ยนแถวแนวตั้ง เรียงใหม่เป็นแนวนอน
matrix(1:6, ncol=3)
matrix(1:6, ncol=3, nrow=2, byrow=T)

m1 <- matrix(1:25, ncol=5 , byrow=TRUE)
m2 <- matrix(1:6, ncol=3, nrow=2, byrow=T)

## element wise computation = แปลว่าการ บวก ลบ คูณ หาร ทีละตัว
m2 + 100
m2 * 4
```
### 🌻 3. list
- list เก็บข้อมูลได้หลายประเภท
```r
## 3. list
my_name <- "Sunsun"
my_friends <- c("jan", "ink", "zue")
m1 <- matrix(1:25, ncol=5)
R_is_cool <- TRUE

my_list <- list(item1 = my_name,    -- ตั้งชื่อ = vector ที่ดึงมา
                item2 = my_friends,
                item3 = m1,
                item4 = R_is_cool)

my_list$item3
my_list$item4
```

### 🌻 4. dataframe
```r
## data frame this df have 4 vector 5 values

## dataframe type 1
friends <- c("wan", "ink", "aan", "bee", "top")

ages <- c(26, 27, 32, 31, 28)
locations <- c("New York", "London", "London",
               "Tokyo" , "Manchester")
movie_lover <- c(T, T, F, T, T)

df <- data.frame(friends,
           ages,
           locations,
           movie_lover)

View(df)

## dataframe type 2 -- create dataframe from list
my_list_df <- list(friends = friends,
                   ages = ages,
                   location = locations,
                   movie = movie_lover)

list_df <- data.frame(my_list_df)
```
## 🍁 subset
- [ ] subset by position
- [ ] subset by name
- [ ] subset by condition

```r
## List 

my_name <- "Sun"
my_friend <- c("Lunar","Any", "Muvmuv")
m1 <- matrix(1:25, ncol=5)
R_is_cool <- TRUE

my_list <- list(item1 = my_name,
                item2 = my_friend,
                item3 = m1,
                item4 = R_is_cool)
my_list$item3
my_list$item4

-------------------------------------
## Using $ select column and subset by position 
> my_list$item4
[1] TRUE
> my_list$item2[2:3]
[1] "Any" "Muvmuv"
> my_list$item2
[1] "Lunar" "Any" "Muvmuv"
> my_list$item2[ c(1,3) ]
[1] "Lunar" "Muvmuv"
```
- [ ] 🌷 **Subset by position**
```r
## subset by position
> friends[1]
[1] "wan"
> friends[2]
[1] "ink"
> friends[3]
[1] "aan"
> friends[5]
[1] "top"
> friends[2:3]
[1] "ink" "aan"
> friends[2:5]
[1] "ink" "aan" "bee" "top"
> > > friends[ c(1,3,5)]
[1] "wan" "aan" "top"
```
- [ ] 🌷 **Subset by condition**
```r
> ages
[1] 26 27 32 31 28
> ages[ ages > 30]
[1] 32 31
> ages[ ages <= 30]
[1] 26 27 28
```
- [ ] 🌷 **Subset by name**
-  Using function names(ages) ← friends
-  แปล - ใช้ function names แล้วโยน (ages) เพิ่มชื่อเพื่อนเข้าไปใน ages
-  👆 สมมติว่าต้องการใส่ชื่อเพื่อนไปในอายุด้วยให้ใช้ฟังก์ชัน names( ) 
```r
> ages
wan ink aan bee top 
 26  27  32  31  28 
> 
> names(ages) <- friends
> 
> ages
wan ink aan bee top 
 26  27  32  31  28 
> 

> ages["wan"]
wan 
 26 
> ages["top"]
top 
 28 
 
> ages[ c("top","aan","bee") ]
top aan bee 
 28  32  31
```
------
### 🌻 Example subset data
```r
> > View(df)  
 > df
  friends ages  locations movie_lover
1     wan   26   New York        TRUE
2     ink   27     London        TRUE
3     aan   32     London       FALSE
4     bee   31      Tokyo        TRUE
5     top   28 Manchester        TRUE

> df[1,3] -- select row 1 : col 3
[1] "New York"

> df[2,4] -- select row 2 : col 4
[1] TRUE

> df[1:2,4] -- select row 1 - 2 : col 4
[1] TRUE TRUE

> df[1:2, ] -- select row 1 - 2 : All column
  friends ages locations movie_lover
1     wan   26  New York        TRUE
2     ink   27    London        TRUE
> 

> df[1:2, 2:4] -- select row 1 - 2 : col 2 - 4
  ages locations movie_lover
1   26  New York        TRUE
2   27    London        TRUE

> df[  ,"friends"]  -- select column friend , all row --- [row, column]
[1] "wan" "ink" "aan" "bee" "top"

** 👇🏻 select 2 column c("friends", "locations") , all row
> df[ ,c("friends", "locations")]
  friends  locations
1     wan   New York
2     ink     London
3     aan     London
4     bee      Tokyo
5     top Manchester
> 

** 👇🏻 ดึงชื่อเพื่อนที่ชอบหนัง หรือ  == TRUE, ดึงมาทุกคอลลัมน์
> df[ df$movie_lover == TRUE, ] -- syntax filter dataframe in R 
  friends ages  locations movie_lover
1     wan   26   New York        TRUE
2     ink   27     London        TRUE
4     bee   31      Tokyo        TRUE
5     top   28 Manchester        TRUE

> df[ df$movie_lover == FALSE, ]
  friends ages locations movie_lover
3     aan   32    London       FALSE

** 👇🏻 ดึงชื่อเพื่อนที่ ages < 30, ดึงมาทุกคอลลัมน์
> df[ df$ages < 30, ]
  friends ages  locations movie_lover
1     wan   26   New York        TRUE
2     ink   27     London        TRUE
5     top   28 Manchester        TRUE
> 

** 👇🏻 ดึงชื่อเพื่อนที่ name == "top" , ดึงมาทุกคอลลัมน์
> df[ df$friends == "top", ]
  friends ages  locations movie_lover
5     top   28 Manchester        TRUE
```
