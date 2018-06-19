- https://www.reddit.com/r/emacs/comments/3mxq6v/how_to_keep_organized_in_emacs/
- https://github.com/bmag/emacs-purpose
- https://github.com/rakanalh/emacs-dashboard

## Projectile

- https://github.com/nex3/perspective-el
- https://emacs.stackexchange.com/questions/36793/rewrite-a-package-config-using-use-package

```lisp
(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :bind-keymap
  ("C-c C-p" . projectile-command-map)
  :config
  (projectile-mode 1))
```

https://github.com/jwiegley/use-package/issues/684