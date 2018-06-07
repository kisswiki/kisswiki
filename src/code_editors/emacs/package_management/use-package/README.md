- use-package to manage your configuration https://www.reddit.com/r/emacs/comments/8buc63/why_arent_packages_just_installed_directly_from/dxacifg/
- https://emacs.stackexchange.com/questions/16831/using-package-el-to-install-and-update-but-use-package-for-loading-and-configuri
- https://emacs.stackexchange.com/questions/tagged/use-package
- author of use-package https://github.com/jwiegley/dot-emacs

## use-package vs require

They don't do the same thing at all, but yes, you can mostly replace require with use-package. require tries to load an installed feature, if it has not already been loaded. use-package installs it if not present, and provides facilities for running code during Emacs initialization, and other code when the package gets actually loaded. The only difference is that the package is not necessarily loaded after use-package.

https://www.reddit.com/r/emacs/comments/643dkt/use_package_vs_require_and_maybe_some_sorrowful/dfz3mtx/