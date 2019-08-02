```bash
$ emacs --help
#...
--fullheight, -fh               make the first frame high as the screen
--fullscreen, -fs               make the first frame fullscreen
--fullwidth, -fw                make the first frame wide as the screen
--maximized, -mm  
```

only `-fs` works for me.

## Windows

`emacsclientw.exe -c -n -a "runemacs -fs --xrm \"Emacs.toolBar:0\" --xrm \"Emacs.menuBar:0\""`

- https://www.emacswiki.org/emacs/FullScreen
- https://www.emacswiki.org/emacs/EmacsClient
