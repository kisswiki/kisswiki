- <https://stackoverflow.com/questions/3124844/what-are-your-favorite-global-key-bindings-in-emacs>
- <https://emacs.stackexchange.com/questions/5716/how-do-i-add-a-keybinding-to-a-keymap-that-is-on-a-prefix-key>
- <https://emacs.stackexchange.com/questions/12919/how-to-detect-if-in-a-project-then-configure-another-keybinding-for-projectile>
- <https://emacs.stackexchange.com/questions/38092/jump-to-where-a-keybinding-is-defined>

## help

- `C-h ?` list options
- `C-h l` or `(view-lossage)` Display last few input keystrokes and the commands run
- `C-h w` which keystroke runs command
- `M-x find-library icomplete` <https://github.com/radian-software/selectrum/issues/23#issuecomment-594554564>
- `M-x occur fido` search for fido in current buffer

<https://askubuntu.com/questions/596143/emacs-keeps-popping-up-buffer-menu-when-i-dont-want-it>

## Transient

transient map - The command can be repeated by pressing the final key again. It works the same as keyboard macro repeating with e after a C-x e. So with this bound to C-c TAB, once the binding has been typed out in full, just pressing tab over and over switches through the different tab sizes.

<https://www.reddit.com/r/emacs/comments/4lh74r/tell_us_about_a_minor_change_you_made_in_your/d3nl6lm/>

## Disable kebindings suggestions

`(setq suggest-key-bindings nil)`

<https://stackoverflow.com/questions/19781529/how-to-disable-emacs-messages-like-you-can-run-the-command-x-with-y>

## Unset

`(global-unset-key key)`

<https://stackoverflow.com/questions/7549259/is-there-a-quick-way-to-unbind-keys-in-emacs>

## misc

- delete line C-S-k <https://stackoverflow.com/questions/3958528/how-can-i-delete-the-current-line-in-emacs>

## compile

- C-c C-b zig-compile (zig build)
- M-; compile  watchexec -r zig build
- C-x ` go to next error, C-h f compile for more
- g in compilation window to recompile
- C-u g in compilation window to recompile but edit compilation command

## smarparens

mark text with C-SPC then (. Why it does not go after closing paren by default? You can exchange point and mark before with C-x C-x.

go after closing paren with M-x sp-up-sexp

## copy, delete, paste

`M-y` or `M-x yank-pop`. With ido use  use C-s and C-r to switch to the next/previous item

<https://emacs.stackexchange.com/questions/68263/how-to-avoid-paste-to-system-clipboard-when-use-emacs-for-mac-os-x>
