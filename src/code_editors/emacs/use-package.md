- https://www.reddit.com/r/emacs/comments/5udtw1/usepackageel_about_to_be_moved_to_emacs_core/

## :delight

`delight.md`

delight is invoked with the :delight keyword, which is passed a minor mode symbol, a replacement string or quoted mode-line data (in which case the minor mode symbol is guessed to be the package name with "-mode" appended at the end), both of these, or several lists of both. If no arguments are provided, the default mode name is hidden completely.

https://github.com/jwiegley/use-package

## :defer

In almost all cases you don't need to manually specify :defer t. This is implied whenever :bind or :mode or :interpreter is used. Typically, you only need to specify :defer if you know for a fact that some other package will do something to cause your package to load at the appropriate time, and thus you would like to defer loading even though use-package isn't creating any autoloads for you.

https://github.com/jwiegley/use-package