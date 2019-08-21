#' Video Information
#'
#' get video information such as width, height, format, duration and framerate
#' @param video path to a video file
#' @return a list of video information
#' @author Shota Ochi
#' @export
#' @usage info_video(video)
info_video <- function(video)
{
  assert_video(video)
  av_video_info(video)
}
