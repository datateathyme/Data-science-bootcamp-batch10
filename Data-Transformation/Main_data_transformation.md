# 💾 Main class: Data Transformation with `"dplyr"` 🌻
**📝 This section provides an overview of my foundational knowledge in data transformation using dplyr. It includes practical code examples and their outputs from the lessons learned.**
## 🔐 install.packages & load library
```r
## install.packages("tidyverse", "glue", "RSQLite")
## load library
library(tidyverse)
library(glue)
library(RSQLite)
```
## 🔐 `glue` > create string template
```r
## glue => create string template
name <- "sunsun"
age <- 25

glue("Hello my name is {name}, and I'm {age} year old.")

## result:
Hello my name is sunsun, and I'm 25 year old.
```
