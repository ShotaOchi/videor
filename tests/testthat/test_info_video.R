test_that("info_video",
{
  expect_error(info_video(path_wrong))
  expect_error(info_video(path_wrong2))
  
  # bees.mp4
  info_correct <- list(width = 1920, height = 1080, frames = 149, framerate = 24, duration = 6.208333, codec = "h264", format = "yuv420p")
  info_out <- info_video(bees)
  expect_equal(info_out$width, info_correct$width)
  expect_equal(info_out$height, info_correct$height)
  expect_equal(info_out$frames, info_correct$frames)
  expect_equal(info_out$framerate, info_correct$framerate)
  expect_equal(info_out$duration, info_correct$duration)
  expect_equal(info_out$codec, info_correct$codec)
  expect_equal(info_out$format, info_correct$format)
  
  
  # counts.gif
  info_correct <- list(width = 300, height = 300, frames = 9, framerate = 10, duration = NA, codec = "gif", format = "bgra")
  info_out <- info_video(counts)
  expect_equal(info_out$width, info_correct$width)
  expect_equal(info_out$height, info_correct$height)
  expect_equal(info_out$frames, info_correct$frames)
  expect_equal(info_out$framerate, info_correct$framerate)
  expect(is.na(info_out$duration) && is.na(info_correct$duration))
  expect_equal(info_out$codec, info_correct$codec)
  expect_equal(info_out$format, info_correct$format)
})
