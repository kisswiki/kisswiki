Create a file mylist.txt with all the files you want to have concatenated in the following form (lines starting with a # are ignored):

```
# this is a comment
file '/path/to/file1'
file '/path/to/file2'
file '/path/to/file3'
```

Note that these can be either relative or absolute paths. Then you can stream copy or re-encode your files:

`ffmpeg -f concat -safe 0 -i mylist.txt -c copy output`

The `-safe 0` above is not required if the paths are relative.

- https://trac.ffmpeg.org/wiki/Concatenate
- https://superuser.com/questions/1256223/combine-mov-video-files
- https://superuser.com/questions/1039678/merge-multiple-video-with-ffmpeg-single-command-line-in-specific-time-without-cu
- https://askubuntu.com/questions/8523/what-software-can-join-videos
- https://askubuntu.com/questions/637074/how-to-merge-multiple-more-than-two-videos-on-ubuntu

### Non-monotonous DTS in output stream

- I got similar errors, and the audio in my output videos was sometimes out of sync and sometimes missing completely, but I ended up using mkvmerge from mkvtoolnix instead. https://video.stackexchange.com/questions/15468/non-monotonous-dts-on-concat-ffmpeg/19096#19096
- https://superuser.com/questions/1150276/trim-video-and-concatenate-using-ffmpeg-getting-non-monotonous-dts-in-output
