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
-- combine two columns
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
```sql
SELECT 
    invoicedate,
    billingaddress,
    billingcity,
    total,
    ROUND(total * 0.07,2)  AS vat
FROM invoices;
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
-- join 4 table 
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
```sql
-- นับจำนวนเพลง จับกลุ่มตาม genre
select 
    ge.Name                       AS genreName,
    COUNT(*)                      AS n_track,
    ROUND(AVG(tr.Milliseconds),2) AS avg_mill,
    SUM(tr.Bytes)                 AS sun_bytes
from artists AS ar
JOIN albums  AS al ON ar.ArtistId = al.ArtistId
JOIN tracks  AS tr ON al.AlbumId  = tr.AlbumId
JOIN genres  AS ge ON tr.GenreId  = ge.GenreId
GROUP BY ge.Name
```
### 🌻 Aggregate Function
```sql
SELECT 
    COUNT(*)          AS n,
    AVG(bytes)        AS avg_bytes,
    SUM(bytes)        AS sum_bytes,
    MIN(milliseconds) AS min_mill,
    MAX(milliseconds) AS max_mill
FROM tracks;
```
```sql
-- create new columns
SELECT 
    name,
    ROUND(milliseconds / 60000.0, 2)  AS min,
    ROUND(bytes / (1024*1024.0) , 2)  AS mb
FROM tracks;
```
```sql
SELECT 
    COUNT(*), 
    COUNT(firstname),
    COUNT(company) -- null 49 values
FROM customers;
```
### 🌻 ```CASE WHEN``` == IF
```sql
-- WHEN: condition THEN: 'value'
SELECT 
    firstname,
    company,  
    CASE 
    	WHEN company IS NULL     THEN 'customer'
        WHEN company IS NOT NULL THEN 'corporate'
    END AS segment
FROM customers;
```
```sql
SELECT 
    firstname,
    company,  
    country,
    CASE
    	WHEN country IN ('USA', 'Canada')              THEN 'North America'
        WHEN country IN ('Italy', 'France', 'Belgium') THEN 'Europe'
        ELSE 'other regions'
    END AS region
FROM customers;
```
### 🌻 ```DATETIME``` SQLite
```sql
SELECT 
    invoiceid, 
    invoicedate,
    billingcountry
FROM invoices
WHERE invoicedate BETWEEN '2009-01-01 00:00:00' AND '2009-01-03 00:00:00';

-- 
SELECT 
    invoiceid, 
    invoicedate,
    billingcountry
FROM invoices
WHERE invoicedate <= '2009-01-03 00:00:00';

--
SELECT 
    invoiceid, 
    invoicedate,
    billingcountry
FROM invoices
WHERE invoicedate < '2009-02-01';
```
**🌷 STRFTIME → ปรับ format Time** >>  Note: Date in SQLite = 'Text' 
```sql
SELECT 
    invoicedate,
    STRFTIME('%Y', invoicedate)    AS year,
    STRFTIME('%m', invoicedate)    AS month,
    STRFTIME('%d', invoicedate)    AS day,
    STRFTIME('%Y-%m', invoicedate) AS monthid
FROM invoices
WHERE monthid = '2009-09';

--
Note: */ Date in SQLite = 'Text' */ 
```
### 🌻Common Table Expression (CTE) / using ```WITH clause```
- Common Table Expression (CTE)
- WITH clause / subquery -> การประกาศตัวแปลชั่วคราว
- subquery = query ซ้อน query -> SELECT ซ้อน SELECT
- SELECT ด้านใน รันก่อน ค่อยออกมารัน SELECT ด้านนอก
```sql
-- subquery = query ซ้อน query -> SELECT ซ้อน SELECT
SELECT firstname, lastname, email
FROM (
  SELECT * FROM customers
  WHERE country = 'USA'
)
```
- โจทย์คือ ต้องการทราบชื่อเพลง ที่มีค่า milliseconds > มากว่า  AVG(milliseconds)
```sql
SELECT name FROM tracks
WHERE milliseconds > (
  SELECT AVG(milliseconds) FROM tracks
)
```
- CTE (WITH)
     - CTE(with) --> เป็นการประกาศตัวแปลชั่วคราวขึ้นมาใช้ก่อนเพื่อความสะดวก แล้วค่อยดึงข้อมูลขึ้นมา
     - CTE(with) --> สามารถประกาศได้หลายตัวแปล
```sql
variable1 = (SELECT * ......)
variable2 = (SELECT * ......)
```
```sql
-- CTE (with)
WITH usa_customers AS (
	SELECT * FROM customers
    WHERE country = 'USA'
)

SELECT firstname, email
FROM usa_customers
```
- รายชื่อลูกค้า 5 คนแรกของประเทศ USA ที่ใช้จ่ายกับเรามากที่สุดในปี 2010
```sql
-- CTE (with)
WITH 
	usa_customers AS (
	SELECT * FROM customers
    WHERE country = 'USA'
),
	invoice_y2010 AS (
    SELECT * FROM invoices
    WHERE invoicedate BETWEEN '2010-01-01' AND '2010-12-31'
)

SELECT 
    t1.firstname || ' ' || t1.lastname AS fullName,
    SUM(total)
FROM usa_customers AS t1
JOIN invoice_y2010 AS t2
ON t1.customerid = t2.customerid
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```
### 🌻 window function
- สร้างคอลัมน์ใหม่เข้าไปอยู่ใน Table

```sql
-- create new column : customerid
SELECT 
    ROW_NUMBER() OVER() AS customerid,
    firstname,
    lastname,
    country
FROm customers
```
- รันตัวเลข จับกลุ่มตามประเทศ
```sql
SELECT 
    ROW_NUMBER() OVER(PARTITION BY country) AS customerid, -- รันตัวเลข จับกลุ่มตามประเทศ
    firstname,
    lastname,
    country
FROm customers
```
- แบ่งกลุ่มออกเป็นจำนวนเท่าๆกัน
```sql
-- segmentation
SELECT
    name,
    milliseconds,
    NTILE(5) OVER(ORDER BY milliseconds) AS length_segment -- แบ่งกลุ่มออกเป็น 5 กลุ่ม โดยเรียงความยาวจากน้อยไปมากก่อน แล้วแบ่งออกเป็น5กลุ่ม โดยมีจำนวนเพลงเท่าๆกัน
FROM tracks
```
- แต่ละกลุ่มที่แบ่งออกมาแล้วด้านบน มีจำนวนเพลงกี่เพลง
```sql
SELECT length_segment, COUNT(*) FROM (
   SELECT 
    name,
    milliseconds,
    NTILE(5) OVER(ORDER BY milliseconds) AS length_segment
   FROM tracks
)
GROUP BY length_segment;
```
