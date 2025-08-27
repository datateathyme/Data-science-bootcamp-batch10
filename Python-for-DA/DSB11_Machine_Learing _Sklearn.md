# 🐣 **Machine Learing - Sklearn - DSB11**

#### **basic ML workflow**
1. split data
2. train model
3. score
4. evaluate
---
## 📑 Template for ML 
## ✅ import modules
```
## sklearn basics
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import pandas as pd
```
## ✅ read data
```py
## read data
mtcars = pd.read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")
mtcars.head()
```
## ✅ prepare data
```py
## prepare data
X = mtcars.drop(["model", "mpg"], axis = 1) ## axis = 1 (column)
y = mtcars["mpg"]
```
## ✅ split data
```py
## split data
## random_state = 42 (set.seed(42))
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)
```
## ✅ train model
```py
## train model
model = LinearRegression()
model.fit(X_train, y_train)
```
## ✅ prediction (score)
```py
## prediction (score)
pred = model.predict(X_test)
```
## ✅ R squared (evaluate)
```py
## R squared (evaluate)
model.score(X_test, y_test)

result 🔐: 0.7856209608689562
```
```py
model.score(X_train, y_train)
result 🔐: 0.8667068951242609
```
---
## 🎯 RandomForestRegressor
```py
from sklearn.ensemble import RandomForestRegressor
```
```py
## train model
model = RandomForestRegressor()
model.fit(X_train, y_train)
```
```py
## prediction (score)
pred = model.predict(X_test)
```
```py
## R squared (evaluate)
model.score(X_test, y_test)
```
```py
model.score(X_train, y_train)
```
---
## 🎯 DecisionTreeRegressor
```py
from sklearn.tree import DecisionTreeRegressor
```
```py
## train model
model = DecisionTreeRegressor()
model.fit(X_train, y_train)
```
```py
## prediction (score)
pred = model.predict(X_test)
```
```py
## R squared (evaluate)
model.score(X_test, y_test)
```
```py
model.score(X_train, y_train)
```
