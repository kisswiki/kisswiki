- https://github.com/skeeto/.emacs.d/blob/master/lisp/gpkg.el
  - usage https://github.com/skeeto/.emacs.d/blob/master/packages.el

## emacsmirror

>Emacsmirror provides that largest available collection of packages https://stackoverflow.com/questions/454259/what-do-you-expect-from-a-package-manager-for-emacs/454449

https://emacsmirror.net/

https://emacsmirror.net/stats/compare.html

## Comparison

- https://github.com/raxod502/straight.el#tldr-1
- https://github.com/raxod502/straight.el#comparison-to-other-package-managers
- https://emacs.stackexchange.com/questions/17542/how-to-load-only-a-subset-of-installed-packages/34909#34909
- https://stackoverflow.com/questions/454259/what-do-you-expect-from-a-package-manager-for-emacs/454449


###

- straight.el clones Git repos and builds packages from source, instead of downloading tarballs from a central server
- straight.el uses the init-file as a sole source of truth, whereas package.el stores mutable state outside the init-file
- straight.el focuses on reproducibility and local modification, neither of which are supported in any way by package.el

http://wikemacs.org/wiki/Package.el#Straight.el.2C_an_alternative_package_manager