## 🐣 **Essential Python for DA Part2-DSB 11**
### **Key Concepts in Programming**
1. Variable
2. Type
3. Structure
4. Control flow
5. Function

---
## 💳 special topics in Python
```py
## type hint

name: str = "jay"
age: int = 25
gpa: float = 3.72
netflix: bool = True
```
```py
type(name), type(age), type(gpa), type(netflix)
result: (str, int, float, bool)
```
```py
## type hint in function
## optional
def add(a: int, b: int) -> int:
    return a + b

add(5, 5)
result : 10
```
```py
from typing import List
```
```py
friends: List[str] = ["jay", "joe", "jenny"]

for f in friends:
    print(f"Hi! {f}")

result:
Hi! jay
Hi! joe
Hi! jenny
```
```py
## lambda one-liner function
add_lambda = lambda a, b: a + b

add_lambda(5, 5)
result: 10
```
```py
## list comprehension
result = []
original = [1, 2, 3, 4, 5]

for number in original:
    result.append(number * 2)

print(result)
result: [2, 4, 6, 8, 10]
```
```py
## list comprehension
[number * 2 for number in original]
result: [2, 4, 6, 8, 10]
```
```py
## grade ## list comprehension
## score >= 80, passed or failed
scores = [88, 75, 72, 90, 95]
grade = ["passed" if score >= 80 else "failed" for score in scores]
```
```py
## original 
for score in scores:
    if score >= 80:
        print("passed")
    else:
        print("failed")
```
## 💳 try - except working with error 
```py
## try - except working with error 

try:
    result = 1/0
    print(result)
except:
    print("cannot divide by zero")

result 🔐 cannot divide by zero
```
```py
## try print a variable

try:
    print(datarockie)
except:
    print("no variable called 'datarockie'")

result 🔐 no variable called 'datarockie'
```
