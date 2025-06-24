## Recap basic programming
## 1. variable : x <- 100
## 2. data types : num , character , logical, datetime
## 3. data structure : vector, list, matrix, df
## 4. function ✅
## 5. control flow : if for while [loop] ✅

## create your own function 

print("hello world!")

greeting <- function() {
  print("Hello world!")
}

greeting_name <- function(name) {
  text <- paste0("Hello! :", name)
  print(text)
}


greeting_name2 <- function(name) {
  print(paste("Hello :", name))
}

## simple function
add_two_num <- function(x, y) {
  return( x + y)
}

# create function with default argument 
add_two_num2 <- function(x=10, y=20) {
  return( x + y)
}


cube2 <- function(base, power) {
  return(base ** power)
}

# set default argument 
cube3 <- function(base, power=3) {
  return(base ** power)
}

cube3 <- function(base, power=3) base**power

## function calls another function(s) 
hi1 <- function() print("hi")
hi2 <- function() print("hi hi!")
hi3 <- function() print("hello!! ")

all_hi <- function() {
  hi1()
  hi2()
  hi3()
}

## control flow
## if for while

ifelse(10 > 2, T, F)
ifelse("hi" == "Hi", T, F)


## IFS() in google sheets
score <- 85

if (score >= 80) {
  print("A")
} else if (score >= 70) {
  print("B")
} else if (score >= 60) {
  print("C")
} else if (score >= 50) {
  print("D")
} else {
  print("Failed")
}

## create function grading
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

## for loop 
## vectorization 


for (i in 1:10) {
  print(i)
}

for (i in 1:10) {
  print(i * 2)
}

for (i in 1:10) {
  if (i %% 2 == 0) {
    print("even number")
  } else {
    print("odd number")
  }
}

for (i in 1:10) {
  if (i %% 2 == 0) {
    print(paste0(i, ": even number"))
  } else {
    print(paste0(i, ": odd number"))
  }
}

## We can declare variables outside of a function

nums <- c(25, 30, 40, 100, 1225)

for (i in nums) {
  if (i %% 2 == 0) {
    print(paste0(i, ": even number"))
  } else {
    print(paste0(i, ": odd number"))
  }
}

ifelse(nums %% 2 == 0,"even", "odd")


## while loop 
while (condition) {
  ## do someting 
}

count <- 0

while (count < 5) {
  print("I still miss my ex")
  count = count + 1
  if (count == 5) {
    print("I move on already")
  }
}

## take input from a user
## user input is character

user_name <- readline("what's your name: ")

print(user_name)

user_pw <- readline("your password: ")

## design Facebook Login Logic

users <- c("toy", "john", "marry")
pw <- 1234

fb_login <- function() {
  print("Welcome to facebook!")
  username <- readline("Username: ")
  password <- readline("Password: ")
  if ((username %in% users) & (password == pw)) {
    print("Log in successfully!")
  } else {
    print("Try again!")
  }
}

## homework
## 1. create chatbot order pizza
pizza <- function() {
  print("Hello welcome to pizzaria restaurant!")
  ## present menu to a user
  ## let them choose a menu
  ## let then choose a drink
  ## bonus - check bill
}

## create game pao ying chub -- 10 round
play_game <- function() {
  games <- 0
  while (games < 10) {
    ## pao ying chub
    print("let' play a game")
    games = games + 1
  }
}

## let's say random hand
hands <- c("hammer", "scissor", "paper")
sample(hands,1)

## let's say random balls
balls <- c("red", "green", "blue", "gold")

sample(balls,1)

## load library
library(tidyverse)
library(glue)
library(RSQLite)

## library glue => create to string template
name <- "toy"
age <- 35

glue("Hello my name is {name}, ans I'm {age} year old.")

## library RSQLite
## connect sqlite database 
## create connection
con <- dbConnect(SQLite(), "chinook.db")

## see how many tables in database 
dbListTables(con)

## check column name in a table
dbListFields(con, "customers")

## get data from a table
usa_customers <- dbGetQuery(con, 
          "SELECT 
            firstname,
            lastname,
            country,
            email
           FROM customers
           WHERE country = 'USA'
           ")

dbListTables(con)

## write table into a database 
## (create new tables into database)
branches <- data.frame(
  branch_id = 1:3,
  branch_name = c("BKK", "LON", "SEOUL")
)

dbWriteTable(con, "branches", branches)

## remove table in database
dbRemoveTable(con, "branches")

## dbDisconnect() -- Closed connection can't query
dbDisconnect(con)

## create a new database .db
## homework 03 - create a new restuarant.db 

con <- dbConnect(SQLite(), "school.db")

dbListTables(con)

dbWriteTable(con, "students",
             data.frame(id = 1:2,
                        names = c("toy", "joe")))
dbListTables(con)

dbGetQuery(con, "select names from students")

dbDisconnect(con)
