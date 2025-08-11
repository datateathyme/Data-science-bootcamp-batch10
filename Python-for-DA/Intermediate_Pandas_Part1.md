# 🌲 Intermediate Pandas Part1 with `penguins` dataset🐼
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

# show first 5 rows
penguins.species.head()
```
```py
# select multiple column
penguins[['species', 'island', 'sex']].head()
```
```py
# select last 8 rows 
penguins[['species', 'island', 'sex']].tail(8)
```
## 🏝 integer location based indexing (iloc)
✅ เลือก row ตามตัวเลข index
```py
# integer location based indexing (iloc)
# เลือก row ตามตัวเลข index
penguins.iloc[0]

penguins.iloc[[0, 1, 2]]

penguins.iloc[0:3]
```
```py
# select row and column
penguins.iloc[ 0:5, [0, 1, 5] ]

mini_penguins = penguins.iloc[0:5, 0:3]
mini_penguins
```
## 🔎 Filter dataframe with one condition
```py
# filter row by a condition

penguins['island'] == 'Torgersen' ## return: true | false

penguins[ penguins['island'] == 'Torgersen' ] ## return: dataframe
```
