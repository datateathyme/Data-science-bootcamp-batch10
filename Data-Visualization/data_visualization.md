# 🧵 data visualization + Rmarkdown
```r
## data visualization or chart 
## 1. number of variables: one, two, more than teo vars
## 2. data types: number (numeric), not a number (factor)

## Q: one variable, number
## A: Histogram / Density
```
```r
## data visualization + markdown
library(tidyverse)

## ggplot2
## grammar of graphics - 2D
## hadley wickham 

ggplot(data = mtcars, 
       mapping = aes(x=mpg, y=hp)) +
  geom_point() 
  

## cheatsheet ggplot2 in R
## url cheatsheet in my notion _ Live07
```
## 🎨 discrete vs. continuous
```r
## discrete vs. continuous

## discrete or factor
## 1, 2, 3, 4, 5 or "Male", "Female" or "high", "medium", "low" 

## continuous (measurement)
## 176.567.... 

## quiz == Answer
## heart rate == discrete
## internet data (10 mb, 10.456m76 GB...) == continuous

# continuous
gpa <- c(3.41, 3.52, 2.98, 3.95)


## discrete, factor, categorical data 
gender <- c(rep("M", 10), rep("F", 8))
class(gender) : #character

## convert character to factor [categorical]
gender_factor <- factor(gender)
gender_factor <- factor(gender,
                        levels= c("M", "F"),
                        labels= c("M", "F"))
gender_factor

## count n factor
table(gender_factor)

animals <- c("cat", "dog", "hippo", "cat")
animals <- factor(animals)

## ordinal data 
## temperature : low < medium < high
## spending : low < medium < high 

## ordinal data
spending <- c("low", "high", "med", "med", "high")
spending <- factor(spending,
                   levels = c("low", "med", "high"),
                   labels = c("low", "med", "high"),
                   ordered = TRUE)

## factor 
## 1. categorical data [nominal data ] 2. ordinal data [เรียงลำดับ สูง กลาง ต่ำ]
```
## 🎨 one variable - continuous
```r
## one variable - continuous

ggplot(mtcars, aes(mpg)) +
  geom_histogram(bins=6)

base <- ggplot(mtcars, aes(mpg))
base + geom_density()
base + geom_histogram(bins=5, fill="salmon", col="black")
```
## 🎨 one variable - discrete / categorical
```r
## one variable - discrete / categorical 
mtcars %>%
  select(hp, wt, am) %>%
  mutate(am = ifelse(am == 0, "Auto", "Manual")) %>%
  ggplot(aes(am, fill = am)) +
  geom_bar()

mtcars %>%
  select(hp, wt, am) %>%
  ggplot(aes(am, fill = am)) +
  geom_bar()
```
## 🎨 two variable - both continuous
```r
## two variable - both continuous
base <- ggplot(data = mtcars,
       mapping = aes(hp,mpg))

base + 
  geom_point() +
  geom_smooth(method = "lm") +
  geom_rug()
```
## 🎨 setting vs. mapping 
```r
## setting vs. mapping 
## setting
base + 
  geom_point(
    col = "red",
    size = 4,
    alpha = 0.6, #oppacity
    pch = 16 # shape
    )
  
## mapping
base +
  geom_point(
    mapping = aes(col=am)
  )
## if column 'am' is not factor you can convert like this👇 
class(mtcars$am) # check class 'am' 

base +
  geom_point(mapping = aes(col=factor(am)), # map color in column factor
             size = 5,
             alpha = 0.6) 

base +
  geom_point(mapping = aes(col=wt)) #column: continuous
```
## 🎨 diamonds data set  
```r
## diamonds data set
View(diamonds)

diamonds %>%
  select(cut)

diamonds %>% 
  count(cut)

class(diamonds$cut)

diamonds %>% 
  count(clarity)
  

## explore data with chart 

set.seed(42) 
small_df <- diamonds %>%
  sample_frac(0.1)

ggplot(small_df, aes(x= carat, y=price)) +
  geom_point(alpha = 0.3, col="#E39987") +
  theme_minimal()
  
ggplot(small_df, aes(carat,price)) +
  geom_point(mapping = aes(col=cut)) +
  theme_minimal()

## or can write in another way  
ggplot(small_df, aes(carat,price, col=cut)) +
  geom_point(size =3, alpha=0.4) +
  theme_minimal()

## filter column cut 
set.seed(42) 
small_df <- diamonds %>%
  sample_frac(0.1) %>%
  filter(cut %in% c("Fair", "Premium", "Ideal"))

ggplot(small_df, aes(carat,price, col=cut)) +
  geom_point(size =3, alpha=0.4) +
  theme_minimal()
```
## 🎨 facet, multiple sub - plot
- facet using with column factor
```r
## facet, multiple sub - plot
base2 <- ggplot(small_df, aes(carat,price, col=cut)) +
  geom_point(size =3, alpha=0.4) +
  theme_minimal()

base2 +
  facet_wrap(~cut) ## facet using with column factor

base2 +
  facet_wrap(~cut, ncol=2)

base2 +
  facet_wrap(~color, ncol=3)

base2 + 
  facet_grid(color ~ cut)


ggplot(small_df, aes(carat,price)) +
  geom_point(size =3, alpha=0.4) +
  geom_smooth(se = FALSE, col="red") +
  theme_minimal() +
  facet_grid(color ~ cut)

ggplot(small_df %>%
         filter(carat <= 2.5), aes(carat,price)) +
  geom_point(size =3, alpha=0.4) +
  geom_smooth(se = FALSE, col="red") +
  theme_minimal()
```

## 🎨 set title, caption, x/y labels
```r
## set title, caption, x/y labels

base3 <- ggplot(small_df %>%
         filter(carat <= 2.5), aes(carat,price)) +
  geom_point(size =3, alpha=0.4) +
  geom_smooth(se = FALSE, col="red") +
  theme_minimal() 

base3 +
  labs(title = "Correlation is very strong", 
       subtitle = "Correlation is 0.85",
       caption = "Source: ggplot package",
       x= "Diamond Carat",
       y = "Price $ USD") 
```
## 🎨 change color manual 
```r
## change color manual 
new_df <- data.frame(
  id = 1:5,
  fruit = c(rep("grape",3), rep("banana",2)),
  price= c(20, 25, 21, 24, 30),
  weight = c(5, 4, 7, 6, 10)
)

ggplot(new_df, aes(weight, price, color=fruit)) +  ## fruit = discrete using manual
  geom_point(size =3) +
  scale_color_manual(values = c("#FECC02","#9209B8")) +
  theme_minimal()

ggplot(new_df, aes(weight, price, color=price)) + ## price = continuous using gradient
  geom_point(size =3) +
  theme_minimal() +
  scale_color_gradient(low="gold", high="blue")
```
## 🎨 final tips - multiple dataframe in one chart 
```r
## final tips - multiple dataframe in one chart 

new_df1 <- new_df %>% filter(weight < 7)
new_df2 <- new_df %>% filter(weight >= 7)


ggplot() +
  theme_minimal() +
  geom_point(data = new_df1,
             mapping = aes(weight, price),
             color = "salmon", size = 3) +
  geom_point(data = new_df2,
             mapping = aes(weight, price),
             color = "purple", size =3)
```
## 🎨 mapped to aesthetic of the chart 
```r
## ggplot2: 2D
## add more variables
## mapped to aesthetic of the chart 
library(tidyverse)

set.seed(42)
small_diamonds <-  diamonds %>%
  sample_frac(0.1)

ggplot(small_diamonds, aes(x=carat, y=price)) +
  geom_point(aes(color = clarity)) +
  theme_minimal()
```
![Image](https://github.com/user-attachments/assets/919ad522-4ad1-4ce5-bcf7-227d9b6e767e)

## 🎨 Two approaches to statistics
- [x] [1] graphical
- [x] [2] numerical 
```r
## overplotting
## install.packages("ggthemes")
library(ggthemes)

## create chart with summarise stat
ggplot(data = small_diamonds, 
       mapping = aes(x=price, y=carat)) +
  geom_point(mapping = aes(color = cut, alpha = 0.7) +
  theme_minimal()
  
diamonds %>%
  group_by(cut) %>%
  summarise(
    n = n(),
    avg_price = mean(price),
    avg_carat = mean(carat)
  )

```
## 🐣 homework R markdown 
```r
## homework R markdown 
set.seed(42)
small_df <- diamonds %>%
  sample_n(1000)


ggplot(small_df, aes(x = price)) +
  geom_histogram(fill = "#29C294", color = "black") +
  labs(title = "Distribution of Diamond Prices",
       x = "Price", y = "Frequency")

ggplot(small_df, aes(x = carat, y = price)) +
  geom_point(size= 4, col= "purple" , alpha = 0.3) +
  labs(title = "Correlation between Carat and Price",
       x = "Diamond Carat", 
       y = "Price $ USD")

ggplot(small_df, aes(x = cut, y = price)) +
  geom_point() +
  labs(title = "Price Distribution by Cut",
       x = "Cut", y = "Price")

ggplot(small_df ,aes(carat, price, col=cut)) +
  geom_boxplot() +
  theme_minimal() +
  facet_wrap(~cut) +
  labs(title = "Price Distribution by Cut",
       caption = "Source: ggplot package",
       x = "Cut",
       y = "Price")

ggplot(small_df, aes(x = cut, y = price, )) +
  geom_point(fill = "salmon") +
  geom_smooth() +
  labs(title = "Price Distribution by Cut",
       x = "Cut", y = "Price")

small_dia <- diamonds %>%
  sample_frac(0.2)

ggplot(small_df, aes(x = clarity)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Frequency of Diamond Clarity",
       x = "Clarity", y = "Frequency")

ggplot(small_df, aes(x = carat, y = price, color = cut)) +
  geom_point(alpha = 0.5) +
  labs(title = "Price vs. Carat by Cut",
       x = "Carat", y = "Price", color = "Cut")

ggplot(small_df, aes(x = carat, y = price, color = cut)) +
  geom_point(size = 3, alpha = 0.4) +
  theme_minimal() +
  facet_wrap(~cut)

ggplot(small_df, aes(x = color, y = price)) +
  geom_boxplot() +
  labs(title = "Price Distribution by Color",
       x = "Color", y = "Price")

ggplot(small_df, aes(carat)) +
  geom_histogram(bins= 6, fill = "steelblue", alpha = 0.6) +
  theme_minimal() +
  labs(title = "Density Plot of Diamond Depth",
       caption = "Source: ggplot package",
       x = "Depth", 
       y = "Density")

small_df %>%
  summarize(avg = mean(depth),
            median = median(depth),
            min = min(depth),
            max = max(depth))

library(ggplot2)

# Select a numerical column, e.g., price
ggplot(small_df, aes(x = table)) +
  geom_density(fill = "steelblue", alpha = 0.5) +
  labs(title = "Distribution of Diamond Prices",
       x = "Price", y = "Density")

ggplot(small_df, aes(x = depth)) +
  geom_density(fill = "steelblue", alpha = 0.5) +
  labs(title = "Distribution of Diamond Depth",
       x = "Depth", y = "Density")

library(ggplot2)

# Compare depth distributions by cut
ggplot(small_df, aes(x = depth, color = cut)) +
  geom_density(alpha = 0.8) +
  facet_grid(~cut) +
  theme_minimal() +
  labs(title = "Depth Distribution by Cut",
       caption = "Source: ggplot package",
       x = "Depth", 
       y = "Density")

# Compare depth distributions by clarity
ggplot(small_df, aes(x = depth, color = clarity)) +
  geom_density(alpha = 0.5) +
  labs(title = "Depth Distribution by Clarity",
       x = "Depth", y = "Density")

library(ggplot2)

# Create a boxplot to visualize price distribution by cut
ggplot(small_df, aes(x = cut, y = price)) +
  geom_boxplot() +
  labs(title = "Price Distribution by Cut",
       x = "Cut", y = "Price")

library(tidyverse)

mean_price <- mean(small_df$price)
print(mean_price)

median_price <- median(small_df$price)
print(median_price)

mode_price <- small_df %>%
  count(price) %>%
  arrange(desc(n)) %>%
  slice(1) %>%
  pull(price)

print(mode_price)

# Calculate mean and median
summary_stats <- small_df %>%
  summarize(mean_price = mean(price),
            median_price = median(price))

# Approximate mode using the most frequent price
mode_price <- small_df %>%
  count(price) %>%
  arrange(desc(n)) %>%
  slice(1) %>%
  pull(price)

# Combine results into a single data frame
final_result <- summary_stats %>%
  tibble(mode_price = mode_price)
print(final_result)

small_df %>%
  count(clarity) %>%
  arrange(desc(n))

new_small_df <- small_df %>%
  filter(price <= 15000)

ggplot(new_small_df , aes(x = price )) +
  geom_histogram(fill = "#CC83E0", alpha = 0.8, color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Diamond Prices",
       caption = "Source: ggplot package",
       x = "Price", 
       y = "Frequency")

small_df %>%
  summarize(min_depth = min(depth),
            avg_depth = mean(depth),
            median_depth = median(depth),
            max_depth = max(depth))

small_df %>%
  summarize(min(depth),
            quantile(depth),
            max(depth))

library(ggplot2)

# Create a boxplot to visualize price distribution by cut
ggplot(small_df, aes(x = cut, y = price)) +
  geom_boxplot(fill = "#CC83E0", alpha = 0.8) +
  theme_minimal() +
  labs(title = "Price Distribution by Cut",
       x = "Cut", y = "Price")

sum_depth <- small_df %>%
  summarize(
    min_depth = min(depth),
    q1_depth = quantile(depth, probs = 0.25),
    avg_depth = mean(depth),
    median_depth = quantile(depth, probs = 0.5),
    q3_depth = quantile(depth, probs = 0.75),
    max_depth = max(depth)
  )


print(sum_depth)
```
