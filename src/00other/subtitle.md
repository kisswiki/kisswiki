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

## timing

If the sync gets worse (gets more and more ahead or behind) as the playback progresses then you have a timing issue.

https://superuser.com/questions/153143/how-to-perfectly-synchronize-subtitles-with-movie

## edit timing

- https://www.videohelp.com/software/Subtitle-Edit
- Subtitle Workshop does not support mkv
- https://superuser.com/questions/153143/how-to-perfectly-synchronize-subtitles-with-movie
- https://superuser.com/questions/49245/what-subtitle-file-editor-for-srt-files-supports-synchronization

## remuxing

Remuxing, in our context, refers to the process of changing the “container” format used for a given file. For example from MP4 to MKV or from AVI to MKV. It also allows adding or removing of content streams as needed. Remuxing differs from Transcoding in that remuxing a file simply repackages the existing streams while transcoding actually creates new ones from a source.

https://support.plex.tv/articles/201097958-remuxing-files-to-mkv/
