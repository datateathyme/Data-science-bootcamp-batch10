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
