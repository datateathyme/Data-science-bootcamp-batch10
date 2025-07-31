# 📁 homework 03 - create a new restuarant.db 
```r
## homework 03 - create a new restuarant.db 

## library RSQLite
library(RSQLite)

## create connection -- open connection
con <- dbConnect(SQLite(), "new_restuarant.db")

## write table into a database 
## create table : staff
dbWriteTable(con, "staff",
             data.frame(staffId = 1:3,
                        name = c("James", "Mary", "John"),
                        position = c("Manager", "Chef", "Waiter")))

## create table : menu
dbWriteTable(con, "menu",
             data.frame(menuId = 1:6,
                        name = c("Pizza", "Hamburger", "Salad", 
                                 "Cola", "Ice Cream", "French Fries"),
                        price = c(85.50, 55.99, 42.50, 
                                  15.00, 34.20, 45.50)))

## create table : customers
dbWriteTable(con, "customers",
             data.frame(customerId = 1:6,
                        firstname = c("Jay", "May", "Bay", 
                                      "Sarah", "David", "Emily"),
                        lastname = c("Smith", "Johnson", "Williams", 
                                     "Davis", "Brown", "Miller"),
                        state = c("California", "California", "Texas", 
                                  "California", "Florida", "Texas"),
                        phone = c("555-1234", "555-5678", "555-9012", 
                                  "555-3456", "555-7890", "555-2345")))

## create table : transactions
dbWriteTable(con, "transactions", 
             data.frame(transactionId = 1:10,
                        customerId = c(2, 2, 3, 2, 5, 6, 1, 2, 4, 6),
                        menuId = c(1, 1, 3, 4, 5, 6, 2, 6, 4, 1),
                        quantity = c(2, 3, 2, 2, 1, 2, 4, 4, 6, 3),
                        total_amount = c(171.00, 256.5, 85.00, 30.00, 34.20, 
                                         91.00, 223.96, 227.5, 90.00, 102.6),
                        staffId = c(1, 2, 3, 3, 3, 1, 1, 2, 1, 2)))

## list tables in database 
dbListTables(con)

## check column name in a table
dbListFields(con, "customers")

## get data from a table
texas_customers <- dbGetQuery(con, "SELECT firstname, state 
                              FROM customers
                              WHERE state = 'Texas'")

## dbDisconnect() -- closed connection
dbDisconnect(con)
```
