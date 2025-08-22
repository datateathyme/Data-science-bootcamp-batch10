## load library
library(tidyverse)

## read csv file
forest_fires <- read_csv("forestfires.csv")

## what columns are in the dataset?
colnames(forest_fires)

## data Processing
forest_fires %>%
  pull(month) %>%
  unique()

forest_fires %>%
  pull(day) %>%
  unique()

## order month - Day
month_order <- c("jan", "feb", "mar",
                 "apr", "may", "jun",
                 "jul", "aug", "sep",
                 "oct", "nov", "dec")

day_order <- c("sun", "mon", "tue", "wed", "thu", "fri", "sat")

forest_fires <- forest_fires %>% 
  mutate(
    month = factor(month, levels = month_order),
    day = factor(day, levels = day_order)
  )

glimpse(forest_fires)

## month level
fires_by_month <- forest_fires %>%
  group_by(month) %>%
  summarise(total_fires = n())

print(fires_by_month)
tibble(fires_by_month)

## create ggplot by month
fires_by_month %>%
  ggplot(aes(x = month, y = total_fires)) +
  geom_col(fill = "salmon") +
  theme_minimal() +
  labs(
    title = "Number of forest fires in data by month",
    x = "Month",
    y = "Fire count"
  )

## day level
fires_by_day <- forest_fires %>%
  group_by(day) %>%
  summarize(total_fires = n())

print(fires_by_day)

## create ggplot by day of week
fires_by_day %>% 
  ggplot(aes(x = day, y = total_fires)) +
  geom_col(fill="#02BDAE") +
  theme_minimal() + 
  labs(
    title = "Number of forest fires in data by day of the week",
    y = "Fire count",
    x = "Day of the week"
  )

## plotting other variables against time 
forest_fires_long <- forest_fires %>% 
  pivot_longer(
    cols = c("FFMC", "DMC", "DC", 
             "ISI", "temp", "RH", 
             "wind", "rain"),
    names_to = "data_col",
    values_to = "value"
)

print(forest_fires_long)

## plot boxplot
forest_fires_long %>% 
  ggplot(aes(x = month, y = value)) +
  geom_boxplot() +
  facet_wrap(vars(data_col), scale = "free_y") +
  theme_minimal() +
  labs(
    title = "Variable changes over month",
    x = "Month",
    y = "Variable value"
  ) 

## create scatter plot
forest_fires_long %>% 
  ggplot(aes(x = value, y = area)) +
  geom_point() +
  facet_wrap(vars(data_col), scales = "free_x") +
  theme_minimal() +
  labs(
    title = "Relationships between other variables and area burned",
    x = "Value of column",
    y = "Area burned (hectare)"
  )

## filter area < 300
forest_fires_long %>% 
  filter(area < 300) %>% 
  ggplot(aes(x = value, y = area)) +
  geom_point() +
  facet_wrap(vars(data_col), scales = "free_x") +
  theme_minimal() +
  labs(
    title = "Relationships between other variables and area burned (area < 300)",
    x = "Value of column",
    y = "Area burned (hectare)"
  )

