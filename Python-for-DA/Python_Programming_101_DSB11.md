# 🌲 Python Programming 101 - DSB11
*sunsun-datathyme*
1. variable
2. data type
3. data structure
4. control flow
5. function

## 🏡 variable
```py
  # variable
  x = 100
  y = 200
  print(x + y)
```
## 🏡 data types => int, float, string , bool
### 🎯 naming variable => snake case
```py
# naming variable => snake case
# data types => int, float, string , bool
my_name = "jay"
my_age = 25
gpa = 3.72
netflix = True
```
```py
print(my_name, my_age, gpa, netflix)
result: jay 25 3.72 True # data types => string, int, float, bool
```
```py
print("Hello!", "my name is", "jay")
result: Hello! my name is jay
```
## 🏡 create multiple variables (# tuple unpacking)
```py
# create multiple variables
# tuple unpacking
name, age, gpa = "jay", 25, 3.72
print(name, age, gpa)

result : jay 25 3.72
```
## 🏡 replace value
```py
## replace value
my_name = "jay"
my_name = "Jay"
print(my_name)
result: Jay
```
## ⛔ remove varaible
```py
## remove varaible
del my_name
```
## 🏡 data types conversion
### 👉 int( ), folat( ), string ( ), bool( )
```py
## data types conversion
# int(), folat(), string(), bool()
bool(1)
result: True
```
```py
str(100)
result: "100"
```
```py
int("555")
result: 555
```
```py
float("3.41")
result: 3.41
```
## 🏡 get input from user
- [x] รับ input เข้ามาเป็น string เท่านั้น!
```py
input("What's your name: ")
result: What's your name: jay
```
```py
# convert string to int
age = int(input("What's your age: "))
age = 37
```
```py
print(age, type(age))
result: 37 <class 'int'>
```
## 🏡 **fstring template**
```py
## fstring template
my_name = " jay"
my_age = 25
text = f"Hi! my name is {my_name} and my age is {my_age} year old."
print(text)

result: Hi! my name is  jay and my age is 25 year old.
```
## 🏡 **function**
```py
## function 
## defind function
def double(x):
    return x * 2

double(100)
resullt: 200
```
```py
def greeting(name, food):
    text = f"{name} likes to eat {food}"
    return text

greeting("jay", "french fries")
result: jay likes to eat french fries
```
```py
## default argument
def greeting2(name="jay", food="hot dog"):
    text = f"{name} likes to eat {food}"
    return text

greeting2()
result: jay likes to eat hot dog

greeting2("jenny")
result: jenny likes to eat hot dog

greeting("jenny", "coke")
result: jenny likes to eat coke
```
### ✅ function more than one input
```py
## function return more than one input 
def greeting3(x):
    return (x**2, x+2)
```
```py
x, y = greeting3(5)
print(x, y , x + y)
result: 25 7 32
```
```py
## function return more than one input 
def greeting3(x):
    return x**2, x+2 , "useless"

x, y, _ = greeting3(5)
print(x, y)
result: 25 7
```
## 🏡 **modularity (modular programming)**
```py
# modularity (modular programming)
def f1():
    print("hi")

def f2():
    print("hello")

def f3():
    print("ni hao!")

def f4():
    f1() # load data
    f2() # clean data
    f3() # prep data
    print("done!!!")

```
```py
f4()
result:
hi
hello
ni hao!
done!!!
```
## 🏡 **control flow**
### 🎯 **if-else, for, while**
```py
def grade(score):
    if score >= 90:
        return "Passed"
    else: 
        return "Please retake the exam"
```
```py
grade(92)
result: Passed

grade(82)
result: Please retake the exam
```
```py
## if elif else
def grade_adv(score):
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    elif score >= 70:
        return "c"
    else:
        return "Please retake the exam!"
```
```py
grade_adv(65)
result: Please retake the exam!
```
```py
## multiple condition
## and, or
def grade_adv2(score):
    if score >= 90 and score <= 100:
        return "A"
    elif score >= 80 and score < 90:
        return "B"
    else: 
        return "Retake the exam!"
```
```py
def testing():
    if (1+1 == 2 or 2*2 == 4):
        print("correct")
    else:
        print("incorrect")
```
## 🏡 **Python basic Data structure**
1. list (similar to vector in R)
2. tuple
3. dictionary
4. set
### 🎯 1. list (similar to vector in R)
- [x] **## mutable data structure (can be updated data)**
```py
## 1. list (similar to vector in R)
shopping_list = ["egg", "milk", "bread"]

## index starts at zero[0]
print(shopping_list[0])
print(shopping_list[1])
print(shopping_list[2])

## check number of items
print(len(shopping_list))

# result:
egg
milk
bread
3
```
```py
## update value in list
## mutable data structure (can be updated data)
shopping_list[0] = "orange"
shopping_list[1] = "milk 2 gallons"
print(shopping_list)

result: ['orange', 'milk 2 gallons', 'bread']
```
### ✅ **list method**
#### **method is a function designed for a specific data structures/ types**
```py
## list method
## method is a function designed for a specific data structures/ types
shopping_list.append("butter")
print(shopping_list)

result: ['orange', 'milk 2 gallons', 'bread', 'butter']
```
```py
shopping_list.append("banana")
print(shopping_list)
```
```py
len(shopping_list)
```
### ⛔ remove the last item `.pop` (ลบตัวสุดท้ายด้านขวา)
```py
## remove the last item .pop (ลบตัวสุดท้ายด้านขวา)
shopping_list.pop()
print(shopping_list)

result: ['orange', 'milk 2 gallons', 'bread', 'butter']
```
### ⛔ remove item `.remove` (เลือกได้ว่าจะลบตัวไหน)
```py
# remove item (เลือกได้ว่าจะลบตัวไหน)
shopping_list.remove("bread")
print(shopping_list)

result: ['orange', 'milk 2 gallons', 'butter']
```
### ✅ insert item
```py
## insert item
shopping_list.insert(1, "chocolate") # (index, "item")
print(shopping_list)

result: ['orange', 'chocolate', 'milk 2 gallons', 'butter']
```
```py
shopping_list.insert(2, "coke") # (index, "item")
print(shopping_list)

result: ['orange', 'chocolate', 'coke', 'milk 2 gallons', 'butter']
```
## ✅ sort data
```py
## sort data
shopping_list.sort()
print(shopping_list)

result: ['butter', 'chocolate', 'coke', 'milk 2 gallons', 'orange']
```
```py
## sort data descending order
shopping_list.sort(reverse=True) # from Z to A
print(shopping_list)

result: ['orange', 'milk 2 gallons', 'coke', 'chocolate', 'butter']
```
### ✅ **combine two lists**
```py
## combine two lists
full_list = ["egg", "milk"] + ["butter", "coke"]
print(full_list)

result: ['egg', 'milk', 'butter', 'coke']
```
## 🎯 **for loop**
```py
## for loop 
for item in full_list:
    print(item)

result:
egg
milk
butter
coke
```
```py
fruits = ["banana", "orange", "strawberry"]

for fruit in fruits:
    print(fruit)

result:
banana
orange
strawberry
```
```py
for fruit in fruits:
    if fruit == "banana":
        print("The banana is very delicious")
    else:
        print(fruit)

result:
The banana is very delicious
orange
strawberry
```
```py
## mutable vs. immutable
## string is immutable
text = "a duck walk into a bar"
text = text.replace("duck", "lion")
print(text)
: a lion walk into a bar
```
```py
language = "Python"
new_language = "C" + language[1: ]
print(new_language)
: Cython
```
## ✅ mutable 
```py
## mutable
friends = ["jay", "jenny", "joe"]
friends[0] = "jayler"
print(friends)
result: ['jayler', 'jenny', 'joe']
```
## ⛔ immutable 
```py
## immutable
my_name = "Jayler"
"T" + my_name[1: ]
result: Tayler
```
