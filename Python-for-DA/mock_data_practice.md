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
