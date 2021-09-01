Gitlab has limit of 10 MB for video. So I have reduced using libx264 and bitrate.

bitrate is bits/sec.

So for 10 MB file (not MiB) and time of video 2:40 we have this calculation:

```
$ echo $((10*1000*1000*8/270))
296296
```

Then we can convert with:

```
$ ffmpeg -i input.mp4 -vcodec libx264 -b 296k output.mp4
```

libx265 is giving better quality but cannot be played in page in github isse.

- https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg/38380#38380
- https://unix.stackexchange.com/questions/346902/need-to-convert-bytes-to-gb-mb-kb-in-normal-decimal-format/504728#504728
  https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg/498642#498642
