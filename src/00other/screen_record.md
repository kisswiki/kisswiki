
## Region size

I am using proportions 16:9.

```python
def factors(n):
    return set(
        factor for i in range(1, int(n**0.5) + 1) if n % i == 0
        for factor in (i, n//i)
    )
print(factors(1920))
```

```bash
$ python factors.py
set([1920, 1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 320, 384, 20, 24, 640, 30, 160, 40, 64, 48, 128, 60, 192, 960, 96, 32, 80, 480, 16, 240, 120])
$ python -c "from __future__ import division; print(320*9/16)"
180.0
```

- https://stackoverflow.com/questions/10768584/execute-python-commands-passed-as-strings-in-command-line-using-python-c/30690444#30690444
- https://stackoverflow.com/questions/1267869/how-can-i-force-division-to-be-floating-point-division-keeps-rounding-down-to-0/1267892#1267892
- https://stackoverflow.com/questions/6800193/what-is-the-most-efficient-way-of-finding-all-the-factors-of-a-number-in-python/38817866#38817866

## OBS

I am using `Settings`:

- `Video > Base and Output to 320x180`. In the main window I need to drag to the area that I want to record.
- `Output > Recording format: mp4`, so that will be embeded in Microsoft Teams.
- `Hotkeys > Start Recording: Ctrl+F9`, `Hotkeys > Stop Recording: Ctrl+F10`

>The Base and Output resolution entries are not limited to the values in the drop down lists. Click into the fields and manually type any resolution you want. The drop down list entries are only proposals and contain the most used standard resolutions.

https://obsproject.com/forum/threads/problem-solved-obs-studio-captures-a-small-window-instead-of-fullscreen.79510/post-375188

There is also this link https://jp9000.github.io/OBS/features/subregion.html but I don't know how to apply it.

Then I adding video source:

`Sources > Window Capture`

Video file will show in folder set in `Settings > Output > Recording Path`.

I can also record with microphone:

`Sources > Audio Input Capture`

>You also need AUDIO INPUT for either your desktop or whatever.

https://obsproject.com/forum/threads/audio-isnt-being-recorded.76025/

## ffmpeg

`ffmpeg -f gdigrab -show_region 1 -framerate 60 -video_size 320x180 -offset_x 1496 -offset_y 296 -i desktop -c:v libx264rgb -preset ultrafast out7.mpg`

- http://ffmpeg.org/ffmpeg-devices.html#gdigrab
- https://trac.ffmpeg.org/wiki/Capture/Desktop
- https://stackoverflow.com/questions/52863787/record-region-of-screen-using-ffmpeg
- https://stackoverflow.com/questions/38202171/desktop-grabbing-with-ffmpeg-at-60-fps-using-nvenc-codec

### show_region

`-show_region 1` show bad size and position of region on Windows 10.

Now I am doing fullscreenshot with gimp, using rectangular select tool with fixed size, i.e. 320x180, to get position.

### Quality

There is section "Lossless Recording" on https://trac.ffmpeg.org/wiki/Capture/Desktop which also adds params `-c:v libx264rgb -crf 0`, but it had no impact on quality.

`ffmpeg -f gdigrab -show_region 1 -framerate 60 -video_size 320x180 -offset_x 1300 -offset_y 385 -i desktop -c:v libx264rgb -crf 0 -preset ultrafast out5.mpg`

- https://stackoverflow.com/questions/43288824/how-can-i-record-a-video-using-ffmpeg-in-a-better-quality
- https://video.stackexchange.com/questions/17715/record-desktop-at-1080p60-in-high-quality

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

## Alternatives

- https://alternativeto.net/software/open-broadcaster-software/?license=opensource&platform=windows
- https://alternativeto.net/software/tinytake/?license=opensource

>http://obsproject.com is open source, doesn’t use FFmpeg but might work for you. May even capture DirectX woot. http://www.ffsplit.com is not open source, but does capture/stream desktop using FFmpeg. http://camstudio.org is open source and free, but requires you to just use your local codecs installed in your windows system, and has some usability issues, which is why I even started this project in the first place :)

https://github.com/rdp/screen-capture-recorder-to-video-windows-free