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
