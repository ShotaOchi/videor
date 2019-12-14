library(videor)
library(checkmate)

bees <- system.file("extdata", "bees.mp4", package = "videor")
path_wrong <- "wrong path"
path_wrong2 <- c(bees, bees)

