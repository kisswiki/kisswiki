- `C-x k` kill buffer
- `C-g` like Escape
- `C-x 0` close current window
- `C-x 1` close other window
- `C-x C-f` open file
- `C-x C-s` save buffer
- `C-x C-w` write file - should I use this or `(save-buffer)`?
- `M-x ibuffer` buffer list

- https://stackoverflow.com/questions/207510/what-is-the-key-sequence-for-closing-the-current-buffer-in-emacs
  - https://www.gnu.org/software/emacs/manual/html_node/emacs/Kill-Buffer.html
- https://emacs.stackexchange.com/questions/20187/organize-the-buffer-list/20188#20188

## bind function with parameter

```lisp
(global-set-key (kbd "M-<up>") (lambda () (interactive) (move-line -1)))
```

https://stackoverflow.com/questions/1030392/emacs-global-set-key-and-calling-interactive-function-with-argument/1030444

## Ctrl Shift k translated to Ctrl k

```lisp
(global-set-key [(control shift t)] 'transpose-words-backwards)
(global-set-key [(meta shift t)] 'transpose-words-backwards2)
```

https://stackoverflow.com/questions/38140280/what-causes-m-s-t-meta-shift-t-key-binding-not-to-take/38141909#38141909
