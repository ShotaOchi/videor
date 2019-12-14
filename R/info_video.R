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
  raw_info <- system(sprintf("ffmpeg -i %s -hide_banner -map 0:v:0 -c copy -f null -", video), intern = TRUE)
  out <- vector(mode = "list", length = 7)
  names(out) <- c("width", "height", "frames", "framerate", "duration", "codec", "format")
  out$frames <- extract_frames(raw_info)
  out$duration <- extract_duration(raw_info)
  tmp <- extract_others(raw_info)
  out$width <- tmp$width
  out$height <- tmp$height
  out$codec <- tmp$codec
  out$framerate <- tmp$framerate
  out$format <- tmp$format
  out
}

extract_frames <- function(txt)
{
  out <- which(stri_detect(txt, regex = "frame="))
  out <- txt[out[length(out)]]
  out <- stri_extract_first(out, regex = "frame= *[0-9]*")
  out <- stri_extract_first(out, regex = "[0-9]+")
  ifelse(length(out) > 0, as.numeric(out), NA)
}

extract_duration <- function(txt)
{
  out <- which(stri_detect(txt, regex = "Duration:"))
  out <- txt[out[length(out)]]
  out <- stri_extract_first(out, regex = "Duration: *[0-9 : /.]*")
  out <- stri_extract_first(out, regex = "[0-9]+[0-9 : /.]+")
  ifelse(length(out) > 0, out, NA)
}
 
extract_others <- function(txt)
{
  out <- vector(mode = "list", length = 5)
  names(out) <- c("width", "height", "codec", "framerate", "format")
  tmp <- which(stri_detect(txt, regex = "^ *Stream.*Video.*fps"))
  tmp <- txt[tmp[length(tmp)]]
  tmp <- stri_split(tmp, regex = ",")[[1]]
  tmp_wh <- extract_wh(tmp)
  out$width <- tmp_wh[1]
  out$height <- tmp_wh[2]
  out$codec <- extract_codec(tmp)
  out$framerate <- extract_framerate(tmp)
  out$format <- extract_format(tmp)
  out
}

extract_framerate <- function(txt)
{
  tmp <- txt[which(stri_detect(txt, regex = "fps"))][1]
  as.numeric(stri_extract_first(tmp, regex = "[0-9]+"))
}

extract_wh <- function(txt)
{
  tmp <- txt[which(stri_detect(txt, regex = "[0-9]+x[0-9]+") & !stri_detect(txt, regex = "Stream.*Video"))][1]
  tmp <- stri_extract_first(tmp, regex = "[0-9]+x[0-9]+")
  as.numeric(stri_split(tmp, regex = "x")[[1]])
}

extract_codec <- function(txt)
{
  tmp <- txt[which(stri_detect(txt, regex = "Stream.*Video"))][1]
  tmp <- stri_extract_first(tmp, regex = "Video: *[a-z 0-9]+")
  tmp <- stri_split(tmp, regex = "Video")[[1]]
  tmp <- tmp[length(tmp)]
  stri_extract_first(tmp, regex = "[a-z0-9]+")
}

extract_format <- function(txt)
{
  tmp <- txt[which(stri_detect(txt, regex = "Stream.*Video")) + 1][1]
  stri_extract_first(tmp, regex = "[a-z0-9]+")
}
