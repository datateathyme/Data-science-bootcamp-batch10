# 📂 SQL for Data Analyst 101
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
