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
nrow(diabetes_df)  ## count nrow
# -- ถ้าทั้งสองค่านี้เท่ากันแสดงว่า data ไม่มี missing value
result:
> sum(complete.cases(diabetes_df)) a
[1] 768
> nrow(diabetes_df) 
[1] 768
```
