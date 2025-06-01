## Let's use a simple logistic regression model 
linstall.packages("titanic")
install.packages("caret")
install.packages("tidyverse")

library(caret)
library(titanic)
library(tibble)

##  Load and Explore Dataset
data("titanic_train")
tibble(titanic_train)

## Drop NA (missing values)
titanic_train <- na.omit(titanic_train)
nrow(titanic_train)

## convert data type
titanic_train$Sex <- factor(titanic_train$Sex, 
                            levels = c("male", "female"), 
                            labels = c(0, 1))

## Check data after cleaned data and convert data
tibble(titanic_train)

## Split Data [train 70% : test 30%]
set.seed(42)
n <- nrow(titanic_train)
id <- sample(1:n, size=n*0.7) 
train_data <- titanic_train[id, ]
test_data <- titanic_train[-id, ]


## Train Model
model <- glm(Survived ~ Pclass + Sex + Age + SibSp, 
             data = train_data, family = "binomial")

p_train <- predict(model, type = "response")
train_data$pred <- ifelse(p_train >= 0.5, 1, 0) 

result_train <- train_data[, c("PassengerId", "Survived", "Pclass", "Sex", "Age", "SibSp", "pred")]
tibble(result_train)

## Score and Evaluate
p_test <- predict(model, newdata = test_data, type = "response")
test_data$pred <- ifelse(p_test >= 0.5, 1, 0)


## Create a confusion matrix 
conM_train <- confusionMatrix(table(train_data$pred, train_data$Survived,
                                    dnn = c("Predict", "Actual")),
                                    mode = "prec_recall")

conM_test <- confusionMatrix(table(test_data$pred, test_data$Survived, 
                                   dnn= c("Predict", "Actual")), 
                                   mode = "prec_recall") 

## Accuracy
accuracy_train <- 0.8136
accuracy_test <- 0.8

result <- paste("Accuracy_Train:", accuracy_train,
                "Accuracy_Test:", accuracy_test)

print(result)



