#!/bin/bash
# https://superuser.com/questions/1049606/reduce-generated-gif-size-using-ffmpeg

vid="$1"
fps=25           # frames per a second .
filename=$(basename -- "$vid")
filename="${filename%.*}"

filters="fps=$fps"

ffmpeg -i  "$vid"                                  \
       -vf "$filters,palettegen"                   \
       -y  palette.png                             &&
ffmpeg -i  "$vid"                                  \
       -i  palette.png                                \
       -lavfi "$filters [x]; [x][1:v] paletteuse"  \
       -y  "$filename".gif                              &&
rm palette.png
