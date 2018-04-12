- https://github.com/Diaoul/subliminal
- https://github.com/ajknol/Subliminal-Windows-right-click-menu
- https://isubtitles.net/the-boy-and-the-beast-subtitles

## mpv

Subtitles with .txt extension in 0.24.0
Since version 0.24.0 subtitles with .txt extension are no longer recognized as subtitles and thus no longer autoloaded. Please refer to the offending commit's message and this [upstream issue](https://github.com/mpv-player/mpv/commit/50991fac81eb56bc0985af2c9d31cd503302dcfe) for more info.

If you want to restore the previous behaviour, use the following Lua script: [autoloadtxt.lua](https://wiki.gentoo.org/wiki/Mpv/autoloadtxt.lua).

https://wiki.gentoo.org/wiki/Mpv#Subtitles_with_.txt_extension_in_0.24.0

## mpv load subtitle

`--sub-file`

- https://unix.stackexchange.com/questions/279884/play-subtitles-automatically-with-mpv
- https://askubuntu.com/questions/901120/can-i-make-mpv-player-to-pick-up-any-subtitles-available-in-the-folder
- https://github.com/zeynaliAli/MPV-Sub-Configure

You need to put `sub-auto`, and likely `--sub-file-paths` in your `mpv.conf` file (see https://mpv.io/manual/master/#subtitles for examples). I'm not aware of any support for "drag and drop" subtitles addition in MPV.

https://superuser.com/questions/1097227/open-external-subtitles-on-mpv-on-linux-without-terminal

## mpv key mapping

```
v Show / hide subtitles
j / J Next / previous subtitle
z / x Increase / decrease subtitle delay
r / t Move subtitles up / down
```

https://www.cheatography.com/someone/cheat-sheets/mpv-media-player/