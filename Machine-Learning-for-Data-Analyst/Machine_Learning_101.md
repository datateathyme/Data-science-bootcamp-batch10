# 🎰🎄 Machine Learning 101 
## What is ML?
**Machine Learning** คือกระบวนการสอนให้คอมพิวเตอร์สามารถเรียนรู้และค้นหารูปแบบจากข้อมูล เพื่อให้คอมพิวเตอร์สามารถหาความสัมพันธ์ คาดการณ์ หรือตัดสินใจได้เองโดยอัตโนมัติ

![Image](https://github.com/user-attachments/assets/005c6ab5-5db7-4cb6-b33e-8fd1022933a3)
Source: Content designed and created by DataRockie

## What is Model?
- [x] **`Algorithm`** + **`Data`** = **`Model`**
- [ ] `Algorithm` i.e. Linear Regression, Logistic Regression, Decision Tree, KNN
## R is a Great Example
```
model = lm(mpg ~ hp + wt + am, data = mtcars) ## lm == Algorithm
```
## Types of ML
- [x] Supervised Learning 🔥 (focus)
- [x] Unsupervised Learning
- [x] Reinforcement Learning
----
### 🔥 `Supervised Learning` 
aka. predictive models/ analytics
- Learn from **`labeled data`** to make a prediction
- ใช้สำหรับคอลัมน์ที่เราต้องการทำนาย เช่น ทำนายราคาบ้านในอนาคต, ราคาหุ้น, ฝนจะตกพรุ่งนี้ไหม?, churn prediction (ลูกค้าจะเลิกใช้บริการไหม?)

### 🔥 Supervised Learning 2 types
- [x] 1. `Regression (numeric):` Used for predicting a continuous numerical value. (ใช้สำหรับทำนายค่าที่เป็นตัวเลข เช่น ราคา รายได้)
- [x] 2. `Classification (category):` Used for predicting a categorical label. (ใช้สำหรับทำนายข้อมูลที่เป็นหมวดหมู่(factor) yes/no question)
----
### 🌵 `Unsupervised Learning` 
e.g. how many customer segments do we have in our database
- Learn from **`unlabeled data`** to find patterns and summarise data
- ใช้สำหรับสรุปผล data เบื้องต้น / การจับกลุ่มข้อมูล
- The most common unsupervised learning model: `K-Means Clustering` ใช้จับกลุ่มข้อมูลที่อยู่ใน database ของเรา

### 🌵 Unsupervised Learning หลักๆแบ่งออกเป็นอีก 3 หมวด
- [x] 1. `Clustering:` การจับกลุ่มข้อมูล
- [x] 2. `Association:` ส่วนมากอยู่ในธุรกิจ retail เช่น Market Basket Analysis
- [x] 3. `Dimension Reduction:` หรือการลดมิติข้อมูล คือเทคนิคที่ใช้ลดจำนวนคุณสมบัติ (features) หรือคอลัมน์ของข้อมูลลง เพื่อให้ชุดข้อมูลนั้นเล็กลงและจัดการได้ง่ายขึ้น โดยยังคงรักษาข้อมูลสำคัญไว้ให้ได้มากที่สุด
----
### 🛸 `Reinforcement Learning`
- Reinforcement Learning คือการสอนให้ AI เรียนรู้ผ่านการลองผิดลองถูก
- Agent learns to `maximize rewards` 🎁
- โดย AI จะได้รับรางวัลเมื่อทำสิ่งที่ถูกต้อง และถูกลงโทษเมื่อทำผิด เพื่อให้ AI เรียนรู้ที่จะทำพฤติกรรมที่เหมาะสมที่สุดด้วยตัวเอง เช่น AI ที่เล่นเกมจะได้รับคะแนนเมื่อชนะและเสียคะแนนเมื่อแพ้ จนในที่สุด AI ก็จะเรียนรู้วิธีการเอาชนะเกมได้เอง
