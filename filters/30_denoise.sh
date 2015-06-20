#!/bin/bash

if [[ ! $# -eq 1 ]]
then
    printf "\n\n\tWrong arguments\n\n"
    exit 1
fi

# denoise
# working bad ... still have noise

ffmpeg -i $1 -vf "yadif,hqdn3d=3:3:4:4" -map_metadata 0 -strict -2 $1-denoise.mp4

exit 0