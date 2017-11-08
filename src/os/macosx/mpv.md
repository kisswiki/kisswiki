`brew install mpv`

or better

`brew cask install mpv` to have mpv in Applications

- https://mpv.io/installation/
- https://apple.stackexchange.com/questions/288689/installed-mpv-with-brew-but-nothing-in-applications
- https://github.com/mpv-player/mpv/issues/572#issuecomment-35679696

## txt subtitle no loaded

I have to use `mpv file.mp4 --sub-file file.txt`, and then press `j` in app to see subtitles.

Didn't help putting in `~/.config/mpv/mpv.conf`

```
sub-auto=fuzzy
subcp=cp1250
```

mpvs worked https://unix.stackexchange.com/questions/279884/play-subtitles-automatically-with-mpv

inna allows select subtitles with the gui https://lhc70000.github.io/iina/ or maybe https://www.smplayer.info/pl/mpv

## config

- https://gist.github.com/zanderzhng/c2735bea40eb5b5ced87