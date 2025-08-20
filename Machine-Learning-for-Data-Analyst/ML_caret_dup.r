## install and load library
install.packages("caret")
library(caret)

mtcars

# split Data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.8*n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

# train model
lm_model <- train(mpg ~ hp , 
      data= split_data[[1]],
      method = "lm")

# score and evaluate
p <- predict(lm_model, newdata = split_data[[2]])

error <- split_data[[2]]$mpg - p
rmse <- sqrt(mean(error**2))


### Train Classification Model
data("mtcars")

# prepare data 
mtcars$am <- factor(mtcars$am,
                      levels=c(0,1),
                      labels=c("Auto","Manual"))

# split Data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(n, size = 0.7*n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

# train model
glm_model <- train(am ~ mpg , #classification
                  data = split_data[[1]],
                  method = "glm")

# score and evaluate
p <- predict(glm_model, newdata = split_data[[2]])

acc <- mean(p == split_data[[2]]$am)


# load clean data
data("mtcars")

# prepare data
mtcars$am <- factor(mtcars$am, levels=c(0,1), labels=c("Auto", "Manual"))

# split data
split_data <- train_test_split(mtcars)

# train model
glm_model <- train(am ~ mpg, # classification 
                   data = split_data[[1]],
                   method = "glm")

# score and evaluate
p <- predict(glm_model, newdata=split_data[[2]])

acc <- mean(p == split_data[[2]]$am)

##------------------------------------------------##
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
##------------------------------------------##      

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

ctrl <- trainControl(method = "cv", 
                     number = 5) # k

knn <- train(mpg ~ ., 
             data = prep_df$train, 
             method = "knn",
             metric = "MAE", 
             trControl = ctrl)

## k-fold cross validation
## set hyperparameter tuning
set.seed(42)

grid_k <- data.frame(k = c(5, 7)) ## grid tuning

## repeated k-fold CV
ctrl <- trainControl(method = "repeatedcv", 
                     number = 5, # k
                     repeats = 5,
                     verboseIter = TRUE) # print result 

knn <- train(mpg ~ ., 
             data = prep_df$train, 
             method = "knn",
             metric = "MAE", 
             trControl = ctrl, 
             ## ask program to random k
             tuneLength = 3)
## -----------------------------------------------------
## classification problem
## load library
library(tidyverse)
library(caret)
library(mlbench)

## load data
data("PimaIndiansDiabetes")

diabetes_df <- PimaIndiansDiabetes
diabetes_df <- tibble(diabetes_df)

diabetes_df %>%
  select(age, diabetes) %>%
  group_by(diabetes) %>%
  summarise(avg_age = mean(age, na.rm=TRUE),
            median_age = median(age))

## check / inspect data
## check missing value 
sum(complete.cases(diabetes_df)) 
mean(complete.cases(diabetes_df)) == 1 
nrow(diabetes_df)  

## glimpse
glimpse(diabetes_df)

## logistic regression method = "glm" model
set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5)

logit_model <- train(diabetes ~ . - triceps,
                     data = diabetes_df,
                     method = "glm",
                     trControl = ctrl)

## final model
## parametric model == regression  
logit_model$finalModel

## variable importance
varImp(logit_model)

## confusion matrix
p1 <- predict(logit_model, newdata = diabetes_df)

t1 <- table(p1, diabetes_df$diabetes, dnn = c("Predict", "Actual"))

(445+157) / nrow(diabetes_df)
prec <- 157 / (55+157)
(recall <- 157 / (111+157))
F1 <- 2 * ((prec*recall)/ (prec+recall))

confusionMatrix(p1, diabetes_df$diabetes, 
                positive = "pos",
                mode = "prec_recall")


## ------------------------------------------------------
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
                      method = "glmnet", 
                      metric = "Accuracy",
                      trControl = ctrl)

## test model
p_test <- predict(glmnet_model, newdata = diabetes_test) 

## evaluate
accuracy <- mean(p_test == diabetes_test$diabetes)
