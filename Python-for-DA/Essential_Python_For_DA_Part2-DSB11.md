## 🐣 **Essential Python for DA Part2-DSB 11**
### **Key Concepts in Programming**
1. Variable
2. Type
3. Structure
4. Control flow
5. Function

---
## 💳 special topics in Python
```py
## type hint

name: str = "jay"
age: int = 25
gpa: float = 3.72
netflix: bool = True
```
```py
type(name), type(age), type(gpa), type(netflix)
result: (str, int, float, bool)
```
```py
## type hint in function
## optional
def add(a: int, b: int) -> int:
    return a + b

add(5, 5)
result : 10
```
```py
from typing import List
```
```py
friends: List[str] = ["jay", "joe", "jenny"]

for f in friends:
    print(f"Hi! {f}")

result:
Hi! jay
Hi! joe
Hi! jenny
```
```py
## lambda one-liner function
add_lambda = lambda a, b: a + b

add_lambda(5, 5)
result: 10
```
```py
## list comprehension
result = []
original = [1, 2, 3, 4, 5]

for number in original:
    result.append(number * 2)

print(result)
result: [2, 4, 6, 8, 10]
```
```py
## list comprehension
[number * 2 for number in original]
result: [2, 4, 6, 8, 10]
```
```py
## grade ## list comprehension
## score >= 80, passed or failed
scores = [88, 75, 72, 90, 95]
grade = ["passed" if score >= 80 else "failed" for score in scores]
```
```py
## original 
for score in scores:
    if score >= 80:
        print("passed")
    else:
        print("failed")
```
## 💳 try - except working with error 
```py
## try - except working with error 

try:
    result = 1/0
    print(result)
except:
    print("cannot divide by zero")

result 🔐 cannot divide by zero
```
```py
## try print a variable

try:
    print(datarockie)
except:
    print("no variable called 'datarockie'")

result 🔐 no variable called 'datarockie'
```
```py
## try print a variable
datarockie = 500

try:
    print(datarockie)
except:
    print("no variable called 'datarockie'")
else:
    print("the value is printed")

🔐
500
the value is printed
```
```py
## try print a variable
datarockie = 500

try:
    print(datarockie)
except NameError:
    print("no variable called 'datarockie'")
except ZeroDivisionError:
    print("cannot divide by zero")
except ValueError:
    print("check your value")
else:
    print("the value is printed")
finally:
    print("the end")
```
---
## 🎯 **How to read csv file in Pyhton**
```py
## how to read csv file in Pyhton
import csv
```
```py
try:
    with open("customers_arpu.csv", "r") as file:
        reader = csv.reader(file)
        for row in reader:
            print(row)
except:
    print("file not found")
```
```py
## read file
result = []

try:
    with open("customers_arpu.csv", "r") as file:
        reader = csv.reader(file)
        for row in reader:
            result.append(row)
except:
    print("file not found")
```
```py
## convert result to DataFrame
result_df = pd.DataFrame(result)
print(result_df)
```
```py
## read csv with pandas
import pandas as pd 

try:
    df = pd.read_csv("customers_arpu.csv")
    print(df)

except FileNotFoundError:
    print("Error: The file 'customers_arpu.csv' was not found.")
```
## 🎯** write csv file**
```py
## write csv file
import csv

header = ["id", "student_name", "age"]
body = [
    [1, "jay", 25],
    [2, "ann", 22],
    [3, "joe", 28]
    ]

with open("new_file.csv", "w") as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(body)
```
```py
!cat new_file.csv
```
## 🎯 with + try
```py
## with + try
try:
    with open("new_file.csv", "r") as file:
        reader = csv.reader(file)
        for row in reader:
            print(row)
except:
    print("file not found")
```
