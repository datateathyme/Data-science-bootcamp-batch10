# 📂 SQL for Data Analysts 103: A Chinook Database Case Study
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
**🌻select data from multiple tables using 'WHERE' - 'PK = FK'**
```sql
SELECT * FROM artists, albums
WHERE artists.ArtistId = albums.ArtistId;
```
```sql
SELECT 
    A.ArtistId,
    A.Name   AS artist_name,
    B.Title  AS album_name
FROM artists AS A, albums AS B
WHERE A.ArtistId = B.ArtistId -- PK=FK
 AND A.Name LIKE 'C%';
```
**🌻convert 'WHERE' to 'INNER JOIN'**
```sql
SELECT 
    A.ArtistId,
    A.Name   AS artistName,
    B.Title  AS albumName
FROM artists AS A
JOIN albums  AS B
ON A.ArtistId = B.ArtistId
WHERE A.Name LIKE 'C%';
```
```sql
-- Default JOIN = INNER JOIN
SELECT 
    A.ArtistId,
    A.Name   AS artistName,
    B.Title  AS albumName,
    C.Name   AS trackName
FROM artists AS A
JOIN albums  AS B
 ON A.ArtistId = B.ArtistId
JOIN tracks  AS C
 ON C.AlbumId = B.AlbumId
WHERE A.Name LIKE 'C%';
```
```sql
-- count song of 'Aerosmith'
SELECT 
    COUNT(*) AS Aerosmith_Songs
FROM artists AS A
JOIN albums  AS B
 ON A.ArtistId = B.ArtistId
JOIN tracks  AS C
 ON C.AlbumId = B.AlbumId
WHERE A.Name = 'Aerosmith';
```
**🌻review type of JOIN**

![Image](https://github.com/user-attachments/assets/0ca59bad-8b18-4a52-bfaa-6b5f92064f81)

**🌻review create table**
```sql
CREATE TABLE book_shop (
	id INT,
    name TEXT,
  	release_year INT
);

CREATE TABLE favorite_book (
	id INT,
  	author TEXT,
  	reviews REAL
);

INSERT INTO book_shop VALUES
    (1, 'Think Like a Freak', 2014),
    (2, 'Ultralearning', 2019),
    (3, 'Blue Ocean Strategy', 2015),
    (4, 'The Power of Habit', 2012),
    (5, 'Outliers', 2008);
    
INSERT INTO favorite_book VALUES
    (1, 'Steven D. Levitt, Stephen J. Dubner',1904),
    (4, 'Charles Duhigg', 12007),
    (5, 'Malcolm Gladwell', 12063);
```
```sql
SELECT * FROM book_shop;
SELECT * FROM favorite_book;
```
**🌻INNER JOIN and LEFT JOIN**
```sql
-- inner join
SELECT * FROM book_shop  As A
INNER JOIN favorite_book AS B  ON A.id = B.id;

-- the same result join with 'WHERE' clause
SELECT * FROM book_shop, favorite_book
WHERE book_shop.id = favorite_book.id;
```
```sql
-- left join
SELECT * FROM book_shop  AS A 
LEFT JOIN favorite_book  AS B ON A.id = B.id;
```
**🌻CROSS JOIN (aka. Cartesian)**

**🌷cross join ไม่ต้องมี PK=FK (table x table)**
```sql
SELECT * FROM ranks;
SELECt * FROM suits;

-- cross join
SELECT * FROM ranks, suits;

-- หรือเขียนแบบนี้ก็ได้
SELECT * FROM ranks CROSS JOIN suits ORDER BY suit;
```
**🌻Self join - table can join itself (self-join)**
```sql
-- CREATE TABLE
CREATE TABLE employee (
    id INT,
    name TEXT,
    level TEXT,
    manager_id INT 
);

INSERT INTO employee VALUES 
    (1, 'David', 'CEO', NULL),
    (2, 'John', 'SVP', 1),
    (3, 'Mary', 'VP', 2),
    (4, 'Adam', 'VP', 2),
    (5, 'Scott', 'Manager', 3),
    (6, 'Louise', 'Manager', 3),
    (7, 'Kevin', 'Manager', 4),
    (8, 'Takeshi', 'Manager', 4),
    (9, 'Joe', 'AM', 6),
    (10, 'Anna', 'AM', 7);
```
```sql
-- self join
SELECT 
    e1.name  AS staff,
    e1.level AS staff_level,
    e2.name  AS manager,
    e2.level AS manager_level, 
    e1.name || ' reports to ' || e2.name AS comment
FROM employee AS e1, employee AS e2
WHERE e1.manager_id = e2.id
```

**⛱ result**

![Image](https://github.com/user-attachments/assets/802376f3-2538-40fb-a2ee-bb78138a34d1)

**🌻intersect and except**
 - INTERSECT return เฉพาะ distinct rows ที่มีในสองตาราง การใช้งานคล้ายๆ INNER JOIN return row ที่ match ค่ากัน
 - EXCEPT return เฉพาะ distinct rows ในตารางด้านซ้ายที่ ไม่มี ในตารางด้านขวา

```sql
-- คือ id หนังสือ ที่มีอยู่ใน 2 table [Note: เราต้องใส่ id ถ้าใส่ * จะรันไม่ได้]
-- ผลลัพธ์จะรีเทิร์น id 1 , 4, 5 ที่มีใน 2 table 
SELECT id FROM book_shop
INTERSECT -- intersect = which books are in both tables
SELECT id From favourite_book
```
```sql
-- ถ้าอยากรู้ว่า id ไหน ที่มีใน book_shop แต่ไม่มีใน favorite_book ให้ใช้ EXCEPT
SELECT id FROM book_shop
EXCEPT -- except = which books are in the left table, but not in the right tables
SELECT id From favourite_book
```
**🌻Union & Union All**
- Union = คือการเอา 2 table มาต่อกัน แต่ถ้าต้องการเก็บค่า Duplicate ที่ซ้ำกันไว้ให้เติมคำว่า ALL
- [x] Union = จะลบ Duplicate row ทิ้ง
- [x] Union ALL = จะเก็บ Duplicate row ไว้

```sql
--  Union = จะลบ Duplicate row ทิ้ง
SELECT * from book_shop
UNION
SELECT * FROM book_shop_new;
```
```sql
-- Union ALL = จะเก็บ Duplicate row ไว้
SELECT * from book_shop
UNION ALL
SELECT * FROM book_shop_new;
```
**🌻intro to subqueries**
- Subqueries คือเทคนิคการเขียน nested query หรือ 'SELECT ซ้อน SELECT'

```sql

-- basic subqueries in WHERE clause
SELECT * FROM tracks 
WHERE milliseconds = (SELECT max(milliseconds) FROM tracks);

SELECT firstname, lastname, country FROM
 (SELECT * FROM customers
  WHERE country = 'USA')
```
