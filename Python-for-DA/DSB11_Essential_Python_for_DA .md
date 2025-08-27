# 🐣 Essential Python for Data Analyst - DSB11

- **OOP**
- **Pandas / Numpy**
- **Requests**

### 🎯 **OOP: object oriented programming**
```py
## create a new class (cookie cutter)
class Human:
    ## initialazation (create)
    def __init__(self, name, age, country):
        self.name = name
        self.age = age
        self.country = country

    ## string method
    def __str__(self):
        return "I am Human!"
    
    ## your own method
    def greeting(self):
        print(f"Hi! my name is {self.name}")

    ## age + 1
    def get_older(self, year):
        self.age += year
        print(f"Age increases by {year}.")
```
```py
## create a new instance
user1 = Human("jay", 25, "Thailand")
user2 = Human("jenny", 23, "USA")
user3 = Human("jesoo", 21, "UK")
user4 = Human("lisa", 20, "Taiwan")
```
```py
print(user1.name, user2.name, user3.name, user4.name)
result: jay jenny jesoo lisa
```
### 💳Create: Class ATM
```py
## ATM
class ATM:
    def __init__(self, name, bank, balance):
        self.name = name
        self.bank = bank
        self.balance = balance
    
    def check_balance(self):
        print(f"Your balance is {self.balance} $")

    def deposit(self, amount):
        self.balance += amount
        print(f"You just deposit {amount} $")

    def withdraw(self, amount):
        if self.balance >= amount:
            self.balance -= amount
            print(f"You just withdraw {amount} $")
        else:
            print("Insufficient balance!")
    
    def transfer(self, amount, receiver):
        if self.balance >= amount:
            self.balance -= amount
            receiver.balance += amount
            print(f"You just transfer {amount} $ to {receiver.name}")
        else:
            print("Insufficient balance!")
```
```py
binnie = ATM("binnie", "KTB", 5000)
bonnie = ATM("bonnie", "KTB", 10000)
```
## 🎯 **API 101 in Python**
```py
## standard module (library)
import requests
```
```py
url = "https://swapi.info/api/people/1"
```
```py
res = requests.get(url)
```
```py
res.status_code
result: 200 # complete
```
```py
if res.status_code == 200:
    print("Success")
else:
    print("Please check the path again!")
```
