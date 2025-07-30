# 💾 Data Transformation with `"dplyr"` 🌻
**📝 This section provides an overview of my foundational knowledge in data transformation using dplyr. It includes practical code examples and their outputs from the lessons learned.**
## 🍫 Data Transformation 
📝 การทำ Data Transformation with dplyr คือการที่เราเปลี่ยนรูปหน้าตาของข้อมูล (original data) ให้เป็นไปตามที่เราต้องการ ไม่ว่าจะเป็นการ สร้างหรือเพิ่ม columns หรือ rows ใหม่เข้าไปในข้อมูล การเรียงลำดับ (sort) ข้อมูล หรือการ กรองข้อมูล (filter) เพื่อเลือกเฉพาะส่วนที่เราสนใจ ทุกอย่างนี้สามารถทำได้โดยใช้ภาษา R และแพ็กเกจ dplyr
## 🛠 install.packages("dplyr") 
```r
## Core Packages ที่ R Programer ทุกคนต้องเขียนได้คือ "dplyr" อ่านว่า ดี - พาย - อาร์

## Install Packages
## install new package in RStudio
install.packages("dplyr")    --> Package นี้ติดตั้งแค่ครั้งเดียว เปิดโปรแกรมแล้วรันคำสั่ง

## load library
library(dplyr)    --> run ทุกครั้งที่เปิดโปรแกรมใช้งานขึ้นมาใหม่

```
## 🔐 Core Function in dplyr
| **Function** | **What is does?** | 
|---|---|
| select() | เลือกคอลัมน์ | 
| filter() | ฟิลเตอร์ข้อมูลด้วยเงื่อนไข | 
| mutate() | สร้างคอลัมน์ใหม่ | 
| arrange() | เรียงข้อมูล | 
| summarise() | สรุปผลสถิติ | 
| group_by() | จับกลุ่มข้อมูล | 

## 🔐 Load data 
### 📩 read csv file 'imdb.csv' into R studio
```r
## read csv file 'imdb.csv' into R studio
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE) ## คอลัมน์ที่เป็นตัวอักษรไม่เปลี่ยนเป็น factor เก็บไว้เป็นตัวอักษรเหมือนเดิม
View(imdb) 
```
## 🔐 Review data structure
```r
## review data structure
glimpse(imdb)

----
result:
Rows: 100
Columns: 7
$ NO         <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, …
$ MOVIE_NAME <chr> "The Shawshank Redemption",…
$ YEAR       <int> 1994, 1972, 2008, 1974, 200…
$ RATING     <chr> "R", "R", "PG-13", "R", "PG…
$ LENGTH     <int> 142, 175, 152, 202, 201, 15…
$ GENRE      <chr> "Drama", "Crime, Drama", "A…
$ SCORE      <dbl> 9.3, 9.2, 9.0, 9.0, 8.9, 8.…

```
```r
## print head and tail of data
head(imdb)    --> head จะ print 6 แถวแรกของ dataframe ออกมาดู

## print head and tail of data
head(imdb, 10 )    --> ถ้าจะ print 10 แถวแรกให้ใส่เลข 10 เข้าไป

## print head and tail of data
head(imdb, 10)
tail(imdb)   --> tail print 6 แถวล่างสุด

## ดูจำนวนแถวและคอลัมน์
nrow(imdb)
ncol(imdb)

## เรียกดูชื่อคอลัมน์
names(imdb)
```
## 🔐 Select Columns
### 📩 Pipe Operator
- `dplyr` มาพร้อมกับ pipe operator `%>%` ที่ใช้ในการเขียน pipeline (ตามชื่อของมันเลย) ตัวอย่าง code ด้านล่างทั้งสองแบบได้ผลลัพธ์เหมือนกัน
```r
## select columns
select(mtcars, mpg, wt, hp)

## select columns
mtcars %>% select(mpg, wt, hp)

## การเขียน %>% เชื่อมหลายฟังก์ชันเข้าด้วยกัน
df %>% select() %>% filter() %>% mutate() %>% arrange()
```
```r
## select columns
select(imdb, MOVIE_NAME, RATING ) ## select from column name
select(imdb, 1, 5)  ## select from column index
 
```
### 📩 Rename column
```r
## rename column name
select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)

select(imdb, movie_name = MOVIE_NAME,  ## >> เปลี่ยนชื่อคอลัมน์ ใส่ชื่อใหม่ = ชื่อเก่า
             released_year = YEAR)
```
```r
## เปลี่ยนชื่อให้เป็นตัวพิมพ์เล็กทั้งหมด tolower
names(imdb) <- tolower(names(imdb))
```
### 📩 Ex. Pipe Operator `%>% Select data`
```r
## pipe operator
head(imdb)

imdb %>% 
  select( movie_name = MOVIE_NAME, released_year = YEAR) %>% 
  head(10)
```
### 📩 Ex. Pipe Operator `%>% Filter data`
```r
## filter data 
filter(imdb, SCORE >= 9.0)

imdb %>% filter(SCORE >= 9.0)

imdb %>% 
  select(movie_name, year, score) %>%
  filter(score >= 9)

result:
               movie_name year score
1 The Shawshank Redemption 1994   9.3
2            The Godfather 1972   9.2
3          The Dark Knight 2008   9.0
4   The Godfather: Part II 1974   9.0
```
```r
## filter with & (and) , | (or)

imdb %>% 
  select(movie_name, year, score) %>%
  filter(score >= 9 & year > 2000)

imdb %>%
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9.0)

## หรือเขียน or โดยใช้ %in% ได้ผลลัพธ์เหมือนด้านบน
imdb %>%
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

```
```r
## filter string columns
imdb %>%
  select(movie_name, genre, rating) %>%
  filter(rating == "R")


imdb %>%
  select(movie_name, genre, rating) %>%
  filter(genre == "Drama")

imdb %>%
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))  ## grepl หา Drama โดยไม่สนใจว่า Drama อยู่ในตำแหน่งไหน

imdb %>%
  select(movie_name) %>%
  filter(grepl("The", imdb$movie_name))
```
### 📩 Ex. Pipe Operator `%>% mutate` # create new column
```r
## create new column

imdb %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"))

imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Film", "Short Film"))


imdb %>%
  select(movie_name, score) %>%
  mutate(score_update = score + 0.1) %>%
  head(10)
```
### 📩 Ex. Pipe Operator `%>% arrange` # sort data
```r
## arrange data 
head(imdb)

imdb %>%
  arrange(length) %>%  ## ascending order
  head(10)

imdb %>%
  arrange(desc(length)) %>%   ## descending order
  head(10)

## sort 2 column
imdb %>%
  arrange(rating, desc(length))
```
### 📩 Ex. Pipe Operator `%>% summarise & group by` # summary statistics
```r
## summarise 
imdb %>%
  summarise(mean_length = mean(length),
            sum_length  = sum(length),
            sd_length   = sd(length),
            min_length  = min(length),
            max_length  = max(length),
            n           = n())

## summarise and group by
imdb %>%
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sum_length  = sum(length),
            sd_length   = sd(length),
            min_length  = min(length),
            max_length  = max(length),
            n           = n())

## summarise and group by and filter null
imdb %>%
  filter(rating != "") %>%  ## filter rating ไม่เท่ากับ ค่าว่าง (null)
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sum_length  = sum(length),
            sd_length   = sd(length),
            min_length  = min(length),
            max_length  = max(length),
            n           = n())
```
## 🔐 Join Tables
```r
## join data
favorite_films <- data.frame(id = c(5, 10, 25, 30, 98))

favorite_films %>%
  inner_join(imdb, by = c("id" = "no")) ## by = join ด้วย c("id" = "no")
```
## 🔐 write CSV file (export result)
```r
## write CSV file (export result)
imdb_prep <- imdb %>%
  select(movie_name, year, rating, length, score) %>%
  filter(rating == "R" & year > 2000)

## export file
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)
```
## 🔐 data.fram vs. tibble
- ผลลัพธ์เหมือนกัน แต่การแสดงผล tibble จะอ่านง่ายกว่า data.frame
```r
## install.packages("tidyverse")
# dplyr tidyr ggplot2
library(tidyverse)

# data.frame vs. tibble
df_tibble <- tibble(id = 1:3, name = c("bobby", "jisoo", "lisa"))
df <- data.frame(id = 1:3, name = c("bobby", "jisoo", "lisa"))

## convert data.frame to tibble
mtcars
mtcars_tibble <- tibble(mtcars)
```
