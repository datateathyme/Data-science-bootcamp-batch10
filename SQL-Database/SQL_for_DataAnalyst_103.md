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
    A.Name   AS artist_name,
    B.Title  AS album_name
FROM artists AS A
JOIN albums  AS B
ON A.ArtistId = B.ArtistId
WHERE A.Name LIKE 'C%';
```
