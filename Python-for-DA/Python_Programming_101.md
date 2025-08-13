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
## 🆎 Working with String
### ✅ fstring => format string
```py
## fstring => format string
name = "sunsun"
gpa = 3.72

text = f"{name} graduates from RSU with gpa {gpa}"
print(text)
result: sunsun graduates from RSU with gpa 3.72
```
### ✅ long string
```py
## long string
long_str = """ 
I love McDonald's 
Planning to have it for Lunch 
Very Cool!
"""
result:  '\nI love McDonald's \nPlanning to have it for Lunch \nVery Cool!\n'
```
## 🆎 function vs. method 
```py
## function vs. method 
text = "a duck walks into a bar"
len(text)
print(text)
result: a duck walks into a bar
```
```py
## method is a function created specifically to an object
## string method
text.upper()
result: A DUCK WALKS INTO A BAR
```
```py
## replace new value
text = text.replace("duck", "lion")
print(text)
result: a lion walks into a bar
```
```py
text.count("a")
result: 4
```
```py
result = text.split(" ")
print(result)
result: ['a', 'lion', 'walks', 'into', 'a', 'bar']
```
```py
# count
"strawberry".count("r")
result: 3
```
```py
# เชื่อม text (join string)
text = " ".join(result)
print(text)
result: a lion walks into a bar
---
"-".join(result)
result: a-lion-walks-into-a-bar
```
## 🌴 index in python starts with 0
```py
## index in python starts with 0 
text = "python"
text[0]
result: 'p'
---
text[-1]
result: 'n'
```
## 🆎 slice text
```py
## slice text 
text = "python"
text[0:3]
result: 'pyt'
---
text[3:6]
result: 'hon'
---
# ปล่อยว่างไว้ จะดึงค่าที่เหลือมาทั้งหมดเลย
text[1: ]
result: 'ython'
```
## 🆎 text + text
```py
## text + text
"Python" + " is awesome"+ " and I love it"
result: 'Python is awesome and I love it'
```
```py
 ## [start:stop:step]
 "I am learning Python today"[0:15:2]
result: 'Ia erigP'
```
## 🆎 string is immutable
```py
## string is immutable ไม่สามารถอัพเดตค่าได้
text = "python"

text[0] = "c"
TypeError: 'str' object does not support item assignment
```
```py
## how to solve
text = "python"

print("c" + text[1: ])
result: cython
```
## 🔐 **Data Structures**
1. List 
2. Tuple
3. Dictionary
4. Set

```py
## list, ordered, mutable object
shopping_list = ["egg", "milk", "vitamilk", "bread"]

shopping_list
result: ['egg', 'milk', 'vitamilk', 'bread']

len(shopping_list)
result: 4

shopping_list[-4]
result: 'egg'
```
```py
# list can be update value (replace)
shopping_list[0] = "butter"
shopping_list
result: ['butter', 'milk', 'vitamilk', 'bread']
```
- [ ] 🔐 [Python List/Array Methods](https://www.w3schools.com/python/python_ref_list.asp) 
```py
## list method
shopping_list.append("banana")
shopping_list
result: ['butter', 'milk', 'vitamilk', 'bread', 'banana']
```
```py
## ลบ value ตัวสุดท้ายออก
shopping_list.pop()
result: 'banana'
```
```py
# ลบค่าที่ต้องการออก
shopping_list.remove("milk")
result: ['butter', 'vitamilk', 'bread']
```
```py
# .insert(index, "item")
shopping_list.insert(2, "butter")
result: ['butter', 'milk', 'butter', 'milk', 'vitamilk', 'bread']
```
```py
# มีนมกี่กล่อง
shopping_list.count("milk")
result: 2
```
```py
shopping_list.reverse()
shopping_list
result: ['bread', 'vitamilk', 'milk', 'butter', 'milk', 'butter']
```
```py
shopping_list.sort()
shopping_list
result: ['bread', 'butter', 'butter', 'milk', 'milk', 'vitamilk']
```
```py
## list + list 
["item1" , "item2"] + ["item3", "item4"]
result: ['item1', 'item2', 'item3', 'item4']
```
## 🛸 loop through shopping list
```py
## loop through shopping list
for item in shopping_list:
    print(item)

# result
bread
butter
butter
milk
milk
vitamilk
```
```py
for item in shopping_list:
    print("I have to buy " + item)

# result
I have to buy bread
I have to buy butter
I have to buy butter
I have to buy milk
I have to buy milk
I have to buy vitamilk
```
```py
for item in shopping_list:
    if len(item) >= 5:
        continue # ข้ามไปเลย
    else:
        print(f"I need to buy {item}")
# result:
I need to buy milk
I need to buy milk
```
## 🧮 average revenue per user (ARPU)
```py
## average revenue per user (ARPU)
spending = [500, 1200, 800, 300, 900]

for spend in spending:
    if spend >= 900:
        print("high spender")
    else:
        print("low spender")
# result:
low spender
high spender
low spender
low spender
high spender
```
## 🛍 list comprehension 
```py
## list comprehension 
scores = [80, 90, 75, 60, 59, 82]
for score in scores:
    if score >= 80:
        print(score, "passed")
    else:
        print(score, "failed")
# result:
80 passed
90 passed
75 failed
60 failed
59 failed
82 passed
```
```py
## example list comprehension 
scores = [80, 90, 75, 60, 59, 82]

new_scores = [score + 5 for score in scores ]
print(new_scores)
# result : [85, 95, 80, 65, 64, 87]
```
```py
## example list comprehension 
grades = ["passed" if score >= 80 else "failed" for score in scores]
print(grades)
result : ['passed', 'passed', 'failed', 'failed', 'failed', 'passed']
```
## 🎫 tuple, ordered, immutable
```py
## tuple, ordered, immutable
## tuple unpacking
toy, jane, ann = (36, 29, 32)
print(toy, jane, ann)
result: 36 29 32
```
```py
names = ("toy", "joe", "john")
names.index("joe")
```
```py
for name in names:
    print(f"Hello! {name.capitalize()}")
# result
Hello! Toy
Hello! Joe
Hello! John
```
## recap list
```py
## recap list
complex_list = [
    25, "The Dark Knight",
    [1, 2, 3, 4, 5],
    ("hello", "ni hao", "sawasdee")
]

complex_list
result: [25, 'The Dark Knight', [1, 2, 3, 4, 5], ('hello', 'ni hao', 'sawasdee')]
```
```py
complex_list[3][1]
result: 'ni hao'
```
