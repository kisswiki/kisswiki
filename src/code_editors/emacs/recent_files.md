
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

Available also in `File > Open recent`

- http://makble.com/implementing-goto-anything-in-emacs
- https://www.masteringemacs.org/article/find-files-faster-recent-files-package
- http://emacsredux.com/blog/2013/04/05/recently-visited-files/
- https://stackoverflow.com/questions/3527150/open-recent-in-emacs
- Use the recentf-exclude variable to exclude  https://stackoverflow.com/questions/14915239/in-emacs-is-there-a-command-to-visit-the-most-recently-opened-file/14915463#14915463
- https://www.emacswiki.org/emacs/RecentFiles
- http://ergoemacs.org/emacs/emacs_recentf.html
- https://stackoverflow.com/questions/19351741/open-recent-files-in-emacs

## helm-mini

Helm - you can bind `helm-mini` to a key and call that when you want to switch buffers - it'll show a list of open buffers followed by the recentf list - you can enter text to filter them down.

- http://emacsredux.com/blog/2013/04/05/recently-visited-files/
- https://emacs.stackexchange.com/questions/14079/how-to-see-recently-opened-files-in-helm/14104#14104