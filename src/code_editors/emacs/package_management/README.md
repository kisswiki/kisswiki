- https://github.com/skeeto/.emacs.d/blob/master/lisp/gpkg.el
  - usage https://github.com/skeeto/.emacs.d/blob/master/packages.el
- https://www.emacswiki.org/emacs/LibraryDependencies

## emacsmirror

>Emacsmirror provides that largest available collection of packages https://stackoverflow.com/questions/454259/what-do-you-expect-from-a-package-manager-for-emacs/454449

https://emacsmirror.net/

https://emacsmirror.net/stats/compare.html

## Melpa stable vs unstable

On stable there are no:
  - flycheck-elm
  - dired-sidebar

## Comparison

- https://github.com/raxod502/straight.el#tldr-1
- https://github.com/raxod502/straight.el#comparison-to-other-package-managers
- https://www.reddit.com/r/emacs/comments/6di4oy/straightel_source_based_package_manager_for_emacs/
- https://emacs.stackexchange.com/questions/17542/how-to-load-only-a-subset-of-installed-packages/34909#34909
- https://stackoverflow.com/questions/454259/what-do-you-expect-from-a-package-manager-for-emacs/454449
- https://emacs.stackexchange.com/questions/411/how-does-emacs-manage-its-packages

### straight.el vs package.el

- straight.el clones Git repos and builds packages from source, instead of downloading tarballs from a central server
- straight.el uses the init-file as a sole source of truth, whereas package.el stores mutable state outside the init-file
- straight.el focuses on reproducibility and local modification, neither of which are supported in any way by package.el

http://wikemacs.org/wiki/Package.el#Straight.el.2C_an_alternative_package_manager

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