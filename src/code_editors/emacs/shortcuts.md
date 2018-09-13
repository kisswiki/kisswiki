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

## Help

C-h t for a learning-by-doing tutorial

C-h i for a comprehensive Emacs manual about... almost everything!

C-h k for check what a keystroke do

C-h f for function document/source

C-h v for variable document/source

C-h w Display which keystrokes invoke the given command (where-is)

You can use C-h ? to see what else it provided.

C-h r	Emacs section of the info manual

C-h c	describe-command

C-h a	describe-apropos (search)

C-h m	list all keys assoiciated wth current modes.

C-h n	list all news in this version of emacs.

C-h e	show Message buffer (echo area)

prefix C-h	list all keys belonging to the prefix,

C-x r C-h	example of above code. List all keys with that prefix

Furthermore, to find relevant elisp source code there are several very useful functions:

M-x find-library

M-x find-function

M-x find-variable

`C-h l` or `(view-lossage)`

`C-h i` should give index, but I have it empty. [maybe this](https://emacs.stackexchange.com/questions/10814/c-h-i-info-directory-is-nearly-empty). But for emacs info I can do `C-h i g (emacs)`.

`C-h i g (elisp) Variable Scoping RET`

C-h v (describe-variable)

`M-x apropos` do search all list symbols

`C-h d` to search in all doc-strings


```lisp
(defun describe-variable-short (var)
  (interactive "vVariable: ")
  (message (format "%s: %s" (symbol-name var) (symbol-value var))) )
(global-set-key "\C-h V" 'describe-variable-short)
```

Or just type `M-: name RET`

- https://stackoverflow.com/questions/3366972/how-to-check-if-a-variable-is-set-to-what-in-elisp-emacs/20255760#20255760
- http://ergoemacs.org/emacs/elisp_check_defined.html
- https://www.reddit.com/r/emacs/comments/1udtd1/starting_emacs_with_preludestarter_kits_scares_me/
- http://home.thep.lu.se/~karlf/emacs.html
- https://stackoverflow.com/questions/40618516/where-is-locate-dominating-file-documented
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Examining.html
- https://stackoverflow.com/questions/3366972/how-to-check-if-a-variable-is-set-to-what-in-elisp-emacs


## most used

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

`C-u C-SPC` pop local mark

`C-x z` repeat last command

## Last command

`C-x Esc Esc` gives you a browsable history of M-x commands you have run, but shows you the elisp code.

https://stackoverflow.com/questions/2087532/troubleshooting-techniques-for-emacs-and-emacs-lisp

## reload file

`C-x C-v` runs `find-alternate-file`

https://emacs.stackexchange.com/questions/169/how-do-i-reload-a-file-in-a-buffer

## save file with different name and switch to it

`C-x C-w` `wirte-file`

https://emacs.stackexchange.com/questions/2849/save-current-file-with-a-slightly-different-name

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

`M-s .` (isearch-forward-symbol-at-point)

`M-e C-r` toggle search backward
