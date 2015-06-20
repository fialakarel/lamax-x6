#!/bin/bash

if [[ ! $# -eq 1 ]]
then
    printf "\n\n\tWrong arguments\n\n"
    exit 1
fi

# deshake video

ffmpeg -i $1 -vf deshake -map_metadata 0 -strict -2 $1-deshake.mp4

exit 0