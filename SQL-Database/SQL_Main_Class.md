# 🗂 SQL - Database : Main Class 🌻
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
### 🌻```SELECT``` clause
```sql
-- SELECT column FROM table_name;
SELECT 
    firstname,
    lastname,
    country
FROM customers; 
```
```sql
SELECT 
    firstname,
    lastname,
    firstname || ' ' || lastname AS fullName, -- create full name for each customers
    country
FROM customers;
```
```sql
SELECT 
    firstname,
    country,
    SUBSTR(country, 1, 2) 
FROM customers;
```
```sql
SELECT 
    firstname,
   'Hello ' || firstname AS greeting
FROM customers;
```
**🌷 clean data**
```sql
-- COALESCE() replace missing values
SELECT 
    firstname,
    country,
    company,
    COALESCE(company, 'B2C') AS cleanCompany -- เมื่อไหร่ที่เจอค่า NULL ในคอลัมน์ company ให้เปลี่ยนเป็นค่า 'B2C' แทน
FROM customers;
```
### 🌻```WHERE``` clause - filter data (rows)
```sql
SELECT 
    firstname,
    country,
    email
FROM customers
WHERE country = 'Brazil';
```
```sql
SELECT 
    firstname,
    country,
    email
FROM customers
WHERE country = 'Brazil' OR country = 'USA';
```
```sql
SELECT 
    firstname,
    country,
    email
FROM customers
WHERE LOWER(country) IN ('brazil', 'usa', 'united kingdom'); 
```
**🌷 pattern matching**
```sql
SELECT 
    firstname,
    country,
    email
FROM customers
WHERE email LIKE '%@google.com';
```
```sql
SELECT 
    firstname,
    country,
    email
FROM customers
WHERE email LIKE '%@yahoo%';
```
```sql
-- REGEXP()
SELECT 
    firstname,
    country,
    email
FROM customers
WHERE email REGEXP '.+@yahoo.+';
```
