## control flow

## if
## =IF() in google sheets

score <- 95

if(score >= 90) {
  print("Passed")
} else {
  print("Failed")
}

## multiple if else
if (score >= 90) {
  print("Passed")
} else if (score >= 50) {
  print("OK")
} else {
  print("Enroll again !!")
}

## for loop
friends <- c("boy", "john", "mary", "anna")

for (friend in friends) {
  print( paste("Hi! ", friend) )
}

for (friend in friends) {
  print(friend)
}

## vectorization

paste("Hi!", friends)

nums <- c(5, 10, 12, 20, 25)
nums + 2
nums <- nums + 2

for (num in nums) {
  print(num - 2)
}

(nums <- nums - 2)

## while loop
count <- 0

while (count < 5) {
  print("Hi!")
  count <- count + 1
} 

## function
## input -> f() -> output

x <- c(10, 25 ,50 ,100)

sum(x)
mean(x)
median(x)
sd(x)

## create our first function 

greeting <- function() {
  print("Hello world!!")
}

greeting_name <- function(name) {
  print( paste ("Hello!", name))
}

func <- function() {
  greeting()
  greeting_name("May")
}

## parameter & default argument

greeting_name <- function(name = "Sun") {
  print( paste ("Hello!", name))
}

greeting_name <- function(name = "Sun", age = 25) {
  print( paste ("Hello!", name))
  print( paste ("Age:", age))
}

## Function Kata -- Practice x3

## add_two_nums 

add_two_nums <- function(val1, val2) {
  return(val1 + val2)
}

## cube () function 

cube <- function(base,power=3) {
  return(base ** power)
}

## count_ball() function

balls <- c("red", "red", "blue", "green", 
           "green", "green","green", "red")

# create function count balls
count_ball <- function(balls, color) {
  sum(balls == color)
}

## loop over a dataframe
data()

nrow(USArrests)
ncol(USArrests)
head(USArrests)

for (i in 1:ncol(USArrests)) {
  print(i)
}

for (i in 1:ncol(USArrests)) {
  print( names(USArrests) [i] )
  print( mean(USArrests[[i]]) )
}

## create function cal mean by column
cal_mean_by_col <- function(df) {
  for (i in 1:ncol(df)) {
    print( names(df) [i] )
    print( mean(df[[i]]) )
  }
}



## apply function 
apply(mtcars, MARGIN=2, mean) ## by column
apply(mtcars, MARGIN=1, mean) ## by row

avg_by_row_mtcars <- apply(mtcars, MARGIN=1, mean)

sum_by_col_mtcars <- apply(mtcars, MARGIN=2, sum)
