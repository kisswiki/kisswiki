## flac to mp3

```
#!/bin/bash
# https://wiki.archlinux.org/index.php/Convert_FLAC_to_MP3

for a in ./*.flac; do
  ffmpeg -i "$a" -qscale:a 0 "${a[@]/%flac/mp3}"
done
```

## download mp3 from youtube

`youtube-dl --extract-audio --audio-format mp3 videoURL`

- https://github.com/rg3/youtube-dl
- https://github.com/jweslley/youtube-dl-mp3/issues/6
