# 💾 Main class: Data Transformation with `"dplyr"` 🌻
**📝 This section provides an overview of my foundational knowledge in data transformation using dplyr. It includes practical code examples and their outputs from the lessons learned.**
## 🔐 install.packages & load library
```r
## install.packages("tidyverse", "glue", "RSQLite")
## load library
library(tidyverse)
library(glue)
library(RSQLite)
```
## 🔐 `glue` > create string template
```r
## glue => create string template
name <- "sunsun"
age <- 25

glue("Hello my name is {name}, and I'm {age} year old.")

## result:
Hello my name is sunsun, and I'm 25 year old.
```
## 🔐 connect sqlite database
```r
## connect sqlite database
## create connection
con <- dbConnect(SQLite(), "chinook.db")

## how many tables
dbListTables(con)

## check column names in a tables
dbListFields(con, "customers")

## get data from a table 
usa_customers <- dbGetQuery(con, "select 
           firstname,
           lastname, 
           country, 
           email
           from customers
           where country = 'USA'")

View(usa_customers)

summary(usa_customers)
nrow(usa_customers)
dim(usa_customers)
head(usa_customers)

## write table into a database 
branches <- data.frame(
  branch_id = 1:3 ,
  branch_name = c("BKK", "LON", "SEOUL")
)

dbWriteTable(con, "branches", branches) ## create new table
dbListTables(con) ## list table name

dbGetQuery(con, "select branch_name from branches")

## remove table
dbRemoveTable(con, "branches")

## disconnect database
dbDisconnect(con)
```
### 📩 create a new database
- [Homework: Create a new reataurant.db](https://github.com/datateathyme/Data-science-bootcamp-batch10/blob/main/Data-Transformation/Homework/create_a_new_restuarant.md)
```r
## create a new database 

con <- dbCanConnect(SQLite(), "school.db")

dbListTables(con)

dbWriteTable(con, "school", 
             data.frame(id=1:2, names=c("sun", "joe")))

dbGetQuery(con, "select names from students")

dbDisconnect(con)
```
## 🔐 read file into R
```r
## read file into R

## Split data: using commas
df1 <- read_csv("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_01.csv")

## Split data: using semicolons
df2 <- read_csv2("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_02.csv")

## Split data: using delim "|"
df3 <- read_delim("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_03.txt", delim = "|")

## Split data: using tsv (Tab-Separated Values)
df4 <- read_tsv("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_04.tsv")

## read excel file, sheet1
## install.packages("readxl")
library(readxl)

df5 <- read_excel("student_05.xlsx", sheet = 1)  ## upload file in working directory ก่อน
```
### 📩 list.file()
```
> list.files(pattern = "*.json")
[1] "blackpink.json"  "example_df.json"
[3] "my_profile.json"
```
### 📩 how to  read a json file into R
```r
## how to  read a json file into R
install.packages("jsonlite")
library(jsonlite)

my_profile <- fromJSON("my_profile.json")
```
```r
## read json as dataframe
temp <- fromJSON("example_df.json")
class(temp)

----
> class(temp)
[1] "data.frame"
```
# 🔐 data transformation 101
## 🔐 Core Function in dplyr
| **Function** | **What is does?** | 
|---|---|
| select() | เลือกคอลัมน์ | 
| filter() | ฟิลเตอร์ข้อมูลด้วยเงื่อนไข | 
| mutate() | สร้างคอลัมน์ใหม่ | 
| arrange() | เรียงข้อมูล | 
| summarise() | สรุปผลสถิติ | 
| group_by() | จับกลุ่มข้อมูล | 

```r
## data transformation 101
library(tidyverse) ## OR library(dplyr)

## Hadley Wickham
## 1. select column == SQL select
## 2. filter rows == SQL where
## 3. arrange == SQL order by
## 4. mutate (create new columns)
## 5. summarise == SQL aggregate function

## preview data
head(mtcars)

colnames(mtcars)
rownames(mtcars)

car_names <- rownames(mtcars)

## create new column
mtcars$model <- car_names

## remove rownames
rownames(mtcars) <- NULL
```
### 📩 how to select columns
```r
## how to select columns
select(mtcars, hp, wt, am) ## subset by name

select(mtcars, 1:5, 10) ## subset by position

select(mtcars, am, hp, 10) ## ## subset by name and position

select(mtcars, contains("a")) ## subset by condition
```
### 📩 data transformation pipeline
```r
## data transformation pipeline
mtcars %>%
  select(hp, wt, am)


mtcars %>%
  select(model, hp, wt, am) %>%
  filter(hp >= 200 & wt < 5 & am == "Auto")

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(hp >= 200 | hp <= 90) %>%
  arrange(desc(hp))

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(between (hp, 100, 180)) ## แรงม้า hp อยู่ระหว่าง 100 - 180

```
- [ ] **อยากได้รถยนต์ที่ชื่อขึ้นต้นด้วย M 🚗**
```r
> grep("^M.+", car_names)
 [1]  1  2  8  9 10 11 12 13 14 31

> id <- grep("^M.+", car_names)
> car_names[id]
 [1] "Mazda RX4"     "Mazda RX4 Wag" "Merc 240D"    
 [4] "Merc 230"      "Merc 280"      "Merc 280C"    
 [7] "Merc 450SE"    "Merc 450SL"    "Merc 450SLC"  
[10] "Maserati Bora"
```
```r
mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model))

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model) & hp >= 180)

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model)) %>%
  arrange(hp)

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model)) %>%
  arrange(-hp)  ## shortcut for descending order using -hp in column numeric

m_cars <- mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model)) %>%
  arrange(am, desc(hp))
``` 
### 📩 mutate
```r
hp_df <- mtcars %>% 
  filter(hp < 100) %>%
  select(model, am, hp) %>%
  ## create new column 
  mutate(am_label = ifelse(am == 0, "Auto", "Manual"),
         hp_scale = hp/100, 
         hp_double = hp*2)
```
### 📩 summarise
```r
## summarise
mtcars %>%
  summarise(mean_hp = mean(hp),
            sum_hp  = sum(hp),
            median_hp = median(hp), 
            sd_hp  = sd(hp), 
            n = n())

mtcars %>%
  filter(wt <= 5) %>%
  summarise(mean_hp = mean(hp),
            sum_hp  = sum(hp),
            median_hp = median(hp), 
            sd_hp  = sd(hp), 
            n = n())
```
```r
> mtcars %>%
+   summarise(mean_hp = mean(hp),
+             sum_hp  = sum(hp))
   mean_hp sum_hp
1 146.6875   4694
```
- เทียบเท่ากับการเขียน sqldf
```r
> sqldf("select avg(hp), sum(hp) from mtcars")
   avg(hp) sum(hp)
1 146.6875    4694
```
