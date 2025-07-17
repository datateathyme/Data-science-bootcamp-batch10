# 🗂 SQL Workshop Part2: A Chinook Database Case Study 🌻
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
## 📝 Example practical queries
### 🌻Basic Syntax ```WHERE```
```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```
- [x] 🌷 **Comparison Operators**
- ```=```  Equal to
- ```<>``` or ```!=``` Not equal to
- ```>``` Greater than
- ```<``` Less than
- ```>=``` Greater than or equal to
- ```<=``` Less than or equal to

```sql
SELECT * FROM Customers WHERE Age > 30; -- selects customers older than 30
SELECT * FROM Products  WHERE Price = 100; -- selects products with a price of 100
```
- [x] 🌷 **Logical Operators**
- ```AND```: combines two or more conditions. ```All conditions must be 'TRUE'```
- ```OR```: combines two or more conditions. ```At least one condition must be 'TRUE'```
- ```NOT```: negates a condition

```sql
-- WHERE clause used to filter condition
SELECT * FROM customers
WHERE customerid = 29 OR customerid = 30;
```
```sql
-- logical operators = AND, OR, NOT
SELECT * FROM Employees WHERE Department = 'Sales' AND Salary > 50000;
SELECT * FROM Orders    WHERE Region = 'North' OR Region = 'South';
SELECT * FROM Students  WHERE NOT Grade = 'F';
```
- [x] 🌷 **```LIKE```: used for pattern matching with wildcards**
- ```%``` represents zero, one, or multiple characters
- ```_``` represents a single character

```sql
SELECT * FROM Customers WHERE FirstName   LIKE 'J%'; -- names starting with 'J'
SELECT * FROM Products  WHERE ProductName LIKE '%apple%'; -- names containing 'apple'
SELECT * FROM Customers WHERE FirstName   LIKE 'J_hn'; 
```
- [x] 🌷 **```IN```: specifies a list of possible values for a column**

```sql
SELECT * FROM Employees WHERE City IN ('London', 'Paris', 'Berlin');
```
- [x] 🌷 **```BETWEEN...AND...```: selects values within a specified inclusive range**

```sql
SELECT * FROM Products WHERE Price BETWEEN 50 AND 100;
```
- [x] 🌷 **```IS NULL / IS NOT NULL```: checks for NULL (missing) values.**

```sql
SELECT * FROM Customers WHERE Email IS NULL;
SELECT * FROM Employees WHERE PhoneNumber IS NOT NULL;
```













