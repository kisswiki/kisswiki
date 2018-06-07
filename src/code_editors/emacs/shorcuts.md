- https://github.com/justbur/emacs-which-key
- https://github.com/abo-abo/hydra
- http://wikemacs.org/wiki/Expand_region
- https://github.com/abo-abo/avy

## Legend

`C` means `Ctrl`

`M` means `Meta` or `Alt`

`S` means `Shift`

##

quit a partially entered command `C-g`

load file `C-x f`

save file `C-x s`

copy `M-w`

cut `C-w` runs `kill-region`

paste `C-y` or `Shift+Insert`

`M-x kill-buffer-and-window`

kill-whole-line `C-S-Backspace`

goto-line `M-g M-g`

delete-window `C-x 0`

delete-other-window `C-x 1`

comment `M-;`

## move lines

```lisp
;;(drag-stuff-define-keys)
(global-set-key [M-up] 'drag-stuff-up)
(global-set-key [M-down] 'drag-stuff-down
```

https://stackoverflow.com/questions/2423834/move-line-region-up-and-down-in-emacs