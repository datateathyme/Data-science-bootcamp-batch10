# ggplot2 in R

**🍱 Let's see below**


```r
## ggplot2
## library tidyverse
library(tidyverse)

## First ggplot
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth() +
  geom_rug() +
  theme_minimal()


ggplot(mtcars, aes(hp,mpg)) +
  geom_point(size = 3, col = "blue", alpha = 0.5)

ggplot(mtcars, aes(hp)) +
  geom_histogram(bins = 10, fill = "red", alpha = 0.5)
  
ggplot(mtcars, aes(hp)) +
  geom_boxplot()

p <- ggplot(mtcars, aes(hp))
p + geom_histogram(bins =10)
p + geom_density()
p + geom_boxplot()

##  Box plot by group
diamonds %>%
  count(cut)

diamonds %>%
  count(color)

ggplot(diamonds, aes(cut)) +
  geom_bar(fill = "#0366fc")

ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar(position = "stack")


ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar(position = "dodge")


ggplot(diamonds, aes(cut, fill=color)) +
  geom_bar(position = "fill")

#### Scatter plot
set.seed(42)
small_diamonds <- sample_n(diamonds, 5000)

ggplot(small_diamonds , aes(carat, price)) +
  geom_point()

#### FACET : small multiples
ggplot(small_diamonds , aes(carat, price)) +
  geom_point() +
  geom_smooth(method = "lm", col="red") +
  facet_wrap( ~ color, ncol = 2) +
  theme_minimal() +
  labs(title = "Relationship between carat and price by color",
       x = "Carat",
       y = "Price USD",
       caption = "Source: Diamonds from ggplot2 package")

#### Final example
ggplot(small_diamonds , aes(carat, price, col=cut))  +
  geom_point(size = 2, alpha = 0.9) +
  facet_wrap(~ color, ncol=2) +
  theme_minimal()
```
- [x] Example : ggplot2 
  - FACET : small multiples
    ![ggplot2_Data_Viz_inR](https://github.com/user-attachments/assets/af8d968c-7eeb-4a6d-8dbc-bd9ace83e4cb)
  - Mapping color in cut
    ![ggplot2_Data_Viz_inR_2](https://github.com/user-attachments/assets/11c57deb-5506-42bf-afd1-e19570e333af)
  - Mapping color in cut position = "stack"
    ![ggplot2_Data_Viz_inR_3](https://github.com/user-attachments/assets/6df1fad6-631f-4762-a696-540b8b2071c0)
 
