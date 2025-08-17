
import random

def computer_hand():
    """Generates a random computer choice."""
    choices = ["rock", "paper", "scissors"]
    return random.choice(choices)

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
    
    player_score = 0
    computer_score = 0
    rounds = 0
    
    while True:
        rounds += 1
        print(f"Round: {rounds}")
        
        player_choice = input("Please choose your choice (rock, paper, scissors or quit): ").lower()
        
        if player_choice == "quit":
            break
        
        if player_choice not in ["rock", "paper", "scissors"]:
            print("Invalid choice. Please choose again.")
            continue
            
        computer_choice = computer_hand()
        
        print(f"Player's Turn: {player_choice}")
        print(f"Computer's Turn: {computer_choice}")
        
        result = determine_winner(player_choice, computer_choice)
        print(result)
        
        if result == "Player wins!🎉":
            player_score += 1
        elif result == "Computer wins!🎊":
            computer_score += 1
        
        print("-------------------------------------")
        
    print("Game Over! ")
    print(f"Total Rounds: {rounds - 1}")
    print(f"Player Score: {player_score}")
    print(f"Computer Score: {computer_score}")
    
    if player_score > computer_score:
        print("Player wins the game!🎉")
    elif player_score < computer_score:
        print("Computer wins the game!🎊")
    else:
        print("It's a tie!🤩")
        
    print("-------------------------------------")
    print("Thank you for playing a game! I hope you enjoyed it.")

if __name__ == "__main__":
    play_game()
