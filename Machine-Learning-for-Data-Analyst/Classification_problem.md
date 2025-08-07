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

diabetes_df %>%
  select(age, diabetes) %>%
  group_by(diabetes) %>%
  summarise(avg_age = mean(age, na.rm=TRUE),
            median_age = median(age))
```
