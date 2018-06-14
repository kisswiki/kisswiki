## Set font

`Options > Set Default Font …`
`Options > Save Options`

https://www.emacswiki.org/emacs/ChangeFontsPermanentlyOnWindows

or

```lisp
(set-frame-font "Source Code Pro-12" nil t)
```

## Run without dos window

Use runemacs for that.

`emacsclientw.exe -c -n -a "runemacs -fs --xrm \"Emacs.toolBar:0\" --xrm \"Emacs.menuBar:0\""`

- https://emacs.stackexchange.com/questions/20213/how-to-start-emacs-without-the-cmd-exe-window-on-ms-windows
- https://www.emacswiki.org/emacs/EmacsMsWindowsIntegration
- https://www.johndcook.com/blog/emacs_windows/
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Windows-Startup.html