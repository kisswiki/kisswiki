# How to adjust subtitles to your video file

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

## matroska mkv test files

- multiple audio and subtitles https://github.com/Matroska-Org/matroska-test-files/blob/master/test_files/test5.mkv
- https://www.matroska.org/downloads/test_w1.html
- https://kodi.wiki/view/Samples

## set default audio track in mkv

Add `C:\Program Files\MKVToolNix` to `%PATH%`.

Get correct track numbers by opening video in [MKVToolNixGUI](https://www.videohelp.com/software/MKVToolNix) in InfoTool tab. Beqare that `mkvmerge --identify` gives ids not good for that.

Set desired track to `flag-default=1` and other to `0`.

`mkvpropedit -v test5.mkv -v --edit track:2 --set flag-default=0 --edit track:4 --set flag-default=1`

Reorder - may make the file unplayable, if you reorder video track with audio.

`mkvpropedit -v movie.mkv -v --edit track:2 --set track-number=3 --edit track:3 --set track-number=2`

or specify track type like `a1`:

`mkvpropedit movie.mkv --edit track:a1 --set flag-default=0 --edit track:a2 --set flag-default=1`

Remove forced flag and reorder:

`mkvpropedit -v movie.mkv -v --edit track:2 --set track-number=3 --edit track:3 --set track-number=2  --set flag-forced=0`

- list of options `mkvpropedit.exe -l`
- https://mkvtoolnix.download/doc/mkvpropedit.html
- https://stackoverflow.com/questions/26956762/ffmpeg-set-subtitles-track-as-default/35235287#35235287
- https://video.stackexchange.com/questions/19634/mux-mkv-and-dts-file-change-default-audio-stream-and-language
- https://superuser.com/questions/539640/how-do-i-swap-the-first-and-second-audio-streams-in-an-mkv-in-a-linux-based-syst

## subedit - enable mpv

- `Options > Settings > Video player > Download mpv lib` - needed to click this couple of times for it to download it
- then `Video engine > mpv`

## Download subtitles

Search subtitles on https://www.opensubtitles.org. Choose language, sort by Downloaded. Sometimes the most downloaded might by low quality. Try with less downloads but from earlier day.

## fix timing and delay with SubEdit


Open srt file. SubEdit should open corresponding video file.

Looks like SubEdit automaticaly fixes fps.

So what's left is delay:

- run program
- menu: Synchronization -> Adjust all times...
- enter time
- select "All lines"
- hit "Show earlier" / "Show later" (your call)

- https://forum.videohelp.com/threads/383270-How-to-timeshift-a-subtitle-(-mkv-srt)
