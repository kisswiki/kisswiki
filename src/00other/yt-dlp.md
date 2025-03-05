## Install on windows, linux

Somehow version installed with pip reported older version with `youtube-dl --version`.

I installed then manually with <https://ytdl-org.github.io/youtube-dl/download.html>

But curl could not save to `/usr/local/bin/` because it had permission 750.

And later when manually put file there, I could not run it becuase `/usr/local/bin` had 750 permissions.

So first I needed to do `sudo chmod 755 /usr/local/bin` and then proceed with instructions.

I also had some old version installed in `~/.local/bin` and it was trying to run this version, which no longer were there.

So I needed to also do `hash -r` or `export PATH=$PATH`.

<https://superuser.com/questions/876579/linux-command-executed-from-a-different-path-than-whereis/876588#876588>

## Install on Android

Install from here <https://github.com/rofrol/termux-yt-dlp>

Upgrade with `pip install -U yt-dlp`.

### Config

<https://github.com/rofrol/termux-yt-dlp/blob/master/yt-dlp/config>

`vim ~/.config/yt-dlp/config`

- <https://github.com/kdeldycke/dotfiles/blob/e3cbd1318dc64d7d015295c782a14016c771c89e/dotfiles/.config/yt-dlp.conf>
- <https://github.com/Mikaela/shell-things/blob/3dab67498bb5fc71c1fa3baddbbd810df4564359/conf/yt-dlp.conf>
- <https://www.reddit.com/r/youtubedl/wiki/config-example>
- <https://superuser.com/questions/927523/how-to-download-only-subtitles-of-videos-using-youtube-dl>

also

```
--throttled-rate 100K
--concurrent-fragments 4
```

- <https://github.com/Tahvohck/VTuber-Archiving-Tools/blob/f1093c0c6b3d33a57a4d5046ffb6c86bf463dea8/yt-dlp.conf>
- <https://github.com/ohmybahgosh/YT-DLP-SCRIPTS>

## options priority

In youtube-dl, `--sub-langs en --sub-langs ja` will download only `ja`, but in yt-dlp, it will download both. If you want to override an older sub-langs in yt-dlp, you have to explicitly do it like `--sub-langs -all,ja`. The `-all` removes all previous `--sub-langs`.

<https://www.reddit.com/r/youtubedl/comments/o88mtn/comment/h33heak/>

## embed subtitles

`ffmpeg -i "https://example.com/link/to/subtitles_playlist.m3u8" subtitles.srt`

<https://www.reddit.com/r/youtubedl/comments/mb8hxf/comment/grwjsa3/>

If your mkv filenames match the subtitle names (as is usually the case) -- apart from the extension of course, you can run something like:

```bash
for f in *.mkv ; do ffmpeg -i ${f} -i ${f%.*}.en.vtt -c:v copy -c:a copy -map 0:v -map 0:a -map 1:s ${f%.*}_sub.mkv ;done
```

in a bash/zsh-like shell (so works on Windows via WSL, MacOS, & Linux etc.)

You can do it for MP4s too - just change the extension of course, and add `-c:s mov_text -metadata:s:s:0 language=en` between the last `copy` and the first `-map`.

<https://www.reddit.com/r/youtubedl/comments/p4b2r7/comment/h8y4x8z/>

### Add id to file name

Open termux

```
apt update
pkg install vim
vim ~/.config/youtube-dl/config
```

Change to `%(title)s-%(id)s.%(ext)s`

- <https://github.com/yt-dlp/yt-dlp#differences-in-default-behavior>

## ffmpeg

Install ffmpeg or you may get file without audio <https://www.ffmpeg.org/download.html>

## download mp3 or acc

```
yt-dlp --extract-audio "https://www.youtube.com/watch?v=GXeAOtb1VeA"
ffmpeg -i output.opus output.aac
```

`yt-dlp --extract-audio --audio-format aac "https://www.youtube.com/watch?v=GXeAOtb1VeA"`

`youtube-dl --extract-audio --audio-format mp3 -f bestaudio <Video-URL>`

<https://askubuntu.com/questions/634584/how-to-download-youtube-videos-as-a-best-quality-audio-mp3-using-youtube-dl/634622#634622>

or

`youtube-dl --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3 -f bestaudio <Video-URL>`

<https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video#comment1403556_178991>

## audio-quality not for source but post processing?

> The --audio-quality does not affect the audio quality of the source. It's a post processing option and will re-encode the audio.
>
> Since any kind of (lossy) re-encoding will actually deteriorate the quality of the stream—or at least make it unnecessarily larger in size—I would recommend not to post-process the audio at all.

<https://superuser.com/questions/846842/how-to-get-best-quality-audio-using-youtube-dl>

## `-f bestaudio` different than `--audio-quality 0`

bestaudio is best audio-only format not best overall audio <https://github.com/rg3/youtube-dl/issues/9302>

> be careful with -f bestaudio as best audio could be .webm and not .m4a Use `-f m4a` if you want best m4a quality audio. <https://askubuntu.com/questions/423508/can-i-directly-download-audio-using-youtube-dl#comment1130351_423510>

> The real problem is that bestaudio will select only the best of the dedicated audio formats, even if there is a better audio available in combined format. <https://askubuntu.com/questions/688713/how-to-get-best-quality-audio-using-youtube-dl#comment1409840_688731>

## metadata, thumbnail, filename etc

`youtube-dl -f bestaudio --ffmpeg-location /path/to/ffmpeg -o '/path/output/%(title)s.%(ext)s' -x --audio-quality 4 --audio-format mp3 --add-metadata --embed-thumbnail -i URLGOESHERE`

<https://www.reddit.com/r/learnprogramming/comments/44nhzp/how_to_use_youtubedl_and_ffmpeg_to_download/d12vuln/>

## playlist

If you have a nonstandard URL (timestamped or video stamped) You have to remove everything after the first variable in the url.
Your playlist URL <https://www.youtube.com/playlist?list=PLNffuWEygffbbT9Vz-Y1NXQxv2m6mrmHr> will work. But if you are on the second video of that playlist and copy <https://www.youtube.com/watch?v=Es-ziVPhrNs&list=PLNffuWEygffbbT9Vz-Y1NXQxv2m6mrmHr&index=2> it will not. You would have to remove "watch?v=Es-ziVPhrNs&" from the start and "&index=2" from the end. Because the variables aren't setup that way.

<https://www.reddit.com/r/learnprogramming/comments/44nhzp/how_to_use_youtubedl_and_ffmpeg_to_download/d3ew070/>

## bat

<https://www.reddit.com/r/learnprogramming/comments/44nhzp/how_to_use_youtubedl_and_ffmpeg_to_download/d3ew070/>

## list available formats

`youtube-dl -F "http://www.youtube.com/watch?v=P9pzm5b6FFY"`

## download specific format

youtube-dl -f 22 "<http://www.youtube.com/watch?v=P9pzm5b6FFY>"
Or optionally use the following flags to automatically download the best audio and video tracks available:

`youtube-dl -f bestvideo+bestaudio "http://www.youtube.com/watch?v=P9pzm5b6FFY"`

If you encounter an error during the muxing process, instead try the following:

`youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "http://www.youtube.com/watch?v=P9pzm5b6FFY"`

notice that youtube-dl has labeled the last option 1280x720 as the 'best' quality and that's what it will download by default, but that the line starting with 137 is actually higher quality 1920x1080. Youtube has separated the video and audio streams for the lines labeled DASH so we also need to pick the highest quality audio which in this case is the line starting with 141. Then we run youtube-dl again this time specifying the audio and video:

`youtube-dl -f 137+141 https://www.youtube.com/watch\?v\=-pxRXP3w-sQ`

## Please sign in to view this video - cookies

`yt-dlp --cookies ~/Downloads/twitter.com_cookies.txt <url>`

- <https://github.com/rg3/youtube-dl/blob/master/README.md#how-do-i-pass-cookies-to-youtube-dl>
  - <https://chromewebstore.google.com/detail/get-cookiestxt-locally/cclelndahbckbenkjhflpdbgdldlbecc>

## egghead.io

### Error KeyError('media_urls')

Even when extracting cookies with <https://chrome.google.com/webstore/detail/cookiestxt/njabckikapfpffapmjgojcnbfjonfjfg>

`youtube-dl -v --user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101 Firefox/59.0" --cookies cookies.txt -o "$(printf "%02d" 2).%(title)s.%(ext)s" "https://egghead.io/lessons/graphql-use-graphql-primitive-types"`

or using user agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"

- <https://github.com/rg3/youtube-dl/issues/6635#issuecomment-340277143>
- <https://github.com/rg3/youtube-dl#how-do-i-pass-cookies-to-youtube-dl>

## Autonumbering from file

`youtube-dl -i -o "%(autonumber)s-%(title)s.%(ext)s" -a list.txt --cookie ../cookies.txt`

<https://github.com/ellerbrock/egghead-video-download>

## Extract links

```bash
#!/bin/bash
# Usage: dl-lession.sh https://egghead.io/courses/react-fundamentals

let n=1
for link in $(curl -s $1 | pup '.series-lessons-list a attr{href}'); do
  filename=$(echo $link | sed "s/https:\/\/egghead.io\/lessons\///g" | sed "s/\?.*$//g")
  filename_numbered=$(echo "$n $filename" | awk '{ printf "%02i-%s.mp4\n", $1, $2 }')
  youtube-dl -o "$filename_numbered" "$link"
  let n++
done
```

- <https://gist.github.com/kaeff/7f3be2e262747719e6d195d968ca6bbf>
