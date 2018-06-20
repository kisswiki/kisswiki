- https://www.emacswiki.org/emacs/EmacsNewbieKeyReference
- https://github.com/justbur/emacs-which-key
- https://github.com/abo-abo/hydra
  - https://www.reddit.com/r/emacs/comments/8of6tx/tip_how_to_be_a_beast_with_hydra/
- http://wikemacs.org/wiki/Expand_region
- https://github.com/abo-abo/avy
- https://github.com/chrisdone/god-mode

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

select whole buffer `C-x h`

`C-SPC` to toggle mark, then move to select. Or use shift and arrows.

## move lines

`M-<up>` 'drag-stuff-up
`M-<down>` 'drag-stuff-down

## search and replace

`C-s` to search, once again `C-s` to repeat search.

`M-x query-replace`

`M-%` interactive find/replace on active region, or cursor point to end.

`M-x query-replace-regexp`

`C-M-%` interactive find replace with regex, on active region, or cusor point to end.

When a query command asks you for confirmation, here's the most common keys:

- `y` do the replacement.
- `n` skip
- `!` do this and all remaining replacements without asking.
- `C-g` cancel. (call undo to undo existing replacement.)

- http://ergoemacs.org/emacs/emacs_find_replace.html