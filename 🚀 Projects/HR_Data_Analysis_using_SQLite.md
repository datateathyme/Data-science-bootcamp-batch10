# 👨‍💻 HR Data Analysis using SQLite Project
- [HR Data Analysis: click view on website](https://datateathyme.wordpress.com/2025/08/29/hr-data-analysis-using-sqlite/)
## Overview
บทความนี้เราจะนำข้อมูลเกี่ยวกับชุดข้อมูลทรัพยากรบุคคล (HR) ของบริษัทข้ามชาติขนาดใหญ่ ซึ่งมีจำนวนข้อมูลพนักงานมากถึง 2 ล้านรายการ
ข้อมูลครอบคลุมรายละเอียดสำคัญ เช่น ข้อมูลส่วนบุคคล ตำแหน่งงาน ผลงาน สถานะการทำงาน และเงินเดือน

ข้อมูลชุดนี้อยู่ในรูปแบบไฟล์ CSV และสามารถนำไปใช้ประโยชน์ในการวิเคราะห์ข้อมูล HR (HR analytics) เพื่อหาข้อมูลเชิงลึกได้
เช่น การทำความเข้าใจโครงสร้างพนักงาน การวิเคราะห์สาเหตุการลาออก การศึกษาแนวโน้มค่าตอบแทน และการประเมินผลงานของพนักงาน

การวิเคราะห์ข้อมูลนี้เราจะใช้ SQLite ซึ่งการวิเคราะห์ข้อมูลนี้จะเป็นประโยชน์อย่างยิ่งสำหรับผู้ที่ทำงานด้านทรัพยากรบุคคล (HR)

## Writing the code
🎯 Using this dataset, we answered multiple questions with SQLite online in our Project
### 🌻 Q1. What is the distribution of Employee Status (Active, Resigned, Retired, Terminated) ?
```sql
SELECT 
	Status, 
    COUNT(*) AS NumberOfEmployees
FROM HR_Data_MNC
GROUP BY Status
ORDER BY NumberOfEmployees DESC;
```

### 🌻 Q2. What is the distribution of work modes (On-site, Remote) ?
```sql
SELECT 
	Work_Mode, 
    COUNT(*) AS NumberOfEmployees
FROM HR_Data_MNC
GROUP BY Work_Mode
ORDER BY NumberOfEmployees DESC;
```

### 🌻 Q3. How many employees are there in each department?
```sql
SELECT 
	Department, 
    COUNT(*) AS NumberOfEmployees
FROM HR_Data_MNC
GROUP BY Department
ORDER BY NumberOfEmployees DESC;
```

### 🌻 Q4. What is the average salary by Department ?
```sql
SELECT 
	Department, 
    ROUND(avg(Salary_INR),2) AS avg_salary
FROM HR_Data_MNC
GROUP BY Department
ORDER BY avg_salary DESC;
```

### 🌻 Q5. Which job title has the highest average salary ?
```sql
SELECT 
	Job_Title, 
    ROUND(avg(Salary_INR),2) AS avg_salary
FROM HR_Data_MNC
GROUP BY Job_Title
ORDER BY avg_salary DESC
LIMIT 5;
```

### 🌻 Q6. What is the average salary in different Departments based on Job Title ?
```sql
SELECT 
	Department,
    Job_Title, 
    ROUND(avg(Salary_INR),2) AS avg_salary
FROM HR_Data_MNC
GROUP BY Department, Job_Title
ORDER BY Department, avg_salary DESC;
```

### 🌻 Q7.  How many employees Resigned & Terminated in each department ?
```sql
SELECT 
	Department, 
    Status,
    COUNT(*) AS n_of_employees
FROM HR_Data_MNC
WHERE Status IN ('Resigned', 'Terminated')
GROUP BY Department, Status;
```

### 🌻 Q8. How does salary vary with years of experience ?
```sql
SELECT 
	Experience_Years, 
    ROUND(avg(Salary_INR),2)  AS avg_salary
FROM HR_Data_MNC
GROUP BY Experience_Years;
```

### 🌻 Q9. What is the average performance rating by department ?
```sql
SELECT 
	Department, 
    ROUND(avg(Performance_Rating),4)  AS avg_performance_rating
FROM HR_Data_MNC
GROUP BY Department
ORDER BY avg_performance_rating DESC;
```

### 🌻 Q10. Which Country have the highest concentration of employees ?
```sql
SELECT
    -- Use SUBSTR and INSTR to extract the country from the location string
    SUBSTR(Location, INSTR(Location, ',') + 2) AS Country,
    COUNT(*) AS n_of_employees
FROM HR_Data_MNC
GROUP BY Country
ORDER BY n_of_employees DESC
LIMIT 5;
```

### 🌻 Q11. Which 5 employees have worked for the company the longest?
```sql
SELECT
    Employee_ID,
    Full_Name,
    Department,
    Job_Title,
    Hire_Date,
    -- This calculates the number of days between the hire date and today.
    julianday('now') - julianday(Hire_Date) AS Days_of_Service
FROM HR_Data_MNC
ORDER BY Hire_Date ASC
LIMIT 5;
```

### 🌻 Q12. How has the number of hires changed over time (per year) ?
```sql
SELECT
    -- Extracts the year from the Hire_Date
    strftime('%Y', Hire_Date) AS Hiring_Year,
    COUNT(*) AS n_of_employees
FROM HR_Data_MNC
GROUP BY Hiring_Year
ORDER BY Hiring_Year;
```

### 🌻 Q13. Compare salaries of Remote vs. On-site employees — is there a significant difference ?
- **calculates the average salary for each work mode**
```sql
SELECT
    Work_Mode,
    ROUND(avg(Salary_INR),4) AS avg_salary
FROM HR_Data_MNC
GROUP BY Work_Mode
ORDER BY avg_salary DESC;
```
- **counts how many employees work remotely and on-site**
```sql
SELECT
    Work_Mode,
    count(*) AS n_employee
FROM HR_Data_MNC
GROUP BY Work_Mode
ORDER BY n_employee DESC;
```

### 🌻 Q14. Find the top 10 employees with the highest salary in each department.
```sql
WITH rankedSalaries AS (
    SELECT
        Department,
        Full_Name,
  		Job_Title,
  		Work_Mode,
        Salary_INR,
        RANK() OVER (PARTITION BY Department ORDER BY Salary_INR DESC) AS rank_in_department
    FROM HR_Data_MNC
)
SELECT
    Department,
    Full_Name,
    Job_Title,
    Work_Mode,
    Salary_INR
FROM rankedSalaries
WHERE rank_in_department <= 10
ORDER BY Department, Salary_INR DESC;
```

### 🌻 Q15.  Identify departments with the highest attrition rate (Resigned %)
```sql
SELECT
    Department,
    -- Calculate the attrition rate
    ROUND(CAST(SUM(CASE WHEN Status = 'Resigned' THEN 1 ELSE 0 END) AS REAL) * 100 / COUNT(*),2) AS Attrition_Rate_Percentage
FROM HR_Data_MNC
GROUP BY Department
ORDER BY Attrition_Rate_Percentage DESC;
```
