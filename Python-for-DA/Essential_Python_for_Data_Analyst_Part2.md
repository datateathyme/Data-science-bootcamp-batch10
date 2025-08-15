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
