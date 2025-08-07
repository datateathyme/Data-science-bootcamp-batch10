## optimization vs. machine learning (time)
- Optimization (การหาค่าที่เหมาะสมที่สุด) เป็นกระบวนการที่มุ่งหา "คำตอบที่ดีที่สุด" จากตัวเลือกทั้งหมดที่เป็นไปได้ โดยมีเป้าหมายที่ชัดเจน เช่น ต้องการลดต้นทุนให้ต่ำที่สุด หรือเพิ่มกำไรให้สูงที่สุด 
- Machine Learning (การเรียนรู้ของเครื่อง) เป็นกระบวนการที่มุ่ง "เรียนรู้จากข้อมูล" ในอดีตเพื่อ "คาดการณ์" หรือ "จำแนก" สิ่งที่จะเกิดขึ้นในอนาคต โดยไม่ได้ถูกโปรแกรมมาอย่างชัดเจน แต่เรียนรู้จากแพทเทิร์นในข้อมูล
```r
## racap ML for DA part 1 
library(tidyverse)
library(caret)
library(mlbench) ## training dataset for ML problem 

## recap ML workflow (simple)
## 1. split data 
## 2. train data
## 3. score (predict test data)
## 4. evaluate model (train error vs. test error)

## the biggest problem = overfitting
## optimization (focus now) vs. machine learning (time: focus prediction future)


## split data with own function
split_data <- function(data) {
  set.seed(42)
  n <- nrow(data)
  id <- sample(1:n, size = 0.7*n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return( list (train=train_df, test=test_df) )
}

## prep data
prep_df <- split_data(mtcars)


## k-fold cross validation
## tuning model setting 

set.seed(42)

grid_k <- data.frame(k = c(3,5)) # tune manual


ctrl <- trainControl(method = "CV", # k-fold cross validation
                    number = 5,     # k
                    verboseIter = TRUE)  # print result

## repeated k-fold cv
set.seed(42)
ctrl <- trainControl(method = "repeatedcv", 
                     number = 5, # k
                     repeats = 5, 
                     verboseIter = TRUE)  

knn <- train(mpg ~ . ,
             data = prep_df$train,
             method = "knn",
             metric = "MAE",
             trControl = ctrl,
             ## ask program to random K Auto tune 
             tuneLength = 3) # a number of K values

knn <- train(mpg ~ . ,
             data = prep_df$train,
             method = "knn",
             metric = "MAE",
             trControl = ctrl,
             tuneGrid= grid_k)

## break down ------------ ## 

set.seed(42)

ctrl <- trainControl(method = "boot",
                     number = 10)

knn <- train(mpg ~ . ,
             data = prep_df$train,
             method = "knn",
             metric = "MAE",
             trControl = ctrl)

## break down ------------ ## 

set.seed(42)

ctrl <- trainControl(method = "LOOCV")

knn <- train(mpg ~ . ,
             data = prep_df$train,
             method = "knn",
             metric = "MAE",
             trControl = ctrl)

## break down ------------ ## 

knn <- train(mpg ~ . ,
             data = prep_df$train,
             method = "knn")


set.seed(42)
knn <- train(mpg ~ . ,
             data = prep_df$train,
             method = "knn",
             metric = "RMSE")


set.seed(42)
knn <- train(mpg ~ . ,
             data = prep_df$train,
             method = "knn",
             metric = "MAE")

## ----------------------------------------------------------

## ----------------------------------------------------------
## classification problem 

data("PimaIndiansDiabetes")

diabetes_df <- PimaIndiansDiabetes
diabetes_df <- tibble(diabetes_df)

diabetes_df %>%
  select(age, diabetes) %>%
  group_by(diabetes) %>%
  summarise(avg_age = mean(age, na.rm=TRUE),
            median_age = median(age))

## check / inspect data
sum(complete.cases(diabetes_df))
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
p2 <- predict(logit_model, newdata = diabetes_df, type = "prob")

p2 <- ifelse(p2$pos >= 0.07, "pos", "neg")

t1 <- table(p1, diabetes_df$diabetes, dnn = c("Predict", "Actual"))
t2 <- table(p2, diabetes_df$diabetes, dnn = c("predict", "Actual"))





## Accuracy
(445+157) / nrow(diabetes_df)

## Precision
prec <- 157 / (55+157)

## Recall
recall <- 157 / (111+157)

## F1 score
F1 <- 2 * ((prec*recall)/ (prec+recall))

## But in `caret` have function confusion matrix
confusionMatrix(p1, diabetes_df$diabetes, 
                positive = "pos",
                mode = "prec_recall")

## regression => high bias
## data change => model doesn't change that much 


## save model .RDS
saveRDS(logit_model, "logistic_reg.RDS")


## Let's say this is friend's computer
model <- readRDS("logistic_reg.RDS")

## ----------------------------------------------------------

## ----------------------------------------------------------

## decision tree model
set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5)

tree_model <- train(diabetes ~ . - triceps,
                     data = diabetes_df,
                     method = "rpart", ## dicision tree
                     trControl = ctrl)

## plot tree
library(rpart.plot)
rpart.plot(tree_model$finalModel)

forest_model <- train(diabetes ~ . - triceps,
                    data = diabetes_df,
                    method = "rf", ## random forests
                    trControl = ctrl)


glmnet_model <- train(diabetes ~ . - triceps,
                    data = diabetes_df,
                    method = "glmnet", ## ridge/lasso regression 
                    trControl = ctrl,
                    tuneGrid = expand.grid(
                      alpha = c(0,1),
                      lambda = c(0.01, 0.10)
                    ))


## train model for the future
## future == test data
```
