library(tidyverse)
library(caret) ## classification and regression tree

## k-fold cross validation
## mpg = f(hp, wt)
model <- train(mpg ~ hp + wt,
      data = mtcars,
      method = "lm")

model_knn <- train(mpg ~ hp + wt,
               data = mtcars,
               method = "knn")


## full loop k-fold cv
## 1. split data
## 2. training (with k-fold)
## 3. score
## 4. evaluate

## load library
library(tidyverse)
library(caret)
library(mlbench)

## 0. load data 
data("BostonHousing")

## 1. split data
df <- BostonHousing
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size= 0.8*n)
train_data <- df[id, ]
test_data <- df[-id, ]

## 2. training (with k-fold)
set.seed(42)

## k-fold cross validation 
train_ctrl <- trainControl(method = "cv",
                           number = 5)

knn_model <- train(medv ~ crim + indus + rm + b,
                   data = train_data, 
                   method = "knn",
                   metric = "RMSE",
                   trControl = train_ctrl)


## 3. score
pred_medv <- predict(knn_model, 
                     newdata = test_data)

## 4. evaluate
error <- pred_medv - test_data$medv
test_rmse <- sqrt(mean(error ** 2))
