# 🎄📈 Intro to Data Visualization in R 
**📝 This section provides an overview of my foundational knowledge in data visualization in R. It includes practical code examples and their outputs from the lessons learned.**
## 💡 Why we need Data Visualization?
Data Visualization ช่วยให้เราเข้าใจข้อมูลที่ซับซ้อนได้ง่ายขึ้น เมื่อเราเปลี่ยนข้อมูลเหล่านั้นให้กลายเป็น กราฟ หรือ แผนภูมิ สมองของเราจะสามารถประมวลผลข้อมูลได้เร็วขึ้น หรือเห็นความสัมพันธ์ระหว่างข้อมูลได้แบบเร็วๆ เพราะ
- กราฟช่วยให้เรามองเห็นภาพรวมของข้อมูลได้ในทันที เช่น ยอดขายเพิ่มขึ้นหรือลดลงในช่วงเวลาไหน
- เราสามารถระบุแนวโน้ม (trends) ของข้อมูลได้ง่ายขึ้น เช่น ลูกค้าซื้อของช่วงวันหยุดสุดสัปดาห์มากกว่าวันธรรมดา
- Data Viz จะช่วยให้เราเจอข้อมูลที่น่าสนใจหรือข้อมูลที่ผิดปกติ (outliers) ได้เร็วขึ้น
- การใช้กราฟและแผนภูมิในการนำเสนอ ทำให้ผู้ฟังเข้าใจสิ่งที่เราต้องการจะสื่อได้ชัดเจนกว่าการอธิบายด้วยตัวเลขเพียงอย่างเดียว
- เมื่อเราเข้าใจข้อมูลได้ดีขึ้น การตัดสินใจทางธุรกิจหรือการแก้ปัญหาก็จะแม่นยำและมีประสิทธิภาพมากขึ้น
## 🔐 basic plot (base R)
```r
## basic plot (base R)
hist(mtcars$mpg)
```


```r
## Intro to data viz in R
## library tidyverse
library(tidyverse)
```







