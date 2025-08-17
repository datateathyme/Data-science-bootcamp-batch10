# Import the random module to generate a random computer choice
import random

# ---Create Functions ---
def computer_hand():
    """Generates a random computer choice."""
    choices = ["rock", "paper", "scissors"] # Create a list of possible choices
    return random.choice(choices)  # Use random.choice() to select one item from the list

def determine_winner(player_choice, computer_choice):
    """Determines the winner of a single round."""
    if player_choice == computer_choice:
        return "Tie! 🤜🤛"
    elif (
        (player_choice == "rock" and computer_choice == "scissors") or
        (player_choice == "paper" and computer_choice == "rock") or
        (player_choice == "scissors" and computer_choice == "paper")
    ):
        return "Player wins!🎉"
    else:
        return "Computer wins!🎊"

def play_game():
    """Plays a game of rock, paper, scissors."""
    print("Welcome to the Squid Game! Let's play a game🚀")
    print("Ready to play rock, paper, scissors? Choose wisely!")
    print("-------------------------------------")

    # Initialize scores and round counter
    player_score = 0
    computer_score = 0
    rounds = 0

    # The game loop continues until the player decides to "quit"
    while True:
        rounds += 1
        print(f"Round: {rounds}")

        # Get input from the player and convert it to lowercase for easy comparison
        player_choice = input("Please choose your choice (rock, paper, scissors or quit): ").lower()

        # Check if the player wants to quit the game
        if player_choice == "quit":
            break

        # Validate the player's choice
        if player_choice not in ["rock", "paper", "scissors"]:
            print("Invalid choice. Please choose again.")
            continue

        # Get the computer's choice and display both hands
        computer_choice = computer_hand()
        
        print(f"Player's Turn: {player_choice}")
        print(f"Computer's Turn: {computer_choice}")

        # Determine the winner of the current round
        result = determine_winner(player_choice, computer_choice)
        print(result)

        # Update scores based on the round's result
        if result == "Player wins!🎉":
            player_score += 1
        elif result == "Computer wins!🎊":
            computer_score += 1
        
        print("-------------------------------------")
    # --- Game Over ---    
    print("Game Over! ")
    # Display the final scores and total rounds played
    print(f"Total Rounds: {rounds - 1}")
    print(f"Player Score: {player_score}")
    print(f"Computer Score: {computer_score}")

    # Determine and print the overall winner of the game
    if player_score > computer_score:
        print("Player wins the game!🎉")
    elif player_score < computer_score:
        print("Computer wins the game!🎊")
    else:
        print("It's a tie!🤩")
        
    print("-------------------------------------")
    print("Thank you for playing a game! I hope you enjoyed it.")
    
# The entry point of the program. This ensures play_game() runs only when the script is executed directly.
if __name__ == "__main__":
    play_game()
