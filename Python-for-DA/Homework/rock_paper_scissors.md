## 🏡 Homework - rock paper scissors game in python

```py
## Homework - rock paper scissors

# Import library
import random

# create function com choice
def gen_computer_choice():
  """
  Generates a random choice for the computer between "rock", "paper", and "scissors".

  Returns:
      str: The computer's choice.
  """
  choices = ["rock", "paper", "scissors"]
  return random.choice(choices)

# create function determine winner
def determine_winner(player_choice, computer_choice):
  """
  Determines the winner of a single round of Rock-Paper-Scissors.

  Args:
      player_choice (str): The player's choice.
      computer_choice (str): The computer's choice.

  Returns:
      str: The result of the round ("Player wins!", "Computer wins!", or "Tie").
  """
  if player_choice == computer_choice:
    return "Tie 🤜🤛 "
  elif (
      (player_choice == "rock" and computer_choice == "scissors") or
      (player_choice == "paper" and computer_choice == "rock") or
      (player_choice == "scissors" and computer_choice == "paper")
  ):
    return "Player wins! 🎉"
  else:
    return "Computer win! 🎊"

## create function play a game
def play_game():
  """
  Plays a game of Rock-Paper-Scissors with the user.
  """
  print("Let's play a game 🚀")
  print("Ready to rock, paper, scissors? Choose wisely! ")
  player_score = 0
  computer_score = 0

  for round in range(1, 11):
    print(f"Round: {round}")
    
    player_choice = input("Choose your choice: ")
    computer_choice = gen_computer_choice()
    
    print(f"Player's Turn: {player_choice}")
    print(f"Computer's Turn: {computer_choice}")

    result = determine_winner(player_choice, computer_choice)
    print(result)

    if result == "Player wins! 🎉":
      player_score += 1
    elif result == "Computer win! 🎊":
      computer_score += 1
    
    print("------------------------")

  print("Game Over!")
  print(f"Player Score: {player_score}")
  print(f"Computer Score: {computer_score}")

  if player_score > computer_score:
    print("Player wins the game! 🎉")
  elif player_score < computer_score:
    print("Computer wins the game! 🎊")
  else:
    print("It's a tie!")
  print("------------------------")
  print("Thanks for playing! Let's do it again sometime!")

# Run the game
play_game()
```
