# 🛠 What is Web Scraping?
Web scraping คือการดึงข้อมูลจากหน้าเว็บไซต์ที่เราต้องการ เว็บที่เราเข้าไปดึงได้ง่ายสุดจะเป็นแบบ static website ที่แสดง content เฉยๆ เช่น blog, article และเป็น public website ที่ไม่ต้อง login
## 🔐 Library
ใน Python เราเรียกใช้ library ตัวที่ง่ายสุดเลย ชื่อว่า gazpacho (จริงๆข้างหลังเค้าต่อยอดมาจาก beautiful soup)
## 🔐 GET request web page
**วิธีการทำ Web Scraping ง่ายๆใน 3 ขั้นตอนด้วย Python**
- เขียน `get` request หน้า webpage ที่เราต้องการ
- เปลี่ยน content ที่ดึงมาเป็น `Soup` object
- ดึง text หรือ content จาก `html tag` ที่เราต้องการ เช่น h1, h2, h3, p, a
```py
# install gazpacho on our machine
!pip install gazpacho

# import library
import requests 
import gazpacho as gz

# skooldio medium website
url = "https://medium.com/skooldio"

# request content from medium
response = requests.get(url)

print(response.status_code)

web = gz.Soup(response.text)

# find the element you want
web.find("h1")

# We use strip() to remove all the html tags.
# the heading 1 content
web.find("h1").strip()

# the heading 2 content
web.find("h2").strip()

# Using for loop to clean the article titles
# the heading 3 content
for title in web.find("h3"):
    print(title.strip())
```
---
## ⛱ Review Essential HTML
- Web browser ของเราจะมีเครื่องมือที่ชื่อว่า DevTools ไว้ใช้ inspect เว็บไซต์ที่เราต้องการ แค่คลิกขวา เลือก inspect แล้ว explore content ในหน้าเว็บไซต์นั้นๆได้เลยง่ายๆ
- HTML tags ที่เราใช้วาง content บนเพจ (อ่านเพิ่มเติมได้ที่ W3schools)
  - `title` ชื่อ webpage หน้านั้นๆ
  - `h1`, `h2`, `h3`, ..., `h6` สำหรับ heading เช่น ชื่อบทความ หรือหัวข้อย่อยๆในบทความ
  - `li` bullet point list
  - `a` anchor link หรือ hyperlink
  - `div` division สำหรับจัดกลุ่ม content บนหน้าเว็บ
  - `p` paragraph สำหรับ text-based content
---
## 🔎 Find the element you want
- Syntax ที่เราใช้ในการค้นหา HTML tags ที่เราต้องการคือ `webpage.find("tag")`
- ตัวอย่างด้านล่าง เราลองหา tag `h1`, `h2` และ `h3` ตามลำดับ
```py
# find the element you want - h1
web.find("h1")

# find the element you want - h2
web.find("h2")

# find the element you want - h3
web.find("h3")
```
---
## 🛡 Data Cleaning
✅ หลังจากเราเจอ HTML ที่เราต้องการแล้ว ขั้นตอนต่อไปคือการทำความสะอาดหรือ clean contents ให้อยู่ในรูปแบบที่เราต้องการ เช่น
- ลบ html เก็บไว้เฉพาะ text contents เท่านั้น
- จัดการ text contents ด้วย string method เช่น `.lower()` `.upper()` `.replace()` หรือ `.split()` เป็นต้น
- สร้างเป็น dataframe หรือ data structure อื่นๆ เช่น list, tuple, dict หรือ JSON ที่เราเอาไปใช้ต่อได้ง่ายๆ
