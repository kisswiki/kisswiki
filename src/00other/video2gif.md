```bash
#!/bin/bash
#https://superuser.com/questions/1049606/reduce-generated-gif-size-using-ffmpeg

vid="$1"
start_time=00:00:00
duration=5
#height=ih/2      # input height halved , can replace with pixils .
#width=-2         # keeps aspect ratio . can replace with pixils .
fps=25           # frames per a second .
filename=$(basename -- "$vid")
filename="${filename%.*}"

#filters="fps=$fps,scale=$width:$height:flags=lanczos"
filters="fps=$fps"

ffmpeg -ss $start_time                             \
       -t  $duration                               \
       -i  "$vid"                                  \
       -vf "$filters,palettegen"                   \
       -y  palette.png                             &&
ffmpeg -ss $start_time                             \
       -t  $duration                               \
       -i  "$vid"                                  \
       -i  palette.png                                \
       -lavfi "$filters [x]; [x][1:v] paletteuse"  \
       -y  "$filename".gif                              &&
rm palette.png
```

## Old

install ffmpeg and imagemagick

`ffmpeg -i input.flv -vf scale=320:-1 -r 10 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - gif:- | convert -layers Optimize - output.gif`

https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality/730389#730389
