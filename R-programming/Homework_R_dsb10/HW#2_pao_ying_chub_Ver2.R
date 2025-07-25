## SquidGame - DSB11
## Pao Ying Chub

## create a function to generate a random computer choice
computer_hand <- function() {
  choices <- c("rock", "paper", "scissors")
  sample(choices, 1)
}

## create a function to determine the winner
determine_winner <- function(player_choice, computer_choice) {
  if(player_choice == computer_choice) {
    return("Tie! 🤜🤛")
  } else if (
    (player_choice == "rock"     & computer_choice == "scissors") |
    (player_choice == "paper"    & computer_choice == "rock") |
    (player_choice == "scissors" & computer_choice == "paper")
  ) {
    return("Player wins!🎉")
  } else {
    return("Computer wins!🎊")
  }
}

## create a function to play a game
play_game <- function() {
  print("Welcome to the Squid Game! Let's play a game🚀")
  print("Ready to play rock, paper, scissors? Choose wisely!")
  print("-------------------------------------")
  player_score <- 0
  computer_score <- 0
  rounds <- 0
  
  while(TRUE) {
    rounds <- rounds + 1
    print(paste("Round :", rounds))
    
    player_choice <- readline("Please choose your choice (rock, paper, scissors or quit): ")
    
    if(player_choice == "quit") {
      break
    }
    
    computer_choice <- computer_hand()
    
    print(paste("Player's Turn: ", player_choice))
    print(paste("Computer's Turn: ", computer_choice))
    
    result <- determine_winner(player_choice, computer_choice)
    print(result)
    
    if(result == "Player wins!🎉") {
      player_score <- player_score + 1
    } else if (result == "Computer wins!🎊") {
      computer_score <- computer_score + 1
    }
    
    print("-------------------------------------")
  }
  print("Game Over! ")
  print(paste("Total Rounds: ", rounds - 1))
  print(paste("Player Score: ", player_score))
  print(paste("Computer Score: ", computer_score))
  
  if(player_score > computer_score) {
    print("Player wins the game!🎉")
  } else if (player_score < computer_score) {
    print("Computer wins the game!🎊") 
  } else {
    print("It's a tie!🤩")
  }
  print("-------------------------------------")
  print("Thank you for playing a game! I hope you enjoyed it.")
}

