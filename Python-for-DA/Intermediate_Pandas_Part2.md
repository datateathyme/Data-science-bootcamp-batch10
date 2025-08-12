# 🌲 Intermediate Pandas Part2 with `penguins` dataset🐼
## 🔐 Import Library
```py
import pandas as pd
```
## 🔐 Import Library
```py
penguins = pd.read_csv("penguins.csv")
```
## 🌻 summarise dataframe `.describe()`
```py
# summarise dataframe
penguins.describe()
```
```py
# summarise dataframe *all column
penguins.describe(include='all')
```
## 🌻 average, mean
```py
# average, mean
penguins['bill_length_mm'].mean()
```
## 🌻 std: standard deviation
```py
# std: standard deviation
penguins['bill_length_mm'].std()
```
## 🌻 median
```py
# median
penguins['bill_length_mm'].median()
```
## 🌻 group by + sum/mean
```py
# group by + sum/mean
penguins.groupby('species')['bill_length_mm'].mean()

penguins.groupby('species')['bill_length_mm'].sum()

penguins.groupby('species')['bill_length_mm'].median()
```
## 🌻 group by aggregate function
```py
# group by aggregate function 
penguins.groupby('species')['bill_length_mm'].agg(['min', 'mean', 'median', 'std', 'max'])
```
```py
# group by more than one column 
result = penguins.groupby(['island', 'species'])['bill_length_mm'].agg(['min', 'mean', 'max']).reset_index()

# write to csv
result.to_csv('penguins_result.csv')
```
## 🌻 if youe code is long using `\` to help 
```py
# if youe code is long
penguins.groupby(['island', 'species'])['bill_length_mm'] \
  .agg(['min', 'mean', 'max']) \
  .reset_index()
```
## 🌻 `.map` values MALE:m, FEMALE:f เปลี่ยนค่าในคอลัมน์ {ค่าเก่า : ค่าใหม่}
```py
penguins['sex'].map({'MALE':'m', 'FEMALE':'f'}).head(6).fillna('other')
```
```py
penguins['sex_new'] = penguins['sex'].map({'MALE':'m', 'FEMALE':'f'}).fillna('other')

penguins.head()
```
