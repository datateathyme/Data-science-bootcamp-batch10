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
### 💌 Combine Data Using `||` in SQLite
```sql
-- combine firstname & lastname 
SELECT
    firstname,
    lastname,
    firstname || ' ' || lastname AS full_name
FROM employees;
```
```sql
--- MySQL
SELECT
    firstname,
    lastname,
    CONCAT(firstname, ' ' ,lastname) AS full_name
FROM employees;
```
## 🎯 ตัวอย่างโค้ดเปรียบเทียบ
```sql
-- MySQL
SELECT CONCAT(first_name, ' ', last_name)  AS full_name,
       SUBSTRING(address, 1, 10)           AS short_addr,
       UPPER(city)                         AS city_upper,
       REPLACE(comment, 'foo', 'bar')      AS comment2
FROM users;

-- SQLite (เทียบกับ MySQL)
SELECT first_name || ' ' || last_name      AS full_name,
       substr(address, 1, 10)              AS short_addr,
       UPPER(city)                         AS city_upper,
       REPLACE(comment, 'foo', 'bar')      AS comment2
FROM users;
```
