test_that("load_video",
{
  expect_error(load_video(path_wrong, 1))
  expect_error(load_video(path_wrong2, 1))
  
  # bees.mp4
  bees_1 <- load_video(bees, 1)
  bees_2 <- load_video(bees, 2)
  bees_3 <- load_video(bees, 3)
  bees_4 <- load_video(bees, 4)
  bees_5 <- load_video(bees, 5)
  bees_6 <- load_video(bees, 6)
  bees_1to6 <- load_video(bees, c(1,6))
  bees_2to6_step2 <- load_video(bees, c(2,6), step = 2)
  expect_error(load_video(bees, 1, step = NA))
  expect_error(load_video(bees, 1, expr = 100))
  expect_error(load_video(bees, 1, maxSize = "A"))
  expect_class(bees_1, class_imager)
  expect_class(bees_1to6, class_imager)
  expect_equal_cimg(bees_1, frame(bees_1to6, 1))
  expect_equal_cimg(bees_4, frame(bees_1to6, 4))
  expect_equal_cimg(bees_6, frame(bees_1to6, 6))
  expect_equal_cimg(bees_2, frame(bees_2to6_step2, 1))
  expect_equal_cimg(bees_4, frame(bees_2to6_step2, 2))
  expect_equal_cimg(bees_6, frame(bees_2to6_step2, 3))
  expect(all(!is.na(bees_1)))
  expect_equal(depth(bees_1to6), 6)
  expect_equal(depth(bees_2to6_step2), 3)
  
  # bees.avi
  bees_1 <- load_video(avi, 1)
  bees_3 <- load_video(avi, 3)
  bees_6 <- load_video(avi, 6)
  bees_1to6 <- load_video(avi, c(1,6))
  expect_class(bees_1, class_imager)
  expect_class(bees_1to6, class_imager)
  expect_equal_cimg(bees_1, frame(bees_1to6, 1))
  expect_equal_cimg(bees_3, frame(bees_1to6, 3))
  expect_equal_cimg(bees_6, frame(bees_1to6, 6))
  expect(all(!is.na(bees_1)))
  expect_equal(depth(bees_1to6), 6)
  
  # bees.webm
  bees_1 <- load_video(webm, 1)
  bees_3 <- load_video(webm, 3)
  bees_6 <- load_video(webm, 6)
  bees_1to6 <- load_video(webm, c(1,6))
  expect_class(bees_1, class_imager)
  expect_class(bees_1to6, class_imager)
  expect_equal_cimg(bees_1, frame(bees_1to6, 1))
  expect_equal_cimg(bees_3, frame(bees_1to6, 3))
  expect_equal_cimg(bees_6, frame(bees_1to6, 6))
  expect(all(!is.na(bees_1)))
  expect_equal(depth(bees_1to6), 6)
  
  # bees.wmv
  bees_1 <- load_video(wmv, 1)
  bees_3 <- load_video(wmv, 3)
  bees_6 <- load_video(wmv, 6)
  bees_1to6 <- load_video(wmv, c(1,6))
  expect_class(bees_1, class_imager)
  expect_class(bees_1to6, class_imager)
  expect_equal_cimg(bees_1, frame(bees_1to6, 1))
  expect_equal_cimg(bees_3, frame(bees_1to6, 3))
  expect_equal_cimg(bees_6, frame(bees_1to6, 6))
  expect(all(!is.na(bees_1)))
  expect_equal(depth(bees_1to6), 6)
  
  # counts.gif
  counts_1 <- load_video(counts, 1)
  counts_4 <- load_video(counts, 4)
  counts_9 <- load_video(counts, 9)
  counts_all <- load_video(counts)
  expect_equal_cimg(counts_1, frame(counts_all, 1))
  expect_equal_cimg(counts_4, frame(counts_all, 4))
  expect_equal_cimg(counts_9, frame(counts_all, 9))
})
