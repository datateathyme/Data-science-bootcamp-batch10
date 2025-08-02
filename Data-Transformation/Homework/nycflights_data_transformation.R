install.packages("nycflights13")
library(tidyverse)
library(nycflights13)

## write csv file
write_csv(flights, "flights.csv")

## read csv file
flights_df <- read_csv("flights.csv")

## homework data transformation 
## using dplyr write 5 query manipulate data 

# Find the 10 most delayed flights
flights_df %>% 
  arrange(desc(arr_delay)) %>%
  select(flight, carrier, origin, dest, arr_delay) %>%
  head(10)


# Calculate average departure delay for each airline
flights_df %>%
  group_by(carrier) %>%
  summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(-avg_dep_delay)


# Find the busiest airports (in terms of flights)
flights_df %>%
  group_by(dest) %>%
  summarise(n_flights = n()) %>%
  arrange(desc(n_flights))


# Find the flights that were delayed more than two hours
flights_df %>%
  select(flight, carrier, origin, dest , arr_delay, dep_delay, arr_time) %>% 
  filter(arr_delay > 120 | dep_delay > 120) 


# Finding the Fastest Flights
flights_df %>%
  mutate(speed = distance / air_time * 60) %>%
  arrange(desc(speed)) %>%
  select(flight, carrier, origin, dest, speed)

 
# Finding the Most Popular Routes
flights_df %>%
  count(origin, dest) %>%
  arrange(desc(n))

