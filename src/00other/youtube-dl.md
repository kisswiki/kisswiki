## download mp3

`youtube-dl --extract-audio --audio-format mp3 -f bestaudio <Video-URL>`

https://askubuntu.com/questions/634584/how-to-download-youtube-videos-as-a-best-quality-audio-mp3-using-youtube-dl/634622#634622

or

`youtube-dl --output "%(title)s.%(ext)s" --extract-audio --audio-format mp3 -f bestaudio <Video-URL>`

https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video#comment1403556_178991

## `-f bestaudio` different than `--audio-quality 0`

https://github.com/rg3/youtube-dl/issues/9302

>be careful with -f bestaudio as best audio could be .webm and not .m4a Use `-f m4a` if you want best m4a quality audio. https://askubuntu.com/questions/423508/can-i-directly-download-audio-using-youtube-dl#comment1130351_423510

>The real problem is that bestaudio will select only the best of the dedicated audio formats, even if there is a better audio available in combined format. https://askubuntu.com/questions/688713/how-to-get-best-quality-audio-using-youtube-dl#comment1409840_688731

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
