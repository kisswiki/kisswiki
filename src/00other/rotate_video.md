## ffmpeg

ffmpeg will automatically physically rotate the video according to any existing video stream rotation metadata.

`ffmpeg -i input.mp4 -c:a copy output.mp4`

To disable this behavior use the `-noautorotate` option

ffmpeg -i in.mov -qscale 0 -vf "transpose=1" out.mov BUT read the man pages, as some codecs treat this differently. For example, when I recently worked with Theora, I had to use -qscale 28 as it ignored 0 and wanted a 1 - 31 value.

Current docs note that "Numerical values are deprecated, and should be dropped in favor of symbolic constants." ffmpeg.org/ffmpeg-filters.html#transpose Thus cclock_flip, clock, cclock or clock_flip instead of 0, 1, 2 or 3



- https://superuser.com/questions/578321/how-to-rotate-a-video-180-with-ffmpeg
- https://stackoverflow.com/questions/3937387/rotating-videos-with-ffmpeg
- https://stackoverflow.com/questions/34442156/ffmpeg-avconv-transcode-using-same-codec-and-params-as-input
- https://stackoverflow.com/questions/20664460/remove-rotate-metadata-from-mp4
- https://stackoverflow.com/questions/9408542/video-captured-from-iphone-gets-rotated-when-converted-to-mp4-using-ffmpeg
- https://github.com/laurentperrinet/photoscripts/blob/master/rotate_video.py

### Rotate video by an arbitrary angle expressed in radians

`fmpeg -i input.mp4 -vf "rotate=90" output.mp4`

## other options

`ffmpeg -i VIDEO0018.mp4 -vf "transpose=2" -an  -strict -2 dotMeter.mp4`

https://gist.github.com/timoshenkoav/de00148f5037115278be