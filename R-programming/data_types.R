## Data Types

## 1. numeric
age <- 32
print(age)
class(age)  ## check data type

## 2. character
my_name <- "sun"
my_university <- 'Rangsit University'
print(my_name)
print(my_university)
class(my_name); class(my_university)

## 3. logical
result <- 1 + 1 == 2
print(result)
class(result)

## 4. factor
animal <- c("Dog", "Cat", "Cat", "Hippo")
class(animal)

animal <- factor(animal) 
class(animal)

## 5. date
time_now <- Sys.time()
class(time_now)
