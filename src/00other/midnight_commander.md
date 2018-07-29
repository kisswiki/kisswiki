# Midnight Commander

- https://unix.stackexchange.com/questions/205546/go-to-file-directory-in-midnight-commander-by-typing/425172#425172
- https://unix.stackexchange.com/questions/5901/how-to-open-the-same-directory-in-another-panel-in-midnight-commander/425173#425173

## File association

copy `mc.ext` installed with `mc` to `~/.config/mc`.

Find line `include/video` and change to:

```
include/video
  #Open=/usr/local/Cellar/midnight-commander/4.8.21/libexec/mc/ext.d/video.sh open ALL_FORMATS
  Open=mpv "${MC_EXT_FILENAME}"
```
