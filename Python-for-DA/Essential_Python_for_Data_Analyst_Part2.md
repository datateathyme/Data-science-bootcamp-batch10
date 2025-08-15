# 🎄 Essential Python for Data Analyst Part2 - DSB10 🐣
```py
import numpy as np
import pandas as pd
```
```py
# numpy: numerical python
friends = ["jay", "john", "jane"]
```
```py
type(friends)
result: list
```
```py
arr_friends = np.array(friends)
```
```py
arr_friends[0]
result: np.str_('jay')
```
```py
arr_friends[0:4]
result: array(['jay', 'john', 'jane'], dtype='<U4')
```
```py
# exam scores
scores = [90, 80, 95, 100, 50]
```
```py
arr_scores = np.array(scores)

arr_scores
result: array([ 90,  80,  95, 100,  50])
```
```py
np.mean(arr_scores)
result: np.float64(83.0)
```
```py
np.sum(arr_scores)
result: np.int64(415)
```
```py
np.median(arr_scores)
result: np.float64(90.0)
```
```py
np.std(arr_scores)
result: np.float64(17.776388834631177)
```
```py
## array 2d,3d
arr_3d = np.array([[1,2,3], [4,5,6], [7,8,9]])
print(arr_3d)
```
```py
arr_3d[1][2]
result: np.int64(6)
```
```py
arr_3d[0][0]
result: np.int64(1)
```
```py
arr_3d[2][2]
result: np.int64(9)
```
```py
# matrix multiplication (dot)
mat1 = np.array([[1,2], [3,4]])
mat2 = np.array([[3,3], [4,5]])
```
```py
mat1.dot(mat2)
```
```py
np.dot(mat1, mat2)
```
```py
import pandas as pd
import numpy as np

# Create a sample DataFrame with 5 columns and 10 records
data = {
    'StudentID': np.arange(1, 11),
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Emily', 'Frank', 'Grace', 'Henry', 'Ivy', 'Jack'],
    'Age': np.random.randint(18, 22, size=10),
    'Gender': np.random.choice(['Male', 'Female'], size=10),
    'Grade': np.random.randint(70, 101, size=10)
}

student_df = pd.DataFrame(data)
print(student_df)
```
```py
student_df["Age"].mean()
result: np.float64(19.3)
```
```py
np.mean(student_df["Age"])
result: np.float64(19.3)
```
```py
student_df.columns
result: Index(['StudentID', 'Name', 'Age', 'Gender', 'Grade'], dtype='object')
```
```py
student_df[["StudentID", "Name"]].head()
```
### 📩 filter row
```py
# filter row
student_df.query("Age > 20")
```
```py
student_df.query("Gender == 'Female'")
```
```py
student_df.query("Gender == 'Female' & Grade > 90")
```
```py
student_df.query("Gender == 'Female' & Grade > 90")[["Name", "Gender", "Age"]] # filter & select column [[]]
```
## 🐣 **sklearn => machine learning model**
-  Python ML AI > R

```py
from sklearn.linear_model import LinearRegression 
from sklearn.model_selection import train_test_split
```
```py
mtcars = pd.read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")
```
```py
mtcars.head()
```
```py
## prepare data 
X = mtcars.drop(["model", "mpg"], axis = 1) # axis1 == column
y = mtcars["mpg"]
```
## 🐣 **ML workflow**
1. split data
2. train
3. score
4. evaluate

### 🎄 split data
```py
# split data
# sed.seed(42)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size = 0.25, random_state = 42
)
```
### 🎄 train model
```py
# train model
model = LinearRegression()
model.fit(X_train, y_train)
```
### 🎄 prediction
```py
# prediction
p = model.predict(X_test)

p
#result:
array([19.816545  , 10.98232893, 16.31616932, 27.16613904, 28.59706508,
       18.29855129, 14.85758111, 27.41057736])
```
### 🎄 evaluate R-squared
```py
# evaluate R-squared
model.score(X_test, y_test)

result: 0.7856209608689562
```
```py
model.score(X_train, y_train)
result: 0.8667068951242609
```
