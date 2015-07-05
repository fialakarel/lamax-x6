#!/bin/bash

for ((i=0;i<100;i++)) ; do for ((j=0;j<100;j++)); do ffmpeg -i lens.jpg -loglevel error -threads 4 -vcodec mjpeg -vf "frei0r=lenscorrection:0.5:0.5:0.$i:0.$j" lens-$i-$j.jpg ; done ; done
