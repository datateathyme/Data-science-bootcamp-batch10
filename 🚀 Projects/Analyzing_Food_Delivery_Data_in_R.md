# 🏍🍔 Analyzing Food Delivery Data in R
- [Analyzing Food Delivery Data in R (website)](https://datateathyme.wordpress.com/2025/09/07/analyzing-food-delivery-data-in-r/)

## 🔐 Full code
```r
## install packages 
install.packages(c("forecast","dplyr","car","ggplot2", "readr"))


## load library
library(dplyr)
library(ggplot2)
library(forecast)
library(car)
library(readr)
library(lubridate)

## load data and preview the data
food_delivery_data <- read_csv("food_delivery_data.csv")

head(food_delivery_data)

## clean data
food_delivery_data <- food_delivery_data %>% 
  distinct()

food_delivery_data <- food_delivery_data %>%
  mutate(across(everything(), ~ ifelse(is.na(.), mean(., na.rm = TRUE), .)))

food_delivery_data$Order_Date <- as.Date(food_delivery_data$Order_Date, format="%d-%m-%Y")

food_delivery_data$Time_Orderd <- hms::as_hms(food_delivery_data$Time_Orderd)

food_delivery_data$order_hour <- hour(food_delivery_data$Time_Orderd)


## Histogram of Delivery Time
food_delivery_data <- food_delivery_data %>%
  rename(delivery_time_min = "Time_taken(min)")

## check column name 
names(food_delivery_data)

ggplot(food_delivery_data, aes(x = delivery_time_min)) +
  geom_histogram(binwidth = 5, fill = "#0D9922", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Delivery Time", 
       x = "Delivery Time (min)",
       y = "Frequency")


## Delivery person Ratings Distribution
ggplot(food_delivery_data, aes(x = Delivery_person_Ratings)) +
  geom_bar(fill = "salmon", color = "black") +
  theme_minimal() +
  labs(title = "Delivery Person Ratings", 
       x = "Ratings", 
       y = "Count")

## Orders by Road Traffic Density
traffic_density_counts <- food_delivery_data %>%
  count(Road_traffic_density) %>%
  mutate(percentage = n / sum(n) * 100)

ggplot(traffic_density_counts, aes(x = "", y = percentage, fill = Road_traffic_density)) +
  geom_bar(stat = "identity", width = 1) +
  geom_text(aes(label = paste0(round(percentage, 1), "%")), 
            position = position_stack(vjust = 0.5),
            size = 5) + 
  coord_polar("y") +
  labs(title = "Orders by Road Traffic Density", x = "", y = "") +
  theme_void()


## Distribution of Multiple Deliveries
ggplot(food_delivery_data, aes(x = factor(multiple_deliveries))) +
  geom_bar(fill = "darkgreen", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Multiple Deliveries", 
       x = "Multiple Deliveries", 
       y = "Count")

## Average Delivery Person Ratings by City
rating_by_city <- food_delivery_data %>%
  group_by(City) %>%
  summarise(avg_rating = mean(Delivery_person_Ratings, na.rm = TRUE))

ggplot(rating_by_city, aes(x = City, y = avg_rating, fill = avg_rating)) +
  geom_tile() +
  scale_fill_gradient(low = "darkgreen", high = "lightgreen") +
  theme_minimal() +
  labs(title = "Average Delivery Person Ratings by City", 
       x = "City", 
       y = "Average Rating")

## Impact of Weather on the Number of Orders
order_counts_by_weather <- food_delivery_data %>%
  group_by(Weatherconditions) %>%
  summarise(number_of_orders = n()) %>%
  ungroup()

ggplot(order_counts_by_weather, aes(x = Weatherconditions, y = number_of_orders, fill = Weatherconditions)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Number of Orders by Weather Conditions",
    x = "Weather Conditions",
    y = "Number of Orders"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


## Correlation between Delivery Person's Age and their Ratings
avg_ratings_by_age <- food_delivery_data %>%
  group_by(Delivery_person_Age) %>%
  summarise(avg_rating = mean(Delivery_person_Ratings, na.rm = TRUE)) %>%
  ungroup()

ggplot(avg_ratings_by_age, 
       aes(x = Delivery_person_Age, y = avg_rating)) +
  geom_point(color = "darkgreen", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Average Ratings by Delivery Person's Age",
    x = "Delivery Person Age",
    y = "Average Ratings"
  ) +
  theme_minimal()
```
