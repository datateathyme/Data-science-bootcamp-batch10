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
```r
## Evaluate and Visualize the Clusters
cluster_membership <- km_result$cluster

## Compare clusters with original species (for evaluation)
table(Species, cluster_membership)
```
