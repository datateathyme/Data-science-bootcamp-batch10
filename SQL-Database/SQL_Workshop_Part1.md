
# 🗂 SQL Workshop Part1: A Chinook Database Case Study 🌻
### ⛱ This area showcases foundational SQL skills essential for data analysis, demonstrated through practical queries on the chinook.db database. 
## 💾 Database and ER Diagram
- ```ER Diagram``` ย่อมาจาก ```Entity-Relationship Diagram``` เป็นเหมือนแผนที่ ที่บอกเราว่าข้อมูลใน database มีอะไรบ้าง และความสัมพันธ์ของแต่ละ table เป็นอย่างไร
  
**🌻รูปแบบความสัมพันธ์ที่เราใช้ใน database มีสามแบบหลักๆคือ**
1. One-to-One
2. One-to-Many (อันนี้ใช้เยอะสุดเลย)
3. Many-to-Many

## 💾 Example practical queries
```sql
SELECT 
    firstname,
    lastname,
    firstname || ' ' || lastname AS fullName, --camel case 
    LOWER(firstname) || '.' || LOWER(SUBSTR(lastname,1,2)) || '@company.com' AS email
FROM customers
ORDER BY 1
LIMIT 5;
```
```sql
---value function
SELECT 
    name,
    ROUND(milliseconds/ 60000.0 ,2)  AS minute,
    ROUND(bytes / (1024*1024.0) ,4)  As mb
FROM tracks;
```
```sql
-- strftime() works with DATETIME
SELECT 
    invoicedate,
    STRFTIME('%Y',invoicedate)   AS year,
    STRFTIME('%m', invoicedate)  AS month,
    STRFTIME('%d', invoicedate)  AS day,
    STRFTIME('%Y-%m', invoicedate) AS monthID
FROM invoices
WHERE monthID = '2009-05';
```
