## Logistic Regression Example
## Divorse 
happiness <- c(10, 8, 9, 7, 8, 5, 9, 6, 8, 7, 1, 1, 3, 1, 4, 5, 6, 3, 2, 0)

divorce <- c(rep(0,10), rep(1, 10))

df <- data.frame(happiness, divorce)

## Fit Logistic Regress Full Dataset
model <- glm(divorce ~ happiness, data = df, family = "binomial")

summary(model)

## Predict and Evaluate Model
df$prob_divorce <- predict(model, type = "response")
df$pred_divorce <- ifelse(df$prob_divorce >= 0.5, 1,0)
print(df)

## Confusion Matrix
conM <- table(df$pred_divorce, df$divorce, 
      dnn = c("Predicted", "Actual"))

## Model Evaluation
cat("Accuracy:", (conM[2,2] + conM[1,1]) / sum(conM))
cat("Precission:", conM[2,2] / (conM[2,2] + conM[2,1]))
cat("Recall:", conM[2,2]  / (conM[2,2] + conM[1,2]))
cat("F1:", 2 * ((0.9 * 0.9) / (0.9 + 0.9)))
