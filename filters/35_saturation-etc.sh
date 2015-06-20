#!/bin/bash

if [[ ! $# -eq 1 ]]
then
    printf "\n\n\tWrong arguments\n\n"
    exit 1
fi

# increase saturation, contrast, etc

ffmpeg -i $1 -vf mp=eq2=1:1.2:0:1.1:1:1:1 -map_metadata 0 -strict -2 $1-enhance.mp4


exit 0