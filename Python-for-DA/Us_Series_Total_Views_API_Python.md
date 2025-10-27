# 📈 **ทดสอบดึงยอดวิวรวมของซีรีส์จาก `playlist: Us รักของเรา` ทั้ง 12 EP บน Youtube: `GMMTV OFFICIAL`**
**Date: 27 October 2025**
#### การดึงยอดวิวรวมของซีรีส์ทั้งหมดในเพลย์ลิสต์โดยใช้ Python และ YouTube Data API นั้นสามารถทำได้โดยการ เรียกข้อมูลวิดีโอทั้งหมดในเพลย์ลิสต์ออกมาทีละรายการ แล้วรวมยอดวิวของแต่ละวิดีโอเข้าด้วยกัน
```py
pip install google-api-python-client
```
```py
from googleapiclient.discovery import build

# --- ข้อมูลที่ต้องใส่ ---
# 1. API Key 
YOUTUBE_API_KEY = "YOUR_YOUTUBE_API_KEY" # -- Replace with your API Key

# 2. ID ของเพลย์ลิสต์ซีรีส์ที่ต้องการ
# ตัวอย่าง ID จะคล้ายกับ 'PLxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
PLAYLIST_ID = "PLLmO9suE7x1RRGG_e_-mjOiko_yKL-ghn"
# -----------------------------

def get_playlist_total_views(api_key, playlist_id):
    """
    ดึงยอดวิวรวมของวิดีโอทั้งหมดในเพลย์ลิสต์ที่กำหนด

    :param api_key: YouTube Data API Key
    :param playlist_id: ID ของเพลย์ลิสต์
    :return: ยอดวิวรวมทั้งหมด (int)
    """
    
    # 1. สร้าง Service object สำหรับการเชื่อมต่อ API
    youtube = build('youtube', 'v3', developerKey=api_key)
    
    video_ids = []
    next_page_token = None
    
    # 2. วนลูปเพื่อดึง ID ของวิดีโอทั้งหมดในเพลย์ลิสต์
    # API จะจำกัดการดึงต่อครั้ง (สูงสุด 50 รายการต่อหน้า) จึงต้องใช้ page token
    while True:
        # ดึงรายการวิดีโอในเพลย์ลิสต์ (playlistItems)
        pl_request = youtube.playlistItems().list(
            part='contentDetails',
            playlistId=playlist_id,
            maxResults=50,
            pageToken=next_page_token
        )
        pl_response = pl_request.execute()
        
        # เก็บ video ID
        for item in pl_response['items']:
            video_ids.append(item['contentDetails']['videoId'])
            
        next_page_token = pl_response.get('nextPageToken')
        
        # หากไม่มีหน้าถัดไป ให้หยุดลูป
        if not next_page_token:
            break

    # 3. ดึงสถิติยอดวิวของวิดีโอทั้งหมดที่เก็บได้
    # API 'videos().list' ให้คุณส่ง ID ได้สูงสุด 50 รายการต่อครั้ง
    total_views = 0
    
    # แบ่งรายการ video_ids ออกเป็นชุดย่อย ชุดละ 50 ID
    for i in range(0, len(video_ids), 50):
        video_id_chunk = video_ids[i:i+50]
        
        # ดึงข้อมูลสถิติ (statistics) ของวิดีโอ
        stats_request = youtube.videos().list(
            part='statistics',
            id=','.join(video_id_chunk) # นำ ID มารวมกันคั่นด้วย comma
        )
        stats_response = stats_request.execute()
        
        # รวมยอดวิวทั้งหมด
        for item in stats_response['items']:
            # ตรวจสอบว่ามีข้อมูลยอดวิวหรือไม่ (บางวิดีโออาจถูกลบหรือซ่อน)
            if 'viewCount' in item['statistics']:
                total_views += int(item['statistics']['viewCount'])
                
    return total_views

# --- รันฟังก์ชันและแสดงผลลัพธ์ ---
try:
    views = get_playlist_total_views(YOUTUBE_API_KEY, PLAYLIST_ID)
    print(f"ยอดวิวรวมของซีรีส์ในเพลย์ลิสต์ Us รักของเรา '{PLAYLIST_ID}' คือ: {views:,} ครั้ง")
    
except Exception as e:
    print(f"เกิดข้อผิดพลาด: {e}")
    print("โปรดตรวจสอบ API Key และ Playlist ID ว่าถูกต้องและเปิดใช้งาน YouTube Data API V3 แล้ว")
```
## 📈Result 
```
ยอดวิวรวมของซีรีส์ในเพลย์ลิสต์ Us รักของเรา 'PLLmO9suE7x1RRGG_e_-mjOiko_yKL-ghn' คือ: 105,195,621 ครั้ง
```
---
## 🔐 วิธี Get YouTube API Key
1. เข้าสู่ระบบ: คลิกที่ลิงก์ด้านบนและเข้าสู่ระบบด้วยบัญชี Google ของคุณ
2. เลือกหรือสร้างโปรเจกต์: ที่ด้านบน ให้เลือกหรือสร้าง Project ใหม่สำหรับงานนี้
3. เปิดใช้งาน API: ไปที่เมนู APIs & Services (API และบริการ) > Library (ไลบรารี) แล้วค้นหาและ Enable (เปิดใช้งาน) `YouTube Data API v3`
4. สร้าง API Key: กลับไปที่หน้า Credentials (ข้อมูลรับรอง)
   4.1 คลิก + Create Credentials (+ สร้างข้อมูลรับรอง)
   4.2 เลือก API Key (คีย์ API)
5. คลิก Show Key : คัดลอกคีย์ (ระบบจะสร้างสตริงคีย์ API ให้ทันที ซึ่งสามารถคัดลอกไปใช้ในโค้ด Python ได้ เช่น AIzaSy............................)
---
## 🔐 playlist_id
**Example URL**
```
https://www.youtube.com/playlist?list=PLxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
