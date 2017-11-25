Use dutti, look at mpv.md

## Below didn't work

`sudo xattr -rd com.apple.quarantine *` in the user directory solved the problem permanently here

- macOS 10.13 High Sierra Verifying issue https://github.com/mpv-player/mpv/issues/4966

It's a bug in Quicktime. On every opening it adds the xattr (extended attribute) com.apple.quarantine on every file opening. I hope Apple will fix this on a next update soon. The only workaround I know is to remove that xattr on every file (on network delete all ._* files where the xattr are saved on Samba shares) and try not to open the video file with Quicktime and use an alternative.

- https://discussions.apple.com/thread/8093203?start=0&tstart=0


```bash
xattr -r com.apple.quarantine ~/Downloads
```

The `-r` is to make it recursive (so existing files and folders are also modified).

UPDATE I've realized that new files will be put in quarantine when you download them, so although the above command will go file by file and remove the flag, so you don't have to tell the OS that the file is safe every time, in order to completely disable the mechanism, you have to execute an extra command. please make sure that this is ok with you, since you can't do this for single files, it's an all or nothing.

https://apple.stackexchange.com/questions/82370/how-to-automatically-open-files-downloaded-from-safari