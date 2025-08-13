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
## 🎟 recap list
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
## 📒 Dictionary
### ✅ key-value pair (similar to json)
```py
movie = {
    "title": "The Hitchhiker's Guide to the Galaxy",
    "author": "Douglas Adams",
    "publishedYear": 1979,
    "genres": [ "Science fiction","Comedy"],
    "isInPrint": True
}

print(movie)
```
```py
customer_01 = {
    "name": "john wick",
    "age": 50, 
    "fav_movies": ["Superman", "Inside out", "Lion King"],
    "gpa": 3.41
}

customer_01
```
```py
## dictionary is unordered, mutable
customer_01["name"]
result: john wick
```
```py
customer_01["name"].upper()
result: JOHN WICK
```
```py
customer_01["fav_movies"]
result: ['Superman', 'Inside out', 'Lion King']

customer_01["fav_movies"][1]
result: Inside out
```
## 🍅 dictionary method
```py
 ## dictionary method
 list(customer_01.keys())
 result: ['name', 'age', 'fav_movies', 'gpa']
```
```py
list(customer_01.values())
result: ['john wick', 50, ['Superman', 'Inside out', 'Lion King'], 3.41]
```
```py
list(customer_01.items())
# result:
[('name', 'john wick'),
 ('age', 50),
 ('fav_movies', ['Superman', 'Inside out', 'Lion King']),
 ('gpa', 3.41)]
```
### 🍁 create new key
```py
## create new key
customer = customer_01
customer["city"] = "Bangkok"
customer["nationality"] = "American"

customer
```
## ⛔ remove the key (delete key)
```py
## remove the key
del customer["nationality"]
customer
```
```py
# use method to remove
customer.pop("city")
customer
```
### 🍅 update value
```py
## update value
customer["age"] = 51
customer
```
## 🎯The last data structure: set
### ✅ set ie used to find distinct/ unique values
```py
## The last data structure: set
## set ie used to find distinct/ unique values
set([1, 1, 2, 3, 4])
result: {1, 2, 3, 4}
```
```py
set(["orange", "orange", "banana"])
result: {'banana', 'orange'}
```
**✅ set operation ✅ union and intersection**
```py
## set operation 
## union and intersection
mary = {"orange", "apple"}
jay = {"orange", "durian"}

mary | jay # union ตัดค่าซ้ำออก
result: {'apple', 'durian', 'orange'}

mary & jay # intersec รีเทิร์นค่าที่ซ้ำกันออกมา
result: {'orange'}
```
```py
mary - jay # อะไรที่มีใน mary แต่ไม่มีใน jay
result: {'apple'}
```
## 🎯 Recap Data Structures
1. list
2. tuple
3. dictionary
4. set
---
## ✅ Function
**User defined function**
- **the most important thing why we write function**
- **because they are `reusable`**
```py
## the most important thing why we write function
## because they are reusable
def hello():
    print("Hello World!")

hello()
result: Hello World!
```
```py
## default argument
def hello2(name="may"):
    print("Hello " + name)

hello2("jay")
result: Hello jay
```
### 🌴 can we get input from a user?
```py
## can we get input from a user?
def greeting():
    username = input("What's your name: ")
    result = f"Hi {username}"
    print(result)
    action = input("What are you goin to do today? ")
    print(f"You're going to {action}. Great!")
```
```py
greeting()
result:
What's your name: Kevin
Hi Kevin
What are you goin to do today? having lunch
You're going to having lunch. Great!
```
```py
user_age = int(input("How old are you:  "))
print(user_age, type(user_age))
# result:
How old are you:  25
25 <class 'int'>
```
### ✅ function can have more than one paremeters
```py
## function can have more than one paremeters
def my_power(base=2, power=3):
    return base ** power
```
```py
result = my_power(5, 2)
print(result)
result: 25
```
## 🌵 lambda
```py
## regular function
# def double(num):
#     return num*2

## lambda function
double = lambda num: num*2

double(3)
result: 6
```
```py
hello = lambda name: f"Hello {name}"
hello("jay")
```
---
## 🎯 Control Flow
1. if
2. for
3. while
```py
def grading(score):
    if score >= 80:
        return "Passed"
    else:
        return "Failed"

grading(85)
result: Passed
```
```py
def grading(score):
    """
    input: score is a numeric number
    output: grade passed or failed
    """
    if score >= 80:
        return "Passed"
    else:
        return "Failed"

grading(85)
```
### 🍅 multiple if else
```py
## multiple if else
def full_grading(score):
    if score >= 80:
        return "A"
    elif score >= 70:
        return "B"
    elif score >= 60:
        return "C"
    elif score >= 50:
        return "D"
    else:
        return "Retry the exam again."

full_grading(45)
result: Retry the exam again.
```
### 🍅 if multiple condition
```py
## if multiple condition
# morning weekday => cereal
# morning weekend => hamburger
# else => fasting

time = "morning"
day = "weekend"

if time == "morning" and day == "weekday":
    print("I'm eating cereal")
elif time == "morning" and day == "weekend":
    print("I'm eating hamburger")
else:
    print("I'm eating nothing, I'm fasting")

result: I'm eating hamburger
```
## 🎯 recap `for`
```py
## recap for 
shopping_list = ["egg", "milk", "vitamilk", "bread"]

for item in shopping_list:
    if len(item) >= 4:
        print(item)

# result:
milk
vitamilk
bread
```
## 🎯 while loop
```py
## while loop
count = 0
while count < 5:
    print("hello world")
    count += 1
#result
hello world
hello world
hello world
hello world
hello world
```
