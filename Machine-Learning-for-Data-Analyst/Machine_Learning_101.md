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
  
  ![Image](https://github.com/user-attachments/assets/dbfc8141-42a5-4977-b62a-7bc2937ed1e8)
Source: Content designed and created by DataRockie
----
### 🌵 `Unsupervised Learning` 
e.g. how many customer segments do we have in our database
- Learn from **`unlabeled data`** to find patterns and summarise data
- ใช้สำหรับสรุปผล data เบื้องต้น / การจับกลุ่มข้อมูล
- The most common unsupervised learning model: `K-Means Clustering` ใช้จับกลุ่มข้อมูลที่อยู่ใน database ของเรา

### 🌵 Unsupervised Learning หลักๆแบ่งออกเป็นอีก 3 หมวด
- [x] 1. `Clustering:` การจับกลุ่มข้อมูล
- [x] 2. `Association:` ส่วนมากอยู่ในธุรกิจ retail เช่น Market Basket Analysis
- [x] 3. `Dimension Reduction (Component Analysis):` หรือการลดมิติข้อมูล คือเทคนิคที่ใช้ลดจำนวนคุณสมบัติ (features) หรือคอลัมน์ของข้อมูลลง เพื่อให้ชุดข้อมูลนั้นเล็กลงและจัดการได้ง่ายขึ้น โดยยังคงรักษาข้อมูลสำคัญไว้ให้ได้มากที่สุด
----
## summary 

![Image](https://github.com/user-attachments/assets/43b9e331-4fb9-485b-86b4-dbd9ee512496)

Source: Content designed and created by DataRockie

----
### 🛸 `Reinforcement Learning`
- Reinforcement Learning คือการสอนให้ AI เรียนรู้ผ่านการลองผิดลองถูก
- Agent learns to `maximize rewards` 🎁
- โดย AI จะได้รับรางวัลเมื่อทำสิ่งที่ถูกต้อง และถูกลงโทษเมื่อทำผิด เพื่อให้ AI เรียนรู้ที่จะทำพฤติกรรมที่เหมาะสมที่สุดด้วยตัวเอง เช่น AI ที่เล่นเกมจะได้รับคะแนนเมื่อชนะและเสียคะแนนเมื่อแพ้ จนในที่สุด AI ก็จะเรียนรู้วิธีการเอาชนะเกมได้เอง
----
## Basic ML Workflow
🔮 **ML workflow แบบ Train-Test-Split แบ่งได้เป็น 4 ขั้นตอน `split data > train > score > evaluate`**


![Image](https://github.com/user-attachments/assets/2d7bd18e-aef2-49b7-aacb-462be12e3a27)
Source: Content designed and created by DataRockie

## Basic Machine Learning Workflow (from Gemini)
![Image](https://github.com/user-attachments/assets/7b31c970-4e94-40ae-bbf2-2c008791d294)

1. Define the Problem
   - Goal: What do we want to achieve?
   - Problem Type:
     - Regression: Predict a number (e.g., house price).
     - Classification: Predict a category (e.g., spam or not spam).
     - Clustering: Find groups (e.g., customer segments).
2. Prepare Data
   - Collection: Get the raw data.
   - Cleaning:
     - Handle missing values.
     - Remove duplicates.
     - Correct errors.
   - Feature Engineering:
     - Create new variables.
     - Transform existing data.
   - Split:
     - Training Set (e.g., 80%): Used to build the model.
     - Testing Set (e.g., 20%): Used to evaluate the model.
3. Train the Model
   - Algorithm Selection: Choose the right model for the problem (e.g., Linear Regression, Decision Tree, etc.).
   - Fitting: The model learns patterns from the training data.
4. Evaluate the Model
   - Testing: Apply the trained model to the testing data.
   - Metrics: Measure performance.
     - Regression: Mean Squared Error.
     - Classification: Accuracy, Precision, Recall.
   - Diagnosis: How well did the model perform?
5. Refine & Deploy
   - Improvement:
     - Adjust model settings (Hyperparameter Tuning).
     - Try a different algorithm.
     - Go back to Feature Engineering.
   - Deployment: Use the final, refined model to make predictions on new data.
----
### Testing Model
- Testing model is a very important step in ML workflow
- เพราะเราต้องการนำ model ไปทำนายกับ unseen data หรือข้อมูลที่เราไม่เคยเห็นมาก่อน
- ดังนั้นผลลัพธ์ของการ train & test ต้องมีค่าใกล้เคียงกัน ถ้า Train data ได้คะแนนดี ตอนนำไป Test ก็ควรจะต้องได้คะแนนใกล้เคียงกัน เพื่อความแม่นยำในการนำไปทำนายกับข้อมูลในอนาคตที่เราไม่รู้
- เราเรียกกระบวนกวนการนี้ว่า Generalization คือ model ที่ทำขึ้นมา ควรจะนำไปทำนายกับข้อมูลที่ไม่เคยเห็นมาก่อนได้ดี
----
## Linear model
```r
## create our first model with caret
install.packages("caret")
library(caret)

data("mtcars")
head(mtcars)

set.seed(42)
n <- nrow(mtcars) # นับจำนวนแถวใน Dataframe
id <- sample(n, size = 0.8 * n)
train_data <- mtcars[id, ]
test_data <- mtcars[-id, ]

## create function and split data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data) 
  id <- sample(n, size = 0.8 * n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

## train model
lm_model <- train(mpg ~ hp, 
      data = split_data[[1]],
      method = "lm")

## score and evaluate
p <- predict(lm_model, newdata = split_data[[2]])

error <- split_data[[2]]$mpg - p
rmse <- sqrt(mean(error **2))


# rmse: train and test
cat("Train: ", lm_model$results[[2]], "\nTest: ", rmse)
```
## Classification model
```r
## Classification model
library(caret)

data("mtcars")

## prepare data
mtcars$am <- factor(mtcars$am, 
                    levels= c(0, 1),
                    labels = c("Auto", "Manual"))

## split data
train_test_split <- function(data) {
  set.seed(42)
  n <- nrow(data) 
  id <- sample(n, size = 0.7 * n)
  train_data <- data[id, ]
  test_data <- data[-id, ]
  return(list(train_data, test_data))
}

split_data <- train_test_split(mtcars)

## train model
glm_model <- train(am ~ mpg, 
                  data = split_data[[1]],
                  method = "glm")

## score and evaluate
p <- predict(glm_model, newdata = split_data[[2]])

acc <- mean( p == split_data[[2]]$am)

# result
acc_train <- 0.8
acc_test <- 0.6

# Accuracy: train and test
cat("Accuracy Train: ", acc_train, "\nAccuracy Test: ", acc_test)
```
