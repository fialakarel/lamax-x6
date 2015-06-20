#!/bin/bash

if [[ ! $# -eq 1 ]]
then
    printf "\n\n\tWrong arguments\n\n"
    exit 1
fi

# -q:v 3

# ffmpeg -i $1 -vcodec h264 -acodec aac -strict -2 -qscale 0 $1.mp4

# convert input MOV to MP4, lossless
# copy video h264
# transcode audio to AAC
# copy metadata (created date)

ffmpeg -i $1 -c copy -acodec aac -strict -2 -map_metadata 0 $1.mp4

exit 0