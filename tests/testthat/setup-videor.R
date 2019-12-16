library(videor)
library(checkmate)

class_imager <- "cimg"
class_pixset <- "pixset"

bees <- system.file("extdata", "bees.mp4", package = "videor")
counts <- system.file("extdata", "counts.gif", package = "videor")
path_wrong <- "wrong path"
path_wrong2 <- c(bees, bees)

expect_equal_cimg <- function(im1, im2)
{
  expect(all(im1 == im2))
}
