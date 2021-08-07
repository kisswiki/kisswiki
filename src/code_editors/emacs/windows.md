- http://ergoemacs.org/emacs/emacs_mswin.html
- http://caiorss.github.io/Emacs-Elisp-Programming/Emacs_On_Windows.html

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

## Executable

get path of executable

`M-: (executable-find "find")`

https://emacs.stackexchange.com/a/26081/19475

```lisp
(when (eq system-type 'windows-nt)
  (add-to-list 'exec-path "C:/Program Files/Git/usr/bin")
  (setenv "PATH" (mapconcat #'identity exec-path path-separator)))
```

https://emacs.stackexchange.com/questions/27326/gui-emacs-sets-the-exec-path-only-from-windows-environment-variable-but-not-from

## Install and update with pacman

`pacman -S mingw-w64-x86_64-emacs`

https://www.gnu.org/software/emacs/download.html
