## Recap basic programming 
## 1. variable x<-100
## 2. data types
## 3. data structure: vector, list, matrix, df
## 4. function 
## 5. control flow: if for while

## create your own function

print("hello world")

greeting <- function() {
  print("hello world")
}

greeting_name <- function(name) {
  text <- paste0("Hello! ", name)
  print(text)
}

## simple function 
add_two_num <- function(x,y) {
  return(x + y)
}

add_two_num <- function(x,y, ....) {
  return(x + y)
}


## simple function 
## default argument
add_two_num <- function(x=10,y=20) {
  return(x + y)
}

cube <- function(base, power=3) {
  return(base ** power)
}

cube <- function(base, power=3) base**power

## function calls another function(s)
hi1 <- function() print("hi")
hi2 <- function() print("hi hi!")
hi3 <- function() print("hello!")

all_hi <- function() {
  hi1()
  hi2()
  hi3()
}


## control flow
## if for while 

ifelse(10>2, T,F)

score = 180 ## 240

if (score >= 200) {
  print("passed")
} else{
  print("failed")
}

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
  
## create function 

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
nums <- c(25, 30, 40, 100, 1225)

## 1:10 %% 2 == 0 
for (i in nums ) {
  if (i %% 2 == 0) {
    print(paste0(i, ": two number"))
  } else {
    print(paste0(i, ": odd number"))
  }
}

## while loop 
while (condition) {
  ## do something
}

count <- 0

while (count <5) {
  print("I miss you so so much ") 
  count = count + 1
  if (count == 5) {
    print("It's ok just be fine")
  }
} 

## take input from a user
## user input is character
user_name <- readline("what is your name: ")

print(user_name)
user_pw <- readline("your password: ")


## Facebook Login(Page) Logic 
users <- c("sun", "jo", "minnie")
pw <- 1234


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
