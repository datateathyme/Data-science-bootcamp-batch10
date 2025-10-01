# 🆎 String Functions

### 💌 LENGTH
```sql
-- LENGTH() 
SELECT 
	firstname, 
    LENGTH(firstname)
FROM employees
ORDER BY 2;
```
### 💌 UPPER
```sql
-- UPPER()
SELECT 
	firstname, 
    UPPER(firstname)
FROM employees
ORDER BY 2;
```
### 💌 LOWER
```sql
-- LOWER() 
SELECT 
	firstname, 
    LOWER(firstname)
FROM employees
ORDER BY 2;
```
### 💌 LEFT(), SUBSTR()
```sql
-- LEFT() MySQL
SELECT 
	firstname, 
    LEFT(firstname, 2)
FROM employees;

-- SUBSTR() SQLite
SELECT 
    firstname, 
    SUBSTR(firstname, 1, 2)
FROM employees;
```
