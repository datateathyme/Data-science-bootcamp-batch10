# 🌲 Python Programming 101 - DSB10
## 🐣 Basic `Python` for Data Analyst (Beginner)
- variable
- data type
- data structure
- control flow
- function
### R vs . Python
- R for small data, prototyping
- Python for larger data, software, data science, ai, app
- R is statistical language vs. Python is a general language
- R is specialist (stats)
- Python is generalist (app, data, software, ai)
## 📩 variable
```py
## 1. variable  
x = 100
y = 200
print(x + y)
```
```py
my_university_name = "Rangsit"
print(my_university_name)
```
```py
# delete variable
del my_university_name
```
```py
## replace value
x = 100
x =150
print(x)
```
```py
# ประกาศตัวแปร บรรทัดเดียวกันเลย
x, y, z = 1,"math", 3
print(x, y, z)
```
```py
## variable
my_name = "jane"
age = 25
friends = ["ann", "mae", "joe"] # list อัพเดตค่าได้
fav_food = ("hotdog", "coke", "french fries") # tuple อัพเดตค่าไม่ได้
```
### 🍁 list[ ] vs. tuple( )
- [x] `list ` mutable อัพเดตค่าได้
- [x] `tuple` immutable อัพเดตค่าไม่ได้
```py
# update value in list
friends[0] = "kittipong"

friends
result: ['kittipong', 'mae', 'joe']
```
---
## 📩 data types
### ✅ int, float, str, bool
```py
## data types
## int, float, str, bool
age = 25
type(age)
result: int
```
```py
gpa = 3.72
type(gpa)
result: float
```
```py
name = "sunsun"
type(name)
result: str
```
```py
result = age < 40
print(result, type(result))
result: True <class 'bool'>
```
```py
my_bool = True, False, True
print(my_bool, type(my_bool))
result: (True, False, True) <class 'tuple'>
```
```py
my_bool = [True, False, True]
print(my_bool, type(my_bool))
result: [True, False, True] <class 'list'>
```
## 📩 convert type
```py
## convert type
str(25)
result: '25'
```
```py
int("25")
result: 25
```
```py
float("25")
result: 25.0
```
```py
## True = 1, False = 0
bool(0)
result: False
```
