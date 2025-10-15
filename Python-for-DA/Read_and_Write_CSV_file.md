# 🐼 Read and Write CSV file in Python 

## 📩 **Read CSV file**
import `csv`
```py
import csv

file = open("customers_arpu.csv", "r")

reader = csv.reader(file)
for row in reader:
    print(row)
-----------------------------
# result:
['\ufeffid', 'name', 'arpu', 'city']
['1', 'john', '500', 'BKK']
['2', 'toy', '250', 'BKK']
['3', 'anne', '300', 'BKK']
['4', 'jessica', '400', 'Lon']
['5', 'joy', '800', 'Lon']
```
```py
import csv

data = []
## แนะนำให้ใช้วิธีนี้ช่วย check
try:
    file = open("customers_arpu.csv", "r")
    reader = csv.reader(file)
    for row in reader:
        data.append(row)
    print(data)
    file.close()
except: 
    print("file not found, please check the filename again.")
```
```py
## another way
import csv

data = []

try:
    ## context manager - with ปิดไฟล์ให้อัตโนมัติ
    with open("customers_arpu.csv", "r") as file:
        reader = csv.reader(file)
        for row in reader:
            data.append(row)
        print(data)
except: 
    print("file not found, please check the filename again.")
```
```py
import csv 

with open("customers_arpu.csv", "r") as file:
    ## a reader
    reader = csv.reader(file)
    for row in reader:
        print(row)
```
## 📩 **Read CSV file `import pandas as pd`**
```py
import pandas as pd
df = pd.read_csv("customers_arpu.csv")
df
```
```py
df["arpu"].sum()
result: np.int64(2250)
```
## 📩 How to write a csv file
```py
## how to write a csv file 
## csv.writer()

import csv

## nested list
data = [
    ["Name", "Age", "City"],
    ["Alice", 25, "New York"],
    ["Bob", 30, "London"],
    ["Charlie", 22, "Paris"]
]

with open("example_data.csv", "w") as file:
    writer = csv.writer(file)
    writer.writerows(data)
```
```py
!cat example_data.csv

# result:
Name,Age,City
Alice,25,New York
Bob,30,London
Charlie,22,Paris
```
```py
## how to write a csv file 
## csv.writer()

import csv

## nested list
header = ["Name", "Age", "City"]

data = [
    ["Alice", 25, "New York"],
    ["Bob", 30, "London"],
    ["Charlie", 22, "Paris"]
]

with open("example_data.csv", "w") as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(data)
```
```py
import pandas as pd
df = pd.read_csv("example_data.csv")
df
```
```py
## updata data
df["Age"] += 1
df["Country"] = ["USA", "UK", "France"]
df
```
## 📩 **Write CSV file `import pandas as pd`**
```py
# used pandas write csv file
# write csv
df.to_csv("update_example_data.csv")
```
```py
## Boolean: Crucially, set to False to exclude the DataFrame's row index

df.to_csv('output.csv', index=False)
```
```py
## Set to False to exclude the column names row

df.to_csv('output.csv', header=False)
```
