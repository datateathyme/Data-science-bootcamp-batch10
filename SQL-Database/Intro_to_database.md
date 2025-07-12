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
**🌻transform column create new salary column**
