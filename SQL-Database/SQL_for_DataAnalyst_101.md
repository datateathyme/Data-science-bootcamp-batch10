# 📂 SQL for Data Analysts 101: A Chinook Database Case Study 🌻
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
**🌻select columns**
```sql
SELECT 
    firstname,
    lastname,
    country
FROM customers
LIMIT 10;
```
**🌻create new columns -> fullName & email**
```sql
-- create/ transform columns
SELECT 
    firstname,
    lastname,
    firstname || ' ' || lastname                                             AS fullName,
    LOWER(firstname) || '.'|| LOWER(SUBSTR(lastname,1,2)) || '@company.com'  AS email
FROM customers
LIMIT 10;
```
**🌷result**
![Image](https://github.com/user-attachments/assets/18128d2b-8215-4dd9-a803-4925fec867b5)
**🌻transforming numeric data: minutes & mb**
```sql
SELECT 
    name,
    ROUND(milliseconds / 60000.0, 2)   AS minute,
    ROUND(bytes / (1024*1024.0) , 2)   AS mb
FROM tracks;
```
**🌷result**
![Image](https://github.com/user-attachments/assets/c1231eef-d404-47b8-af77-6bfa7f996f0d)
**🌻customer segmentation: Corporate vs. End Customer**
- CASE WHEN ใช้ในการเขียนเงื่อนไข สร้างคอลัมน์ใหม่ เราจะเขียน CASE WHEN ใน SELECT clause
- 🐣  Note : เปิดด้วย ```CASE``` และปิดท้ายด้วย ```END``` / ```WHEN``` คือเงื่อนไข ส่วน ```THEN``` คือ Value
```sql
-- CASE WHEN
SELECT 
    company,
    CASE 
    	WHEN company is not NULL THEN 'Corporate'
        ELSE 'End Customer'
    END AS segment
FROM customers;
```
**🌻working with Date-Time in SQLite**
```sql
-- STRFTIME is a specific function for SQLite
SELECT 
    invoicedate,
    STRFTIME('%Y', invoicedate)    AS year,
    STRFTIME('%m', invoicedate)    AS month,
    STRFTIME('%d', invoicedate)    AS day,
    STRFTIME('%Y-%m', invoicedate) AS monthid
FROM invoices
WHERE year = '2010';
```
```sql
SELECT 
    invoicedate,
    CAST(STRFTIME('%Y', invoicedate) AS INT)  AS year, -- ใช้ CAST เปลี่ยน data type
    STRFTIME('%m', invoicedate)               AS month,
    STRFTIME('%d', invoicedate)               AS day,
    STRFTIME('%Y-%m', invoicedate)            AS monthid
FROM invoices
WHERE year = 2011;
```
**🌻JOIN table: joining data across multiple tables: Artists, Albums, Tracks**
```sql
-- review join syntax
SELECT 
	A.column,
	B.column
FROM tableA AS A
JOIN tableB AS B
	ON A.primary_key = B.foreign_key;
```
```sql
SELECT 
    ar.ArtistId,
    ar.name  AS artistName,
    al.Title AS albumTitle,
    tr.name  AS trackName,
    tr.Composer
FROM artists AS ar
JOIN albums  AS al
ON ar.ArtistId = al.ArtistId
JOIN tracks  AS tr
ON al.AlbumId = tr.AlbumId
WHERE ar.name = 'BackBeat';
```
**🌻getting random rows**
```sql
-- Exploring Random Tracks
SELECT 
    name,
    RANDOM() -- Random() ไม่ต้องใส่ในนี้ก็ได้ ใส่ใน order by อย่างเดียวก็ได้
FROM tracks
ORDER By RANDOM() DESC
LIMIT 10;
```
```sql
-- ไม่ต้องใส่ RANDOM() ใน SELECT ก็ได้
SELECT 
    name
FROM tracks
ORDER By RANDOM() DESC 
LIMIT 10;
```
