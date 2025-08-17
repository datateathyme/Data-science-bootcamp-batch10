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
    f1()
    f2()
    f3()
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
