assert_video <- function(video)
{
  assert_access(video, access = 'r', .var.name = deparse(substitute(video)))
}

assert_nb_frames <- function(nb_frames)
{
  assert_numeric(nb_frames, lower = 1, finite = TRUE, any.missing = FALSE, len = 1, .var.name = deparse(substitute(nb_frames)))
}

#$' must call assert_frames after assert_video and assert_nb_frames
assert_frames <- function(frames, nb_frames)
{
  assert_numeric(frames, lower = 1, upper = nb_frames, finite = TRUE, any.missing = FALSE, min.len = 1, max.len = 2, sorted = TRUE, .var.name = deparse(substitute(frames)))
}
