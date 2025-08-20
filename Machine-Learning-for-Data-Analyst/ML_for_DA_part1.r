install.packages("tiduverse")
install.packages("caret")
install.packages("mlbench")

library(tidyverse)
library(caret)
library(mlbench)

## load data
mtcars

## split data 70:30
set.seed(42)
n <- nrow(mtcars) ## 32 rows
id <- sample(1:n, size=0.7*n)
train_df <- mtcars[id, ]
test_df <- mtcars[-id, ]

## train a linear regression model
set.seed(42)
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "lm")

## train knn model 
knn_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "knn")



## score
p_test <- predict(lm_model, newdata = test_df)
p_test_knn <- predict(knn_model, newdata = test_df)

## evaluate MAE, MSE, RMSE
error <- test_df$mpg - p_test ## actual - prediction
error_knn <- test_df$mpg - p_test_knn 

mae <- mean(abs(error)) 
mae_knn <- mean(abs(error_knn))

mse <- mean(error**2)
rmse <- sqrt(mse)

list_test <- list(mae_test, mse, rmse)

list_test <- list(MAE = mae_test, MSE = mse, RMSE = rmse)
