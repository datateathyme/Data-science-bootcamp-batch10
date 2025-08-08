```r
library(tidyverse)
library(caret)
library(mlbench)

## load data
data("PimaIndiansDiabetes")
diabetes_df <- PimaIndiansDiabetes

## split data 70:30
set.seed(42)
n <- nrow(diabetes_df)
id <- sample(1:n, size = 0.7*n)
diabetes_train <- diabetes_df[id, ]
diabetes_test <- diabetes_df[-id, ]

## train elasticnet model
set.seed(42)
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

glmnet_model <- train(diabetes ~ ., 
                      data = diabetes_train, 
                      method = "glmnet", ## ridge/lasso regression
                      metric = "Accuracy",
                      trControl = ctrl)

## test model
p_test <- predict(glmnet_model, newdata = diabetes_test) 

## evaluate
accuracy <- mean(p_test == diabetes_test$diabetes)

```
