test_that("load_video",
{
  bees_1 <- load_video(bees, 1)
  bees_2 <- load_video(bees, 2)
  bees_3 <- load_video(bees, 3)
  bees_4 <- load_video(bees, 4)
  bees_5 <- load_video(bees, 5)
  bees_6 <- load_video(bees, 6)
  bees_1to6 <- load_video(bees, c(1,6))
  
  expect_error(load_video(path_wrong, 1))
  expect_error(load_video(path_wrong2, 1))
  
  expect_class(bees_1, class_imager)
  expect_class(bees_1to6, class_imager)

  expect_equal_cimg(bees_1, frames(bees_1to6, 1)[[1]])
  expect_equal_cimg(bees_4, frames(bees_1to6, 4)[[1]])
  expect_equal_cimg(bees_6, frames(bees_1to6, 6)[[1]]) 
})
