```
#!/bin/bash
# https://wiki.archlinux.org/index.php/Convert_FLAC_to_MP3

for a in ./*.flac; do
  ffmpeg -i "$a" -qscale:a 0 "${a[@]/%flac/mp3}"
done
```
