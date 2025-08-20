## create our first model with caret
install.packages("caret")
library(caret)

data("mtcars")
head(mtcars)

set.seed(42)
n <- nrow(mtcars) # นับจำนวนแถวใน Dataframe
id <- sample(n, size = 0.8 * n)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

## create function and split data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data) 
  id <- sample(n, size = 0.8 * n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

## train model
lm_model <- train(mpg ~ hp, 
      data = split_data[[1]],
      method = "lm")

## score and evaluate
p <- predict(lm_model, newdata = split_data[[2]])

error <- split_data[[2]]$mpg - p
rmse <- sqrt(mean(error **2))


# rmse: train and test
cat("Train: ", lm_model$results[[2]], "\nTest: ", rmse)


## Classification model
library(caret)

data("mtcars")

## prepare data
mtcars$am <- factor(mtcars$am, 
                    levels= c(0, 1),
                    labels = c("Auto", "Manual"))

## split data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data) 
  id <- sample(n, size = 0.7 * n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

## train model
glm_model <- train(am ~ mpg, 
                  data = split_data[[1]],
                  method = "glm")

## score and evaluate
p <- predict(glm_model, newdata = split_data[[2]])

acc <- mean( p == split_data[[2]]$am)

# result
acc_train <- 0.8
acc_test <- 0.6

# Accuracy: train and test
cat("Accuracy Train: ", acc_train, "\nAccuracy Test: ", acc_test)
