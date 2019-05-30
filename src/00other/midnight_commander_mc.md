# Midnight Commander

- https://unix.stackexchange.com/questions/205546/go-to-file-directory-in-midnight-commander-by-typing/425172#425172
- https://unix.stackexchange.com/questions/5901/how-to-open-the-same-directory-in-another-panel-in-midnight-commander/425173#425173

## File association

copy `mc.ext` installed with `mc`:

`cp /etc/mc/mc.ext ~/.config/mc`.

Find line `include/video` and change to:

```
include/video
  #Open=/usr/local/Cellar/midnight-commander/4.8.21/libexec/mc/ext.d/video.sh open ALL_FORMATS
  Open=mpv "${MC_EXT_FILENAME}"
```

## Keys

Win+Alt+0 quit

Alt+o opens the directory your cursor is on.

Alt+i opens the active panel's directory on the other panel.

Ctrl+o toggle command line view

Alt+Enter copy file name to command line

## Sorting

in ~/.config/mc/mc.keymap

```
[panel]
Sort = alt-!
SortPrev =
SortNext =
SortReverse = alt-@
SortByName = alt-#
SortByExt = alt+$
SortBySize = alt-%
SortByMTime =  alt-^
```

https://unix.stackexchange.com/questions/354215/change-sort-order-with-shortcuts-in-midnight-commander
