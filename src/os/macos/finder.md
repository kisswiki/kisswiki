- https://apple.stackexchange.com/questions/4699/how-to-set-to-open-folder-with-enter-in-finder

## Copy path and paste path

`cmd+option+c` to copy

`cmd+shift+g` to open input and paste with `cmd+v`.

Works also in file picker dialogs.

- https://apple.stackexchange.com/questions/338898/how-to-copy-path-of-a-file-in-mac-os/338899#comment475984_338899
- https://superuser.com/questions/44086/open-folder-for-a-given-path-in-mac-os-x/44089#44089

## breadcrumbs

`cmd+option+p`

## script to convert video

`brew install ffmpeg`

- `Automator > Quick Action`
  - `Workflow receives current: files or folders`
  - `in: Finder.app`
  - on the left search for `Run Shell Script` and drag-and-drop it to the right.
  - `Pass input: as arguments`

The conent will be:

```bash
. $HOME/.zprofile
video_for_whatsup.sh "$@"
```

- Then `File > Save`

- https://apple.stackexchange.com/questions/129929/automating-ffmpeg-using-automator-service/129931#129931
- [Creating Custom Finder Quick Actions With Automator - YouTube](https://www.youtube.com/watch?v=0BEPkM_gkGU)
