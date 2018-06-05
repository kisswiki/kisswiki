
If you just want to save the minibuffer history between emacs invocations you can put the following in your .emacs:

```lisp
(savehist-mode 1)
```

or better

```lisp
(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
```

- https://www.masteringemacs.org/article/find-files-faster-recent-files-package
- https://stackoverflow.com/questions/3527150/open-recent-in-emacs
- Use the recentf-exclude variable to exclude  https://stackoverflow.com/questions/14915239/in-emacs-is-there-a-command-to-visit-the-most-recently-opened-file/14915463#14915463
- https://www.emacswiki.org/emacs/RecentFiles
- http://ergoemacs.org/emacs/emacs_recentf.html