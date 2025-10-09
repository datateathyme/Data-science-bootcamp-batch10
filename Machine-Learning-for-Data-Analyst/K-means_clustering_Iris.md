# 🌺 K-means clustering project using the Iris dataset in RStudio
## 1. Load the Iris Dataset
The Iris dataset is a built-in dataset in R, so it can be loaded directly
```r
## Load library
library(tidyverse)

## Load data
data(iris)
```
## 2. Data Preparation
เลือกตัวแปรสำหรับการจัดกลุ่ม K-means is an unsupervised learning algorithm จึงต้องลบคอลัมน์ Species (ซึ่งเป็นป้ายกำกับ/ผลลัพธ์ที่เราจะเปรียบเทียบ) ออกจากชุดข้อมูลที่เราจะใช้จัดกลุ่ม
```r
## Data Preparation
Species <- iris$Species
iris_data <- iris %>% select(-Species)
```
## 3. Determine the Optimal Number of Clusters (K)
- The Iris dataset inherently has three species, suggesting K=3. However, in real-world scenarios, the optimal K is often unknown and can be estimated using methods like the Elbow method or Silhouette method
- ก่อนทำการจัดกลุ่มจริง ต้องหาค่า K ที่เหมาะสม (จำนวนกลุ่ม) โดยทั่วไปจะใช้วิธี Elbow Method หรือ Silhouette Method โดยทั่วไปสำหรับชุดข้อมูล Iris เราทราบอยู่แล้วว่ามี 3 ชนิด แต่ในกรณีที่ไม่มีข้อมูลป้ายกำกับ เราจะต้องใช้วิธีการเหล่านี้เพื่อค้นหา K

ติดตั้งและโหลดแพ็กเกจที่จำเป็น: มักใช้แพ็กเกจ `factoextra` และ `cluster`
```r
# install.packages("factoextra")
# install.packages("cluster")
library(factoextra)
library(cluster)
```
ใช้ Elbow Method: พล็อตผลรวมกำลังสองภายในกลุ่ม (Within-Cluster Sum of Squares, WCSS) เทียบกับจำนวนกลุ่ม (K) แล้วหาจุดที่กราฟมีความชันลดลงอย่างเห็นได้ชัด (แอดขอเรียกง่ายๆว่าจุกหักศอก)
```r
fviz_nbclust(iris_data, kmeans, method = "wss")
```
![Image](https://github.com/user-attachments/assets/b72c08b1-02d3-4c19-b1ad-2769cb056b39)

## 4. Perform K-means Clustering
Apply the kmeans() function to the prepared data, specifying the number of clusters (K)
```r
## K-means Clustering
set.seed(42)
km_result <- kmeans(iris_data, centers = 3)
print(km_result)
```
## 5. Evaluate and Visualize the Clusters (cross check)
Assess the quality of the clustering and visualize the results
- เปรียบเทียบกับชนิดจริง (Species): ตรวจสอบว่ากลุ่มที่สร้างขึ้นสอดคล้องกับชนิดของดอกไม้จริงได้ดีเพียงใดโดยใช้ตารางไขว้ (Contingency Table)
```r
## Evaluate and Visualize the Clusters
cluster_membership <- km_result$cluster

## Compare clusters with original species (for evaluation)
table(Species, cluster_membership)

iris_clustered <- data.frame(iris, cluster = as.factor(km_result$cluster))
```
```r
## Visualize the clusters (e.g., using 'ggplot2' and 'factoextra')
fviz_cluster(km_result, data = iris_data, 
             geom = "point",
             ellipse.type = "convex",
             palette = "jco",
             ggtheme = theme_minimal(),
             main = "K-means Clustering of Iris Dataset")
```
![Image](https://github.com/user-attachments/assets/4039711e-00eb-412a-8c39-7b223bcf4c4a)

```r
ggplot(iris_clustered, aes(x=Petal.Length, y = Petal.Width, color = cluster, shape = Species)) +
  geom_point(size = 3) +
  labs(title = "K-means Clusters vs. Actual Species") +
  theme_minimal()
```
![Image](https://github.com/user-attachments/assets/2682b1d6-96fe-4dbc-a3dd-63349408905e)
**สรุปผลลัพธ์การเปรียบเทียบ K-means vs. ชนิดจริง**

กราฟนี้แสดงให้เห็นว่า K-means Clustering ทำงานได้ดีมากในการจัดกลุ่มข้อมูล Iris ดังนี้:

1. การจัดกลุ่มที่สมบูรณ์แบบ (Perfect Match)

    Cluster 1 (สีส้ม): ตรงกับ Iris setosa (สัญลักษณ์ข้าวหลามตัด) ได้อย่างสมบูรณ์แบบ ไม่มีการจัดกลุ่มผิดพลาดเลย

2. การจัดกลุ่มที่มีการทับซ้อน (Overlap/Misclassification)

    Cluster 2 (สีเขียว) และ Cluster 3 (สีฟ้า): สองกลุ่มนี้ (ซึ่งควรจะเป็น Versicolor และ Virginica) มีการทับซ้อนกันบ้าง

        Versicolor (สัญลักษณ์สามเหลี่ยม) ส่วนใหญ่อยู่ใน Cluster 2 (สีเขียว) แต่ก็มีบางจุดที่ถูกจัดให้อยู่ใน Cluster 3 (สีฟ้า) (จุดสามเหลี่ยมสีฟ้า)

        Virginica (สัญลักษณ์สี่เหลี่ยม) ส่วนใหญ่อยู่ใน Cluster 3 (สีฟ้า) แต่ก็มีบางจุดที่ถูกจัดให้อยู่ใน Cluster 2 (สีเขียว) (จุดสี่เหลี่ยมสีเขียว)

🔑 ใจความสำคัญ

ผลลัพธ์นี้ยืนยันว่า Petal Length และ Petal Width เป็นตัวแปรที่ทรงพลังมาก ในการแยกชนิดของดอก Iris โดยเฉพาะการแยก Setosa ออกจากกลุ่มอื่น แต่การแยก Versicolor และ Virginica ยังคงมีความท้าทายเล็กน้อย เนื่องจากมีลักษณะทางกายภาพสองมิตินี้ที่ค่อนข้างใกล้เคียงกัน
