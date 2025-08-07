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

```
```r
## save model .RDS
saveRDS(logit_model, "logistic_reg.RDS")

## Let's say this is friend's computer
model <- readRDS("logistic_reg.RDS")
```
