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
- vector เก็บข้อมูลได้หนึ่งประเภทเท่านั้น!
```r
## 1. vector

1:10
16:25

## sequence generation 
seq(from=1 , to =100 ,by=5) -- เริ่มที่เลข 1 ถึง 100 กระโดดทีละ 5

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
length(x)
dim(x) <- c(5,5)

matrix(1:25, ncol=5 , byrow=TRUE)
matrix(1:6, ncol=3)
matrix(1:6, ncol=3, nrow=2, byrow=T)

m1 <- matrix(1:25, ncol=5 , byrow=TRUE)
m2 <- matrix(1:6, ncol=3, nrow=2, byrow=T)

## element wise computation
m2 + 100
m2 * 4
```
### 🌻 3. list

```
## 3. list
my_name <- "Sunsun"
my_friends <- c("jan", "ink", "zue")
m1 <- matrix(1:25, ncol=5)
R_is_cool <- TRUE

my_list <- list(item1 = my_name,
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
