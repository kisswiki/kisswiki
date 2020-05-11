## ffmpeg

`ffmpeg -f gdigrab -show_region 1 -framerate 60 -video_size 320x180 -offset_x 1496 -offset_y 296 -i desktop -c:v libx264rgb -preset ultrafast out7.mpg`

### show_region

`-show_region 1` show bad size and position of region on Windows 10.

Now I am doing fullscreenshot with gimp, using rectangular select tool with fixed size, i.e. 320x180, to get position.

### Quality

There is section "Lossless Recording" on https://trac.ffmpeg.org/wiki/Capture/Desktop which also adds params `-c:v libx264rgb -crf 0`, but it had no impact on quality.

`ffmpeg -f gdigrab -show_region 1 -framerate 60 -video_size 320x180 -offset_x 1300 -offset_y 385 -i desktop -c:v libx264rgb -crf 0 -preset ultrafast out5.mpg`

- https://stackoverflow.com/questions/43288824/how-can-i-record-a-video-using-ffmpeg-in-a-better-quality

### File size

The smallest file size is with `-c:v libx264rgb -preset ultrafast`.

```
$ ffmpeg -f gdigrab -framerate 60 -video_size 320x180 -offset_x 1496 -offset_y 296 -i desktop -c:v libx264rgb -preset ultrafast out6.mpg
$ ffmpeg -f gdigrab -framerate 60 -video_size 320x180 -offset_x 1496 -offset_y 296 -i desktop -c:v libx264rgb -preset ultrafast out7.mpg
$ ffmpeg -f gdigrab -framerate 60 -video_size 320x180 -offset_x 1496 -offset_y 296 -i desktop -preset ultrafast out8.mpg
$ ffmpeg -f gdigrab -framerate 10 -video_size 320x180 -offset_x 1496 -offset_y 296 -i desktop -c:v libx264rgb -preset ultrafast out7.2.mpg
$ ffmpeg -f gdigrab -framerate 6 -video_size 320x180 -offset_x 1496 -offset_y 296 -i desktop -c:v libx264rgb -preset ultrafast out7.3.mpg
$ ls -ltr
-rw-r--r-- 1 roman.frolow 1049089  548864 May 11 16:17  out6.mpg
-rw-r--r-- 1 roman.frolow 1049089  243712 May 11 16:19  out7.mpg
-rw-r--r-- 1 roman.frolow 1049089  526336 May 11 16:20  out8.mpg
-rw-r--r-- 1 roman.frolow 1049089  210944 May 11 16:25  out7.1.mpg
-rw-r--r-- 1 roman.frolow 1049089  133120 May 11 16:27  out7.2.mpg
-rw-r--r-- 1 roman.frolow 1049089  178176 May 11 16:28  out7.3.mpg
```