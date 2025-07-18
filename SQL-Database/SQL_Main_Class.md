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
```sql
SELECT 
    customerid,
    invoicedate,
    total
FROM invoices
WHERE total BETWEEN 7 AND 15
ORDER BY total;
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
### 🌻 create new table
```sql
CREATE TABLE b2b_customers AS 
    SELECT firstname, lastname, company, email, country
    FROM customers
    WHERE company IS NOT NULL
```
### 🌻 join table
```sql
select 
    ar.Name,
    al.Title,
    tr.Name
from artists AS ar
JOIN albums  AS al ON ar.ArtistId = al.ArtistId
JOIN tracks  AS tr ON al.AlbumId = tr.AlbumId
```
```sql
select 
    ar.Name  AS artistName,
    al.Title AS albumName,
    tr.Name  AS trackName,
    ge.Name  AS genreName,
    tr.Milliseconds,
    tr.Bytes
from artists AS ar
JOIN albums  AS al ON ar.ArtistId = al.ArtistId
JOIN tracks  AS tr ON al.AlbumId  = tr.AlbumId
JOIN genres  AS ge ON tr.GenreId  = ge.GenreId
```
