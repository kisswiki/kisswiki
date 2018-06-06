## commands

`C-x package-install RET elm-mode RET`

Refresh list of packages

`M-x package-refresh-contents`

List of packages

`M-x package-list-packages`

- http://melpa.milkbox.net/#/getting-started
- http://ergoemacs.org/emacs/emacs_package_system.html

## Speed

- https://www.reddit.com/r/emacs/comments/87g6yg/new_packagequickstart_feature_in_emacs_27/

## package-initialize

call package-initialize with non-nil optional argument, e.g.,

`(package-initialize 'no-activate)`

This is how I have always use package.el so that I can have many installed packages, but activate only some of them by using a different init file when emacs starts.

https://github.com/raxod502/straight.el/issues/128#issuecomment-323602566

or?

`(setq package-enable-at-startup nil)`

https://github.com/raxod502/straight.el/issues/128#issuecomment-325248034

## package-alist

- https://emacs.stackexchange.com/questions/7978/how-can-i-view-the-full-package-alist-value-without-the-truncation-characters
  in scratch buffer: `(pp package-alist)`, move to end of line and press `C-j`.