# 📂 Introduction to SQL
**🌻create table employee**
```sql
CREATE TABLE employee (
        id INT UNIQUE, -- กำหนด id เป็น unique ห้ามซ้ำ
  	name TEXT,
  	department TEXT,
  	position TEXT,
  	salary REAL  -- REAL ตัวเลขที่มีทศนิยมได้ เป็นค่าตัวเลขแบบเรียลๆๆจริงๆเลยมีทศนิยมได้
);
```
**🌻insert data into employee**
```sql
INSERT INTO employee VALUES 
    (1, 'David', 'Marketing', 'CEO', 100000),
    (2, 'John', 'Marketing', 'VP', 85000),
    (3, 'Marry', 'Sales', 'Manager', 60000);

-- insert more data 
INSERT INTO employee VALUES 
    (4, 'Harry', 'IT', 'Senior Manager', 88000),
    (5, 'Walker', 'IT', 'Manager', 68000); 
```

**🌻select all columns from employee**
```sql
SELECT * FROM employee;
```
**🌻select some columns from employee**
```sql
SELECT 
    id,
    name,
    salary
FROM employee;
```
**🌻select top 3 highest paid employees**
```sql
SELECT 
    id,
    name,
    salary
FROM employee
ORDER BY salary DESC
LIMIT 3;
```
**🌻transform column create new salary column (15% increase)**
```sql
SELECT 
    name,
    salary,
    ROUND(salary * 1.15) AS new_salary -- ROUND เพื่อให้เป็นตัวเลขจำนวนเต็ม
FROM employee
ORDER BY salary DESC
LIMIT 3;
```
**🌻create new column (company_email)**
```sql
SELECT 
    name,
    salary,
    ROUND(salary * 1.15)          AS new_salary,
    LOWER(name) || '@company.com' AS company_email -- LOWER เปลี่ยนชื่อเป็นตัวพิมพ์เล็กทั้งหมด
FROM employee;
```
**🌻filter data**
```sql
-- AND operator
SELECT * FROM employee
WHERE department = 'Marketing' and salary > 90000; 

-- OR operator
SELECT * FROM employee
WHERE department = 'Marketing' OR department = 'IT';

-- IN operator == OR
SELECT * FROM employee
WHERE department IN ('Marketing', 'IT');

-- filter number
SELECT * FROM employee
WHERE salary <= 90000;
```
**🌻update data**
```sql
UPDATE employee  -- เราต้องการ update ที่ table ชื่อว่า employee
SET salary = 99000 -- แก้ไข้ที่คอลัมน์เงินเดือน เปลี่ยนจาก 100,000 เป็น 99,000
WHERE id = 1; -- ตำแหน่งที่ต้องการไปแก้ไขข้อมูล หรือต้องการแก้ไขที่ไหน
```
**🌻delete data (! ก่อนจะลบอะไรต้องดูดีๆก่อน)**
```sql
-- (id = 5, name = 'Walker')
DELETE FROM employee
WHERE id = 5;

-- ลบหลาย record พร้อมกัน โดยใช้ IN operator ได้
DELETE FROM employee
WHERE id IN (2,4);
```
**🌻alter table (เปลี่ยนชื่อ table หรือ เพิ่มคอลัมน์ใหม่ได้)**
```sql
ALTER TABLE employee RENAME TO MyEmployee;
```
```sql
-- สร้างคอลัมน์ใหม่
ALTER TABLE employee
ADD email TEXT; -- ADD ตั้งชื่อคอลัมน์ใหม่

-- เพิ่มข้อมูลลงในคอลัมน์ใหม่ที่สร้างขึ้นมา
UPDATE employee
SET email = 'admin@company.com'; -- สมมติว่าพนักงานทุกคนใช้อีเมลเดียวกันหมด

-- อัพเดตเฉพาะตำแหน่งที่ต้องการ -> เขียน WHERE clause
UPDATE employee
SET email = 'ceo@company.com'
WHERE id = 1; -- ระบุตำแหน่งที่ต้องการเปลี่ยน
```
