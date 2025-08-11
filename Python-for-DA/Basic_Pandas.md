# 🎄 Basic Pandas 🐼
**✅ import pandas**
```py
import pandas as pd
```
## 🌴 create dataframe from scratch
```py
# create dataframe from scratch

raw_data = {
    "name": ['Alice', 'Bob', 'Charlie', 'Diana', 'Ethan'],
    "age": [28, 32, 25, 30, 27],
    "gender": ['F', 'M', 'M', 'F', 'M'],
    "country": ['USA', 'Canada', 'USA', 'UK', 'USA']
}

df = pd.DataFrame(raw_data)

df
```
### 🏝 result: `df = pd.DataFrame(raw_data)`

| index |   name  | age  | gender | country |
| ----- | ------- | ---- | ------ | ------- |
| 0     | Alice   | 28   | F      | USA     |
| 1     | Bob     | 32   | M      | Canada  |
| 2     | Charlie | 25   | M      | USA     |
| 3     | Diana   | 30   | F      | UK      |
| 4     | Ethan   | 27   | M      | USA     |

---
## 🌴  Add a new column
```py
## Add a new column
df["city"] = ["New York", "Toronto", "Los Angeles", "London", "Chicago"]
```
```py
df.shape
result: (5, 5) ## 5 row, 5 column
```
## 🌴 Drop column
```py
 ## drop column city
 df = df.drop('city', axis = 1) # axis 0 == row, 1 == column
```
## 🌴 Drop row
```py
## remove index(row) = 2

df = df.drop(2, axis = 0)
```
## 🌴 Reset index
```py
# reset index
df = df.reset_index(drop = True)
df
```
## 🌴 Rename columns
```py
# rename column

list(df.columns) # ดูชื่อคอลัมน์
result: ['name', 'age', 'gender', 'country']

df.columns = ['first_name', 'age', 'gender', 'country']
df
```
## 🌴 create a new series
```py
# create a new series
s1 = pd.Series(['Charl', 25, 'M', 'USA'], index = ['first_name', 'age', 'gender', 'country'])
print(s1)
print(type(s1))

# append s1 to df
df = pd.concat([df, s1.to_frame().T], ignore_index=True)
df

# create new column
s2 = pd.Series(['New York', 'Toronto', 'Los Angeles', 'London', 'Chicago'])
df['city'] = s2
df
```

## 🔏 Write CSV file
```py
# write CSV file
df.to_csv('mydata.csv', index =False)
```
## 🔏 Import csv file
```py
# import csv file
df2 = pd.read_csv('data.csv')
df2
```
## 🔏 Import excel file
```py
df3 = pd.read_excel('data.xlsx')
df3
```
## 🔏 Import json file
```py
# import json file
df4 = pd.read_json('data.json')
df4
```
