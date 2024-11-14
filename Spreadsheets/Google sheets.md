# Welcome to Excel world !!
## Google Sheets Part 1 : Lessons Learned
What did I learn from sprint google sheets

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

    **If you want to know who is the second author of the third book in bookstore?**
     ```javascript
    You can use the XPath concept to find the answer and select the index you want to know.

    Ex.=IMPORTXML(URL.xml,"/bookstore/book[3]/author[2]")

    Answer: Per Bothner

    ```
    - **Example in a bookstore scenario:** If you have a digital database of a bookstore, structured in XML or HTML, you could use XPath to:

    1. Locate the third book:  **//book[3]**  (This would select the third book element in the document.)
    2. Find the second author of the third book: Assuming the authors are listed in a child element named "author", you might use **//book[3]/author[2]** (This     would select the second author element within the third book element.)
- Table Function
- Filter and Sort Data 
- Create Conditions
- Conditional Formatting
- Query and Summarize Data
- Project Dynamic Query
- Vlookup
- Working with Date / Text
- Project - Convert TH to EN Date
- Project - Sparkline Basics

