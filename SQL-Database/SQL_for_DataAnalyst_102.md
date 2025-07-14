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
