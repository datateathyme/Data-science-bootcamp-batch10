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
## 🔐 connect sqlite database
```r
## connect sqlite database
## create connection
con <- dbConnect(SQLite(), "chinook.db")

## how many tables
dbListTables(con)

## check column names in a tables
dbListFields(con, "customers")

## get data from a table 
usa_customers <- dbGetQuery(con, "select 
           firstname,
           lastname, 
           country, 
           email
           from customers
           where country = 'USA'")

View(usa_customers)

summary(usa_customers)
nrow(usa_customers)
dim(usa_customers)
head(usa_customers)

## write table into a database 
branches <- data.frame(
  branch_id = 1:3 ,
  branch_name = c("BKK", "LON", "SEOUL")
)

dbWriteTable(con, "branches", branches) ## create new table
dbListTables(con) ## list table name

dbGetQuery(con, "select branch_name from branches")

## remove table
dbRemoveTable(con, "branches")

## disconnect database
dbDisconnect(con)
```
### 📩 create a new database
- [Homework: Create a new reataurant.db](https://github.com/datateathyme/Data-science-bootcamp-batch10/blob/main/Data-Transformation/Homework/create_a_new_restuarant.md)
```r
## create a new database 

con <- dbCanConnect(SQLite(), "school.db")

dbListTables(con)

dbWriteTable(con, "school", 
             data.frame(id=1:2, names=c("sun", "joe")))

dbGetQuery(con, "select names from students")

dbDisconnect(con)
```
## 🔐 read file into R
```r
## read file into R

## Split data: using commas
df1 <- read_csv("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_01.csv")

## Split data: using semicolons
df2 <- read_csv2("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_02.csv")

## Split data: using delim "|"
df3 <- read_delim("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_03.txt", delim = "|")

## Split data: using tsv (Tab-Separated Values)
df4 <- read_tsv("https://raw.githubusercontent.com/toyeiei/data-traninig/refs/heads/main/student_04.tsv")

## read excel file, sheet1
## install.packages("readxl")
library(readxl)

df5 <- read_excel("student_05.xlsx", sheet = 1)  ## upload file in working directory ก่อน
```
### 📩 list.file()
```
> list.files(pattern = "*.json")
[1] "blackpink.json"  "example_df.json"
[3] "my_profile.json"
```
### 📩 how to  read a json file into R
```r
## how to  read a json file into R
install.packages("jsonlite")
library(jsonlite)

my_profile <- fromJSON("my_profile.json")
```
```r
## read json as dataframe
temp <- fromJSON("example_df.json")
class(temp)

----
> class(temp)
[1] "data.frame"
```
# 🔐 data transformation 101
## 🔐 Core Function in dplyr
| **Function** | **What is does?** | 
|---|---|
| select() | เลือกคอลัมน์ | 
| filter() | ฟิลเตอร์ข้อมูลด้วยเงื่อนไข | 
| mutate() | สร้างคอลัมน์ใหม่ | 
| arrange() | เรียงข้อมูล | 
| summarise() | สรุปผลสถิติ | 
| group_by() | จับกลุ่มข้อมูล | 

```r
## data transformation 101
library(tidyverse) ## OR library(dplyr)

## Hadley Wickham
## 1. select column == SQL select
## 2. filter rows == SQL where
## 3. arrange == SQL order by
## 4. mutate (create new columns)
## 5. summarise == SQL aggregate function

## preview data
head(mtcars)

colnames(mtcars)
rownames(mtcars)

car_names <- rownames(mtcars)

## create new column
mtcars$model <- car_names

## remove rownames
rownames(mtcars) <- NULL
```
### 📩 move 'model' to the left
```r
## move 'model' to the left
select(mtcars, model, 1:10)

m <- select(mtcars, model, everything()) # using everything() ดึงที่เหลือทั้งหมดไว้ด้านขวา
View(m)
```
### 📩 rename column
```r
## rename
mtcars %>%
  select(model,
         horse_power  = hp,
         transmission = am,
         weight       = wt) %>%
  head()
```
### 📩 sample, slice, pull
```r
## sample, slice, pull
## sample
mtcars %>%
  sample_n(2)

mtcars %>% 
  sample_frac(0.2)

## slice
mtcars %>%
  slice(1:5)

mtcars %>%
  slice(6:10)

mtcars %>%
  slice(c(1, 3, 5))

## pull data as vector
mtcars %>%
  pull(model)

mtcars %>%
  filter(hp > 100) %>%
  pull(model)

```
### 📩 how to select columns
```r
## how to select columns
select(mtcars, hp, wt, am) ## subset by name

select(mtcars, 1:5, 10) ## subset by position

select(mtcars, am, hp, 10) ## ## subset by name and position

select(mtcars, contains("a")) ## subset by condition
```
### 📩 helper verbs to select column
```r
## helper verbs to select column
select(mtcars, starts_with("h"))
select(mtcars, starts_with("a"))
select(mtcars, ends_with("p"))
select(mtcars, contains("a"))
```
### 📩 data transformation pipeline
```r
## data transformation pipeline
mtcars %>%
  select(hp, wt, am)


mtcars %>%
  select(model, hp, wt, am) %>%
  filter(hp >= 200 & wt < 5 & am == "Auto")

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(hp >= 200 | hp <= 90) %>%
  arrange(desc(hp))

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(between (hp, 100, 180)) ## แรงม้า hp อยู่ระหว่าง 100 - 180

```
- [ ] **อยากได้รถยนต์ที่ชื่อขึ้นต้นด้วย M 🚗**
```r
> grep("^M.+", car_names)
 [1]  1  2  8  9 10 11 12 13 14 31

> id <- grep("^M.+", car_names)
> car_names[id]
 [1] "Mazda RX4"     "Mazda RX4 Wag" "Merc 240D"    
 [4] "Merc 230"      "Merc 280"      "Merc 280C"    
 [7] "Merc 450SE"    "Merc 450SL"    "Merc 450SLC"  
[10] "Maserati Bora"
```
```r
mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model))

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model) & hp >= 180)

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model)) %>%
  arrange(hp)

mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model)) %>%
  arrange(-hp)  ## shortcut for descending order using -hp in column numeric

m_cars <- mtcars %>%
  select(model, hp, wt, am) %>%
  filter(grepl("^M.+", model)) %>%
  arrange(am, desc(hp))
``` 
### 📩 mutate
```r
hp_df <- mtcars %>% 
  filter(hp < 100) %>%
  select(model, am, hp) %>%
  ## create new column 
  mutate(am_label  = ifelse(am == 0, "Auto", "Manual"),
         hp_scale  = hp/100, 
         hp_double = hp*2)
```
### 📩 if-else create new segment column
```r
## if-else create new segment column
mtcars %>% 
  select(model, hp) %>%
  mutate(segment  = if_else(hp>200, "high", "low")) %>%
  mutate(segment2 = case_when(
    hp > 200 ~ "high", 
    hp > 100 ~ "medium", 
    TRUE ~ "low" ## TRUE -- คือเงื่อนไขอื่นๆที่เหลือ
  ))

----
mtcars %>% 
  select(model, hp) %>%
  mutate(segment  = if_else(hp>200, "high", "low")) %>%
  mutate(segment2 = case_when(
    hp > 200 ~ "high", 
    hp > 100 ~ "medium", 
   hp <= 100 ~ "low"
  ))
```
### 📩 summarise
```r
## summarise
mtcars %>%
  summarise(mean_hp   = mean(hp),
            sum_hp    = sum(hp),
            median_hp = median(hp), 
            sd_hp     = sd(hp), 
            n         = n())

mtcars %>%
  filter(wt <= 5) %>%
  summarise(mean_hp   = mean(hp),
            sum_hp    = sum(hp),
            median_hp = median(hp), 
            sd_hp     = sd(hp), 
            n         = n())
```
```r
## summarise() with group_by()
## ใช้ group_by() ก่อน summarise() หาค่าสถิติแบ่งตามกลุ่ม
mtcars %>% 
  select(mosel, am, hp) %>%
  mutate(am = if_else(am == 0, "Auto", "Manual")) %>%
  group_by(am) %>%
  summarise(avg_hp = mean(hp), 
            sum_hp = sum(hp), 
            med_hp = median(hp),
            sd_hp  = sd(hp), 
            var_hp = var(hp), 
            n      = n())
```
```r
> mtcars %>%
+   summarise(mean_hp = mean(hp),
+             sum_hp  = sum(hp))
   mean_hp sum_hp
1 146.6875   4694
```
- เทียบเท่ากับการเขียน sqldf
```r
> sqldf("select avg(hp), sum(hp) from mtcars")
   avg(hp) sum(hp)
1 146.6875    4694
```
## 🔐 recap dplyr 
- [x]  1. select
- [x]  2. filter
- [x]  3. arrange
- [x]  4. mutate
- [x]  5. summarise
- [x]  other function: count, distinct
- [x]  join tables, bind_row, bind_col

```r
## recap dplyr 
# 1. select
# 2. filter
# 3. arrange
# 4. mutate
# 5. summarise
# other function: count, distinct
# join tables, bind_row, bind_col

data('mtcars')
df <- mtcars %>% 
  rownames_to_column(var="model") %>%
  tibble()


## random sample / sampling
set.seed(42)
df %>%
  sample_n(3)

df %>%
  sample_frac(0.2)

```
```r
df %>% 
  select(model, am) %>%
  mutate(am = ifelse(am == 0, "Auto", "Manual")) %>%
  count(am)

----
result:
# A tibble: 2 × 2
  am         n
  <chr>  <int>
1 Auto      19
2 Manual    13
```
```r
df %>% 
  select(model, am) %>%
  mutate(am = ifelse(am == 0, "Auto", "Manual")) %>%
  count(am) %>%
  mutate(pct = n/sum(n))  ## สร้างคอลัมน์เปอร์เซ็นต์ขึ้นมาใหม่

----
result:
# A tibble: 2 × 3
  am         n   pct
  <chr>  <int> <dbl>
1 Auto      19 0.594
2 Manual    13 0.406
```
### 📩 distinct
```r
## distinct
df %>% 
  select(model, am) %>%
  mutate(am = ifelse(am == 0, "Auto", "Manual")) %>%
  distinct(am)

----
result:
# A tibble: 2 × 1
  am    
  <chr> 
1 Manual
2 Auto 
```
```r
model_names <- df %>% 
  select(model, am) %>%
  mutate(am = ifelse(am == 0, "Auto", "Manual")) %>%
  distinct(model) %>%
  pull() ## pull ดึงค่าที่ไม่ซ้ำกันออกมาเป็น vector

----
result:
 [1] "Mazda RX4"           "Mazda RX4 Wag"      
 [3] "Datsun 710"          "Hornet 4 Drive"     
 [5] "Hornet Sportabout"   "Valiant"            
 [7] "Duster 360"          "Merc 240D"          
 [9] "Merc 230"            "Merc 280"

> model_names[grepl("Mazda.+", model_names)]
[1] "Mazda RX4"     "Mazda RX4 Wag"
```
### 📩 join tables
- inner, [ left, right, full ] = outer
```r
## join tables
data()

## SQL joins 4 types
## inner, [ left, right, full ] == outer join

## inner join
inner_join(band_members, band_instruments, by = "name")

> ## inner join
> inner_join(band_members, band_instruments, by = "name")
# A tibble: 2 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 John  Beatles guitar
2 Paul  Beatles bass  
> 
------------------------------------------------------------------------------------------
## other write recommend like this
band_members %>%
  inner_join(band_instruments, by ="name")


> ## other write recommend like this
> band_members %>%
+   inner_join(band_instruments, by ="name")
# A tibble: 2 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 John  Beatles guitar
2 Paul  Beatles bass  
>

**** inner == เอาเฉพาะ tables ที่แมทค่ากันได้ คือ เอามาเฉพาะแถวที่เหมือนกัน
---------------------------------------------------------------------------
## left join 
band_members %>%
  left_join(band_instruments, by ="name")
  
> ## left join 
> band_members %>%
+   left_join(band_instruments, by ="name")
# A tibble: 3 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 Mick  Stones  NA    
2 John  Beatles guitar
3 Paul  Beatles bass  
> 

**** left == เอา tables ซ้ายเป็นตัวตั้ง อันไหนแมทค่ากันได้ดึงค่ามา อันไหนแมทไม่ได้ใส่ค่าว่าง Na
-------------------------------------------------------------------------------------------------------------------
## right join 
band_members %>%
  right_join(band_instruments, by ="name")
  
 > ## right join 
> band_members %>%
+   right_join(band_instruments, by ="name")
# A tibble: 3 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 John  Beatles guitar
2 Paul  Beatles bass  
3 Keith NA      guitar

**** right ==  เอา tables ขวาเป็นตัวตั้ง อันไหนแมทค่ากันได้ดึงค่ามา อันไหนแมทไม่ได้ใส่ค่าว่าง Na

---------------------------------------------------------------------------------------------------------

## full outer join 
band_members %>%
  full_join(band_instruments, by = "name") 
  
> ## full outer join 
> band_members %>%
+   full_join(band_instruments, by = "name")
# A tibble: 4 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 Mick  Stones  NA    
2 John  Beatles guitar
3 Paul  Beatles bass  
4 Keith NA      guitar

```
### 📩  join in case key names are not the same
```r
## join in case key names are not the same 
band_members %>%
  rename(friend = name)

band_members %>%
  rename(friend = name) %>%
  left_join(band_instruments, by = c("friend"="name"))
  
  > band_members %>%
+   rename(friend = name) %>%
+   left_join(band_instruments, by = c("friend" = "name"))
# A tibble: 3 × 3
  friend band    plays 
  <chr>  <chr>   <chr> 
1 Mick   Stones  NA    
2 John   Beatles guitar
3 Paul   Beatles bass  

```
### 📩 Drop na 
- data loss <= 5%, acceptable rate
- `drop_na()`
```r
## full outer join 
band_members %>%
  full_join(band_instruments, by = "name") %>%
  drop_na()

> ## full outer join 
> band_members %>%
+   full_join(band_instruments, by = "name") %>%
+   drop_na()
# A tibble: 2 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 John  Beatles guitar
2 Paul  Beatles bass  

## before drop na
> ## full outer join 
> band_members %>%
+   full_join(band_instruments, by = "name")
# A tibble: 4 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 Mick  Stones  NA    
2 John  Beatles guitar
3 Paul  Beatles bass  
4 Keith NA      guitar

** In R => full join drop na == inner join !!!  
```
### 📩 replace_na() in dplyr == SQL COALESCE
- clean Na in dataframe
- `replace_na()`
```r
## clean Na in dataframe 
## replace_na()

id <- 1:5
friends <- c("jay", "john", "mary", "anna", "david")
spending <- c(100, 150, NA, 200, 180)

df <- data.frame(id, friends, spending)

## replace with close friends => avg()
avg_spending <- mean(df$spending, na.rm=TRUE)

## mean imputation
clean_df <- df %>% 
  mutate(spending = replace_na(spending, avg_spending))
```
```r
** Before replace
> band_members %>%
+   full_join(band_instruments, by = "name")
# A tibble: 4 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 Mick  Stones  NA    
2 John  Beatles guitar
3 Paul  Beatles bass  
4 Keith NA      guitar


## replace na == SQL COALESCE 
band_members %>%
  full_join(band_instruments, by = "name") %>%
  mutate(plays = replace_na(plays, "drum"))
  
## AFTER :  replace na == SQL COALESCE 
> band_members %>%
+   full_join(band_instruments, by = "name") %>%
+   mutate(plays = replace_na(plays, "drum")) -- ****
# A tibble: 4 × 3
  name  band    plays 
  <chr> <chr>   <chr> 
1 Mick  Stones  drum  
2 John  Beatles guitar
3 Paul  Beatles bass  
4 Keith NA      guitar
```
```r
band_members %>%
  full_join(band_instruments, by = "name") %>%
  mutate(plays = replace_na(plays, "drum"),
         band  = replace_na(band, "Aerosmith"))

result:
# A tibble: 4 × 3
  name  band      plays 
  <chr> <chr>     <chr> 
1 Mick  Stones    drum  
2 John  Beatles   guitar
3 Paul  Beatles   bass  
4 Keith Aerosmith guitar
```
### 📩 `bind_rows()` UNION Data in R 
```r
## union data == SQL 
-- this syntax in SQL -- 
SELECT * FROM jan_sale
UNION ALL
SELECT * FROM fab_sale;

-- create 2 df -- 
## union data == SQL 
df1 <- data.frame(
  id = 1:3,
  name = c("toy", "john", "marry")
)

df2 <- data.frame(
  id = 3:5,
  name = c("marry", "anna", "david")
)

> df1
  id  name
1  1   toy
2  2  john
3  3 marry
> df2
  id  name
1  3 marry
2  4  anna
3  5 david
```
```r
## append data 
bind_rows(df1, df2)

> bind_rows(df1, df2)
  id  name
1  1   toy
2  2  john
3  3 marry
4  3 marry
5  4  anna
6  5 david

df1 %>%
  bind_rows(df2)    ##  bind_rows(df1, df2) => เขียนแบบไหนก็ได้ ได้ คำตอบเหมือนกัน

result:
  id  name
1  1   toy
2  2  john
3  3 marry
4  3 marry
5  4  anna
6  5 david
```
```r
## UNION ALL
## used bind rows
df1 %>%
  bind_rows(df2)

## UNION use distinct == remove duplicate
## bind rows and then remove duplicates
df1 %>%
  bind_rows(df2) %>%
  distinct()  ## ****

** From this to Below 👇  
    id  name
1  1   toy
2  2  john
3  3 marry  -- marry
4  3 marry  -- marry
5  4  anna
6  5 david

** From above to This 👇
> df1 %>%
+   bind_rows(df2) %>%
+   distinct()  ## => use distinct == remove duplicate
  id  name
1  1   toy
2  2  john
3  3 marry  -- marry
4  4  anna
5  5 david

```
## 📩 Tip & Trick bind rows() multiple 
```r
## dataframe
df1 <- data.frame(
  id = 1:3,
  name = c("toy", "john", "marry")
)

df2 <- data.frame(
  id = 3:5,
  name = c("marry", "anna", "david")
)

df3 <- data.frame(
  id = 6:8,
  name = c("a", "b", "c")
)

df4 <- data.frame(
  id = 9:10,
  name = c("d", "e"))

df1;df2;df3;df4

## Tip & Trick 
## bind rows old version
df1 %>%
  bind_rows(df2) %>%
  bind_rows(df3) %>%
  bind_rows(df4) %>%
  distinct()

## shortcut when we have multiple dataframe 
list_df <- list(df1, df2, df3, df4) # --> create list and input df in list 

list_df %>%
  bind_rows() %>%
  distinct()
  
  > ## shortcut when we have multiple dataframe 
> list_df <- list(df1, df2, df3, df4)
> list_df %>%
+   bind_rows() %>%
+   distinct()
   id  name
1   1   toy
2   2  john
3   3 marry
4   4  anna
5   5 david
6   6     a
7   7     b
8   8     c
9   9     d
10 10     e
```
## 🔐 basic data visualization
- ** `qplot` == guick plot ใช้ในการ plot chart แบบเร็วๆๆ
```r
## basic data visualization
## grammar of graphic
library(tidyverse) ## ggplot2

head(mtcars)

## qplot == shortcut plot
## histogram
qplot(mpg, data=mtcars, geom="histogram", bins=10)

## density
qplot(mpg, data=mtcars, geom="density")

## scatter plot
qplot(x=hp, y=mpg, data=mtcars, geom="point" )

## ggplot full option
ggplot(data =mtcars,
       aes(x=hp, y=mpg)) +
  geom_point()
  
  ## ggplot full option
ggplot(data =mtcars,
       aes(x=hp, y=mpg)) +
  geom_point(col="salmon") +
  geom_smooth(se=F) +
  theme_minimal()
```
## 🔐 wide vs. long data format
### data analyst prefer [LONG format]
- [x] Long Format (tidy Data)
   - [ ] [Important] one column, one data type 1 คอลัมน์ จะเก็บข้อมูลแค่ 1 ประเภท
```r
install.packages("tidye")
library(tidyr)

View(world_bank_pop)

## apply dplyr + tidyr turn wide to long data format 
long_df <- world_bank_pop %>%
  filter(indicator  == "SP.URB.TOTL") %>%
  pivot_longer(cols      = `2000`:`2017`,  ## เปลี่ยนคอลัมน์นี้ไปใส่ใน คอลัมน์ใหม่ "year"
               names_to  = "year", ## ตั้งชื่อคอลัน์ใหม่ 
               values_to = "population") ## value ให้นำมาใส่ในคอลัมน์ population

View(long_df)
```
```r
## convert long to wide format
long_df %>%
  pivot_wider(names_from  = "year",
              values_from = "population") %>%
  View()
```
### convert wide to long format csv file
```r
### read csv file
samsung_sales <- read.csv("samsungsales.csv")

samsung_sales %>%
  pivot_longer(cols = s24:s25u,
               names_to = "model",
               values_to = "sales") %>%
  renames(country = Country) %>% ## ชื่อใหม่ = ชื่อเก่า
  mutate(model = if_else(model == "s25.", "s25p", model) ## ค่าที่นำเข้าจาก csv เพี้ยนไป จึงเขียนเงื่อนไขเพื่อเปลี่ยนชื่อใหม่ ถ้า model เท่ากับ "s25." ให้เปลี่ยนเป็น "s25p" ถ้าไม่ใช่ให้ใส่ค่าเดิม จึงแทนที่ด้วย model
