```bash
$ ffmpeg -codecs help | grep 'mp3'
$ ffmpeg -i input.m4a -acodec libmp3lame -ab 128k output.mp3
```

- https://ubuntuforums.org/showthread.php?t=1614765
- https://askubuntu.com/questions/65331/how-to-convert-a-m4a-sound-file-to-mp3/543945#543945
- https://www.howtoforge.com/tutorial/ffmpeg-audio-conversion/

```
ffmpeg -hide_banner -loop 1 -i img.png -i audio.mp3 -c:v libx264 -preset ultrafast -tune stillimage -c:a copy -pix_fmt yuv420p -shortest out.mkv
```

- https://superuser.com/questions/1041816/combine-one-image-one-audio-file-to-make-one-video-using-ffmpeg/1041818#1041818
- https://www.quora.com/How-can-I-convert-an-audio-into-a-video/answer/Denny-Lenselink
- https://trac.ffmpeg.org/wiki/Slideshow#Addingaudio
- https://stackoverflow.com/questions/25381086/convert-mp3-video-with-static-image-ffmpeg-libav-bash/25382231#25382231
- https://www.quora.com/Converting-audio-to-YouTube-video
- https://www.easeus.com/video-editing-tips/convert-audio-to-video.html
- Uploads to youtube https://tovid.io/
- [How to Upload Audio to YouTube (2021) - YouTube](https://www.youtube.com/watch?v=E79IZYEjQgA)
- https://www.quora.com/What-is-the-easiest-way-to-upload-audio-alone-to-YouTube
- https://videobolt.net/music-visualizer
