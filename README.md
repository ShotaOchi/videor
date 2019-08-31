# videor

[![Build Status](https://travis-ci.org/ShotaOchi/videor.svg?branch=master)](https://travis-ci.org/ShotaOchi/videor)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ShotaOchi/videor?branch=master&svg=true)](https://ci.appveyor.com/project/ShotaOchi/videor)
[![CRAN Version](https://www.r-pkg.org/badges/version/videor)](https://cran.r-project.org/package=videor)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![codecov](https://codecov.io/gh/ShotaOchi/videor/branch/master/graph/badge.svg)](https://codecov.io/gh/ShotaOchi/videor)

## Introduction

videor is an R package for video analysis based on the package 'imager'.

This package may be removed in the future if 'imager' becomes a good package for video analysis.

## Installation

You can install videor from GitHub.

Note that you need to install FFmpeg and FFprobe.

Run the following R code to install videor.
```r
devtools::install_github("ShotaOchi/videor")
```

## Description

videor has only two functions now.

* info_video
* load_video

info_video returns a list containg video information.

load_video returns a cimg object that is specified frames of video.

load_video works fine for gif file, webm file, and mp4 file.

```r
video <- "path_to_your_video_file"

# get video information
info_video(video)

# load first frame of video
load_video(video, 1)

# load a part of video (from 10th frame to 20th frame)
load_video(video, c(10, 20))
```

I'm going to add functions in the future, but not soon.

## Contribution
You're welcome to create issues for any bug report or suggestion on the [issues page](https://github.com/ShotaOchi/videor/issues).

You can also fork this repository and send me a pull request for bug fixes or additional features.