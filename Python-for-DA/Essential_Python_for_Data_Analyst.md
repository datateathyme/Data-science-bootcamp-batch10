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
## 📩 !pip install `gazpacho` for web scrapping
```py
!pip install gazpacho
```
```
!pip list # check package - version 
```
