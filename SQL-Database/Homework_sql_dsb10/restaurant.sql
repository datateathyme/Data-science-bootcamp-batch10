-------------------------------------------------------------------------------
/* 
  Create at least 3 tables (Insert table) : restaurant
  -transaction 
  -staff 
  -manu 
  -ingredient

  Write sql queries at least 3 queries (select, where, join)
  -with clause 
  -subquery
  -aggregate function & group by
*/
-------------------------------------------------------------------------------
## Create sample data for the 'staff', 'customers', and 'transactions' tables.

-- สร้างตาราง staff เพื่อเก็บข้อมูลพนักงาน
CREATE TABLE staff (
  staffId      int PRIMARY KEY,
  name         nvarchar ,
  position     varchar,
  salary       real
);

-- เพิ่มข้อมูลตัวอย่างลงในตาราง staff
INSERT INTO staff VALUES
  (1, 'James', 'Manager', 50000),
  (2, 'Mary',  'Chef',    35000),
  (3, 'John',  'Waiter',  25000);

-- สร้างตาราง menu เพื่อเก็บข้อมูลเมนูอาหาร
CREATE TABLE menu (
  menuId       int PRIMARY KEY,
  name         nvarchar,
  price        real
);

-- เพิ่มข้อมูลตัวอย่างลงในตาราง menu
INSERT INTO menu VALUES
  (1, 'Pizza',        85.50),
  (2, 'Hamburger',    55.99),
  (3, 'Salad',        42.50),
  (4, 'Cola',         15.00),
  (5, 'Ice Cream',    34.20),
  (6, 'French Fries', 45.50);

-- สร้างตาราง customers เพื่อเก็บข้อมูลลูกค้า
CREATE TABLE customers (
  customerId   int PRIMARY KEY,
  firstname    nvarchar,
  lastname     nvarchar,
  email        varchar,
  phone        varchar
);

-- เพิ่มข้อมูลตัวอย่างลงในตาราง customers
INSERT INTO customers VALUES
  (1, 'Jay',   'Smith',    'Jay@datayahoo.com',   '555-1234'),
  (2, 'May',   'Johnson',  'May@datayahoo.com',   '555-5678'),
  (3, 'Bay',   'Williams', 'Bay@datayahoo.com',   '555-9012'),
  (4, 'Sarah', 'Davis',    'Sarah@datayahoo.com', '555-3456'),
  (5, 'David', 'Brown',    'David@datayahoo.com', '555-7890'),
  (6, 'Emily', 'Miller',   'Emily@datayahoo.com', '555-2345');

-- สร้างตาราง transactions เพื่อเก็บข้อมูลการทำธุรกรรม
 CREATE TABLE transactions (
  transactionId     int PRIMARY KEY ,
  customerId        int,
  transactionDate   date,
  menuId            int,
  quantity          int,
  total_amount      real,
  staffId           int
);

-- เพิ่มข้อมูลตัวอย่างลงในตาราง transactions
INSERT INTO transactions VALUES
  (1, 2, '2022-08-01',1,2, 171.00, 1),
  (2, 2, '2022-08-01',1,3, 256.5,  2),
  (3, 3, '2022-08-02',3,2, 85.00,  3),
  (4, 2, '2022-08-04',4,2, 30.00,  3),
  (5, 5, '2022-08-05',5,1, 34.20,  3),
  (6, 6, '2022-08-06',6,2, 91.00,  1),
  (7, 1, '2022-08-08',2,4, 223.96, 1),
  (8, 2, '2022-08-08',6,4, 227.5,  2),
  (9, 4, '2022-08-09',4,6, 90.00,  1),
  (10,6, '2022-08-09',1,3, 102.6,  2);

-------------------------------------------------------------------------------
## Add a new column to the 'customers' table and update data.
-- เพิ่มคอลัมน์ 'state' และอัปเดตข้อมูลในตาราง customers  
ALTER TABLE customers
ADD state VARCHAR(50); 

UPDATE customers
SET state = 'California'  
WHERE customerId = 1;

UPDATE customers
SET state = 'California'  
WHERE customerId = 2;

UPDATE customers
SET state = 'Texas'  
WHERE customerId = 3;

UPDATE customers
SET state = 'California'  
WHERE customerId = 4;

UPDATE customers
SET state = 'Florida'  
WHERE customerId = 5;

UPDATE customers
SET state = 'Texas'  
WHERE customerId = 6; 

-------------------------------------------------------------------------------
.mode table
.header on

-------------------------------------------------------------------------------
## Select data and filter customers by state: California and Texas
  
SELECT 
    customerid,
    firstname,
    lastname,
    firstname || ' ' || lastname  AS fullName ,
    state ,
    firstname || '.' || LOWER(SUBSTRING(lastname,1,2))|| '@datayahoo.com'  AS email
FROM customers
WHERE state IN ('California', 'Texas')
    AND email LIKE '%@datayahoo%'
ORDER BY state;


-------------------------------------------------------------------------------
## This query is designed to provide a comprehensive understanding of transactions by linking related data from multiple tables.
-- Query นี้ออกแบบมาเพื่อให้เข้าใจภาพรวมของธุรกรรมโดยละเอียด โดยเชื่อมโยงข้อมูลที่เกี่ยวข้องจากหลายตาราง  
SELECT
    T.transactionId      AS  T_id,
    T.transactionDate    AS  T_date,
    T.menuId             AS  menuId,
    M.name               AS  menu_name,
    M.price              AS  menu_price,
    T.quantity           AS  quantity,
    T.total_amount       AS  total,
    C.firstname          AS  cus_name,
    S.name               AS  staff_name
FROM transactions   AS  T
JOIN customers      AS  C 
  ON T.customerId = C.customerId
JOIN menu           AS  M 
  ON T.menuId = M.menuId
JOIN staff          AS  S
  ON T.staffId = S.staffId;

-------------------------------------------------------------------------------
## Find the top 3 menu items based on sales data.
  
SELECT 
    M.name,
    ROUND(AVG(total_amount) ,2)  AS  avg_total,
    MIN(total_amount)            AS  min_total,
    MAX(total_amount)            AS  max_total,
    SUM(total_amount)            AS  sum_total,
    COUNT(*)                     AS  N_transaction 
FROM transactions AS   T
JOIN customers    AS   C 
  ON T.customerId = C.customerId
JOIN menu         AS   M 
  ON T.menuId = M.menuId
GROUP BY M.name
ORDER BY 6 DESC
LIMIT 3;

-------------------------------------------------------------------------------
## Create a new column 'segment' to categorize customers as high, medium, or low spenders based on their transaction history
  
SELECT
    C.customerId,
    C.firstname,
    COUNT(*) AS T_total,
CASE
    WHEN  COUNT(*) >= 3 THEN 'High Spenders'
    WHEN  COUNT(*)  = 2 THEN 'Medium Spenders'
    ELSE  'Low Spenders'
END AS segment
FROM transactions AS  T
JOIN customers    AS  C 
  ON T.customerId = C.customerId
GROUP BY C.customerId 
ORDER BY 3 DESC;

-------------------------------------------------------------------------------
## By matching managers with their transactions, this query provides a detailed overview of the manager with staff ID 1's performance.
-- จับคู่ผู้จัดการกับธุรกรรมของพวกเขา Query นี้จะให้ภาพรวมโดยละเอียดของประสิทธิภาพของผู้จัดการที่มี staff ID 1  
  
WITH  staff_manager AS  (
  SELECT * FROM staff
WHERE position = 'Manager'
),
transactions_manager AS(
  SELECT* from transactions
  WHERE staffId = 1
)
SELECT 
  S1.name ,
  S1.position,
  T1.transactionId,
  T1.transactiondate,
  T1.menuId,
  T1.quantity ,
  T1.total_amount          AS total_sale
FROM staff_manager         AS S1
JOIN transactions_manager  AS T1
ON S1.staffId = T1.staffId;

-------------------------------------------------------------------------------
## Group the customers by their state.
  
SELECT
  ROW_number() OVER(PARTITION BY state)  AS customer_id ,
  state,
  firstname,
  lastname
FROM customers;
