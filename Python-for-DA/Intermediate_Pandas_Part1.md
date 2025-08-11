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

penguins[ penguins['bill_length_mm'] < 34 ]
```
## 🔎 Filter dataframe more one condition
```py
# filter more than one condition
# `and` opertor
penguins[ (penguins['island'] == 'Torgersen') & (penguins['bill_length_mm'] < 35) ]

# `or` opertor
penguins[ (penguins['island'] == 'Torgersen') | (penguins['bill_length_mm'] < 35) ]

# ฝากค่าใน object ใหม่ == filtered_penguins
filtered_penguins = penguins[ (penguins['island'] == 'Torgersen') | (penguins['bill_length_mm'] < 35) ]
```
## 🔎 filter with .query()
```py
# filter with .query()
penguins.query('island == "Torgersen"') # "island == 'Torgersen'"

# and
penguins.query('island == "Torgersen" & bill_length_mm < 35')

# or
penguins.query('island == "Torgersen" | bill_length_mm < 35')
```
## 🔎 missing value
```py
# check missing in each column
penguins.isna() ## return: true | false

penguins.isna().sum() ## return: summary data is na
```
```py
# filter missing values in column `sex`
penguins[penguins['sex'].isna()]
```
## ⛔ Drop na
```py
# drop na
clean_penguins = penguins.dropna() ## drop all na

clean_penguins.head(10)
```
## ✅ fill missing values > mean imputation
```py
# fill missing values
penguins.head()

# fill na with mean
avg_value = penguins['bill_length_mm'].mean()
avg_value

penguins['bill_length_mm'] = penguins['bill_length_mm'].fillna(avg_value)
penguins.head()
```
## ✅ Sort Dataframe
```py
## sort bill_length_mm low to high, high to low
penguins.sort_values('bill_length_mm')
```
```py
# descending order
penguins.sort_values('bill_length_mm', ascending=False)
```
✅ Drop na before sort data and then select head 6 rows
```py
# drop na before sort data and then select head 6 rows
penguins.dropna().sort_values('bill_length_mm', ascending=False).head(6)
```
### ✅ sort multiple column
```py
# sort multiple column
penguins.dropna().sort_values(['island','bill_length_mm'], ascending=[True,False])
```
## ✅ Unique and Count
```py
# unique values
unique_islands = penguins['island'].unique()
unique_islands_df = pd.DataFrame(unique_islands, columns=['island'])
unique_islands_df
```
```py
# count values นับ values จับกลุ่มตาม species
penguins['species'].value_counts()
```
```py
# count more than one column
result = penguins[['island', 'species']].value_counts().reset_index()

result.columns = ['island', 'species', 'count']

result
```
