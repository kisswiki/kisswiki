- https://www.reddit.com/r/emacs/comments/8jaflq/tip_how_to_use_your_dashboard_properly/
- https://www.reddit.com/r/emacs/comments/8n6qpp/how_do_you_work_with_emacs_sessions/
- https://www.emacswiki.org/emacs/BookmarkPlus
- https://github.com/nex3/perspective-el
- https://github.com/Bad-ptr/persp-mode.el
- https://github.com/bbatsov/persp-projectile
- https://oremacs.com/2016/06/27/ivy-push-view/
- https://github.com/wasamasa/eyebrowse
- https://github.com/wasamasa/shackle
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Emacs-Sessions.html
- https://github.com/bmag/emacs-purpose
- https://www.reddit.com/r/emacs/comments/7au3hj/how_do_you_manage_your_emacs_windows_and_stay_sane/
- https://www.reddit.com/r/emacs/comments/6lgwme/how_do_you_handle_multiple_projectsworkspaces/
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