# 📂 Introduction to SQL
**🌻create table employee**
```sql
CREATE TABLE employee (
        id INT UNIQUE, --UNIQUE key ห้ามซ้ำกัน
  	name TEXT,
  	department TEXT,
  	position TEXT,
  	salary REAL  --REAL ตัวเลขที่มีทศนิยมได้ เป็นค่าตัวเลขแบบเรียลๆๆจริงๆเลยมีทศนิยมได้
);
```
**🌻insert data into employee**
```sql
INSERT INTO employee VALUES 
    (1, 'David', 'Marketing', 'CEO', 100000),
    (2, 'John', 'Marketing', 'VP', 85000),
    (3, 'Marry', 'Sales', 'Manager', 60000);
```





