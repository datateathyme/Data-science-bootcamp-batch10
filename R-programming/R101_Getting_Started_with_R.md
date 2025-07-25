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
🌷 **Subset by position with vector**
- เลือกค่าเดียว
```r
my_vector <- c(10, 20, 30, 40, 50)
my_vector[3] # เลือกตัวที่ 3
# result: 30
```
- เลือกหลายค่า
```r
my_vector <- c(10, 20, 30, 40, 50)
my_vector[c(1, 5)] # เลือกตัวที่ 1 และ 5
# result: 10 50
```
- เลือกเป็นช่วงขึ้นมา
```r
my_vector <- c(10, 20, 30, 40, 50)
my_vector[2:4] # เลือกจากตัวที่ 2 ถึงตัวที่ 4
# result: 20 30 40
```
- ไม่รวมค่าบางค่า
```r
my_vector <- c(10, 20, 30, 40, 50)
my_vector[-3] # ไม่รวมตัวที่ 3
# result: 10 20 40 50
my_vector[c(-1, -5)] # ไม่รวมที่ 1 และ 5
# result: 20 30 40
```
🌷 **Subset by position with Matrix**
- [ ] การเลือกข้อมูลใน Matrix ต้องระบุตำแหน่งทั้งแถว (row) และคอลัมน์ (column) ในรูปแบบ [row_index, column_index]
- เลือกดึงขึ้นมาค่าเดียว
```r
my_matrix <- matrix(1:9, nrow = 3, byrow = TRUE)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9
my_matrix[2, 3] # เลือก value แถวที่ 2 คอลัมน์ 3
# result: 6
```
- เลือกทั้งแถว/คอลัมน์
```r
my_matrix[1, ] # เลือกทั้งแถวที่ 1
# result: 1 2 3
my_matrix[, 2] # เลือกทั้งคอลัมน์ที่ 2
# result: 2 5 8
```
- เลือกหลายแถว/คอลัมน์
```r
my_matrix[c(1, 3), c(1, 2)] # เลือกแถวที่ 1, 3 และคอลัมน์ที่ 1, 2
# result:
#      [,1] [,2]
# [1,]    1    2
# [2,]    7    8
```
🌷 **Subset by position with Data Frame**
- [ ] คล้ายกับ Matrix แต่มีความยืดหยุ่นกว่า
- เลือกค่าเดียว
```r
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  City = c("NY", "LA", "SF")
)
df[2, 2] # แถว 2 คอลัมน์ 2 (Age ของ Bob)
# result: 30
```
- เลือกทั้งแถว/คอลัมน์
```r
df[1, ] # เลือกทั้งแถวที่ 1
# result:
#    Name Age City
# 1 Alice  25   NY

df[, 3] # เลือกทั้งคอลัมน์ที่ 3 (City)
# result: NY LA SF
# (จะคืนค่าเป็น vector)

df[ , 3, drop = FALSE] # ถ้าอยากให้เป็น data frame เหมือนเดิม
# result:
#   City
# 1   NY
# 2   LA
# 3   SF
```
- เลือกหลายแถว/คอลัมน์
```r
df[c(1, 3), c(1, 3)]
# result:
#      Name City
# 1   Alice   NY
# 3 Charlie   SF
```
- [ ] 🌹 **Subset by condition**
- เป็นการเลือกข้อมูลโดยใช้เงื่อนไข TRUE หรือ FALSE ผลลัพธ์จากเงื่อนไขจะเป็น logical vector ที่มีขนาดเท่ากับข้อมูลต้นฉบับ ซึ่งจะใช้ในการเลือกสมาชิกที่ตรงตามเงื่อนไข
```r
> ages
[1] 26 27 32 31 28
> ages[ ages > 30]
[1] 32 31
> ages[ ages <= 30]
[1] 26 27 28
```
🌹 **Subset by condition with Vector**
```r
temperatures <- c(22, 25, 18, 30, 20)
hot_days <- temperatures[temperatures > 20] # เลือกวันที่อุณหภูมิสูงกว่า 20
# result: 22 25 30
```
🌹 **Subset by condition with Matrix**
```r
my_matrix <- matrix(1:9, nrow = 3, byrow = TRUE)
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9
my_matrix[my_matrix > 5] # เลือกค่าที่มากกว่า 5
# result: 6 7 8 9 (เป็น vector)

# ถ้าต้องการให้ผลลัพธ์ยังคงเป็น matrix และแทนค่าที่ไม่ตรงเงื่อนไขด้วย NA
my_matrix[my_matrix <= 5] <- NA
print(my_matrix)
#      [,1] [,2] [,3]
# [1,]   NA   NA   NA
# [2,]   NA   NA    6
# [3,]    7    8    9
```
🌹 **Subset by condition with Data Frame**
- เลือกแถวตามเงื่อนไขในคอลัมน์เดียว
```r
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David"),
  Age = c(25, 30, 35, 28),
  City = c("NY", "LA", "SF", "NY")
)
# เลือกคนที่อายุมากกว่า 28
old_people <- df[df$Age > 28, ]
# result:
#      Name Age City
# 2     Bob  30   LA
# 3 Charlie  35   SF

# เลือกคนจากเมือง NY
ny_residents <- df[df$City == "NY", ]
# result:
#    Name Age City
# 1 Alice  25   NY
# 4 David  28   NY
```
- เลือกแถวตามหลายเงื่อนไข (ใช้ `&` สำหรับ AND, `|` สำหรับ OR)
```r
# เลือกคนอายุมากกว่า 25 และอยู่เมือง NY
filtered_df <- df[df$Age > 25 & df$City == "NY", ]
# result:
#    Name Age City
# 4 David  28   NY

# เลือกคนอายุมากกว่า 30 หรืออยู่เมือง SF
filtered_df2 <- df[df$Age > 30 | df$City == "SF", ]
# result:
#      Name Age City
# 2     Bob  30   LA  (เงื่อนไข Age > 30 ไม่ตรง แต่รวมเพราะ Age = 30)
# 3 Charlie  35   SF
```
- ใช้ฟังก์ชัน `subset()` (สะดวกสำหรับ Data Frame)
```r
# เลือกคนที่อายุมากกว่า 28 และเลือกเฉพาะคอลัมน์ Name กับ City
filtered_subset <- subset(df, Age > 28, select = c(Name, City))
# result:
#      Name City
# 2     Bob   LA
# 3 Charlie   SF

# เลือกคนจากเมือง LA หรือ NY
filtered_subset2 <- subset(df, City %in% c("LA", "NY"))
# result:
#    Name Age City
# 1 Alice  25   NY
# 2   Bob  30   LA
# 4 David  28   NY

หมายเหตุ: %in% ใช้ตรวจสอบว่าสมาชิกอยู่ในชุดของค่าที่กำหนดหรือไม่
```

- [ ] 🌼 **Subset by name**
- [ ] ใช้ได้กับโครงสร้างข้อมูลที่มีชื่อกำกับ เช่น lists, data frames, หรือ named vectors
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
🌼 **Subset by name with Named Vector**
```r
scores <- c(Math = 90, Science = 85, English = 92)
scores["Math"] # เลือกค่าโดยใช้ชื่อ "Math"
# result: 90
scores[c("Science", "English")] # เลือกหลายค่าด้วยชื่อ
# result:   Science English
#              85      92
```
🌼 **Subset by name with List**
- `[[ ]]`  ใช้ดึงสมาชิกเดียวออกมาจาก list. ผลลัพธ์จะเป็นคลาสของสมาชิกนั้นๆ
```r
my_list <- list(a = 1:3, b = "hello", c = TRUE)
my_list[["a"]] # ดึงสมาชิกชื่อ "a" ออกมา
# result: 1 2 3 (เป็น vector)
```
- `[]` ใช้ดึง subset ของ list. ผลลัพธ์ยังคงเป็น list เสมอ
```r
my_list <- list(a = 1:3, b = "hello", c = TRUE)
my_list["a"] # ดึง subset ของ list ที่มีสมาชิกชื่อ "a"
# result: $a
#          [1] 1 2 3
# (ยังคงเป็น list)
my_list[c("a", "c")] # ดึง subset ของ list ที่มีสมาชิกชื่อ "a" และ "c"
# result: $a
#          [1] 1 2 3
#          $c
#          [1] TRUE
```
- $ (Dollar sign) เป็นวิธีที่สะดวกและอ่านง่ายในการเข้าถึงสมาชิกของ list หรือคอลัมน์ของ data frame โดยใช้ชื่อ
```r
my_list$b
# result: "hello"
```

🌼**Subset by name with Data Frame**
- โดยใช้ชื่อคอลัมน์ (และ $)
```r
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  City = c("NY", "LA", "SF")
)
df$Age # เลือกคอลัมน์ Age
# result: 25 30 35 (เป็น vector)
df[["Name"]] # เลือกคอลัมน์ Name
# result: Alice Bob Charlie (เป็น vector)
```
- โดยใช้ชื่อคอลัมน์ (และ [])
```r
df["City"] # เลือกคอลัมน์ City
# result:
#   City
# 1   NY
# 2   LA
# 3   SF
# (ยังคงเป็น data frame)

df[c("Name", "City")] # เลือกหลายคอลัมน์
# result:
#      Name City
# 1   Alice   NY
# 2     Bob   LA
# 3 Charlie   SF
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

## subset by position
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

## subset by name
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

## subset by condition
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
