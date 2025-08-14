# 🎄 Essential Python for Data Analyst - DSB10 🐣
### 📑 Outline
- Review data structure
- OOP: Object Oriented Programming
- Request API
- Read SQLite
- Library: numpy
---
## 🎄 Review data sturcture
### ✅ list, tuple, dictionary, set
```py
## Review data sturcture
## list, tuple, dictionary, set
friend_list = ["jay", "john", "joe", 42, 50, 99, [1, 2, 3], {"orange", "banana"}]

len(friend_list)
result: 8

friend_list[7]
result: {'banana', 'orange'}
```
## ⛔ handle the error ดักจับค่า error
- [x] แปลว่า try: ลองๆดูก่อน ถ้าผิด แล้วยอมรับ except: ให้ print......ตามที่เราสั่ง  แต่ถ้าถูกไม่ error ให้ print ตามที่สั่ง
- [x] except: จะรันก็ต่อเมื่อ try: ตรงที่เราลองนั้น error 
```py
## handle the error  
try:
    1/0
except:
    print("There is an error")

result: There is an error
```
```py
try:
    1/1
    print("Okay!")
except:
    print("There is an error")

result: Okay!
```
```py
try:
    name = "sunsun"
    print(sunsun)
except:
    print("This is an error")
finally:
    print("This is the completed")

# result:
This is an error
This is the completed
```
### ✅ dictionary key-vlue pair
```py
## dictionary 
## key-value pair

jay = {
    "name": "jay",
    "age": 25,
    "gender": "male",
    "movie_fav": ["Titanic", "Superman"]
}

jay["movie_fav"][1]
result: Superman
```
### ✅ example loop in dictionary
```py
## example loop in dictionary
fruits = ["orange", "banana", "orange", "orange", "banana"]

result = {} # empty dict

for fruit in fruits:
    if fruit in result:
        result[fruit] += 1
    else:
        result[fruit] = 1

print(result)

result: {'orange': 3, 'banana': 2}
```
---
## 🐣 OOP: Object Oriented Programming
```py
class MooDeng():
    def __init__(self, name, age, species):
        self.name = name
        self.age = age
        self.species = species

md = MooDeng("moodeng", 1, "hippo")
jay = MooDeng("jay", 2, "hippo")

print(md.name, md.age, md.species)
print(jay.name, jay.age, jay.species)
# result:
moodeng 1 hippo
jay 2 hippo
```
### 🛠 create method 
```py
class MooDeng():
    def __init__(self, name, age, species):
        self.name = name
        self.age = age
        self.species = species
    
    def hello(self):
        print("I'm MooDeng!")

    def sleep(self):
        print("I am going to bed now.")
------------------------------------------

md = MooDeng("moodeng", 1, "hippo")

# call method
md.hello()
md.sleep()
# result:
I'm MooDeng!
I am going to bed now.
```
```py
class User():
    ## attribute
    def __init__(self, name, age, gender, city):
        self.name = name
        self.age = age
        self.gender = gender
        self.city = city
    
    ## method
    def upload_image(self):
        ## take image from a user
        print("Upload image successfully!")
    
    def add_age(self):
        self.age += 1
    
    def minus_age(self):
        self.age -= 1 

    ## string representation 
    def __str__(self):
        text = f"{self.name} is a {self.gender}, {self.age} years old. lives in {self.city}"
        return text

------------------------------------------
user1 = User("jay", 25, "male", "Taipei")
user1.name
user1.upload_image()
result: Upload image successfully!
------------------------------------------
print(user1.age)
user1.add_age()
print(user1.age)
# result: 
25
26
------------------------------------------
print(user1)
result: jay is a male, 26 years old. lives in Taipei

------------------------------------------
jenny = User("Jenny", 22, "female", "London")
print(jenny)
result: Jenny is a female, 22 years old. lives in London
```
```py
## Homework
# OOP create ATM
# create 4-5 method
class ATM:
    def __init__(self, name, bank, balance):
        self.name = name
        self.bank = bank
        self.balance = balance
    
    def check_balance(self):
        print(f"Current Balance: {self.balance} $")

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount
        print(f"Withdrawal successful. Please collect your cash ({amount})$.")
    
    def transfer(self, recipient_atm, amount):
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount
        recipient_atm.balance += amount
        print(f"Transfer successful. {amount} $ has been sent to {recipient_atm.name}.")
```
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
```py
# used pandas write csv file
# write csv
df.to_csv("update_example_data.csv")
```

## 🐣 json: javascript object notation => API
```py
## json => API
jay_dict = {
    "name": "jay",
    "age": 25,
    "fav_move": ["Superman", "loki"]
}

jay_dict
```
### ✅ write dict to json file 
```py
import json

# write dict to json file 
with open("jay_data.json", "w") as file:
    json.dump(jay_dict, file)
```
```py
!cat jay_data.json
```
### ✅ read json to dict in python
**import `json`** == **dict in python**

- json.dump( ) # write file
- json.load( ) # read file
```py
## read json to dict in python
with open("jay_data.json", "r") as file:
    data = json.load(file)

print(data, type(data))
```
## 📩 API
```py
import requests
```
```py
from requests import get
```
```py
response = get("https://swapi.info/api/people/1")

response.status_code

result: 200 # code 200 คือดึงมาสำเร็จ success
```
```py
# see result people 1
response.json()

# result:
{'name': 'Luke Skywalker',
 'height': '172',
 'mass': '77',
 'hair_color': 'blond',
 'skin_color': 'fair',
 'eye_color': 'blue',
 'birth_year': '19BBY',
 'gender': 'male',
 'homeworld': 'https://swapi.info/api/planets/1',
 'films': ['https://swapi.info/api/films/1',
  'https://swapi.info/api/films/2',
  'https://swapi.info/api/films/3',
  'https://swapi.info/api/films/6'],
 'species': [],
 'vehicles': ['https://swapi.info/api/vehicles/14',
  'https://swapi.info/api/vehicles/30'],
 'starships': ['https://swapi.info/api/starships/12',
  'https://swapi.info/api/starships/22'],
 'created': '2014-12-09T13:50:51.644000Z',
 'edited': '2014-12-20T21:17:56.891000Z',
 'url': 'https://swapi.info/api/people/1'}
```
```py
response.json()["name"]
result: Luke Skywalker
```
```py
## get data from id 1-5
for i in range(1, 6):
    response = get(f"https://swapi.info/api/people/{i}")
    print(response.json()["name"])

# result:
Luke Skywalker
C-3PO
R2-D2
Darth Vader
Leia Organa
```
```py
## get data from id 1-5
base_url = "https://swapi.info/api/people/"

for i in range(1, 6):
    response = get(base_url + str(i)) ## cast (i) == str because string + string 
    print(response.json()["name"])
```
```py
** recommend this way
## get data from id 1-5
from requests import get
from time import sleep

base_url = "https://swapi.info/api/people/"

for i in range(1, 6):
    response = get(base_url + str(i))
    print(response.json()["name"])
    # best practice
    sleep(2) ## break 2 seconds
```
```py
## get data from id 1-5
from requests import get
from time import sleep

base_url = "https://swapi.info/api/people/"

characters = []

for i in range(1, 6):
    response = get(base_url + str(i))
    response_js = response.json()
    name = response_js["name"]
    height = response_js["height"]
    mass = response_js["mass"]
    result = [name, height, mass]
    characters.append(result)
    sleep(2) ## break 2 seconds

print(characters)
```
```py
## write csv file
header = ["name", "height", "mass"]
with open("starwars.csv", "w") as file:
    writer = csv.writer(file)
    writer.writerow(header)
    writer.writerows(characters)

!cat starwars.csv
```
## 📩 !pip install `gazpacho` for web scraping 
```py
!pip install gazpacho
```
```
!pip list # check package - version 
```
