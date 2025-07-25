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
## 🍁 compare values 
```r
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
### main functions
- [ ] as.numeric()
- [ ] as.character()
- [ ] as.logical()
```r
## as.numeric()
## as.character()
## as.logical()

x <- 100
class(x)

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
