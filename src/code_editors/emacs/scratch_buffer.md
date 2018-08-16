- https://www.masteringemacs.org/article/evaluating-elisp-emacs
- http://ergoemacs.org/emacs/modernization_scratch_buffer.html
- http://pragmaticemacs.com/emacs/instant-scratch-buffer-for-current-mode/
- https://github.com/ieure/scratch-el
- https://stackoverflow.com/questions/16459350/add-hook-to-emacs-scratch-at-startup/16460812#16460812

##

GNU Emacs default bindings:

C-xb *scratch* RET

or, more verbosely

M-x switch-to-buffer *scratch* RET

The *scratch* buffer is the buffer selected upon startup, and has the major mode Lisp Interaction. Note: the mode for the *scratch* buffer is controlled by the variable initial-major-mode.

In general you can create as many "scratch" buffers as you want, and name them however you choose.

C-xb NAME RET

switches to a buffer NAME, creating it if it doesn't exist. A new buffer is not associated with a file on disk until you use C-xC-w (or M-x write-file RET) to choose a file where it should be saved.

M-x text-mode RET

changes the current buffer's major mode to Text mode. To find all the modes available (that is, without requiring any new packages), you can get a list by typing:

M-x apropos-command -mode$ RET

https://stackoverflow.com/questions/234963/re-open-scratch-buffer-in-emacs

## enable lexical binding on start

```elisp
(add-hook 'lisp-interaction-mode-hook
      (lambda ()
         (setq lexical-binding t)))
```

- https://stackoverflow.com/questions/36192025/add-hook-to-default-mode-when-using-emacs-q-l
- https://stackoverflow.com/questions/28922280/how-to-enable-minor-modes-for-scratch-buffer
- https://emacs.stackexchange.com/questions/28658/is-it-possible-to-enable-flyspell-in-scratch-buffers
- https://emacs.stackexchange.com/questions/3830/why-does-lisp-interaction-mode-exist-and-do-we-ever-need-it

## prevent closing

```elisp
(add-hook 'kill-buffer-query-functions #'my/dont-kill-scratch)
(defun my/dont-kill-scratch ()
  (if (not (equal (buffer-name) "*scratch*"))
      t
    (message "Not allowed to kill %s, burying instead" (buffer-name))
    (bury-buffer)
    nil))
```

https://emacs.stackexchange.com/questions/19254/never-close-scratch

## insert when evaluating whole buffer

wrap with `progn` and `C-j` or `(insert (format "%S" value))` and `eval-buffer` or `eval-region`.
