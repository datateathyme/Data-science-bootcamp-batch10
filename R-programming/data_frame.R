## Data Frame

friends <- c("Bae","Jay","May","Bec","Fay")

ages <- c(22,23,25,22,24)

location <- c("New York", "London", "London",
              "Tokyo", "Manchester")

movie_lover <- c(TRUE, TRUE, FALSE, 
                 TRUE ,TRUE)

df <- data.frame(friends,
          ages,
          location,
          movie_lover)

View(df)

### create dataframe from list
my_list <- list(friends = friends,
                ages = ages,
                location = location ,
                movie = movie_lover)

data.frame(my_list)
