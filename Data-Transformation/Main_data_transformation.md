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
