# 📂 SQL for Data Analysts 101: A Chinook Database Case Study
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
