#' Loading Video
#'
#' load specified frames of video
#' @param video path to a video file
#' @param frames a numeric vecotr that specfies a frame or a numeric vector that specifies start frame and end frame. if frames is missing, try to load all frames.
#' @param nb_frames the number of frames. if nb_frames is missing, info_video(video)$frames is used.
#' @param step step value for frame reading.
#' @param maxSize maximum allowed size in memory, in GB.
#' @return a cimg object
#' @author Shota Ochi
#' @export
#' @examples
#' counts <- system.file("extdata", "counts.gif", package = "videor")
#' load_video(counts, c(2,7))
#' load_video(counts, c(2,7), step = 2)
load_video <- function(video, frames, nb_frames, step = 1, maxSize = 1)
{
  assert_video(video)
  assert_step(step)
  step <- as.integer(step)
  assert_maxSize(maxSize)
  if (missing(frames))
  {
     frames <- as.integer(c(1, info_video(video)$frames))
  } else
  {
    if (missing(nb_frames))
    {
      nb_frames <- info_video(video)$frames
    }
    assert_nb_frames(nb_frames)
    assert_frames(frames, nb_frames)
    if (length(frames) == 1)
    {
      frames <- c(frames[1], frames[1])
    }
    frames <- as.integer(frames)
  }
  if (step == 1)
  {
    return(load.video(video, extra.args = sprintf("-vf trim=start_frame=%d:end_frame=%d", frames[1] - 1, frames[2]), maxSize = maxSize))
  } else
  {
    return(load.video(video, extra.args = sprintf("-vsync vfr -vf select='if(between(n\\,%d\\,%d)\\,not(mod(n-%d\\,%d)))'", frames[1] - 1, frames[2], frames[1] - 1, step), maxSize = maxSize))
  }
}
