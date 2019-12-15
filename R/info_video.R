#' Video Information
#'
#' get video information such as width, height, format, duration and framerate.
#' Note that this function is relatively slow except when video is mp4 file.
#' @param video path to a video file
#' @return a list of video information
#' @author Shota Ochi
#' @export
#' @examples
#' video <- system.file("extdata", "bees.mp4", package = "videor")
#' info_video(video)
info_video <- function(video)
{
  assert_video(video)
  tmp <- system(sprintf("ffprobe -v error -select_streams v:0 -show_entries stream=codec_name,width,height,duration,nb_frames,pix_fmt,r_frame_rate -of default=nokey=1:noprint_wrappers=1 %s", video), intern = TRUE)
  out <- vector(mode = "list", length = 7)
  names(out) <- c("width", "height", "frames", "framerate", "duration", "codec", "format")
  out$codec <- tmp[1]
  out$width <- as.numeric(tmp[2])
  out$height <- as.numeric(tmp[3])
  out$format <- tmp[4]
  out$framerate <- ifelse(!is.na(suppressWarnings(as.numeric(tmp[5]))), as.numeric(tmp[5]), eval(parse(text = tmp[5])))
  out$duration <- suppressWarnings(as.numeric(tmp[6]))
  out$frames <- as.numeric(ifelse(!is.na(suppressWarnings(as.numeric(tmp[7]))), tmp[7], system(sprintf("ffprobe -v error -count_frames -select_streams v:0 -show_entries stream=nb_read_frames -of default=nokey=1:noprint_wrappers=1 %s", video), intern = TRUE)))
  out
}
