# 🎄 Basic Pandas 🐼
**✅ import pandas**
```py
import pandas as pd
```
## 🌴 create dataframe from scratch
```py
# create dataframe from scratch

raw_data = {
    "name": ['Alice', 'Bob', 'Charlie', 'Diana', 'Ethan'],
    "age": [28, 32, 25, 30, 27],
    "gender": ['F', 'M', 'M', 'F', 'M'],
    "country": ['USA', 'Canada', 'USA', 'UK', 'USA']
}

df = pd.DataFrame(raw_data)

df
```
# result:
	name	age	gender	country
0	Alice	28	F	USA
1	Bob	32	M	Canada
2	Charlie	25	M	USA
3	Diana	30	F	UK
4	Ethan	27	M	USA

