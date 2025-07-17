# 🗂 SQL Workshop Part2: A Chinook Database Case Study 🌻
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
## 📝 Example practical queries
**🌻Basic Syntax**
```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```
```sql
-- WHERE clause used to filter condition
SELECT * FROM customers
WHERE customerid = 29 OR customerid = 30;
```
```sql
SELECT * FROM Customers WHERE Age > 30; -- selects customers older than 30
SELECT * FROM Products WHERE Price = 100; -- selects products with a price of 100
```
```sql
-- logical operators = AND, OR, NOT
SELECT * FROM Employees WHERE Department = 'Sales' AND Salary > 50000;
SELECT * FROM Orders WHERE Region = 'North' OR Region = 'South';
SELECT * FROM Students WHERE NOT Grade = 'F';
```
- [x] ```LIKE```: Used for pattern matching with wildcards
- ```%``` Represents zero, one, or multiple characters
- ```_``` Represents a single character

```sql
SELECT * FROM Customers WHERE FirstName LIKE 'J%'; -- names starting with 'J'
SELECT * FROM Products WHERE ProductName LIKE '%apple%'; -- names containing 'apple'
```
