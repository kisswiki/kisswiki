- introduction https://cs.wellesley.edu/~cs251/spring18/common/emacs/emacs.html
- https://emacs.stackexchange.com/questions/13583/whats-the-difference-between-a-buffer-a-file-a-window-and-a-frame
- https://emacs.stackexchange.com/questions/40821/open-new-window-and-switch-to-it
- https://www.emacswiki.org/emacs/KillingBuffers
- http://emacsredux.com/blog/2013/06/15/deleting-windows/
- http://ergoemacs.org/emacs/emacs_effective_windows_management.html
- https://www.emacswiki.org/emacs/OneOnOneEmacs
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Convenience.html

## Popup

 - https://github.com/auto-complete/popup-el
 - https://github.com/tumashu/posframe

## Narrowing

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

- https://demonastery.org/2013/04/emacs-narrow-to-region-indirect/
- https://emacs.stackexchange.com/questions/38982/frame-specific-narrowing

## Keyboard shortcuts

I've recently started using C-x <left> and C-x <right>. Those are both standard Emacs bindings溶othing to configure. Left takes you back to the previous buffer (initially the same as C-x b RET) but doing it again takes you to the 3rd most recently visited buffer. If you're popping back and forth between 3 or 4 buffers a lot then I find it a lot easier than trying to remember buffer names.

Also I just discovered C-x C-<left> and C-x C-<right> are bound to the same functions so that you can just hold down the control key and alternate between x and the arrows to flip through buffers.

https://emacs.stackexchange.com/questions/728/how-do-i-switch-buffers-quickly

## Duplicate buffer

C-x 2 to open the same file in split window below

C-x 3 to open the same file in split window on the right

C-x 0 to close current window

C-x k to close current buffer (file) but preserve window

https://emacs.stackexchange.com/a/40840/19475
