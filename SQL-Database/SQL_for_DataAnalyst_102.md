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
WHERE customerid BETWEEN 5 AND 10;

-- ได้ผลลัพธ์เหมือนด้านบนแต่เขียนยาวกว่า
SELECT * FROM customers
WHERE customerid >= 5 AND customerid <= 10;
```
```sql
-- filter DateTime
SELECT invoicedate FROM invoices
WHERE invoicedate BETWEEN '2009-02-01' AND '2009-02-31';

SELECT invoicedate FROM invoices
WHERE invoicedate BETWEEN '2009-01-01 00:00:00' AND '2009-01-31 20:00:00';
```
```sql
-- filter values is not Null 
SELECT * FROM customers
WHERE company IS NOT NULL; -- filter value IS NOT NULL

-- filter Null valuse
SELECT * FROM customers
WHERE company IS NULL;
```
**🌻filter data part3 -- pattern matching**
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
SELECT 
    firstname, 
    lastname, 
    country,
    email,
    phone
FROM customers
WHERE phone LIKE '%99%'; -- เลข 99 จะอยู่ตำแหน่งก็ได้ ถ้าใส่ '%_%'
```
