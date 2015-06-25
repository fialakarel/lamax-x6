#!/bin/bash

# author: Karel Fiala
# email: fiala.karel@gmail.com


ffmpeg -framerate 30 -start_number 1 -i FHD%04d.JPG -loglevel error -stats -threads 4 -f mp4 -s:v 1920x1080 -c:v libx264 -r 30 -preset medium -crf 23 -tune fastdecode -movflags faststart -pix_fmt yuv420p -minrate 0 -maxrate 6000k -bufsize 1000k -refs 1 -coder 1 -g 60 -mbd 2 -trellis 1 -bf 2 -qmax 44 -map_metadata 0 timelapse.mp4



exit 0

