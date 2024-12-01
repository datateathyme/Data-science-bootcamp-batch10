## homework in R create chatbot order pizza Ver.2
## create menu 
# Pizza menu 
pizza_menu <- data.frame(
  menu_id = 1:4,
  pizza_name = c("Margherita", "Pepperoni", "Hawaiian", "Supreme"),
  pizza_price = c(20 , 25, 35, 45)
)

# Drink menu
drink_menu <- data.frame(
  menu_id = 1:4,
  drink_name = c("Coke", "Italian Soda", "Lemonade", "Water"),
  drink_price = c(4, 8, 6, 2)
)


## order version 2 used a while loop
pizza_order_v2 <- function() {
  print("Hello! Welcome to Pizza Pie Palace. Let's get cheesy!")
  print("Pizza Menu: Let them choose ")
  print(pizza_menu)
  
  pizza_choice <- 0
  while (pizza_choice < 1 || pizza_choice > nrow(pizza_menu)) {
    pizza_choice <- as.integer(readline("Please select your pizza (enter the menu_ID): "))
    if (pizza_choice < 1 || pizza_choice > nrow(pizza_menu)) {
      print("Invalid pizza choice. Please try again.")
    }
  }
  
  print("Choose your drink ")
  print(drink_menu)
  
  drink_choice <- 0
  while (drink_choice < 1 || drink_choice > nrow(drink_menu)) {
    drink_choice <- as.integer(readline("Please select your drink (enter the menu_ID): "))
    if (drink_choice < 1 || drink_choice > nrow(drink_menu)) {
      print("Invalid drink choice. Please try again.")
    }
  }
  
  print("Thank you for your order! ")
  check_bill(pizza_choice, drink_choice)
}

## check bill function
check_bill <- function(pizza_choice, drink_choice) {
  pizza_name <- pizza_menu$pizza_name[pizza_choice]
  pizza_price <- pizza_menu$pizza_price[pizza_choice]
  drink_name <- drink_menu$drink_name[drink_choice]
  drink_price <- drink_menu$drink_price[drink_choice]
  total_price <- pizza_price + drink_price
  
  print("-------------------")
  print(paste("You ordered:", pizza_name, "and", drink_name))
  print(paste("Total price:", total_price, "USD"))
  print("---------------------------------------")
  print("Enjoy your meal! Have a nice day! 😍")
}


