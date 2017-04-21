- https://github.com/mpv-player/mpv/blob/master/DOCS/mplayer-changes.rst

## Config

- https://wiki.archlinux.org/index.php/mpv
- https://wiki.gentoo.org/wiki/Mpv#Player_settings
- https://mpv.io/manual/master/#files
- https://mpv.io/manual/master/#files-on-windows
- https://github.com/mpv-player/mpv/blob/master/DOCS/man/options.rst
- https://github.com/mpv-player/mpv/blob/master/etc/mplayer-input.conf

If a directory named portable_config next to the mpv.exe exists, all config will be loaded from this directory only.

- https://github.com/mpv-player/mpv/blob/master/etc/input.conf
- https://mpv.io/manual/master/#input-conf

portable_config/input.conf

```
MOUSE_BTN3 seek 2 exact
MOUSE_BTN4 seek -2 exact
```

## DVD

http://unix.stackexchange.com/questions/265874/using-mpv-to-play-dvd-movies

## Subtitles

http://unix.stackexchange.com/questions/279884/play-subtitles-automatically-with-mpv

portable_config/mpv.conf

```
sub-auto=fuzzy
subcp=cp1250
```

## Remember position

portable_config/mpv.conf

```
save-position-on-quit=yes
```

## Voices muted

portable_config/mpv.conf

```
audio-channels=2
```

- https://bbs.archlinux.org/viewtopic.php?pid=1516946#p1516946
- http://askubuntu.com/questions/163843/why-can-i-hear-only-a-few-audio-channels-when-playing-video-files
- https://github.com/mpv-player/mpv/issues/1313

## Loop

L cycle-values loop-file "inf" "no"

https://github.com/mpv-player/mpv/blob/master/etc/input.conf
