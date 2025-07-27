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
- 🆎 วิธีตั้งชื่อ ตัวแปร Variable
   - [ ] Tip : ชื่อตัวแปรห้ามขึ้นต้นด้วยตัวเลข เช่น money [ถูก] , 2024_money [ผิด]
   - ชื่อ ห้ามขึ้นต้นด้วยตัวเลข
   - ชื่อ ถ้ามีหลายคำ ใช้ _ เข้ามาช่วย [`student_name`]
   - ชื่อ เราตั้งเป็นตัวพิมพ์เล็กเสมอ
   - [ ] รูปแบบการตั้งชื่อที่พบบ่อยใน R
   - **snake case:** `student_name` `calculate_average()`  
   - **camel case:** `studentName` `calculateAverage` 
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
### 🎄 [3.1] vector (contains only single data type)
```r
## [3.1] vector
friends <- c("William", "James", "Noah", "Emma", "Ava") ## character
ages <- c(25, 32, 28, 29, 30)  ## numeric
marvel_lover <- c(TRUE, FALSE, TRUE, FALSE, FALSE) ## logical
```
### 🎄 `length()` # count ความยาว หรือจำนวน ใน vecor c()
```r
ages <- c(25, 32, 28, 29, 30)
marvel_lover <- c(T, F, T, F, F) 

length(ages)
[1] 5
> length(marvel_lover)
[1] 5

> friends
[1] "William", "James", "Noah", "Emma", "Ava"
> length(friends)
[1] 5
```
### 🎄 [3.2] `matrix()`
```r
## [3.2] matrix
## 2D vector

m1 <- matrix(1:4, ncol=2)
m2 <- matrix(5:8, ncol=2 ,byrow=TRUE)

my_vec <- 1:25
m3 <- matrix(my_vec, ncol=5)
m4 <- matrix(my_vec, ncol=5, byrow=TRUE) ## 1, 2, 3, 4, 5 

m1 + 100
    [,1] [,2]
[1,]  101  103
[2,]  102  104
```
### 🎄 [3.3] `list()`
- list ยืดหยุ่นที่สุดในภาษา R →  list จะเก็บอะไรก็ได้ในนี้
- concept → Key = value pair
- ฝั่งขวามือ หรือ value pair จะเป็นอะไรก็ได้
```r
## [3.3] list -> Key = value pair
john <- list(
    first_name = "john",
    last_name = "wick",
    age = 45,
    city = "Bangkok",
    occupation = "teacher",
    salary = 100000,
    marvel_fan = TRUE,
    marvel_movies = c("Thor",
                      "Loki Series",
                      "Infinity War")
)
--------------------------------------------------------------
> john [1]
$first_name ## key --> result call = ' list '
[1] "john" ## value pair

> john [[1]]
[1] "john" ## [[]] ## > value pair

## selct key and subset by position 👇

> john$city
[1] "Bangkok"
> john$marvel_fan
[1] TRUE
> john$marvel_movies
[1] "Thor"         "Loki Series"  "Infinity War"
> john$marvel_movies[2]
[1] "Loki Series"
> john$marvel_movies[1:2]
[1] "Thor"        "Loki Series"

------------------
## more example 

> john$city
[1] "Bangkok"
> john$marvel_fan
[1] TRUE
> john$marvel_movies
[1] "Thor"         "Loki Series"  "Infinity War"
> john$marvel_movies[2]
[1] "Loki Series"
> john$marvel_movies[1:2]
[1] "Thor"        "Loki Series"

> john$marvel_movies[c(1, 3)]
[1] "Thor"         "Infinity War"
> john$marvel_movies[c(TRUE, FALSE, TRUE)]
[1] "Thor"         "Infinity War"
> john$marvel_movies[-2]
[1] "Thor"         "Infinity War"
```
```r
## [3.3] list
john <- list(
    first_name = "john",
    last_name = "wick",
    age = 45,
    city = "Bangkok",
    occupation = "teacher",
    salary = 100000,
    marvel_fan = TRUE,
    marvel_movies = c("Thor",
                      "Loki Series",
                      "Infinity War")
)

mary <- list(
    full_name = "mary anne",
    age = 28,
    city = "London",
    football_fan = TRUE,
    fav_team = c("Liverpool", "Chelse")
)

## nested list
customers <- list(id_01 = john, 
                  id_02 = mary)
                  
-------------------------------------------------------------
## more example 

> customers$id_02$full_name
[1] "mary anne"
> customers$id_02$age
[1] 28
> customers$id_01$first_name
[1] "john"
> customers$id_01$last_name
[1] "wick"
> customers$id_01$age
[1] 45
```
### 🎄 [3.4] `data.frame()`
- data frame => excel, csv
- data frame ⇒ values or vector ต้องมีค่าเท่ากัน เช่นในตัวอย่าง คือ 5
```r
id <- 1:5
friends <- c("William", "James", "Noah", "Emma", "Ava")

ages <- c(35, 32, 28, 29, 30)
own_a_dog <- c(T, T, F, F, F)
city <- c("BKK", "LON", "LON",
          "TOK", "TOK")
## data.frame
df <- data.frame(id, friends, ages, own_a_dog, city)
```
### 🎄 `str()`
- review  : โครงสร้างของ dataframe เบื้องต้น ว่ามีกี่ row , col
- review : column name 
- review : data type and show some data in data frame
```r
> str(df)
'data.frame':	5 obs. of  5 variables:
 $ id       : int  1 2 3 4 5
 $ friends  : chr  "William" "James" "Noah" "Emma" ...
 $ ages     : num  35 32 28 29 30
 $ own_a_dog: logi  TRUE TRUE FALSE FALSE FALSE
 $ city     : chr  "BKK" "LON" "LON" "TOK" ...
```
### 🎄 `dim ()` วิธี check dimension แบบเร็วๆ
```r
> dim(df)
[1] 5 5 ## Row , Column
```
### 🎄 `summary()`
- เป็นการหาค่าสถิตเบื้องต้นของคอลัมน์ทุกคอลัมน์ที่อยู่ใน data frame
- มี impact เยอะมาก กับคอลัมน์ที่เป็น**`ตัวเลข`**
```r
> summary(df)
       id      friends               ages     
 Min.   :1   Length:5           Min.   :28.0  
 1st Qu.:2   Class :character   1st Qu.:29.0  
 Median :3   Mode  :character   Median :30.0  
 Mean   :3                      Mean   :30.8  
 3rd Qu.:4                      3rd Qu.:32.0  
 Max.   :5                      Max.   :35.0  
 own_a_dog           city          
 Mode :logical   Length:5          
 FALSE:3         Class :character  
 TRUE :2         Mode  :character  

```
### 🎄 Subset dataframe
- [ ] 🌵 three ways that we can subset in R
- [ ] 1. by position
- [ ] 2. by name
- [ ] 3. by condition
```r
## three ways that we can subset in R
> ## []
> ## 1. by position
> ## 2. by name
> ## 3. by condition

** ใครบ้างที่เป็นเจ้าของน้องหมา 

> df[ df$own_a_dog == TRUE,  ]
  id friends ages own_a_dog city
1  1   William  35      TRUE  BKK
2  2    James   32      TRUE  LON
> 
------------------------------------------------------------

> df[ df$own_a_dog == FALSE, ]
  id friends ages own_a_dog city
3  3    Noah   28     FALSE  LON
4  4    Emma   29     FALSE  TOK
5  5     Ava   30     FALSE  TOK
------------------------------------------------------------
** filter or find friend the name is "William"
"Filter friends by the name 'William'"

> df[ df$friend == "William", ]
  id friends ages own_a_dog city
1  1   William  35      TRUE  BKK
> 

df[ df$friends == "Noah", ]
	id friends ages own_a_dog city
3  3    Noah   28     FALSE  LON
```
### 🎄 create a new column in data frame
- Create a new column in data frame พิมพ์ $ หลัง df ได้เลย แล้วต่อด้วยชื่อคอลัมน์ใหม่
- แต่ต้องมีขนาด vector เท่ากับจำนวนข้อมูลใน df ก่อนหน้า
```r
df$fav_menu <- c("somtum", "hotdog", "pizza",
"french fried", "hotdog")
```
### 🎄 remove column 
- type → **`df$fav_menu  / df$column need to delete` ← NULL**
- assign ← ค่า **`NULL`** คำว่า  **`NULL`**  ต้องเป็นตัวพิมพ์ใหญ่ทั้งหมด

```r
## remove column 
df$fav_menu <- NULL

** old column -> fav_menu 
> df
  id friends ages own_a_dog city     fav_menu
1  1 William   35      TRUE  BKK       somtum
2  2   James   32      TRUE  LON       hotdog
3  3    Noah   28     FALSE  LON        pizza
4  4    Emma   29     FALSE  TOK   french fried
5  5     Ava   30     FALSE  TOK       hotdog

> ## remove column
> df$fav_menu <- NULL
## new column -> after assign NULL for delete column -> fav_menu 
> df
  id friends ages own_a_dog city
1  1 William   35      TRUE  BKK
2  2   James   32      TRUE  LON
3  3    Noah   28     FALSE  LON
4  4    Emma   29     FALSE  TOK
5  5     Ava   30     FALSE  TOK
>
```
### 🎄 create new row and how to append or union 2 table
- type → **`rbind`**( table1, table2)
- **`rbind`** = row bind **นำ row ทั้ง 2 table มาต่อกัน**
```r
## create new row and how to append or union 2 table
df2 <- data.frame(
    id = 6:7,
    friends = c("wick", "ky"),
    ages = c(25, 26),
    own_a_dog = c(T, T),
    city = c("Seoul", "Seoul")
)

## row bind 
full_df <- rbind(df, df2)

result: 
> full_df
  id friends ages own_a_dog  city
1  1 William   35      TRUE   BKK
2  2   James   32      TRUE   LON
3  3    Noah   28     FALSE   LON
4  4    Emma   29     FALSE   TOK
5  5     Ava   30     FALSE   TOK
6  6    wick   25      TRUE Seoul
7  7      ky   26      TRUE Seoul
```
## 💾 write csv file
```r
## write csv file
write.csv(full_df, "result.csv.", row.names = F)

write.csv(ชื่อเดต้าเฟรมที่เราต้องการwrite, "ชื่อไฟล์ที่เราต้องการตั้ง.csv.",
F= เราไม่เอาเลขข้างหน้าของ row มาด้วย)
```
## 💾 read csv file
```r
read.csv( "name file" )
----
read.csv("fullDf_R05.csv")
df <- read.csv("fullDf_R05.csv")
```
## 🎄 [ 4 ] function 
```r
## [4] create function
hello <- function() {
    print("Hello world!")
}

## create a new function `cube`
cube <- function(base, power) {
  base ** power
}
```
```r
hello_name <- function(name) {
  print(paste("Hello ", name))
}

hello_world <- function(name) {
  print(paste("Hello,", name, "!"))
}

-------------------------------------------------------------
hello_name <- function(name) {
  print(paste("Hello !!, ", name, "Nice to meet U:"))
}

result:
> hello_name("sunsun")
[1] "Hello !!,  sunsun Nice to meet U:"
```
## 🎄 [ 5 ] control flow
### 🌻 if for while 
- [ ] if()
- [ ] ifelse = ถ้า(สิ่งนี้เกิด, ให้โชว์สิ่งนี้, ถ้าไม่ใช่ให้โชว์สิ่งนี้)
```r
ifelse(10 > 2, T, F)
```
```r
# if
## write same IFS() in google sheets 
score = 68

if (score >= 80) {
  print("A")
} else if (score >= 70) {
  print("B")
} else if (score >= 60) {
  print("C")
} else if (score >= 50) {
  print("D")
} else {
  print("F")
}
```
```r
## create function with if

grading <- function(score) {
  if (score >= 80) {
    return("A")
  } else if (score >= 70) {
    return("B")
  } else if (score >= 60) {
    return("C")
  } else if (score >= 50) {
    return("D")
  } else {
    return("Failed")
  }
}

---
result:
* ✅ result : reusable (ใช้ซ้ำโค้ดได้ง่ายขึ้น) function code very easy 👇
> grading(80)
[1] "A"
> grading(72)
[1] "B"
> grading(65)
[1] "C"
> grading(69)
[1] "C"
> grading(52)
[1] "D"
> grading(49)
[1] "Failed"
```
- [ ] for()
-  ใน R ไม่ค่อยได้ใช้เท่าไหร่ นอกจากเขียน f(x) ขึ้นมาใช้เอง
- เหตุผลที่ไม่ค่อยได้ใช้ for loop in R because : in R สามารทำ vectorization  ได้เลย
- vectorization คือ โค้ดสามารถรันทั้ง vector ได้เลยก็เร็วมาก
```r
## for loop 
for (i in 1:10) {
  print(i)
}
```
```r
## เราสามารถประกาศตัวแปรข้างนอกได้ด้วย Example 👇
## We can declare variables outside of a function
nums <- c(25, 30, 40, 100, 1225)

for (i in nums) {
  if (i %% 2 == 0) {
    print(paste0(i, ": even number"))
  } else {
    print(paste0(i, ": odd number"))
  }
}

result:
[1] "25: odd number"
[1] "30: even number"
[1] "40: even number"
[1] "100: even number"
[1] "1225: odd number"
```
- [ ] while() คือในขณะที่ เงื่อนไขนี้เป็นจริง ให้ทำสิ่งนี้
- ในขณะที่ สิ่งนี้เป็นจริง ให้ทำแบบนี้ให้เราหน่อย แต่ถ้าเงื่อไขนี้ไม่เป็นจริงก็ให้ออกจาก loop เลย จบบบบบ
- while loop  ต้องสร้างเงื่อนไขที่ออกจาก loop ด้วย ไม่งั้นจะกลายเป็น infinite loop ที่ออกจาก loop ไม่ได้
```r
## while loop 
while (condition) {
  ## do something
}
----
count <- 0

while (count <5) {
  print("I miss you so so much ") 
  count = count + 1 ## สำคัญมากต้องใส่เพื่อหยุด loop ถ้าไม่ใส่จะกลายเป็น infinite loop
  if (count == 5) {
    print("It's ok just be fine")
  }
}
```
```r
 count <- 0
 while (count < 5) {
   print("I still miss my ex")
   count = count + 1
   if (count == 5) {
     print("I move on already")
   }
 }
result:
[1] "I still miss my ex"
[1] "I still miss my ex"
[1] "I still miss my ex"
[1] "I still miss my ex"
[1] "I still miss my ex"
[1] "I move on already"
```
## 🎄 `readline ( )` # take input from a user
- ประกาศฟังก์ชัน **`readline( )`** แล้วรอรับ input from user :
- user input is character : จะเป็น text หรือข้อความเสมอ
```r
readline("what's your name: ")
readline("how are you today? ")

> readline("what's your name: ")
what's your name: sun
[1] "sun"
> 
> readline("how are you today? ")
how are you today? I'm fine
[1] "I'm fine"
```
```r
## Facebook Login(Page) Logic 
## Facebook Login(Page) Logic 
users <- c("emily", "jo", "mint")
pw <- 1234

----
## create function fb login

fb_login <- function() {
  print("Welcome to facebook!")
  username <- readline("Username: ")
  password <- readline("Password: ")
  if ((username %in% users) & (password == pw)) {
    print("Login successfully!")
  } else {
    print("Try again!")
  }
}

## !! %in% = คือ syntax พิเศษที่ช่วยเช็คว่าข้อมูลนี้อยู่ในนี้หรือเปล่า 
```
