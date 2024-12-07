## install.packages(dplyr)
install.packages("dplyr")

## load library
library(dplyr)

## read csv file into Rstudio
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE)
View(imdb)

## review data structure
glimpse(imdb)

## print head and tail of data
head(imdb, 10)
tail(imdb, 10)

## preview columns name
names(imdb)

## select columns
select(imdb, MOVIE_NAME, RATING)
select(imdb, 1, 5)

## rename column name
select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)

## pipe operator
head(imdb)

imdb %>%
  head()

imdb %>%
  select(movie_name = MOVIE_NAME, released_year = YEAR) %>%
  head()
  
## filter data
filter(imdb, SCORE >= 9.0)

imdb %>%
  filter(SCORE >= 9.0)

## wrap string lower case
names(imdb) <- tolower(names(imdb))

names(imdb)

imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9 & year > 2000)

imdb %>% 
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3)

imdb %>% 
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9.0)

imdb %>% 
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

## filter string columns
imdb %>% 
  filter(rating == "R")

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(rating == "PG")

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(genre == "Drama")

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(genre == "Drama")

## like a pattern matching ex.find "Drama"
imdb$genre
grepl("Drama", imdb$genre)

imdb %>% 
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))

imdb %>% 
  select(movie_name) %>%
  filter(grepl("The", imdb$movie_name))

imdb %>% 
  select(movie_name) %>%
  filter(grepl("King", imdb$movie_name))

## create new columns
imdb %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"))

## create new columns [2 col]
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_group = if_else(score >= 9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Film", "Short Film"))

imdb %>% 
  select(movie_name, score) %>%
  mutate(score_update = score + 0.1) %>%
  head(10)


score_update <- imdb %>% 
  select(movie_name, score) %>%
  mutate(score = score + 0.1) %>%
  head(10)

## arrange data
head(imdb)

imdb %>%
  arrange(length) %>%
  head(10)

## sort data by descending order
imdb %>%
  arrange(desc(length)) %>%
  head(10)

imdb %>%
  arrange(rating, desc(length))

## how to filter missing values !! 
imdb %>%
  filter(rating != "") %>%
  arrange(rating, desc(length))



## summarise and group by 
imdb %>% 
  filter(rating != "") %>%  
  group_by(rating)  %>% 
  summarise(mean_length = mean(length),
            sum_length = sum(length),
            sd_length   = sd(length),
            min_length  = min(length), 
            max_length  = max(length),
            n = n())

## join data 
favorite_films <- data.frame(id =c(5, 10, 25, 30, 98))
(favorite_films)

## join table fav_film & imdb by col "id" == col "no" imdb
favorite_films %>%
  inner_join(imdb, by = c("id" = "no"))


## write csv file (export result)
imdb_prep <- imdb %>% 
  select(movie_name, released_year = year, rating, score) %>%
  filter(rating == "R" & released_year > 2000)

## export file
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)

## packages("tidyverse") => dplyr tidyr ggplot2
## load library
library(tidyverse)

## data.frame vs. tibble 
df_tibble <- tibble(id = 1:3, name = c("toy", "jisoo", "lisa"))
df <- data.frame(id = 1:3, name = c("toy", "jisoo", "lisa"))

class(df_tbiible)
class(df)

## covert dataframe to tibble  
mtcars
mtcars_tibble <- tibble(mtcars)

## sample_n == random 
set.seed(42)
sample_n(mtcars, size=5)

sample_frac(mtcars, size=0.50, replace = T)

## slice()
mtcars %>% 
  slice(1:5)

mtcars %>% 
  slice(6:10)

mtcars %>%
  slice(c(1, 3, 5))

mtcars %>% 
  slice( sample(nrow(mtcars), 10))
