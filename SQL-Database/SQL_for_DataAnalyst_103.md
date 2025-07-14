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
