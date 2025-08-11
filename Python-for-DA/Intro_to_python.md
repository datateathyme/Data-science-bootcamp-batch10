# 🌲Review Python Language
```py
# Review Python Language
my_name = "sunsun"
my_age = 25

print(my_name)
print(my_age)
```
## #string & fstring in python
```py
my_name = "sunsun"
my_university = "Rangsit University"

my_long_string = """This is very long 
    This is a second line
    This is a third line
    """

print(my_name, my_university, my_long_string)
```
## #fstring template
```py
# fstring template
my_name = "sunsun"
my_age = 25

text = f"My name is {my_name}, and I am {my_age} year old."
print(text)
```
## #function designed for string (string method)
```py
# function designed for string (string method)
text = "a duck walksk into a bar"

# check type
type(text)
result: str ## string

text.upper()
result: A DUCK WALKSK INTO A BAR

text.lower()
result: a duck walksk into a bar

text.count("a")
result: 4

text.count("duck")
result: 1

## replace 
text2 = text.replace("duck", "lion")
print(text)
print(text2)
# result:
a duck walksk into a bar
a lion walksk into a bar
```
## #list
```py
# list
shopping_list = ['egg', 'milk', 'bread']
print(shopping_list)
result: ['egg', 'milk', 'bread']

## subset 
print(shopping_list[0])
result: egg

print(shopping_list[2])
result: bread

print(shopping_list[0:2])
result: ['egg', 'milk']

print(shopping_list[-1])
result: bread

print(shopping_list[0:3])
['egg', 'milk', 'bread']
```
## #list method = append
```py
shopping_list.append("banana")
print(shopping_list)
result: ['egg', 'milk', 'bread', 'banana']

shopping_list.append("water bottle")
print(shopping_list)
result: ['egg', 'milk', 'bread', 'banana', 'water bottle']
```
## #list method .pop()
✅ ใข้ลบ item ตัวสุดท้ายออกจาก list 
```py
# list method .pop() 
shopping_list.pop()
result: water bottle #item ตัวสุดท้ายโดนลบออกไปแล้ว

shopping_list
result: ['egg', 'milk', 'bread', 'banana']

# count the number of items from the list
len(shopping_list)
result: 4
```
## #dictionary key-value pair
### 🌻create dictionary key-value pair
```py
# dictionary key-value pair

student = {
    "id": 1,
    "name": "Mary",
    "age": 22,
    "movies": ["Spider Man", "Thor", "The Godfather"]
}
```
### 🌻subset
```py
student
# result:
{'id': 1,
 'name': 'Mary',
 'age': 22,
 'movies': ['Spider Man', 'Thor', 'The Godfather']}

type(student)
result: dict

# subset
student['name']
result: Mary

student['movies']
result: ['Spider Man', 'Thor', 'The Godfather']

student['movies'][0]
result: Spider Man
```
### 🌻add new key
```py
# add new key
student['city'] = "London"
student
# result:
{'id': 1,
 'name': 'Mary',
 'age': 22,
 'movies': ['Spider Man', 'Thor', 'The Godfather'],
 'city': 'London'}
```
### 🌻update value
```py
# update value
student['city'] = 'Manchester'
student
# result:
{'id': 1,
 'name': 'Mary',
 'age': 22,
 'movies': ['Spider Man', 'Thor', 'The Godfather'],
 'city': 'Manchester'}
```
### 🌻remove key-value
```py
# remove key-value
del student['city']
student
# result:
{'id': 1,
 'name': 'Mary',
 'age': 22,
 'movies': ['Spider Man', 'Thor', 'The Godfather']}
```
## #user-defined function 
```py
# user-defined function 
def say_hello():
    print("Hello World")
    print("I am learning Python")
    print("It is awesome")

say_hello()
# result:
Hello World
I am learning Python
It is awesome
```
```py
def hello(username):
    print("Hello! " + username)

hello("sunsun")
result: Hello! sunsun
```
```py
def my_sum(val1, val2):
    print(val1 + val2)

my_sum(5, 15)
result: 20
```
```py
## return
def my_sum(val1, val2):
    return val1 + val2

result = my_sum(5, 15)
print(result)
result: 20
```
## #OOP: object oriented programming
```py
class Dog:
    name = "Binnie"
    age = 2
    color = "Brown"
    breed = "Golden Retriever"
```
```py
my_dog = Dog()
type(my_dog)
result: __main__.Dog
```
```py
my_dog.name
result: Binnie

my_dog.breed
result: Golden Retriever
```
```py
class Dog:
    name = "Binnie"
    age = 2
    color = "Brown"
    breed = "Golden Retriever"

    # function (Dog method)
    def bark(self):
        print("Woof! Woof!")
    def sitting(self):
        print("I am sitting now")
    def hungry(self, food_name):
        print(f"I am hungry, I need {food_name}!")

my_dog = Dog()

my_dog.bark()
result: Woof! Woof!

my_dog.sitting()
result: I am sitting now

my_dog.hungry("Pizza")
result: I am hungry, I need Pizza!
```
