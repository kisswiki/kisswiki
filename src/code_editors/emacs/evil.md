## Copy and paste in X

Paste from primary selection: `S-Insert`

Paste from clipboard: `p` or `C-y`

- https://emacs.stackexchange.com/questions/30137/paste-windows-clipboard-with-shift-insert-but-not-by-yanking

## Do not replace kill ring with replaced text

`(setq-default evil-kill-on-visual-paste nil)`

- https://emacs.stackexchange.com/questions/28135/in-evil-mode-how-can-i-prevent-adding-to-the-kill-ring-when-i-yank-text-visual/46485#46485

### Does not work

`(fset 'evil-visual-update-x-selection 'ignore)`

- https://emacs.stackexchange.com/questions/14940/emacs-doesnt-paste-in-evils-visual-mode-with-every-os-clipboard/15054#15054
- https://www.emacswiki.org/emacs/CopyAndPaste

## Search case insensitive does not work

- https://www.reddit.com/r/emacs/comments/d0e7ac/help_evil_search_always_sensitive_despite/
- https://emacs.stackexchange.com/questions/31368/how-to-do-case-sensitive-searches-using-evils-evil-search
- https://emacs.stackexchange.com/questions/45351/re-search-forward-unexpected-behavior-case-insensitive
- https://stackoverflow.com/questions/39535162/search-visual-selction-in-emacs-evil
