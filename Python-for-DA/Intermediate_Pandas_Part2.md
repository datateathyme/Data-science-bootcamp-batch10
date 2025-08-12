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
# 🐼 numpy
## 🔐 Import Library
```py
# import numpy
import numpy as np
```
## 🏝 mean
```py
# import numpy
import numpy as np
np.mean(penguins['bill_length_mm'])

result: np.float64(43.9219298245614)
```
```py
# pandas style
penguins['bill_length_mm'].mean()

result: np.float64(43.9219298245614)
```
## 🏝 numpy.where (condition like ifelse)
```py
np.where(score >= 80, 'passed', 'failed')
```
```py
grade = np.where(score >= 80, 'passed', 'failed')

grade = pd.DataFrame(grade)
grade.columns = ['result']
grade
```
## 🏝 filter , select column, create new column
```py
df = penguins.query("species == 'Adelie' ")[['species', 'island', 'bill_length_mm']].dropna()
df.head()

df['new_column'] = np.where(df['bill_length_mm']> 40, True, False) #boolean
df.head(10)
```
## 🐼 Merge Dataframe (join table)
```py
# create data frame
left = {
    'key': [1, 2, 3, 4],
    'name': ['sun', 'joe', 'jane', 'anna'],
    'age':[25, 28, 30, 22]
}

right = {
    'key': [1, 2, 3, 4],
    'city': ['Bangkok', 'London', 'Seoul', 'Tokyo'],
    'zip': [1001, 2504, 2094, 9802]
}

df_left = pd.DataFrame(left)
df_right = pd.DataFrame(right)
```
```py
# merge table
import pandas as pd
df_result = pd.merge(df_left, df_right, on='key')

df_result
```
## 📈 Pandas Plots
```py
# histogram one column
penguins['body_mass_g'].plot(kind='hist');
```
```py
# histogram two columns
penguins[['body_mass_g', 'bill_length_mm']].plot(kind='hist', subplots=True);
```
```py
# bar plot for species
penguins['species'].value_counts().plot(kind='bar', title='Species Count', color=['salmon', 'orange', 'gold']);
```
```py
# scatter plot
penguins[['bill_length_mm', 'bill_depth_mm']] \
    .plot(kind='scatter', x='bill_length_mm', y='bill_depth_mm', color='salmon', title='scatter plot');
```
