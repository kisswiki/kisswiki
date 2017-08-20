## download mp3

`youtube-dl --extract-audio --audio-format mp3 -f bestaudio <Video-URL>`

https://askubuntu.com/questions/634584/how-to-download-youtube-videos-as-a-best-quality-audio-mp3-using-youtube-dl/634622#634622

or

`youtube-dl --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3 -f bestaudio <Video-URL>`

https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video#comment1403556_178991

## audio-quality not for source but post processing?

>The --audio-quality does not affect the audio quality of the source. It's a post processing option and will re-encode the audio.
>
>Since any kind of (lossy) re-encoding will actually deteriorate the quality of the stream—or at least make it unnecessarily larger in size—I would recommend not to post-process the audio at all.

https://superuser.com/questions/846842/how-to-get-best-quality-audio-using-youtube-dl

## `-f bestaudio` different than `--audio-quality 0`

bestaudio is best audio-only format not best overall audio https://github.com/rg3/youtube-dl/issues/9302

>be careful with -f bestaudio as best audio could be .webm and not .m4a Use `-f m4a` if you want best m4a quality audio. https://askubuntu.com/questions/423508/can-i-directly-download-audio-using-youtube-dl#comment1130351_423510

>The real problem is that bestaudio will select only the best of the dedicated audio formats, even if there is a better audio available in combined format. https://askubuntu.com/questions/688713/how-to-get-best-quality-audio-using-youtube-dl#comment1409840_688731

## metadata, thumbnail, filename etc.

`youtube-dl -f bestaudio --ffmpeg-location /path/to/ffmpeg -o '/path/output/%(title)s.%(ext)s' -x --audio-quality 4 --audio-format mp3 --add-metadata --embed-thumbnail -i URLGOESHERE`

https://www.reddit.com/r/learnprogramming/comments/44nhzp/how_to_use_youtubedl_and_ffmpeg_to_download/d12vuln/

## playlist

If you have a nonstandard URL (timestamped or video stamped) You have to remove everything after the first variable in the url.
Your playlist URL https://www.youtube.com/playlist?list=PLNffuWEygffbbT9Vz-Y1NXQxv2m6mrmHr will work. But if you are on the second video of that playlist and copy https://www.youtube.com/watch?v=Es-ziVPhrNs&list=PLNffuWEygffbbT9Vz-Y1NXQxv2m6mrmHr&index=2 it will not. You would have to remove "watch?v=Es-ziVPhrNs&" from the start and "&index=2" from the end. Because the variables aren't setup that way.

https://www.reddit.com/r/learnprogramming/comments/44nhzp/how_to_use_youtubedl_and_ffmpeg_to_download/d3ew070/

## bat

https://www.reddit.com/r/learnprogramming/comments/44nhzp/how_to_use_youtubedl_and_ffmpeg_to_download/d3ew070/

## list available formats

`youtube-dl -F "http://www.youtube.com/watch?v=P9pzm5b6FFY"`

## download specific format

youtube-dl -f 22 "http://www.youtube.com/watch?v=P9pzm5b6FFY"
Or optionally use the following flags to automatically download the best audio and video tracks available:

`youtube-dl -f bestvideo+bestaudio "http://www.youtube.com/watch?v=P9pzm5b6FFY"`

If you encounter an error during the muxing process, instead try the following:

`youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "http://www.youtube.com/watch?v=P9pzm5b6FFY"`

notice that youtube-dl has labeled the last option 1280x720 as the 'best' quality and that's what it will download by default, but that the line starting with 137 is actually higher quality 1920x1080. Youtube has separated the video and audio streams for the lines labeled DASH so we also need to pick the highest quality audio which in this case is the line starting with 141. Then we run youtube-dl again this time specifying the audio and video:

`youtube-dl -f 137+141 https://www.youtube.com/watch\?v\=-pxRXP3w-sQ`
