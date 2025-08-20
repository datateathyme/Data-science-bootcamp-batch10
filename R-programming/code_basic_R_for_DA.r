## basic programming for data analyst
# 1. variable
# 2. data types
# 3. data structures
# 4. function
# 5. control flow

## [1] variable
income <- 35000
new_income <- 35000 * 1.2
expense <- 22000
saving <- new_income - expense
print(saving)

## remove variable
rm(income)
 
## [2] data types
## numeric, character, logical, date

my_pocket_money <- 150
my_age <- 25
my_name <- "sunsun"
movie_lover <- TRUE

today_date <- as.Date("2024-11-25") 

## check data type  
class(my_age)
class(my_name)
class(movie_lover) 
class(today_date)

## change data types
as.numeric("100")
as.numeric(TRUE)
as.numeric(FALSE)
as.character(555)
as.logical(1)
as.logical(0)

## [3] data structures
## 1. vector
## 2. matrix
## 3. list
## 4. dataframe

## [3.1] vector

friends <- c("William", "James", "Noah", "Emma", "Ava") 
ages <- c(25, 32, 28, 29, 30)  
marvel_lover <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 

length(friends)

## [3.2] matrix
## 2D vector

m1 <- matrix(1:4, ncol=2)

m2 <- matrix(5:8, ncol=2 ,byrow=TRUE)

my_vec <- 1:25
m3 <- matrix(my_vec, ncol=5)
m4 <- matrix(my_vec, ncol=5, byrow=TRUE) ## 1, 2, 3, 4, 5 

m1 + 100



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



## [3.4] data frame
id <- 1:5
friends <- c("William", "James", "Noah", "Emma", "Ava")

ages <- c(35, 32, 28, 29, 30)
own_a_dog <- c(T, T, F, F, F)

city <- c("BKK", "LON", "LON",
          "TOK", "TOK")
## data.frame
df <- data.frame(id, friends, ages, own_a_dog, city)

df2 <- data.frame(
  id = 6:7,
  friends = c("wick", "ky"),
  ages = c(25, 26),
  own_a_dog = c(T, T),
  city = c("Seoul", "Seoul")
)

full_df <- rbind(df, df2)
