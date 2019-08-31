#' Video Information
#'
#' get video information such as width, height, format, duration and framerate.
#' Note that this function is relatively slow except when video is mp4 file.
#' @param video path to a video file
#' @return a list of video information
#' @author Shota Ochi
#' @export
#' @usage info_video(video)
info_video <- function(video)
{
  assert_video(video)
  out <- av_video_info(video)
  if (is.na(out$video$frames))
  {
    out$video$frames <- as.numeric(system(sprintf("ffprobe -v error -count_frames -select_streams v:0 -show_entries stream=nb_read_frames -of default=nokey=1:noprint_wrappers=1 %s", video), intern = TRUE))
  }
  out
}
