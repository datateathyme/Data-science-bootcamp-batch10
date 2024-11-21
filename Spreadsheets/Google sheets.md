# 🌻 Welcome to Google sheets world !!
##  📁  Google Sheets : Lessons Learned
**🍔 What did I learn from sprint google sheets**

- [x] Data Entry 
- [x] Array Formular 
- [x] Import Data from URL [ CSV / XML / HTML Table / FEED ]
    - [HW#1 Create an <cafe.xml> file](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%231_cafe.xml)
  
  - **Example Import Data from URL.xml**
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

    - **🏷 If you want to know who is the second author of the third book in bookstore?**
     ```javascript
    You can use the XPath concept to find the answer and select the index you want to know.

    Ex. =IMPORTXML(URL.xml,"/bookstore/book[3]/author[2]")

    Answer: Per Bothner

    ```
    - **🍟 Example in a bookstore scenario:** If you have a digital database of a bookstore, structured in XML or HTML, you could use XPath to:

      1. Locate the third book:  **```//book[3]```**  (This would select the third book element in the document.)
      2. Find the second author of the third book: Assuming the authors are listed in a child element named "author", you might use **```//book[3]/author[2]```** (This would select the second author element within the third book element.)
- [x] Table Function
- [x] Filter and Sort Data
  -  [Click view more: HW#2 Dynamic Sorting](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%232_Dynamic%20Sorting.md)
- [x] Create Conditions
  - multiple conditions using : **``` * (AND) / + (OR)```** 
- [x] Conditional Formatting
  - [Click view more: HW#3 Conditional Formatting](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%233_Conditional%20Formatting.md) 
- [x] Query and Summarize Data
  - *```Example:  =QUERY(EMPLOYEES,"select A, B, C, E where E>= 50000 order by E desc limit 5") :
         👉🏻 ดึงข้อมูลพนักงานที่มีเงินเดือนมากกว่าหรือเท่ากับ 50000 เรียงข้อมูลจากมากไปน้อย เลือกดึงมาแค่ 5 แถวบนสุด```*
  - *```Example: =QUERY(EMPLOYEES,"select sum(E), avg(E), min(E), max(E), count(E)") :
          👉🏻 Aggregate functions [E = Column Salary]```*
  - *```Example: =QUERY(EMPLOYEES,"select F, sum(E), avg(E) group by F") : 👉🏻 ดูผลรวมเงินเดือน และเงินเดือนเฉลี่ย จับกลุ่มตาม Gender```*
- [x] Project Dynamic Query
  - [Click view more: HW#4 Dynamic Query](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%234_Dynamic%20Query.md)
- [x] Vlookup / Xlookup
  - [Click view more: HW#5 Vlookup](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%235_Vlookup.md)
- [x] Working with Date / Text
- [x] Project - Convert TH to EN Date
  - [Click view more: HW#6 Project - Convert TH to EN Date](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%236_Convert%20TH%20to%20EN%20Date.md)
- [x] Project - ID Card Parser
  - [Click view more: HW#7 Project - ID Card Parser](https://github.com/BowlaSunsun/Data-science-bootcamp-batch10/blob/main/Spreadsheets/Homework_ggsheets_dsb10/HW%237_ID%20Card%20Parser.md)
- [x] Pivot Table
  - Example: summarise and create line chart compare total revenue between 2019 and 2020
  ![Comparing Total_rev 2019   2020 _GG4](https://github.com/user-attachments/assets/8a69819f-a525-419e-8547-7cc82a43941f)
  ![Profit   tax](https://github.com/user-attachments/assets/88dcee11-49e2-48b5-a5a6-e45241c6d2d3)

- [x] Replace missing value
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



