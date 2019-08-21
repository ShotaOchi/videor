#' Loading Video
#'
#' load specified frames of video
#' @param video path to a video file
#' @param frames a numeric vecotr that specfies a frame or a numeric vector that specifies start frame and end frame
#' @return a list of video information
#' @author Shota Ochi
#' @export
#' @usage load_video(video, frames)
load_video <- function(video, frames)
{
  assert_video(video)
  if (missing(frames))
  {
    frames <- as.integer(c(1, info_video(video)$video$frames))
  }
  else
  {
    assert_frames(frames, video)
    if (length(frames) == 1)
    {
      frames <- as.integer(c(frames[1] - 1, frames[1]))
    } else
    {
      frames <- as.integer(c(frames[1] - 1, frames[2]))
    }
  }
  load.video(video, extra.args = sprintf("-vf trim=start_frame=%d:end_frame=%d,setpts=PTS-STARTPTS", frames[1], frames[2]))
}
