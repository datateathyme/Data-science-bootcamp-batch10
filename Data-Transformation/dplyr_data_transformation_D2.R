library(tidyverse)
library(dplyr)

## recap dplyr data transformation 
## dplyr (part of tidyverse)
## select(), filter(), arrange(), mutate(), summarise()

head(mtcars)
mtcars %>% 
  select(am, hp, wt) %>%
  filter(am == "Auto") %>%
  mutate(am_label = ifelse(am == "Auto", 0, 1))

mtcars %>% 
  rownames_to_column() %>%
  head(5)

## dplyr (+ ggplot)
## 1. select
## 2. filter
## 3. arrange
## 4. mutate
## 5. summarise
## other function: count , distinct
## join tables, bind_row, bind_col

df <- mtcars %>%
  rownames_to_column("model") %>%
  tibble()


## random sample / sampling
set.seed(9)
df %>%
  sample_n(3)

df %>% 
  sample_frac(0.2)

df %>% 
  select(model, am) %>%
  count(am) %>%
  mutate(pct = n/ sum(n))

## distinct 
model_names <- df %>% 
  select(model, am) %>%
  distinct(model) %>%
  pull()
  
model_names %>% length()

model_names[1:10]

model_names[grepl("Mazda.+", model_names)] 

df %>% 
  pull(hp)

df[["hp"]]


## join tables
data()

## SQL joins
## inner, left, right, full 

## inner join
inner_join(band_members, band_instruments, by = "name")

## other write recommend like this
band_members %>%
  inner_join(band_instruments, by ="name")

## left join 
band_members %>%
  left_join(band_instruments, by ="name")


## right join 
band_members %>%
  right_join(band_instruments, by ="name")

## full outer join 
band_members %>%
  full_join(band_instruments, by = "name") %>%
  drop_na()

## replace na == SQL COALESCE 
band_members %>%
  full_join(band_instruments, by = "name") %>%
  mutate(plays = replace_na(plays, "drum"),
         band = replace_na(band, "Aerosmith"))

## union data == SQL 
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
list_df <- list(df1, df2, df3, df4)

list_df %>%
  bind_rows() %>%
  distinct()

bind_rows(df1, df2)

## UNION ALL
## used bind rows
df1 %>%
  bind_rows(df2)

## UNION use distinct == remove duplicates
## bind rows and then remove duplicates
df1 %>%
  bind_rows(df2) %>%
  distinct()

## join in case key names are not the same 
band_members %>%
  rename(friend = name)

band_members %>%
  rename(friend = name) %>%
  left_join(band_instruments, by = c("friend"="name"))


## basic data visualization
## grammar of graphic
library(tidyverse) ## ggplot2

## qplot == shortcut plot
## histogram
qplot(mpg, data=mtcars, geom="histogram", bins=10)

## density
qplot(mpg, data=mtcars, geom="density")

## scatter plot
qplot(x=hp, y=mpg, data=mtcars, geom="point")

## ggplot full option
ggplot(data =mtcars,
       aes(x=hp, y=mpg)) +
  geom_point(col="salmon") +
  geom_smooth(se=F) +
  theme_minimal()
