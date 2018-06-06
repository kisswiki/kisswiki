
`C-x package-install RET elm-mode RET`

## Refresh list of packages

`M-x package-refresh-contents`

## List of packages

`M-x package-list-packages`

- http://melpa.milkbox.net/#/getting-started
- http://ergoemacs.org/emacs/emacs_package_system.html

## Cask

- https://www.lambdacat.com/modern-emacs-package-management-with-cask-and-pallet/
- https://github.com/turboMaCk/Dotfiles/tree/master/emacs.d
- `cask update` http://blog.journeythatcounts.nl/posts/emacs-config-with-cask.html
- promote the use of integration and tests to have even better emacs library https://github.com/AdrieanKhisbe/cask-package-toolset.el

## Packages in git

I just commit all of the packages into my Emacs config version control.

This has quite a few advantages:

- You're guaranteed to get the same packages on all machines.
  - Melpa/Org packages aren't signed, so there's a higher risk of downloading a bad package if you download them multiple times on different machines.
  - You're not guaranteed to get the same package on all machines, even if the version is the same.
- Version control for package updates, so you can rollback if you discover updating a package broke your config later on.
- Diffs for package updates
- If you bootstrap your config from a USB stick, you don't need Internet to download packages on a new machine.
- You can edit packages directly to fix bugs while you wait for upstream to merge your damn PR already.
- You can even re-apply your changes after updating the package if you marked your commits.

- https://www.reddit.com/r/emacs/comments/6boafh/is_there_a_way_to_automatically_install_needed/dhool27/


## use-package

- https://emacs.stackexchange.com/questions/16831/using-package-el-to-install-and-update-but-use-package-for-loading-and-configuri

## Melpa stable vs unstable

On stable there are no:
  - flycheck-elm
  - dired-sidebar