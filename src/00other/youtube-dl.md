## download mp3

`youtube-dl --extract-audio --audio-format mp3 -f bestaudio <Video-URL>`

https://askubuntu.com/questions/634584/how-to-download-youtube-videos-as-a-best-quality-audio-mp3-using-youtube-dl/634622#634622

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
