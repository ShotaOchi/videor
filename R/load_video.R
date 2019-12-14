#' Loading Video
#'
#' load specified frames of video
#' @param video path to a video file
#' @param frames a numeric vecotr that specfies a frame or a numeric vector that specifies start frame and end frame. if frames is missing, try to load all frames.
#' @param nb_frames the number of frames. if nb_frames is missing, info_video(video)$video$frames is used.
#' @return a cimg object
#' @author Shota Ochi
#' @export
#' @usage load_video(video, frames, nb_frames)
load_video <- function(video, frames, nb_frames)
{
  assert_video(video)
  if (missing(frames))
  {
    frames <- as.integer(c(1, info_video(video)$video$frames))
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
  load.video(video, extra.args = sprintf("-vf trim=start_frame=%d:end_frame=%d,setpts=PTS-STARTPTS", frames[1] - 1, frames[2]))
}
