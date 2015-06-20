#!/bin/bash

if [[ ! $# -eq 1 ]]
then
    printf "\n\n\tWrong arguments\n\n"
    exit 1
fi

# lens correction -- fish eye removal

# X,Y center
x="0.5"
y="0.5"

# center correction, edge correction koeficient
cc="0.18"
ec="0.60"

ffmpeg -i $1 -vf frei0r=lenscorrection:$x:$y:$cc:$ec -strict -2 -map_metadata 0 $1-lc.mp4

exit 0