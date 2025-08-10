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
---
## 🧵 Using `strip()` to get clean texts
ถ้าเราเจอ HTML tag ที่ต้องการแล้ว ขั้นต่อไปคือการ clean data 
```
web.find("h1")
```
วิธีการทำสะอาด หรือดึง text ออกมาจาก h1 ทำได้สองวิธีคือ
1. `.strip()`
2. `.text`
```
# ทั้งสองแบบได้ผลลัพธ์เหมือนกัน
web.find("h1").strip()
web.find("h1").text
```
**Note** - ตัวอย่าง code นี้จะใช้ได้ในกรณีที่ tag ที่เราดึงออกมามีแค่อันเดียวในหน้าเว็บนั้นๆ

- [x] ✅ ถ้าเราต้องการดึง **multiple tags** เช่น ชื่อบทความ `h3` ทั้งหน้า medium ของ skooldio เวลาเราใช้ `web.find("h3")` เราจะได้ผลลัพธ์กลับมาเป็น `list`
- [x] ✅ ให้เขียน for loop มาช่วยทำความสะอาดข้อมูล
```py
## the heading 3 content
for title in web.find("h3"):
    print(title.strip())
```
---
## 🥫 Gazpacho Examples: Quick Review

วิธีทำ web scraping แบบ very fast ด้วย Python (และ R)
- `Get` the webpage
- Turn it to `Soup`
- `Scrape` The Tags You Want

```py
from gazpacho import get, Soup

url = 'https://scrape.world/books'
html = get(url)
soup = Soup(html)
books = soup.find('div', {'class': 'book-'}, partial=True)

def parse(book):
    name = book.find('h4').text
    price = float(book.find('p').text[1:].split(' ')[0])
    return name, price

[parse(book) for book in books]
```
