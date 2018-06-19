## Narrowing

https://demonastery.org/2013/04/emacs-narrow-to-region-indirect/

```lisp
(defun narrow-to-region-indirect (start end)
  "Restrict editing in this buffer to the current region, indirectly."
  (interactive "r")
  (deactivate-mark)
  (let ((buf (clone-indirect-buffer nil nil)))
    (with-current-buffer buf
      (narrow-to-region start end))
      (switch-to-buffer buf)))
```

## Keyboard shortcuts

I've recently started using C-x <left> and C-x <right>. Those are both standard Emacs bindings—nothing to configure. Left takes you back to the previous buffer (initially the same as C-x b RET) but doing it again takes you to the 3rd most recently visited buffer. If you're popping back and forth between 3 or 4 buffers a lot then I find it a lot easier than trying to remember buffer names.

Also I just discovered C-x C-<left> and C-x C-<right> are bound to the same functions so that you can just hold down the control key and alternate between x and the arrows to flip through buffers.

https://emacs.stackexchange.com/questions/728/how-do-i-switch-buffers-quickly