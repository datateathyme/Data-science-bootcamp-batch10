# 📂 SQL for Data Analysts 102: A Chinook Database Case Study
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
**🌻filter data part1**
```sql
SELECT * FROM customers
WHERE firstname = 'Leonie';
```
```sql
SELECT * FROM customers
WHERE country = 'USA'; -- key ที่ค้นหาต้องเหมือนในคอลัมน์เป๊ะๆ

-- ถ้าไม่แน่ใจว่าตัวอักษรในคอลัมน์นั้นเป็นตัวพิมพ์เล็กหรือพิมพ์ใหญ่ให้เปลี่ยนชื่อคอลัมน์เป็นตัวพิมพ์เล็กหรือพิมพ์ใหม่ทั้งหมดไปเลย
SELECT * FROM customers
WHERE LOWER(country) = 'usa'; -- เปลี่ยนตัวอักษรในคอลัมน์ให้เป็นตัวพิมพ์เล็กทั้งหมดเพื่อง่ายต่อการค้นหา

SELECT * FROM customers
WHERE LOWER(country) = 'united kingdom';
```
- `AND` สองเงื่อนไขเป็นจริงทั้งคู่
- `OR` เงื่อนไขใดเงื่อนไขหนึ่งเป็นจริง
```sql
-- AND เชื่อม 2 เงื่อนไขที่เป็นจริงทั้งคู่
SELECT * FROM customers
WHERE country = 'USA' AND state = 'CA' ;
```
```sql
-- OR "หรือ" เงื่อนไขใดเงื่อนไขหนึ่งเป็นจริงจะดึงผลลัพธ์ออกมาให้เรา
SELECT * FROM customers
WHERE country = 'USA' OR country = 'Canada' ;
```
```sql
-- NOT operator == กรองเงื่อนไขที่เราไม่ต้องการออก
SELECT * FROM customers
WHERE NOT (country = 'USA' OR country = 'Canada' OR country = 'France');

-- NOT IN
SELECT * FROM customers
WHERE country NOT IN ('USA', 'Canada', 'France'); -- เขียนแบบนี้สั้นกว่า
```
**🌻filter data part2**
```sql
-- IN operator
SELECT * FROM customers
WHERE country IN ('Brazil', 'Germany', 'Norway')
ORDER BY country;
```
```sql
-- BETWEEN AND
SELECT * FROM customers
WHERE customerid BETWEEN 5 AND 10; -- inclusive คือ รวมเลข 5 กับ 10 เข้ามาด้วย 

-- ได้ผลลัพธ์เหมือนด้านบนแต่เขียนยาวกว่า
SELECT * FROM customers
WHERE customerid >= 5 AND customerid <= 10;
```
```sql
-- BETWEEN AND with DATE TIME column
SELECT invoicedate FROM invoices
WHERE invoicedate BETWEEN '2009-02-01' AND '2009-02-31';

SELECT invoicedate FROM invoices
WHERE invoicedate BETWEEN '2009-01-01 00:00:00' AND '2009-01-31 20:00:00';
```
- ```NULL```
```sql
-- filter values is not Null 
SELECT * FROM customers
WHERE company IS NOT NULL; -- filter value IS NOT NULL

-- filter Null valuse
SELECT * FROM customers
WHERE company IS NULL;
```
**🌻filter data part3 -- pattern matching**
- [x] Wildcards
  - ```%``` matches any number of characters (0 or more)
  - ```_``` matches single character
  - ข้อจำกัดของ ```LIKE``` คือเป็นการ match แบบ case-insensitive แปลว่า ```J_HN และ j_hn``` จะได้ผลลัพธ์เหมือนกัน
```sql
-- wildcard '%' {matching}
SELECT 
    firstname, 
    lastname, 
    country,
    email
FROM customers
WHERE email LIKE '%@gmail.com'; -- หา email ลูกค้าที่ลงท้ายด้วย '@gmail.com'

SELECT 
    firstname, 
    lastname, 
    country,
    email
FROM customers
WHERE email LIKE '%@gmail.com'AND country = 'USA'; -- AND country in USA
```
```sql
-- NOT LIKE
SELECT 
    firstname, 
    lastname, 
    country,
    email
FROM customers
WHERE email NOT LIKE '%@hotmail.com';
```
```sql
-- Find customers with phone number include 99
SELECT 
    firstname, 
    lastname, 
    country,
    email,
    phone
FROM customers
WHERE phone LIKE '%99%'; -- เลข 99 จะอยู่ตำแหน่งก็ได้ ถ้าใส่ '%_%'
```
```sql
-- wildcard '_'
-- Find customers firstname like 'John' etc.
SELECT 
    firstname, 
    lastname, 
    country,
    email,
    phone
FROM customers
WHERE firstname LIKE 'J_hn'; -- matching 1 character

-- Find customers firstname like 'Roberto' etc.
SELECT 
    firstname, 
    lastname, 
    country,
    email,
    phone
FROM customers
WHERE firstname LIKE 'Rober__' -- matching 2 character
```
**🌻COALESCE -- manipulate NULL/missing values**
- Replace missing value = แทนที่ค่า null ด้วยคำที่เราต้องการ โดยใช้ ```COALESCE```
- ชื่อคอลัมน์ที่ตั้งใหม่หลัง AS ถ้าต้องการมีช่องว่างให้ใส่  ```‘ single_quote ’```  
```sql
-- แทนที่ค่า NULL / missing values
SELECT 
    company,
    COALESCE(company, 'End Customer') AS CompanyClean -- แทนที่ NULL เลือกคอลัมน์และแทนที่ด้วยค่าใหม่ที่ต้องการ 
FROM customers;

SELECT 
    company,
    COALESCE(company, 'End Customer') AS 'Company Clean' -- ใส่ '' ถ้าอยากตั้งชื่อแบบมี space
FROM customers;
```
- เราสามารถใช้ ```CASE WHEN``` เพื่อเขียนเงื่อนไข ทำความสะอาดข้อมูลคอลัมน์ที่มีค่า ```NULL``` ได้ตามตัวอย่างด้านล่าง
```sql
SELECT 
    company,
    COALESCE(company, 'End Customer') AS 'Company Clean',
    CASE 
    	WHEN company IS NULL THEN 'End Customer'
        ELSE company -- แทนที่ด้วยค่าเดิม
    END AS 'Company Clean2'
FROM customers;

SELECT 
    company,
    COALESCE(company, 'End Customer') AS 'Company Clean',
    CASE 
    	WHEN company IS NULL THEN 'End Customer'
        ELSE 'Corporate' -- แทนที่ด้วยค่าใหม่
    END AS segment
FROM customers;
```
**🌻JOIN data using ```WHERE```**
- วิธีการดึงข้อมูลจากหลายตารางด้วย ```WHERE``` clause เทียบเท่ากับการเขียน ```INNER JOIN```
- หัวใจของการดึงข้อมูลแบบ JOIN คือ ```primary key = foreign key``` {PK=FK}

```sql
** WHERE clause

SELECT * FROM table1 , table2
WHERE table1.ArtistId = table2.ArtistId

----------------------------------------
** compare inner join

SELECT * FROM table1 JOIN table2
ON table1.ArtistId = table2.ArtistId
```
```sql
-- join table with 'WHERE' clause
SELECT * FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId; -- PK = FK

-- select column
SELECT 
    artists.ArtistId,
    artists.name AS artist_name,
    albums.title AS album_name
FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId -- PK = FK
 AND artists.ArtistId IN (8, 100, 120); -- ศิลปิน id นี้ออกมาแล้วกี่ album
```
```sql
-- JOIN ON
SELECT * FROM artists
JOiN albums
ON artists.ArtistId = albums.ArtistId;
```
```sql
-- join 3 table with 'WHERE' clause
SELECT 
    artists.ArtistId,
    artists.name AS artist_name,
    albums.title AS album_name,
    tracks.name  AS track_name
FROM artists, albums, tracks
WHERE artists.ArtistId = albums.ArtistId
 AND albums.AlbumId = tracks.AlbumId
 AND artists.ArtistId = 100;
```
**🌻Aggregate functions**
```sql
-- Aggregate functions
SELECT 
    ROUND(AVG(milliseconds),2)  AS avg_mill, -- ROUND ปรับทศนิยมให้เหลือ 2 จุด
    SUM(milliseconds)           AS sum_mill,
    MIN(milliseconds)           AS min_mill,
    MAX(milliseconds)           AS max_mill,
    COUNT(milliseconds)         AS count_mill
FROM tracks;
```
**🌻COUNT Distinct**
```sql
-- UNIQUE value
-- ลูกค้าทั้งหมดมี 59 คน มาจาก 24 ประเทศ
SELECT 
    COUNT(DISTINCT(country)) AS n_country,
    COUNT(*)                 AS n_customer
FROM customers;
```
**🌻```GROUP BY```**
```sql
-- GROUP BY
SELECT 
    country,
    COUNT(*) AS count_country
FROM customers
GROUP BY country -- คอลัมน์ไหนอยู่ใน GROUP BY คอลัมน์นั้นต้องอยู๋ใน SELECT ด้วย
ORDER By count_country DESC; -- sort data in descending order 
```
```sql
-- Aggregate, join table, group by, order by, limit
SELECT 
    genres.name,
    COUNT(*) AS count_song
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.name
ORDER BY count_song DESC
LIMIT 5;
```
**🌻```HAVING``` -- filter after group by**
```sql
-- ใช้กรองข้อมูลหลัง GROUP BY
-- กรองกลุ่มที่เราต้องการ
SELECT 
    genres.name,
    COUNT(*) AS count_song
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId -- WHERE filter table -> filter เพลง 'Rock' ทิ้งก่อนไปทำ GROUP BY
 AND genres.name <> 'Rock' -- <> คือ ไม่เท่ากับ
GROUP BY genres.name
HAVING count_song >= 100 -- HAVING filter GROUP
ORDER BY count_song DESC;
```
**🌻```ORDER BY``` - sort data**
```sql
SELECT 
    genres.name,
    COUNT(*) AS count_song
FROM genres, tracks
WHERE genres.GenreId = tracks.GenreId
GROUP BY genres.name
ORDER BY count_song DESC -- sort data in descending order
LIMIT 5; -- limit top 5
```
```sql
SELECT 
    genres.name,
    COUNT(*) AS count_song
FROM genres 
JOIN tracks
 ON genres.GenreId = tracks.GenreId
GROUP BY genres.name
ORDER BY count_song DESC
LIMIT 5;
```
