If you want to just split the video without re-encoding it, use the `copy` codec for audio and video. Try this:

`ffmpeg -ss 00:00:00 -t 00:50:00 -i largefile.mp4 -acodec copy -vcodec copy smallfile.mp4`

Note that this only creates the first split. The next one can be done with a command starting with `ffmpeg -ss 00:50:00`.

This can be done with a single command:

`ffmpeg -i largefile.mp4 -t 00:50:00 -c copy smallfile1.mp4 -ss 00:50:00 -c copy smallfile2.mp4`

This will create `smallfile1.mp4`, ending at 50 minutes into the video of `largefile.mp4`, and `smallfile2.mp4`, starting at 50 minutes in and ending at the end of `largefile.mp4`.

https://superuser.com/questions/140899/ffmpeg-splitting-mp4-with-same-quality/140980#140980
