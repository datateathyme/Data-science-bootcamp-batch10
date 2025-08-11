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
