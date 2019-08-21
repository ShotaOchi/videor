assert_video <- function(video)
{
  assert_access(video, access = 'r', .var.name = deparse(substitute(video)))
}

#$' must call assert_frames after assert_video
assert_frames <- function(frames, video)
{
  max_frame <- info_video(video)$video$frames
  assert_numeric(frames, lower = 1, upper = max_frame, finite = TRUE, any.missing = FALSE, min.len = 1, max.len = 2, sorted = TRUE, .var.name = deparse(substitute(frames)))
}
