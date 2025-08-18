## 🍕**bot ordering pizza**
```py
import pandas as pd
```
```py
## pizza menu
pizza_menu = pd.DataFrame({
    "menu_id": [1, 2, 3, 4],
    "pizza_name": ["Margherita", "Pepperoni", "Hawaiian", "Vegetarian"],
    "pizza_price": [20 , 25, 35, 45]
})

pizza_menu
```
```py
# Drink menu
drink_menu = pd.DataFrame({
    "menu_id": [1, 2, 3, 4],
    "drink_name": ["Pepsi", "Coke", "Fanta", "Sprite"],
    "drink_price": [4, 8, 6, 2]
})

drink_menu
```
```py
## bot ordering pizza

def check_bill(selected_pizza_row, selected_drink_row):
    """
    Calculates and prints the total bill based on the selected items.
    """
    # Extract the name and price from the DataFrame rows
    pizza_name = selected_pizza_row['pizza_name'].iloc[0]
    pizza_price = selected_pizza_row['pizza_price'].iloc[0]

    drink_name = selected_drink_row['drink_name'].iloc[0]
    drink_price = selected_drink_row['drink_price'].iloc[0]

    # Calculate the total price
    total_price = pizza_price + drink_price

    print("\n-------------------------")
    print("Your Final Bill")
    print("-------------------------")
    print(f"Pizza: {pizza_name} - ${pizza_price}")
    print(f"Drink: {drink_name} - ${drink_price}")
    print(f"Total: ${total_price}")
    print("-------------------------")
    print("Enjoy your meal! 😊")


def bot_pizza():
    print("Hello! Welcome to Pizza Pie Palace. Let's get cheesy!")
    print("Pizza Menu: Let them choose ")
    print(pizza_menu)
    cost = 0

    # Loop for pizza_choice
    while True:
        try:
            pizza_choice = int(input("Please select your pizza (enter the menu_ID): "))

            if pizza_choice in pizza_menu['menu_id'].values:
                selected_pizza_row = pizza_menu[pizza_menu['menu_id'] == pizza_choice]
                break
            else:
                print("Invalid pizza choice. Please try again.")
        except ValueError:
            print("Invalid input. Please enter a number.")

    print("\n")
    print("Drink Menu: Please choose ")
    print(drink_menu)

    # Loop for drink_choice
    while True:
        try:
            drink_choice = int(input("Please select your drink (enter the menu_ID): "))

            if drink_choice in drink_menu['menu_id'].values:
                selected_drink_row = drink_menu[drink_menu['menu_id'] == drink_choice]
                break
            else:
                print("Invalid drink choice. Please try again.")
        except ValueError:
            print("Invalid input. Please enter a number.")

    # Call the new function to check the bill after both choices are made
    check_bill(selected_pizza_row, selected_drink_row)
```
```py
bot_pizza()
```
