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

select all, select whole buffer `C-x h`

`C-SPC` to toggle mark, then move to select. Or use shift and arrows.

`pop-global-mark` bound to `C-x C-@` and `C-x C-SPC` https://superuser.com/questions/241939/how-to-jump-back-to-the-last-position-of-the-cursor-in-emacs

## reload file

`C-x C-v` runs `find-alternate-file`

https://emacs.stackexchange.com/questions/169/how-do-i-reload-a-file-in-a-buffer

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

You can also toggle case sensitivity at will in isearch with M-c

https://www.gnu.org/software/emacs/manual/html_node/efaq/Controlling-case-sensitivity.html

`M-e` to edit last search, arrows to cycle in history

`M-r` to switch between regexp and normal searching

`M-c` to toggle case sensitivity

- https://www.emacswiki.org/emacs/IncrementalSearch
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Incremental-Search.html

`M-s w` toggle word search

https://www.gnu.org/software/emacs/manual/html_node/emacs/Word-Search.html
