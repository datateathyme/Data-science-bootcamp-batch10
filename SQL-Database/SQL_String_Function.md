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
### 💌 LEFT(), RIGHT(), SUBSTR()
**first_two_chars**
```sql
-- LEFT() MySQL
SELECT 
	firstname, 
    LEFT(firstname, 2)
FROM employees;

-- SUBSTR() SQLite
SELECT 
    firstname, 
    SUBSTR(firstname, 1, 2) --ตัดตั้งแต่ตัวที่1 ตัดมา2ตัวอักษร
FROM employees;
```
## ♻ Order of the arguments
- MySQL LOCATE Syntax: `LOCATE(substring, string)`
- SQLite INSTR Syntax: `INSTR(string, substring)`

### 💌 LOCATE(), INSTR()
```sql
-- MySQL
SELECT LOCATE('x', 'Alexander');
```
```sql
-- SQLite
SELECT INSTR('Alexander', 'x');
```
### 💌 Combine
```sql
-- combine firstname & lastname 
SELECT
    firstname,
    lastname,
    firstname || ' ' || lastname AS full_name
FROM employees;
```
