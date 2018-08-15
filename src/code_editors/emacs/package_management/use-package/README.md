- use-package to manage your configuration https://www.reddit.com/r/emacs/comments/8buc63/why_arent_packages_just_installed_directly_from/dxacifg/
- https://emacs.stackexchange.com/questions/16831/using-package-el-to-install-and-update-but-use-package-for-loading-and-configuri
- https://emacs.stackexchange.com/questions/tagged/use-package
- author of use-package https://github.com/jwiegley/dot-emacs
- https://www.masteringemacs.org/article/spotlight-use-package-a-declarative-configuration-tool

## use-package vs require

They don't do the same thing at all, but yes, you can mostly replace require with use-package. require tries to load an installed feature, if it has not already been loaded. use-package installs it if not present, and provides facilities for running code during Emacs initialization, and other code when the package gets actually loaded. The only difference is that the package is not necessarily loaded after use-package.

https://www.reddit.com/r/emacs/comments/643dkt/use_package_vs_require_and_maybe_some_sorrowful/dfz3mtx/

## Links

- https://github.com/jwiegley/use-package
- https://www.reddit.com/r/emacs/comments/5udtw1/usepackageel_about_to_be_moved_to_emacs_core/

## :delight

`delight.md`

delight is invoked with the :delight keyword, which is passed a minor mode symbol, a replacement string or quoted mode-line data (in which case the minor mode symbol is guessed to be the package name with "-mode" appended at the end), both of these, or several lists of both. If no arguments are provided, the default mode name is hidden completely.

https://github.com/jwiegley/use-package

Advantages of using delight instead of dimminish:

- Works on major modes too
- Properly handles mode line forms, like (:eval (format " Minor Mode %s" variable))

- https://github.com/jwiegley/use-package/issues/187
- https://github.com/raxod502/radian/issues/386

- https://emacs.stackexchange.com/questions/3925/hide-list-of-minor-modes-in-mode-line
- https://github.com/Malabarba/rich-minority
- https://www.emacswiki.org/emacs/DelightedModes
- https://github.com/myrjola/diminish.el
- https://savannah.nongnu.org/projects/delight

## :defer

In almost all cases you don't need to manually specify :defer t. This is implied whenever :bind or :mode or :interpreter is used. Typically, you only need to specify :defer if you know for a fact that some other package will do something to cause your package to load at the appropriate time, and thus you would like to defer loading even though use-package isn't creating any autoloads for you.

https://github.com/jwiegley/use-package
