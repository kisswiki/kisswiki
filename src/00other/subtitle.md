# Guide to adjust subtitles to video and play in mpv

## timing

If the sync gets worse (gets more and more ahead or behind) as the playback progresses then you have a timing issue.

<https://superuser.com/questions/153143/how-to-perfectly-synchronize-subtitles-with-movie>

- [kaegi/alass: "Automatic Language-Agnostic Subtitle Synchronization"](https://github.com/kaegi/alass)
  - `cargo install alass-cli` or `brew install alass`
  - `alass-cli movie.mp4 incorrect_subtitle.srt output.srt`
  - `alass-cli reference_subtitle.ssa incorrect_subtitle.srt output.srt`
- <https://openai.com/blog/whisper/>

## edit timing

- <https://www.videohelp.com/software/Subtitle-Edit>
- Subtitle Workshop does not support mkv
- <https://superuser.com/questions/153143/how-to-perfectly-synchronize-subtitles-with-movie>
- <https://superuser.com/questions/49245/what-subtitle-file-editor-for-srt-files-supports-synchronization>
- Automagically synchronize subtitles with video <https://github.com/smacke/subsync>
  - <https://news.ycombinator.com/item?id=19248723>

## remuxing

Remuxing, in our context, refers to the process of changing the “container” format used for a given file. For example from MP4 to MKV or from AVI to MKV. It also allows adding or removing of content streams as needed. Remuxing differs from Transcoding in that remuxing a file simply repackages the existing streams while transcoding actually creates new ones from a source.

<https://support.plex.tv/articles/201097958-remuxing-files-to-mkv/>

## matroska mkv test files

- multiple audio and subtitles <https://github.com/Matroska-Org/matroska-test-files/blob/master/test_files/test5.mkv>
- <https://www.matroska.org/downloads/test_w1.html>
- <https://kodi.wiki/view/Samples>

## set default audio track in mkv

Add `C:\Program Files\MKVToolNix` to `%PATH%`.

Get correct track numbers by opening video in [MKVToolNixGUI](https://www.videohelp.com/software/MKVToolNix) in InfoTool tab. Beware that `mkvmerge --identify` gives ids not good for that.

Set desired track to `flag-default=1` and other to `0`.

Note: If you get error "Error: This file could not be opened or parsed.", check if file is not in `Read Only` mode. <https://github.com/mbunkus/mkvtoolnix/issues/1341>

`mkvpropedit -v test5.mkv -v --edit track:2 --set flag-default=0 --edit track:4 --set flag-default=1`

Reorder - may make the file unplayable, if you reorder video track with audio.

`mkvpropedit -v movie.mkv -v --edit track:2 --set track-number=3 --edit track:3 --set track-number=2`

or specify track type like `a1`:

`mkvpropedit movie.mkv --edit track:a1 --set flag-default=0 --edit track:a2 --set flag-default=1`

Remove forced flag and reorder:

`mkvpropedit -v movie.mkv -v --edit track:2 --set track-number=3 --edit track:3 --set track-number=2 --set flag-forced=0`

- list of options `mkvpropedit.exe -l`
- <https://mkvtoolnix.download/doc/mkvpropedit.html>
- <https://stackoverflow.com/questions/26956762/ffmpeg-set-subtitles-track-as-default/35235287#35235287>
- <https://video.stackexchange.com/questions/19634/mux-mkv-and-dts-file-change-default-audio-stream-and-language>
- <https://superuser.com/questions/539640/how-do-i-swap-the-first-and-second-audio-streams-in-an-mkv-in-a-linux-based-syst>

## subedit - enable mpv

- `Options > Settings > Video player > Download mpv lib > Download mpv lib` - needed to click this couple of times for it to download it
- then `Video engine > mpv`

## ass to srt

```
uv tool install 'pyasstosrt[cli]'
pyasstosrt export en.ass
```

## Download subtitles

- Search subtitles on <https://www.opensubtitles.org>. Choose language, sort by `Downloaded`. Sometimes the most downloaded might be low quality. Look for badges on uploaders. Try with less downloads but from earlier day.
- Polish subitles for anime <http://animesub.info/>
- <http://qnapi.github.io/>
- <https://github.com/zerratar/SubSync>
- <http://www.napiprojekt.pl/>
- <https://gitlab.com/hesperos/napi>
- <https://github.com/emericg/OpenSubtitlesDownload>

## How to download for specific hash from napiprojekt without installing napi?

For example [list of subtitles](https://www.napiprojekt.pl/napisy1,1,1-dla-54910-Green-Book-(2018)), but can be downloaded with windows program napiprojekt.

There is `_download_getSubtitlesForHashes` <https://gitlab.com/hesperos/napi/blob/master/actions/libnapi_download.sh>

## fix timing and delay with SubEdit

If file is txt, then open in SubEdit and save as `SubRip (*.srt)` - first position in list.

Open srt file. SubEdit should open corresponding video file.

- How to adjust subtitle in Subtitle Edit software <https://youtu.be/gqEhvccKygU>
  - Subtitle Edit > Synchronization > Visual sync

1. Place the video file and its subtitle file in the same directory. Make sure the filename prefix of both the files are the same.
2. Open the subtitles file in Subtitle Edit.
3. Choose `Synchronization > Visual Sync`.
4. Subtitle Edit shows a split screen with a video player in each. The video player in the first split is seeked to the first subtitle and that in the second split to the last subtitle.
5. Now, play the video in a split a bit until someone speaks something. Pause it. Pick the subtitle from the dropdown below that matches what was spoken. Do the same with the second video player.
6. Press Sync and let Subtitle Edit do the work of shifting forward, backward, squeezing or expanding the subtitles to match the video. Press Save and you are done!

<https://codeyarns.com/2013/02/23/how-to-sync-subtitles-using-subtitle-edit/>

So what's left is delay:

- run program
- menu: Synchronization -> Adjust all times...
- enter time
- select "All lines"
- hit "Show earlier" / "Show later" (your call)

- <https://forum.videohelp.com/threads/383270-How-to-timeshift-a-subtitle-(-mkv-srt)>
- `Synchronization > Point sync via other subtitle` <https://blog.opensubtitles.org/guides/how-to-synchronize-subtitles-using-subtitle-edit>
- <https://www.nikse.dk/SubtitleEdit/Help#translate>

## mpv

Subtitles with .txt extension in 0.24.0

Since version 0.24.0 subtitles with .txt extension are no longer recognized as subtitles and thus no longer autoloaded. Please refer to the offending commit's message and this [upstream issue](https://github.com/mpv-player/mpv/commit/50991fac81eb56bc0985af2c9d31cd503302dcfe) for more info.

If you want to restore the previous behaviour, use the following Lua script: [autoloadtxt.lua](https://wiki.gentoo.org/wiki/Mpv/autoloadtxt.lua).

<https://wiki.gentoo.org/wiki/Mpv#Subtitles_with_.txt_extension_in_0.24.0>

## mpv load subtitle

`--sub-file`

- <https://unix.stackexchange.com/questions/279884/play-subtitles-automatically-with-mpv>
- <https://askubuntu.com/questions/901120/can-i-make-mpv-player-to-pick-up-any-subtitles-available-in-the-folder>
- <https://github.com/zeynaliAli/MPV-Sub-Configure>

You need to put `sub-auto`, and likely `--sub-file-paths` in your `mpv.conf` file (see <https://mpv.io/manual/master/#subtitles> for examples). I'm not aware of any support for "drag and drop" subtitles addition in MPV.

<https://superuser.com/questions/1097227/open-external-subtitles-on-mpv-on-linux-without-terminal>

## mpv key mapping

```
v Show / hide subtitles
j / J Next / previous subtitle
z / x Increase / decrease subtitle delay
r / t Move subtitles up / down
```

<https://www.cheatography.com/someone/cheat-sheets/mpv-media-player/>

## extract subtitles

Install mkvtoolnix with `sudo apt install mkvtoolnix` or `brew install mkvtoolnix`.

Run from terminal: `mkvextract tracks <your_mkv_video> <track_numer>:<subtitle_file.srt>`

Use `mkvinfo` to get information about tracks.

If the mkvinfo shows for subtitles: Codec ID: S_HDMV/PGS, change extension to sup and convert to srt with <https://pgs-to-srt.com/>

- for S_VOBSUB: `mkvextract tracks file.mkv 3:track3` will produce track3.idx and track3.sub. Convert to srt with <https://subtitletools.com>.

- <https://askubuntu.com/questions/452268/extract-subtitle-from-mkv-files>
- To translate srt subtitles to other language <https://translatesubtitles.co>

## napiprojekt

- <http://pym.uce.pl/pym-player/>
  - PYM Player obsługuje między innymi wywołania ze strony NapiProjektu, czyli możesz pobierać napisy nawet ręcznie bezpośrednio ze strony. ściągnij PYM Player, robi robotę. Na pewno lepsza, niż Qnapi. Możesz sobie tam bezpośrednio pobrać napisy tak jak przez Qnapi, a jeśli będziesz chciał jakieś inne że strony głównej napiprojektu, to też dasz radę je ściągnąć, bo PYM działa jako downloader. <https://www.wykop.pl/wpis/39245551/siema-mam-taki-problem-z-qnapi-mimo-ze-mam-podlacz/>

## qnapi

### backup language

w ~/.config/qnapi.ini musisz mieć 2 wpisy:

```
backup_langu
```
