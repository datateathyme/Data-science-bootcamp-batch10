## Logistic Regrsssion

library(dplyr)
mtcars %>% head()

str(mtcars)

## convert am to factor
mtcars <- factor(mtcars$am,
                 levels = c(0,1),
                 labels = c("Auto", "Manual"))
class(mtcars$am)
summary(mtcars$am)
table(mtcars$am)

## Split Data
set.seed(42)
n <- nrow(mtcars)
id <- sample(1:n, size = n*0.7)
train_data <- mtcars[id, ]
test_data <-  mtcars[-id, ]

## train model
logit_model <- glm(am ~ mpg, data = train_data, family = "binomial")
p_train <- predict(logit_model, type = "response") ## probability
train_data$pred <- if_else(p_train >= 0.5, "Manual", "Auto")
train_data$am == train_data$pred ## actual == prediction
acc_train <- mean(train_data$am == train_data$pred) ## cal accuracy using mean

## test model
p_test <- predict(logit_model, newdata = test_data, type = "response") 
test_data$pred <- if_else(p_test >= 0.5, "Manual", "Auto")
test_data$am == test_data$pred ## actual == prediction
acc_test <- mean(test_data$am == test_data$pred)

## Print Result
cat("Accuracy Train:", acc_train,
    "\nAccuracy Test:", acc_test)
