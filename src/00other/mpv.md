## Config

- https://wiki.archlinux.org/index.php/mpv
- https://wiki.gentoo.org/wiki/Mpv#Player_settings
- https://mpv.io/manual/master/#files
- https://mpv.io/manual/master/#files-on-windows

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
```

## Remember position

portable_config/mpv.conf

```
save-position-on-quit=yes
```
