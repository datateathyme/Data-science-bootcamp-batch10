## install packages
install.packages(c("readr",
                   "readxl",
                   "googlesheets4",
                   "jsonlite",
                   "dplyr",
                   "sqldf",
                   "RSQLite"))

## load library
library(readr)
library(readxl)
library(googlesheets4)
library(jsonlite)
library(dplyr)
library(sqldf)
library(RSQLite)
library(skimr)

df1 <- data.frame(
  id = 1:5,
  name = c("John","Marry", "Anna",
           "David", "Lisa")
)

df2 <- data.frame(
  city = c( rep("BKK",3), rep("London",2) ),
  country = c( rep("TH",3), rep("UK",2))
)

# load library(sqldf)
library(sqldf)
library(readr)

school <- read_csv("school.csv")

sqldf("select * from school;")
sqldf("select 
      avg(student), 
      sum(student)
      from school;")


sqldf("select
      school_id,
      school_name,
      country
      from school;")

sql_query <- "select * from school
              where country = 'USA'"
sqldf(sql_query)
usa_school <- sqldf(sql_query)


# load library
library(QSQLite)

## connect to SQLite database( .db file)
# 1. open connection
conn <- dbConnect(SQLite(),"chinook.db")

# 2. get data
dbListTables(conn)
dbListFields(conn, "customers")

df <- dbGetQuery(conn,"select * from customers 
           where country = 'USA'")
View(df)

df2 <- dbGetQuery(conn,"select * from customers 
           where country = 'United Kingdom'")

# 3. close connection 
dbDisconnect(conn)
