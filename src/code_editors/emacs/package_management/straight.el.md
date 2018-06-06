##  how many packages do you have?

You can get that number by evaluating `(length (hash-table-keys straight--success-cache))`

https://github.com/raxod502/straight.el/issues/9#issuecomment-317011517

`(length (hash-table-keys straight--profile-cache))`

https://github.com/raxod502/straight.el/issues/9#issuecomment-337450092

## use-package

```lisp
(use-package el-patch
  :straight t)
```

https://github.com/raxod502/straight.el#integration-with-use-package-1

This issue is now completely resolved since straight.el uses a different keyword (:straight) and does not modify :ensure in any way.

https://github.com/raxod502/straight.el/issues/135#issuecomment-354918386

## Bug reporting

- https://emacs.stackexchange.com/questions/17542/how-to-load-only-a-subset-of-installed-packages/34909#34909


## Speed

```lisp
(setq straight-check-for-modifications 'live)
```

https://github.com/raxod502/straight.el#customizing-when-packages-are-built

## Profiling org -Q org loading with org-tangle

- https://github.com/raxod502/straight.el/issues/128#issuecomment-325552738
- https://github.com/raxod502/straight.el/issues/9#issuecomment-337700460
- https://github.com/raxod502/straight.el/issues/128#issuecomment-325264689

`M-x emacs-init-time`

## Lock versions

`M-x straight-freeze-versions` creates `~/.emacs.d/straight/versions/default.el`