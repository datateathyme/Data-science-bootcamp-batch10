# 🗂 SQL Workshop Part2: A Chinook Database Case Study 🌻
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
## 📝 Example practical queries
### 🌻Basic Syntax ```WHERE```
```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```
- [x] 🌷 **Comparison Operators**
- ```=```  Equal to
- ```<>``` or ```!=``` Not equal to
- ```>``` Greater than
- ```<``` Less than
- ```>=``` Greater than or equal to
- ```<=``` Less than or equal to

```sql
SELECT * FROM Customers WHERE Age > 30; -- selects customers older than 30
SELECT * FROM Products  WHERE Price = 100; -- selects products with a price of 100
```
- [x] 🌷 **Logical Operators**
- ```AND```: combines two or more conditions. ```All conditions must be 'TRUE'```
- ```OR```: combines two or more conditions. ```At least one condition must be 'TRUE'```
- ```NOT```: negates a condition

```sql
-- WHERE clause used to filter condition
SELECT * FROM customers
WHERE customerid = 29 OR customerid = 30;
```
```sql
-- logical operators = AND, OR, NOT
SELECT * FROM Employees WHERE Department = 'Sales' AND Salary > 50000;
SELECT * FROM Orders    WHERE Region = 'North' OR Region = 'South';
SELECT * FROM Students  WHERE NOT Grade = 'F';
```
- [x] 🌷 **```LIKE```: used for pattern matching with wildcards**
- ```%``` represents zero, one, or multiple characters
- ```_``` represents a single character

```sql
SELECT * FROM Customers WHERE FirstName   LIKE 'J%'; -- names starting with 'J'
SELECT * FROM Products  WHERE ProductName LIKE '%apple%'; -- names containing 'apple'
SELECT * FROM Customers WHERE FirstName   LIKE 'J_hn'; 
```
```sql
SELECT 
    ar.ArtistId  AS ID,
    ar.Name      AS artistName,
    al.Title     AS albumsName
FROM artists     AS ar, albums  AS al
WHERE ar.ArtistId = al.ArtistId 
  AND ar.Name  LIKE 'C%'
  AND al.Title LIKE 'C%';
```
```sql
-- covert to INNER JOIN
SELECT 
    ar.ArtistId  AS ID,
    ar.Name      AS artistName,
    al.Title     AS albumsName
FROM artists     AS ar 
JOIN albums      AS al
 ON ar.ArtistId = al.ArtistId
 AND ar.Name  LIKE 'C%'
 AND al.Title LIKE 'C%';
```
- [x] 🌷 **```IN```: specifies a list of possible values for a column**

```sql
SELECT * FROM Employees WHERE City IN ('London', 'Paris', 'Berlin');
```
- [x] 🌷 **```BETWEEN...AND...```: selects values within a specified inclusive range**

```sql
SELECT * FROM Products WHERE Price BETWEEN 50 AND 100;
```
- [x] 🌷 **```IS NULL / IS NOT NULL```: checks for NULL (missing) values.**

```sql
SELECT * FROM Customers WHERE Email IS NULL;
SELECT * FROM Employees WHERE PhoneNumber IS NOT NULL;
```

### 🌻 Join Table 
- [x] **🌷 join 4 table**
```sql
SELECT 
    artists.ArtistId,
    artists.Name  AS artistName,
    albums.Title  AS albumName,
    tracks.Name   AS tracksName,
    genres.Name   AS genreName
FROM artists, albums, tracks, genres
WHERE artists.ArtistId = albums.ArtistId
 AND  albums.AlbumId   = tracks.AlbumId
 AND  tracks.GenreId   = genres.GenreId
```
- convert to ```INNER JOIN```

```sql
SELECT 
    artists.ArtistId,
    artists.Name  AS artistName,
    albums.Title  AS albumName,
    tracks.Name   AS tracksName,
    genres.Name   AS genreName
FROM artists 
JOIN albums  ON  artists.ArtistId = albums.ArtistId
JOIN tracks  ON  albums.AlbumId   = tracks.AlbumId
JOIN genres  ON  tracks.GenreId   = genres.GenreId
WHERE albums.Title LIKE '%The %' AND genres.Name = 'Rock';
```
```sql
SELECT 
    A.ArtistId,
    A.Name     AS artisName,
    B.Title    AS albumName,
    C.Name     AS trackName,
    C.Composer AS composer,
    D.Name     AS genreName
FROM artists AS A
JOIN albums  AS B ON A.ArtistId = B.ArtistId
JOIN tracks  AS C ON B.AlbumId  = C.AlbumId
JOIN genres  AS D ON C.GenreId  = D.GenreId
WHERE D.name IN ('Rock', 'Jazz')
 AND  A.name LIKE 'The %'
```
- Aggregate Function
```sql
 -- Aggregate Function
 SELECT 
    AVG(milliseconds / 60000.0)  AS avg_min,
    SUM(milliseconds / 60000.0)  AS sum_min,
    MIN(milliseconds / 60000.0)  AS min_min,
    MAX(milliseconds / 60000.0)  AS max_min,
    COUNT(milliseconds)          AS count_mill
FROM tracks;
```
- JOIN, GROUP BY , ORDER BY

```sql
-- นับจำนวนเพลงที่อยู่ในแต่ละ genre
SELECT 
      A.Name        AS genreName,
      COUNT(B.Name) AS n_songs
FROM  genres A, tracks B
WHERE A.GenreId = B.GenreId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```
```sql
-- ศิลปินคนไหน ออกอัลบัมมาแล้วเยอะที่สุด ติดTop 10
SELeCT 
    A.Name         AS artistName,
    COUNT(B.Title) AS n_albums
FROM artists A, albums B
WHERE A.ArtistId = B.ArtistId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```
```sql
-- convert to INNER JOIN
SELeCT 
    A.Name         AS artistName,
    COUNT(B.Title) AS n_albums
FROM artists  A
INNER JOIN albums B ON A.ArtistId = B.ArtistId
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```
**🌻 ลูกค้า id ที่ 5 มี total_invoice เท่ากับเท่าไหร่**
```sql
-- join table customers and invoices select column group by customerid and filter customerid = 5 
SELECT 
    t1.customerid,
    t1.FirstName,
    t1.LastName,
    SUM(total)  AS total_invoice
FROM customers  AS t1
JOIN invoices   AS t2
ON t1.CustomerId = t2.CustomerId
GROUP BY t1.customerid
HAVING t1.customerid = 5;

-----------
result: 40.62
```



