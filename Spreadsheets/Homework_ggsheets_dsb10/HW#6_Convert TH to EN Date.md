## 🎍 Homework6: Project - Convert TH to EN Date
### 🛎  โจทย์คือ เปลี่ยนวันที่ พ.ศ. ให้เป็น ค.ศ.
```
  1. แยกวันเดือนปี =ArrayFormula(SPLIT(D4:D9," "))		
  2. แปลงเดือน	=ArrayFormula(VLOOKUP(F4:F9,A4:B15,2,FALSE))		
  3. แปลงปี      =(G4-543) **พ.ศ. - 543 = ค.ศ.
  4. EN Date    =ArrayFormula(DATE(J4:J9,I4:I9,E4:E9))
```		
**📟 *'Convert TH to EN Date'*** 
![HW#6_Convert TH to EN Date 2](https://github.com/user-attachments/assets/67a5f09c-64aa-42a8-8376-5df8c7bcda02)
