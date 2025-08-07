# 💎 Essential Machine Learning ( ML ) for Data Analyst
## 🧵 simple pipeline to build ML models
![Image](https://github.com/user-attachments/assets/55ad786c-a782-4ac1-8399-2846d787f80e)
Source: Content designed and created by DataRockie

## 🧵 example mtcars model (lm, knn)
```r
## load library
library(tidyverse)
library(caret)

## load data
mtcars

## split data 70:30
set.seed(42)
n <- nrow(mtcars)
id <- sample(n, size= 0.7*n)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

## train a linear regression model
set.seed(42)
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_data,
                  method = "lm")

## train KNN (k-Nearest Neighbors) model
knn_model <- train(mpg ~ hp + wt + am, 
                   data = train_data, 
                   method = "knn")

## score 
p_test <- predict(lm_model, newdata = test_data)
p_test_knn <- predict(knn_model,  newdata = test_data)

## evaluate MAE, MSE, RMSE
error <- test_data$mpg - p_test
error_knn <- test_data$mpg - p_test_knn

mae <- mean(abs(error))
mae_knn <- mean(abs(error_knn))

mse <- mean(error**2)
mse_knn <- mean(error_knn**2)

rmse <- sqrt(mse)
rmse_knn <- sqrt(mse_knn)

## result list
result_lm <- list(MAE = mae, MSE = mse, RMSE = rmse)
print(result_lm)

result_knn <- list(MAE_knn = mae_knn,
                   MSE_knn = mse_knn, 
                   RMSE_knn = rmse_knn)
print(result_knn)
               
```
## k-fold cross validation
```r
## load library
library(tidyverse)
library(caret)
library(mlbench) ## training dataset for ML

## split data
split_data <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(1:n, size = 0.7*n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return(list(train=train_df, test=test_df))
}

prep_df <- split_data(mtcars)

## k-fold cross validation
set.seed(42)

ctrl <- trainControl(method = "boot",  ## Default: Bootstrapped
                     number = 25)

knn <- train(mpg ~ ., 
             data = prep_df$train, 
             method = "knn",
             metric = "MAE", 
             trControl = ctrl)

```
