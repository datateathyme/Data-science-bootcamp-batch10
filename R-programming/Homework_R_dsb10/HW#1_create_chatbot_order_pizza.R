## homework in R
## 1. create chatbot order pizza
pizza <- function() {
  print("Hello welcome to pizzaria restaurant!")
  ## present menu to a user
  ## let them choose a menu
  ## let then choose a drink
  ##  - check bill
}

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


## Pizza order
pizza_order <- function() {
  print("Hello! Welcome to Pizza Pie Palace. Let's get cheesy!")
  print("Pizza Menu: Let them choose ")
  print(pizza_menu)
  pizza_choice <- readline("Please select your pizza (enter the menu_ID): ")
  pizza_choice <- as.integer(pizza_choice)
  
  print("Choose your drink ")
  print(drink_menu)
  drink_choice <- readline("Please select your drink (enter the menu_ID): ")
  drink_choice <- as.integer(drink_choice)
  
  print("Thank you for your order! ")
  check_bill(pizza_choice, drink_choice)
}

## Check bill
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
