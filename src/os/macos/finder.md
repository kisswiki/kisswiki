- <https://apple.stackexchange.com/questions/4699/how-to-set-to-open-folder-with-enter-in-finder>

## Copy path and paste path

`cmd+option+c` to copy

`cmd+shift+g` to open input and paste with `cmd+v`.

Works also in file picker dialogs.

- <https://apple.stackexchange.com/questions/338898/how-to-copy-path-of-a-file-in-mac-os/338899#comment475984_338899>
- <https://superuser.com/questions/44086/open-folder-for-a-given-path-in-mac-os-x/44089#44089>

## breadcrumbs

`cmd+option+p`

## script to convert video

`brew install ffmpeg`

- `Automator > Quick Action`
  - `Workflow receives current: files or folders`
  - `in: Finder.app`
  - on the left search for `Run Shell Script` and drag-and-drop it to the right.
  - `Pass input: as arguments`

The content will be:

```bash
. $HOME/.zprofile
video_for_whatsup.sh "$@"
```

Then `File > Save`

- <https://apple.stackexchange.com/questions/129929/automating-ffmpeg-using-automator-service/129931#129931>
- [Creating Custom Finder Quick Actions With Automator - YouTube](https://www.youtube.com/watch?v=0BEPkM_gkGU)

## Exclude folder from Recents

`System Settings > Spotlight > Privacy`

<https://discussions.apple.com/thread/8384478>

## Search in current folder

`Settings > Advanced tab > When performing a search: Search the current folder`

<https://apple.stackexchange.com/questions/14046/how-to-type-to-search-in-current-folder/14110#14110>

## Open finder in Downloads

`Finder > Settings > General > New Finder window show: Downloads`

## Show hidden files

`cmd+shift+.`

or

`defaults write com.apple.finder AppleShowAllFiles YES`

- <https://discussions.apple.com/thread/7581737?answerId=7581737021&sortBy=rank#7581737021>
- <https://apple.stackexchange.com/questions/302954/permanently-enable-to-show-hidden-system-files-when-searching-in-finder>

## Show all filename extensions

`Finder > Settings > Advanced > Show all filename extensions`

## Keep directories on top

`Settings > Advanced > Keep folders on top > In windows when sorting by name`

## Merge directories

Drag with option key

<https://www.reddit.com/r/MacOS/comments/1b2y8i6/moving_a_folder_over_a_folder_with_the_same_name/>
