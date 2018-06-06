call package-initialize with non-nil optional argument, e.g.,

`(package-initialize 'no-activate)`

This is how I have always use package.el so that I can have many installed packages, but activate only some of them by using a different init file when emacs starts.

https://github.com/raxod502/straight.el/issues/128#issuecomment-323602566

or?

`(setq package-enable-at-startup nil)`

https://github.com/raxod502/straight.el/issues/128#issuecomment-325248034

##

- https://emacs.stackexchange.com/questions/7978/how-can-i-view-the-full-package-alist-value-without-the-truncation-characters
  in scratch buffer: `(pp package-alist)`, move to end of line and press `C-j`.