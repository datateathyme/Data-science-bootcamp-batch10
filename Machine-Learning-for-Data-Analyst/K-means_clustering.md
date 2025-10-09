# 🌺 K-means clustering project using the Iris dataset in RStudio
## 1. Load the Iris Dataset
The Iris dataset is a built-in dataset in R, so it can be loaded directly
```r
## Load library
library(tidyverse)

## Load data
data(iris)
```
## 2. Data Preparation
เลือกตัวแปรสำหรับการจัดกลุ่ม K-means is an unsupervised learning algorithm จึงต้องลบคอลัมน์ Species (ซึ่งเป็นป้ายกำกับ/ผลลัพธ์ที่เราจะเปรียบเทียบ) ออกจากชุดข้อมูลที่เราจะใช้จัดกลุ่ม
```r
## Data Preparation
Species <- iris$Species
iris_data <- iris %>% select(-Species)
```
## 3. Determine the Optimal Number of Clusters (K)
