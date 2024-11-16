# 🌻 Welcome to Google sheets world !!
##  📁  Google Sheets Part 1 : Lessons Learned
**🍔 What did I learn from sprint google sheets**

- Data Entry 
- Array Formular 
- Import Data from URL [ CSV / XML / HTML Table / FEED ]
  
   **Example Import Data from URL.xml**
    - [example data /bookstore.xml](https://raw.githubusercontent.com/toyeiei/jetbrains-python/master/bookshop.xml)
     ```javascript
     =IMPORTXML(URL.xml,"//title")
     ```
     ```javascript
    =IMPORTXML(URL.xml,"//Author")
     ```
    | Book name  | Author |
    | ----------- | ----------- |
    | Everyday Italian | Giada De Laurentiis|
    | Harry Potter| J K. Rowling |
    | XQuery Kick Start | James McGovern |
    | Learning XML | Erik T. Ray |

    **🏷 If you want to know who is the second author of the third book in bookstore?**
     ```javascript
    You can use the XPath concept to find the answer and select the index you want to know.

    Ex. =IMPORTXML(URL.xml,"/bookstore/book[3]/author[2]")

    Answer: Per Bothner

    ```
    - **🍟 Example in a bookstore scenario:** If you have a digital database of a bookstore, structured in XML or HTML, you could use XPath to:

      1. Locate the third book:  **```//book[3]```**  (This would select the third book element in the document.)
      2. Find the second author of the third book: Assuming the authors are listed in a child element named "author", you might use **```//book[3]/author[2]```** (This would select the second author element within the third book element.)
- Table Function
- Filter and Sort Data 
- Create Conditions
  - multiple conditions using : **``` * (AND) / + (OR)```** 
- Conditional Formatting
  - [Click view more conditional formatting](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%233_Conditional%20Formatting.md) 
- Query and Summarize Data
  - **```Example:  =QUERY(EMPLOYEES,"select A, B, C, E where E>= 50000 order by E desc limit 5") :
          ดึงข้อมูลพนักงานที่มีเงินเดือนมากกว่าหรือเท่ากับ 50000 เรียงข้อมูลจากมากไปน้อย เลือกดึงมาแค่ 5 แถวบนสุด```**
- Project Dynamic Query
- Vlookup
- Working with Date / Text
- Project - Convert TH to EN Date
- Project - Sparkline Basics
- Replace missing value
  - Deletion:
    - Remove rows or columns with missing values.
    - Suitable when the number of missing values is small and doesn't significantly impact the analysis.
  - Imputation:
    - Replace missing values with estimated values.
    - Common methods include:
      1. Mean imputation: Replace with the mean of the column.
      2. Median imputation: Replace with the median of the column.
      3. Mode imputation: Replace with the mode of the column.
      4. Regression imputation: Predict missing values using regression models.
      5. K-nearest neighbors imputation: Impute missing values based on similar data points.   



