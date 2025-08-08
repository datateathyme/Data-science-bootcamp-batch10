# 🔏 Classification problem 
```r
## classification problem
## load library
library(tidyverse)
library(caret)
library(mlbench)

## load data
data("PimaIndiansDiabetes")

diabetes_df <- PimaIndiansDiabetes
diabetes_df <- tibble(diabetes_df)

## expore data สำรวจไวๆว่าอายุมีผลหรือไม่
diabetes_df %>%
  select(age, diabetes) %>%
  group_by(diabetes) %>%
  summarise(avg_age = mean(age, na.rm=TRUE),
            median_age = median(age))

## check / inspect data
## check missing value 
sum(complete.cases(diabetes_df)) ## count complete data
mean(complete.cases(diabetes_df)) == 1 ## ถ้า TRUE ข้อมูลสมบูรณ์
nrow(diabetes_df)  ## count nrow
# -- ถ้าทั้งสองค่านี้เท่ากันแสดงว่า data ไม่มี missing value
result:
> sum(complete.cases(diabetes_df)) a
[1] 768
> nrow(diabetes_df) 
[1] 768
```
```r
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
```
```r
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

result:
        Actual
Predict neg pos
    neg 445 111
    pos  55 157

## Accuracy
(445+157) / nrow(diabetes_df)
result: [1] 0.7838542

## Precision
prec <- 157 / (55+157)
result: [1] 0.740566

## Recall
recall <- 157 / (111+157)
result: [1] 0.5858209

## F1 score
F1 <- 2 * ((prec*recall)/ (prec+recall))
result: [1] 0.6541667
## ----------------------------------------------
## But in `caret` have function confusion matrix
confusionMatrix(p1, diabetes_df$diabetes, 
                positive = "pos",
                mode = "prec_recall")

## result:
Confusion Matrix and Statistics

          Reference
Prediction neg pos
       neg 445 111
       pos  55 157
                                         
               Accuracy : 0.7839         
                 95% CI : (0.753, 0.8125)
    No Information Rate : 0.651          
    P-Value [Acc > NIR] : 7.051e-16      
                                         
                  Kappa : 0.5001         
                                         
 Mcnemar's Test P-Value : 1.965e-05      
                                         
              Precision : 0.7406         
                 Recall : 0.5858         
                     F1 : 0.6542         
             Prevalence : 0.3490         
         Detection Rate : 0.2044         
   Detection Prevalence : 0.2760         
      Balanced Accuracy : 0.7379         
                                         
       'Positive' Class : pos      
```
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
```r
## save model .RDS
saveRDS(logit_model, "logistic_reg.RDS")

## Let's say this is friend's computer
model <- readRDS("logistic_reg.RDS")
```
