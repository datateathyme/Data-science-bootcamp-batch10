# 🌲 Intermediate Pandas Part1 🐼
```py
import pandas as pd
```
## 🔏 load data
```py
penguins = pd.read_csv('penguins.csv')
```
## 🏝 preview first 5 rows
```py
# preview first 5 rows
penguins.head()
```
## 🏝 preview last 5 rows
```py
# preview last 5 rows
penguins.tail()
```
## 🏝 shape of dataframe
```py
# shape of dataframe
penguins.shape
```
## 🏝 information of dataframe
```py
# information of dataframe
penguins.info()
```
## 🏝 Select column
```py
# select column
penguins['species']

# หรือเขียนแบบนี้ก็ได้
penguins.species
```
