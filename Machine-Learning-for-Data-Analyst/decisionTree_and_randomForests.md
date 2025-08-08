```r
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
```
