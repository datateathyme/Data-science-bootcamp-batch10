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
my_university = "Rangsit U."

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
