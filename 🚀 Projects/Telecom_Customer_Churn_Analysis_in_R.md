# ☎ Telecom Customer Churn Analysis in R
ในธุรกิจโทรคมนาคม การรักษาฐานลูกค้าเก่ามีความสำคัญไม่แพ้กับการหาลูกค้าใหม่ การที่ลูกค้าเลิกใช้บริการ (Customer churn) จึงเป็นปัญหาสำคัญที่ต้องให้ความสนใจ

ในบทความนี้ เราจะมาวิเคราะห์ชุดข้อมูลที่เกี่ยวข้องกับพฤติกรรมการเลิกใช้บริการของลูกค้า เพื่อหาคำตอบว่าทำไมลูกค้าถึงเลิกใช้บริการ และเราจะทำอย่างไรเพื่อรักษาลูกค้าเหล่านี้ไว้ได้

## 📠 Project Overview
เป้าหมายหลักของโปรเจกต์นี้คือการทำความเข้าใจปัจจัยที่มีอิทธิพลต่อการที่ลูกค้าจะเลิกใช้บริการ (Customer Churn)

ในอุตสาหกรรมโทรคมนาคม เมื่อสามารถระบุปัจจัยเหล่านี้ได้ บริษัทก็จะสามารถวางแผนและดำเนินมาตรการเชิงรุกเพื่อรักษาลูกค้าไว้ได้ ซึ่งไม่เพียงแต่จะช่วยเพิ่มผลกำไร

แต่ยังช่วยสร้างความพึงพอใจให้กับลูกค้า และส่งเสริมความมั่นคงให้กับบริษัทที่สามารถรักษากลุ่มลูกค้าด้วยบริการที่น่าเชื่อถือได้อีกด้วย

## 📠 Understanding the Dataset
🎯📎 Dataset Link: [Telecom Customer Churn](https://media.geeksforgeeks.org/wp-content/uploads/20250617120659539429/Telcom-Customer-Churn.csv)

✅ The dataset contains columns such as

- Customer ID (รหัสลูกค้า)
- Gender (เพศ)
- Senior Citizen (สถานะผู้สูงอายุ)
- Partner (สถานะคู่สมรส)
- Dependents (จำนวนผู้อยู่ในอุปการะ)
- Tenure (ระยะเวลาการใช้บริการ)
- Phone Service (บริการโทรศัพท์)
- Internet Service (บริการอินเทอร์เน็ต)
- Churn (การเลิกใช้บริการ)
- และข้อมูลอื่น ๆ ที่เกี่ยวข้องกับลูกค้าในธุรกิจโทรคมนาคม

## 📠 1. Load Packages and Data
ในขั้นตอนนี้ เราจะทำการโหลดไลบรารีที่จำเป็นและโหลดไฟล์ข้อมูลเข้ามา จากนั้นจะตรวจสอบข้อมูลเบื้องต้นเพื่อทำความเข้าใจโครงสร้างของชุดข้อมูล โดยใช้คำสั่ง head(churn_data) เพื่อแสดงข้อมูล 6 แถวแรกของ dataframe ที่ชื่อว่า “churn_data” ซึ่งมีประโยชน์อย่างยิ่งในการตรวจสอบโครงสร้างและเนื้อหาของ dataframe ได้อย่างรวดเร็ว เพื่อดูว่าข้อมูลมีลักษณะเป็นอย่างไร
```r
## install packages
install.packages("tidyverse")

## load library
library(tidyverse)

## load data read csv file
churn_data <- read_csv("Telcom-Customer-Churn.csv")

## preview data
head(churn_data)
glimpse(churn_data)
```

จากการสำรวจข้อมูลเบื้องต้น เราจะเห็นว่าชุดข้อมูลนี้ประกอบด้วย ข้อมูลเชิงหมวดหมู่ (categorical) และ ข้อมูลเชิงตัวเลข (numerical) ซึ่งครอบคลุมข้อมูลลูกค้า ประเภทบริการ และวิธีการชำระเงิน ข้อมูลเหล่านี้เป็นพื้นฐานสำคัญในการทำความเข้าใจรูปแบบที่เกี่ยวข้องกับการเลิกใช้บริการของลูกค้า

## 📠 2. Performing Exploratory Data Analysis (EDA)
Exploratory Data Analysis (EDA) หมายถึง การสำรวจข้อมูล หรือ การวิเคราะห์ข้อมูลเชิงสำรวจ เป็นกระบวนการที่ใช้ในการทำความเข้าใจข้อมูลในเบื้องต้น เพื่อให้เห็นภาพรวมและลักษณะสำคัญของข้อมูล ก่อนที่จะลงลึกไปในขั้นตอนการวิเคราะห์ขั้นสูงต่อไป

---
### 2.1 Checking for Missing values
✅ เราจะเริ่มต้นด้วยการตรวจสอบค่าที่หายไป (missing values) และดูขนาดของชุดข้อมูล (dimensions of the dataset)

- colSums(is.na(churn_data)): ใช้สำหรับนับจำนวนค่าที่ขาดหายไปในแต่ละคอลัมน์
- dim(churn_data): ใช้สำหรับดูขนาดของชุดข้อมูล โดยจะแสดงจำนวนแถวและคอลัมน์ทั้งหมด

```r
## checking for missing values
mis_val <- (colSums(is.na(churn_data)))
print("Missing Values in All columns")
print(mis_val)

cat("Dimesnions of the dataset: ", dim(churn_data))
```
หลังจากรันโค้ดนี้แล้วเราจะเห็นว่าคอลัมน์ TotalCharges มีข้อมูลที่ขาดหายไป (missing values) ขั้นตอนนี้มีความสำคัญอย่างยิ่งต่อคุณภาพของข้อมูลสำหรับการนำไปวิเคราะห์ต่อ นอกจากนี้เรายังสามารถสรุปได้ว่าชุดข้อมูลของเรามีทั้งหมด 7,043 แถว และ 21 คอลัมน์

---
### 🎯 การจัดการค่า missing values ในคอลัมน์ TotalCharges
เราสามารถจัดการค่า missing values ในคอลัมน์ TotalCharges ด้วยวิธีต่าง ๆ ได้หลายวิธี โดยวิธีที่นิยมใช้กันคือการแทนที่ด้วยค่าเฉลี่ย (Mean Imputation) ค่ามัธยฐาน (Median Imputation) หรือการลบแถวที่มีข้อมูลขาดหายออกไปเลย

#### 🌻 **วิธีที่ 1 การลบแถวที่มี Missing Values ออก**
วิธีนี้เป็นวิธีที่ง่ายที่สุด เหมาะสำหรับกรณีที่จำนวนข้อมูลที่หายไปมีน้อยมาก (ในที่นี้คือ 11 แถว จากทั้งหมด 7,043 แถว) ซึ่งจะไม่ส่งผลกระทบต่อการวิเคราะห์มากนัก
```r
## ลบแถวที่มีค่า missing values ในคอลัมน์ TotalCharges ออก
churn_data <- na.omit(churn_data)

## ตรวจสอบว่ายังมี missing values อยู่หรือไม่
colSums(is.na(churn_data))

## ตรวจสอบขนาดของ dataset อีกครั้ง
dim(churn_data)
```
#### 🌻 **วิธีที่ 2 การแทนที่ด้วยค่าเฉลี่ย (Mean Imputation)**
วิธีนี้จะนำค่าเฉลี่ยของคอลัมน์ TotalCharges มาแทนที่ค่า missing value เหมาะสำหรับข้อมูลที่มีการกระจายตัวแบบปกติ (Normal Distribution)
```r
## คำนวณค่าเฉลี่ยของ TotalCharges โดยไม่รวม missing value
mean_total_charges <- mean(churn_data$TotalCharges, na.rm = TRUE)

## แทนที่ค่า missing value ในคอลัมน์ TotalCharges ด้วยค่า mean
churn_data$TotalCharges[is.na(churn_data$TotalCharges)] <- mean_total_charges

## ตรวจสอบว่ายังมี missing values อยู่หรือไม่
colSums(is.na(churn_data))
```
#### 🌻 **วิธีที่ 3 การแทนที่ด้วยค่ามัธยฐาน (Median Imputation)**
วิธีนี้จะนำค่ามัธยฐานหรือค่ากลางของข้อมูลในคอลัมน์ TotalCharges มาแทนที่ค่าmissing values ซึ่งเป็นวิธีที่ทนต่อค่าผิดปกติ (Outliers) มากกว่าค่าเฉลี่ย
```r
## คำนวณค่ามัธยฐานของ TotalCharges โดยไม่รวม missing value
median_total_charges <- median(churn_data$TotalCharges, na.rm = TRUE)

## แทนที่ค่าที่หายไปในคอลัมน์ TotalCharges ด้วยค่า median
churn_data$TotalCharges[is.na(churn_data$TotalCharges)] <- median_total_charges

## ตรวจสอบว่ายังมี missing values อยู่หรือไม่
colSums(is.na(churn_data))
```
### 🌻 ควรเลือกวิธีไหน?
สำหรับกรณีนี้ แอดขอเลือก วิธีที่ 1 การลบแถวที่มีข้อมูลขาดหายออก ดูจะเป็นทางเลือกที่ดีที่สุด เนื่องจากข้อมูลที่หายไปมีจำนวนน้อยมาก การลบข้อมูลออกจึงไม่ส่งผลกระทบต่อการวิเคราะห์ และเป็นวิธีที่ง่ายที่สุด แต่หากข้อมูลที่หายไปมีจำนวนมาก การเลือกใช้ Mean หรือ Median Imputation จะช่วยรักษาข้อมูลส่วนใหญ่ไว้ได้ดีกว่า 👌
```r
## clean missing values
churn_data <- na.omit(churn_data)

colSums(is.na(churn_data))
dim(churn_data)
```
หลังจากใช้โค้ดข้างต้นแล้ว จำนวนแถวจะลดลงจาก 7,043 เหลือ 7,032 แถว และค่า missing value ในคอลัมน์ TotalCharges ก็จะหายไป

---
### 2.2 Checking the summary of the data
ฟังก์ชัน summary() ในภาษา R ใช้สำหรับสรุปข้อมูลทางสถิติของแต่ละคอลัมน์ใน dataframe สำหรับคอลัมน์ที่เป็นตัวเลข (numeric) ฟังก์ชันนี้จะแสดงค่า minimum ,1st quartile, median, mean, 3rd quartile และ maximum แต่ถ้าเป็นคอลัมน์เชิงหมวดหมู่ (categorical) จะแสดงความถี่ของแต่ละหมวดหมู่
```r
## checking the summary of the data
summary(churn_data)
```
---
## 📠 3. Performing Data Visualization
✅ เราจะสร้าง Visualization เพื่อดูการกระจายตัวของลูกค้าที่เลิกใช้บริการ (churn) และสำรวจว่าปัจจัยต่างๆ เช่น ประเภทสัญญา (contract type) ระยะเวลาการใช้บริการ (tenure) และประเภทบริการอินเทอร์เน็ต (internet service) มีผลต่อการเลิกใช้บริการหรือไม่อย่างไร

---
### 3.1 Churn Distribution using Pie Chart
✅ We will be plotting a bar chart to display the distribution of customer churn

- geom_bar() is used to create a bar chart and coord_polar() transforms the bar chart into a pie chart.
- geom_text() adds the percentage labels to the chart.

```r
## create pie chart
churn_counts <- table(churn_data$Churn)

churn_df <- as.data.frame(churn_counts)
names(churn_df) <- c("Churn", "Count")


ggplot(data=churn_df, aes(x="", y = Count, fill = Churn)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  geom_text(aes(label = scales::percent(Count / sum(Count))),
            position = position_stack(vjust = 0.5)) +
  ggtitle("Churn Distribution") +
  theme_void()
```
--- 
### 3.2 Churn Distribution of Contract Status
✅ แผนภูมิ bar chart นี้แสดงให้เห็นว่า การเลิกใช้บริการ (churn) มีความแตกต่างกันอย่างไรตามประเภทสัญญา ได้แก่ สัญญารายเดือน (Month-to-month) สัญญาหนึ่งปี (One year) และสัญญาแบบสองปี (Two year)
```r
## create bar chart contract status
ggplot(churn_data, aes(x = Churn, fill = Contract)) +
  geom_bar(position = "dodge") +
  labs(title = "Churn Distribution Contract Status", 
       x = "Churn") +
  theme_minimal()
```
---
### 3.3 Churn Distribution of Tenure
✅ แผนภูมิแท่งนี้แสดงให้เห็นการกระจายตัวของการเลิกใช้บริการ (churn) ที่สัมพันธ์กับระยะเวลาการใช้บริการ (tenure) หรือจำนวนเดือนที่ลูกค้าอยู่กับบริษัท
```r
## create bar chart tenure
ggplot(churn_data, aes(x = tenure, fill = Churn)) +
  geom_bar(position = "dodge",width = 2,colour="black") +
  labs(title = "Churn Distribution Tenure", 
       x = "Months", 
       y = "Count") +
  theme_minimal()
```
แผนภูมินี้ช่วยให้เราเข้าใจว่า จำนวนเดือนหรือระยะเวลาที่ลูกค้าใช้บริการกับบริษัทของเรามีความสัมพันธ์กับการตัดสินใจเลิกใช้บริการ โดยลูกค้าใหม่ที่เพิ่งใช้บริการไม่นานมีโอกาสสูงที่จะเลิกใช้บริการมากกว่าคนที่ใช้บริการมาแล้วยาวนาน

---
### 3.4 Churn Distribution of Internet Services
✅ แผนภูมิแท่งนี้แสดงให้เห็นการกระจายตัวของการเลิกใช้บริการเมื่อเทียบกับประเภทบริการอินเทอร์เน็ตที่ใช้งาน (DSL หรือ Fiber optic)
```r
## create bar chart InternetService
ggplot(churn_data, aes(x = InternetService, fill = Churn)) +
  geom_bar(position = "dodge") +
  labs(title = "Churn Distribution Internet Services", 
       x = "Internet Service") +
  theme_minimal()
```
แผนภูมิแท่งนี้ช่วยให้เห็นภาพว่า ประเภทบริการอินเทอร์เน็ต (DSL vs. Fiber optic) มีผลกระทบต่ออัตราการเลิกใช้บริการ (Churn rate) ของลูกค้า

---
### 3.5 Churn Based on Senior Citizen Status
✅ การระบุจำนวนผู้สูงอายุจะช่วยให้สามารถปรับแต่งบริการและโปรโมชันสำหรับกลุ่มลูกค้าเฉพาะนี้ได้ แผนภูมิแท่งนี้จะเปรียบเทียบการกระจายตัวของการเลิกใช้บริการระหว่างกลุ่มผู้สูงอายุและกลุ่มที่ไม่ใช่ผู้สูงอายุ
```r
## churn based on Senior Citizen Status
senior_data <- data.frame(
  SeniorCitizen = c("No", "Yes"),
  Count = c(6932, 1539)
)

ggplot(senior_data, aes(x = SeniorCitizen, 
                        y = Count, 
                        fill = SeniorCitizen)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Senior Citizen Status", 
       x = "Senior Citizen", 
       y = "Count") +
  scale_fill_manual(values = c("No" = "#66B3FF", "Yes" = "#FF9999"))
```
---
### 3.6 Churn Based on Payment Method
✅ แผนภูมิแท่งนี้แสดงการกระจายตัวของวิธีการชำระเงินที่ลูกค้าเลือกใช้ ซึ่งช่วยให้เข้าใจถึงความต้องการของลูกค้าในด้านการชำระค่าบริการ และสามารถนำข้อมูลนี้ไปปรับปรุงกลยุทธ์ด้านการเรียกเก็บเงินและการชำระเงินได้
```r
## churn based on Payment Method
payment_data <- data.frame(
  PaymentMethod = c("Bank transfer (automatic)", "Credit card (automatic)",
                    "Electronic check", "Mailed check"),
  Count = c(1542, 1521, 2365, 1604)
)

ggplot(payment_data, aes(x = PaymentMethod, 
                         y = Count, 
                         fill = PaymentMethod)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Payment Method Distribution", 
       x = "Payment Method", 
       y = "Count") +
  scale_fill_brewer(palette = "Set3")
```
กราฟนี้แสดงให้เห็นภาพรวมของวิธีการชำระเงินที่ลูกค้าเลือกใช้ ซึ่งช่วยให้บริษัทเข้าใจพฤติกรรมและความต้องการของลูกค้าในด้านการชำระเงินได้ดียิ่งขึ้น

---
## 🎯 Conclusion
From our analysis, we observed that

✅ สัญญารายเดือน: ลูกค้าที่ทำสัญญารายเดือนมีแนวโน้มที่จะเลิกใช้บริการสูงกว่า ซึ่งชี้ให้เห็นว่าการเสนอสัญญาที่ยาวขึ้นอาจช่วยเพิ่มการรักษาลูกค้าได้

✅ ระยะเวลาการใช้บริการ: ลูกค้าใหม่ที่เพิ่งใช้บริการได้ไม่นานมีความเสี่ยงสูงที่จะเลิกใช้บริการ แสดงให้เห็นถึงความจำเป็นในการใช้กลยุทธ์ในการรักษาลูกค้าตั้งแต่ช่วงแรกของการสมัครสมาชิก

✅ บริการอินเทอร์เน็ต: บริการอินเทอร์เน็ตแบบ Fiber optic มีอัตราการเลิกใช้บริการมากกว่าแบบ DSL ซึ่งบ่งชี้ถึงโอกาสในการปรับปรุงคุณภาพบริการ หรือส่งเสริมให้ลูกค้าเปลี่ยนไปใช้บริการอื่นที่ดีกว่าแทน

✅ กลุ่มผู้สูงอายุ: ลูกค้าที่เป็นผู้สูงอายุมีอัตราการเลิกใช้บริการที่ต่ำกว่า ซึ่งเน้นย้ำว่าจำเป็นต้องมีบริการที่ตอบโจทย์กลุ่มลูกค้าที่ไม่ใช่ผู้สูงอายุโดยเฉพาะ เนื่องจากเป็นกลุ่มที่มีโอกาสเลิกใช้บริการมากกว่า

✅ วิธีการชำระเงิน: ความนิยมในการชำระเงินด้วย electronic checks ชี้ให้เห็นถึงโอกาสในการปรับปรุงกลยุทธ์การออกใบแจ้งหนี้และการชำระเงินให้เหมาะสมและสอดคล้องกับการใช้งานให้มากยิ่งขึ้น

การแก้ไขปัจจัยเหล่านี้จะช่วยให้บริษัทสามารถนำกลยุทธ์การรักษาลูกค้าที่มีประสิทธิภาพมาใช้เพื่อลดอัตราการเลิกใช้บริการได้

