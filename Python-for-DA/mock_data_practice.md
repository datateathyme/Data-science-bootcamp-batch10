# 🎄 mock up data for practice 
## 💎 mock data
```py
import pandas as pd
import numpy as np


mock_data = {
    'OrderID': np.arange(1001, 1011),  
    'CustomerName': ['Alice', 'Bob', 'Charlie', 'Dana', 'Eve', 'Frank', 'Grace', 'Henry', 'Ivy', 'Jack'],
    'ProductCategory': ['Electronics', 'Apparel', 'Books', 'Electronics', 'Home', 'Books', 'Apparel', 'Home', 'Electronics', 'Apparel'],
    'Quantity': [1, 2, 5, 1, 3, 2, 1, 4, 1, 2],
    'Price_USD': [150.99, 45.50, 12.00, 89.99, 35.00, 18.75, 55.00, 25.00, 299.99, 60.00],
    'OrderDate': pd.to_datetime(['2024-09-01', '2024-09-01', '2024-09-02', '2024-09-03', '2024-09-03', 
                                 '2024-09-04', '2024-09-05', '2024-09-05', '2024-09-06', '2024-09-07']),
    'Shipped': [True, True, False, True, False, True, True, False, True, True]
}

# Create the DataFrame
df = pd.DataFrame(mock_data)
df
```
## 📩 write to csv file
```py
## write to csv file
df.to_csv("mock_data.csv", index=False)
```
## 📩 read csv file
```py
df = pd.read_csv("mock_data.csv")
df
```
### ♻ 1. Create a New Column: Calculate `Total_Spent` by multiplying `Quantity` and `Price_USD`
```py
df['Total_Spent'] = df['Quantity'] * df['Price_USD']
df
```
---
### ♻ 2. Filtering/Subsetting: Find all orders that are not yet shipped or all orders for the `'Electronics'` category
```py
unshipped = df[df['Shipped'] == False]
electronics_orders = df[df['ProductCategory'] == 'Electronics']
```
```py
## filter data unshipped or category == 'Electronics'
unshipped_electronics = df[(df['Shipped'] == False) | (df['ProductCategory'] == 'Electronics')]
unshipped_electronics
```
---
### ♻ 3. Group By and Aggregate: Find the average price and total quantity sold for each `ProductCategory`
```py
summary = df.groupby('ProductCategory').agg(
    Avg_Price=('Price_USD', 'mean'),
    Total_Units=('Quantity', 'sum')
).sort_values(by='Avg_Price', ascending=False)

summary
```
---
### ♻ 4. Sorting: Sort the DataFrame
```py
df_sorted = df.sort_values(by='Quantity', ascending=False)
df_sorted
```
```py
## see the top three best-selling product categories
top3 = df.groupby('ProductCategory').agg(
    Total_Units=('Quantity', 'sum')
).sort_values(by='Total_Units', ascending=False).head(3)

top3
```
```py
## filter and sort data
df[(df.ProductCategory == 'Home') | (df.ProductCategory == 'Electronics')].sort_values(by='Quantity', ascending=False)
```
```py
df[(df.ProductCategory == 'Books') & (df.Quantity >= 2)]
```
#### Using .isin() and Sort 2 column
```py
df[df.ProductCategory.isin(['Home', 'Electronics','Apparel'])].sort_values(by=['ProductCategory','Quantity'], ascending=[True, False])
```
---
### ♻ 5. unique() values
```py
df['ProductCategory'].unique()
```
```py
## value_counts()
df['ProductCategory'].value_counts()
```
---
### ♻ 6. convert data type from object to datetime 
```py
## convert data type from object to datetime 
df['OrderDate'] = pd.to_datetime(df['OrderDate'])
df.dtypes
```
---
### ♻ 7. append new data
```py
new_mock_data = {
    'OrderID': np.arange(1012, 1014),
    'CustomerName': ['Anna', 'Bobby'],
    'ProductCategory': ['Electronics', 'Apparel'],
    'Quantity': [2, 5],
    'Price_USD': [150.99, 45.50],
    'OrderDate': pd.to_datetime(['2024-09-01', '2024-09-01']),
    'Shipped': [True, False]
}

new_df = pd.DataFrame(new_mock_data)
new_df
```
```py
df = pd.concat([df, new_df], ignore_index=True)
df
```
---
### ♻ 8. Drop column
```py
df.drop(columns=['Total_Spent'], inplace=True)
```
---
### ♻ 9. Drop row
```py
## drop row with index
rows = [10, 11] #ลบแถวที่10,11
df.drop(rows, axis=0, inplace=True)
```
```py
df.reset_index(drop=True, inplace=True)
```
