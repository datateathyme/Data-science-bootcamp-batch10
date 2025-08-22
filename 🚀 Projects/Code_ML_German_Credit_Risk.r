## install and load required packages
## install.packages(c("caret", "C50", "tidyverse"))

library(caret)
library(C50)
library(tidyverse)

## load the GermanCredit dataset
data(GermanCredit)
df <- GermanCredit

## view the structure of the data
# head(df)
# str(df)
# glimpse(df)
tibble(df)


## get summary statistics
summary(df)

## check the distribution of the target variable 'Class'
# 'Good' = good credit risk, 'Bad' = bad credit risk.
table(df$Class)

## convert all character variables to factors
df <- df %>% 
  mutate_if(is.character, as.factor)

str(df)

## set seed for reproducibility
set.seed(42)

## split data training (80%) and testing set (20%)
n <- nrow(df)
id <- sample(1:n, size=0.8*n)
train_data <- df[id, ]
test_data <- df[-id, ]

## train model
# Train a C5.0 Decision Tree model
fit_C50 <- C5.0(Class ~ ., 
                data = train_data)
print(fit_C50)

# Train a Logistic Regression model for comparison
ctrl  <- trainControl(method = "cv", 
                      number = 10)

fit_glm <- train(Class ~ ., 
                 data = train_data, 
                 method = "glm", 
                 trControl = ctrl)

## make predictions on the test data using the C5.0 model
predictions_C50 <- predict(fit_C50, test_data)
conM_C50 <- confusionMatrix(predictions_C50, test_data$Class)

## make predictions and evaluate the Logistic Regression model
predictions_glm <- predict(fit_glm, test_data)
conM_glm <- confusionMatrix(predictions_glm, test_data$Class,
                            mode = "prec_recall")

## comparison train and test fit_glm
result <- cat("Accuracy_Train:", fit_glm$results$Accuracy,
                "\nAccuracy_Test:", 0.745)

