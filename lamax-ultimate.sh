#!/bin/bash

if [[ ! $# -eq 1 ]]
then
    printf "\n\n\tWrong arguments\n\n"
    exit 1
fi

# X,Y center
x="0.5"
y="0.5"

# center correction, edge correction koeficient
cc="0.18"
ec="0.60"

in="ffmpeg -i $1 -threads 4 -vf"

sound="-c:a aac -ab 160k -ar 44100 -async 1 -strict experimental"
meta="-map_metadata 0"

out="$meta $sound $1.mp4"

enc2="-minrate 0 -maxrate 6000k -bufsize 1000k -refs 1 -coder 1 -g 60 -mbd 2 -trellis 1 -bf 2 -qmax 44"

encode="-f mp4 -c:v libx264 -preset medium -crf 29 -tune fastdecode -movflags faststart -pix_fmt yuv420p $enc2"

# f=mp4 acodec=aac ab=160k ar=44100 vcodec=libx264 vpre=hq minrate=0 maxrate=5000k b=3000k coder=1 refs=1 g=60 s=920x720 aspect=%dar mbd=2 trellis=1 mv4=1 subq=7 qmin=10 qcomp=0.6 qdiff=4 qmax=51 pass=2

# vpre=hq mv4=1 subq=7 qmin=10 qcomp=0.6 qdiff=4 qmax=51 pass=2
# -cmp 2 -subcmp 2

f_lens="frei0r=lenscorrection:$x:$y:$cc:$ec"
f_denoise="hqdn3d=1:1:2:2"
f_look="mp=eq2=1:1.1:-0.05:1.1:1:1:1"

# -c copy -acodec aac
# yadif,\
# -crf 24
# -maxrate 5000k
# -preset ultrafast
# -tune zerolatency
# -vf  "setpts=0.5*PTS"         # 2x speed up
# -vf  "setpts=2.0*PTS"         # 2x speed down
# ,deshake

#$in $f_lens,$f_denoise,$f_look $encode $out

$in $f_lens,$f_denoise,$f_look $encode $meta $sound $1.mp4

# upravit pro stream
#MP4Box -inter 500 $1.mp4

exit 0

