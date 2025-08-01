## homework 
## create game pao ying chub 
-- play a game `rock paper and scissors` 10 round
  
## generate a random computer choice
gen_computer_choice <- function() {
  choices <- c("rock", "paper", "scissors")
  sample(choices, 1)
}

## determine the winner
determine_winner <- function(player_choice, computer_choice) {
  if (player_choice == computer_choice) {
    return("Tie 🤜🤛 ")
  } else if (
    (player_choice == "rock" && computer_choice == "scissors") ||
    (player_choice == "paper" && computer_choice == "rock") ||
    (player_choice == "scissors" && computer_choice == "paper")
  ) {
    return("Player wins! 🎉")
  } else {
    return("Computer win! 🎊")
  }
} 

## function play game
play_game <- function() {
  print("Let's play a game 🚀")
  print("Ready to rock, paper, scissors? Choose wisely! ")
  player_score <- 0
  computer_score <- 0
  
  for (round in 1:10) {
    print(paste("Round :",round))
    
    
    player_choice <- readline("Choose your choice:  ")
    computer_choice <- gen_computer_choice()
    
    
    print(paste("Player's Turn: ", player_choice))
    print(paste("Computer's Turn: ", computer_choice))
    
    result <- determine_winner(player_choice, computer_choice)
    print(result)
    
    if (result == "Player wins! 🎉") {
      player_score <- player_score + 1
    } else if (result == "Computer win! 🎊") {
      computer_score <- computer_score + 1
    } 
    
    print("------------------------")
  }
  print("Game Over!")
  print(paste("Player Score:", player_score))
  print(paste("Computer Score:", computer_score))
  
  if (player_score > computer_score) {
    print("Player wins the game! 🎉")
  } else if (player_score < computer_score) {
    print("Computer wins the game! 🎊")
  } else {
    print("It's a tie!")
  }
  print("------------------------")
  print("Thanks for playing! Let's do it again sometime!")
}
