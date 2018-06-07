## commands

`C-x package-install RET elm-mode RET`

Refresh list of packages

`M-x package-refresh-contents`

List of packages

`M-x package-list-packages`

- http://melpa.milkbox.net/#/getting-started
- http://ergoemacs.org/emacs/emacs_package_system.html

## package-initialize

call package-initialize with non-nil optional argument, e.g.,

`(package-initialize 'no-activate)`

This is how I have always use package.el so that I can have many installed packages, but activate only some of them by using a different init file when emacs starts.

https://github.com/raxod502/straight.el/issues/128#issuecomment-323602566

or?

`(setq package-enable-at-startup nil)`

https://github.com/raxod502/straight.el/issues/128#issuecomment-325248034

Emacs-27

Installed packages are now activated *before* loading the init file.
This is part of a change intended to eliminate the behavior of
package.el inserting a call to 'package-initialize' into the init
file, which was previously done when Emacs was started.  As a result
of this change, it is no longer necessary to call 'package-initialize'
in your init file.

- https://github.com/emacs-mirror/emacs/blob/master/etc/NEWS
- https://www.reddit.com/r/emacs/comments/87g6yg/new_packagequickstart_feature_in_emacs_27/

## package-alist

- https://emacs.stackexchange.com/questions/7978/how-can-i-view-the-full-package-alist-value-without-the-truncation-characters
  in scratch buffer: `(pp package-alist)`, move to end of line and press `C-j`.