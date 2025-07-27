## Load library
library(dplyr)    
library(ggplot2)
library(stringr)  

## Mock Up Data
# กำหนดจำนวนนักศึกษา
num_students <- 30

## สร้าง StudentID และ StudentName
set.seed(42)
student_data <- data.frame(
  student_id = paste0("S",1:num_students),
  student_name = paste0("Student_",1:num_students)
)


## Mock up score Using "runif" for random score 
student_data$Assignment1 <- round(runif(num_students, min = 10,  max = 20))
student_data$Assignment2 <- round(runif(num_students, min = 12,  max = 20))
student_data$Quiz1       <- round(runif(num_students, min = 5,   max = 10))
student_data$Midterm     <- round(runif(num_students, min = 15,  max = 30))
student_data$FinalExam   <- round(runif(num_students, min = 20,  max = 40))

## แสดงข้อมูล 5 แถวแรกเพื่อตรวจสอบ
head(student_data)

## กำหนดคะแนนเต็มสำหรับแต่ละส่วน
score_assign1 <- 20
score_assign2 <- 20
score_quiz1   <- 10
score_midterm <- 30
score_final   <- 40
total_max_score <- score_assign1 + score_assign2 + score_quiz1 + score_midterm + score_final

## คำนวณคะแนนรวมและคิดเป็นเปอร์เซ็นต์
student_grades <- student_data %>%
  mutate(
    TotalScore = Assignment1 + Assignment2 + Quiz1 + Midterm + FinalExam,
    Percentage = (TotalScore / total_max_score) * 100) %>%
  mutate(
    Grade = ifelse(Percentage >= 80, "A",
            ifelse(Percentage >= 70, "B", 
            ifelse(Percentage >= 60, "C", 
            ifelse(Percentage >= 50, "D", "F"))))
  )

## optional หรือเขียนเงื่อนไขโดยใช้ `case_when()`
library(dplyr) # ตรวจสอบให้แน่ใจว่าได้โหลดแพ็กเกจ dplyr แล้ว

student_grades <- student_data %>%
  mutate(
    TotalScore = Assignment1 + Assignment2 + Quiz1 + Midterm + FinalExam,
    Percentage = (TotalScore / total_max_score) * 100
  ) %>%
  mutate(
    Grade = case_when(
      Percentage >= 80 ~ "A",
      Percentage >= 70 ~ "B",
      Percentage >= 60 ~ "C",
      Percentage >= 50 ~ "D",
      TRUE ~ "F" # เงื่อนไขสุดท้ายสำหรับค่าอื่นๆ ทั้งหมดที่เหลือ
    )
  )

## Result
student_grades %>%
  select(student_id,student_name, TotalScore, Percentage, Grade) %>%
  arrange(desc(Percentage)) %>%
  head(10)

print("--- สรุปค่าสถิติคะแนนเปอร์เซ็นต์โดยรวม ---")
sum_grades <- student_grades %>%
  summarize(
    min_percentage    = min(Percentage),
    q1_percentage     = quantile(Percentage, prob = 0.25),
    avg_percentage    = mean(Percentage),
    median_percentage = quantile(Percentage, prob = 0.5),
    q3_percentage     = quantile(Percentage, prob = 0.75),
    max_percentage    = max(Percentage),
    sd_percentage     = sd(Percentage) 
  )

## กราฟ Histogram แสดงการกระจายตัวของคะแนนรวม (Percentage)
ggplot(student_grades, aes(x = Percentage)) +
  geom_histogram(binwidth = 5, fill = "salmon", color = "white", alpha = 0.9) + 
  labs(
    title = "การกระจายตัวของคะแนนสอบรวม (เป็นเปอร์เซ็นต์)",
    x = "คะแนนเปอร์เซ็นต์",
    y = "จำนวนนักศึกษา"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 16))

## กราฟ Bar Chart แสดงจำนวนนักศึกษาในแต่ละเกรด
ggplot(student_grades, aes(x = Grade, fill = Grade)) +
  geom_bar(color = "white") +
  labs(
    title = "จำนวนนักศึกษาในแต่ละเกรด",
    x = "เกรด",
    y = "จำนวนนักศึกษา"
  ) +
  scale_fill_brewer(palette = "Set2") + 
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 16))
