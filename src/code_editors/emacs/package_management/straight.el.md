- https://github.com/raxod502/straight.el#getting-started

## Reinstall

If I delete `straight` directory and keep only `straight/versions/default.el` and run `emacs -nw` in cmd.exe, `M-: (emacs-init-time)` shows 1000 seconds which is around 16 minutes. Empty init with only straight bootstrap takes 100 seconds.

Reinstall in gui does not look good, as you can't clearly see what is going on.

Maybe starting like [this](https://github.com/raxod502/straight.el#using-straightel-to-reproduce-bugs)

`emacs -Q -l ~/.emacs.d/straight/repos/straight.el/bootstrap.el`

could speed this process up?

There are also `M-x straight-normalize-all` and `M-x straight-prune-build` and `straight-cache-autoloads`.

##  how many packages do you have?

You can get that number by evaluating `(length (hash-table-keys straight--success-cache))`

https://github.com/raxod502/straight.el/issues/9#issuecomment-317011517

`(length (hash-table-keys straight--profile-cache))`

https://github.com/raxod502/straight.el/issues/9#issuecomment-337450092

## use-package

>I however recommend that you use use-package to manage your package configuration.

```lisp
(use-package projectile
  :straight t
  :init (projectile-mode 1))
```

https://emacs.stackexchange.com/questions/27885/how-to-get-the-same-emacs-environment-on-a-different-computer/34241#34241

```lisp
(use-package el-patch
  :straight t)
```

https://github.com/raxod502/straight.el#integration-with-use-package-1

This issue is now completely resolved since straight.el uses a different keyword (:straight) and does not modify :ensure in any way.

https://github.com/raxod502/straight.el/issues/135#issuecomment-354918386

https://github.com/raxod502/straight.el#the-profile-system

## Bug reporting

- https://emacs.stackexchange.com/questions/17542/how-to-load-only-a-subset-of-installed-packages/34909#34909

## Speed

```lisp
(setq straight-check-for-modifications 'live)
```

https://github.com/raxod502/straight.el#customizing-when-packages-are-built

## Profiling org -Q org loading with org-tangle

- straight.el with config in org file https://github.com/lewang/flx#gc-optimization
- https://github.com/raxod502/straight.el/issues/128#issuecomment-325552738
- https://github.com/raxod502/straight.el/issues/9#issuecomment-337700460
- https://github.com/raxod502/straight.el/issues/128#issuecomment-325264689
- https://github.com/raxod502/straight.el#the-transaction-system

`M-x emacs-init-time`

## Lock versions

`M-x straight-freeze-versions` creates `~/.emacs.d/straight/versions/default.el`


Once you've written your init-file to install the packages it needs, run M-x straight-freeze-versions to save a version lockfile to ~/.emacs.d/straight/versions/default.el. You should keep this file under version control, since it will allow straight.el to check out the correct versions of all your packages, when you first launch Emacs on a new machine. (You can manually revert to the versions specified in the lockfile using M-x straight-thaw-versions.)

https://emacs.stackexchange.com/questions/27885/how-to-get-the-same-emacs-environment-on-a-different-computer/34241#34241

## package.el

straight.el disables all of these "features" by setting package-enable-at-startup to nil and enabling some advices. https://github.com/raxod502/straight.el#integration-with-packageel

## lazy loading

In almost all cases you don't need to manually specify :defer t. This is implied whenever :bind or :mode or :interpreter is used. Typically, you only need to specify :defer if you know for a fact that some other package will do something to cause your package to load at the appropriate time, and thus you would like to defer loading even though use-package isn't creating any autoloads for you.

You can override package deferral with the :demand keyword. Thus, even if you use :bind, using :demand will force loading to occur immediately and not establish an autoload for the bound key.

https://github.com/jwiegley/use-package#notes-about-lazy-loading

## custom git repo for example gist

```elisp
(use-package nice-jumper
  :straight (:repo "https://gist.github.com/malb/71acc6c33fa35e075f85fcab1cd5c318" :files ("nice-jumper.el"))
  :commands nice-jumper-mode
  :bind
  (("C-," . nice-jumper/backward)
   ("C-." . nice-jumper/forward)))
```

## Update all packages

`M-x straight-pull-all`
