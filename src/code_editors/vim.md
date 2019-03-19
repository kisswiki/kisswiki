- http://vi.stackexchange.com/
- http://vimawesome.com/

## convert file to utf-8

```
:e ++enc=cp1250
:set fenc=utf8
:w
```

http://stackoverflow.com/questions/9310274/how-can-i-use-vim-to-convert-my-file-to-utf8

## convert line endings to unix

```
:set ff=unix
:w
```

## edit in hex

```
:set bin
:set noeol
```

You need `noeol` because vim adds trailing new line http://stackoverflow.com/questions/1050640/vim-disable-automatic-newline-at-end-of-file/16114535#16114535

You may also look at this http://superuser.com/questions/745111/why-is-vim-adding-a-newline-is-this-a-convention


convert to hex `:%!xxd`

You can edit hex and then convert buffer back to normal `:%!xxd -r`

To have no trailing line with `echo` add `-n`:

```
$ echo -n 'YOLO ;)' | xxd
00000000: 594f 4c4f 203b 29                        YOLO ;)
```

Compare it without `-n`:

```
$ echo 'YOLO ;)' | xxd
00000000: 594f 4c4f 203b 290a                      YOLO ;).
```

http://unix.stackexchange.com/questions/17732/where-has-the-trailing-newline-char-gone-from-my-command-substitution

http://stackoverflow.com/users/4890818/0x594f4c4f203b29

## 2 spaces to tabs

```
:set ts=2 noet
:%retab!
```

http://stackoverflow.com/questions/9104706/how-can-i-convert-spaces-to-tabs-in-vim-or-linux

## tabs to 2 spaces

```
:set ts=2 sw=2 sts=2 et
```

`:retab` may be required.

http://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces

## editorconfig

- https://github.com/editorconfig/editorconfig-vim

## Rust

- https://github.com/rust-lang/rust.vim
- https://github.com/ivanceras/rust-vim-setup
- https://www.reddit.com/r/rust/comments/4y6teu/how_do_i_use_rust_on_vim/

### Racer

- https://github.com/racer-rust/vim-racer
- http://stackoverflow.com/questions/37966696/cargo-path-setup-for-rust-racer

- completion `C-x C-o`
- go to definition `gd` or `gs` or `gx`
- go back `C-o` http://stackoverflow.com/questions/53911/in-vim-how-do-i-go-back-to-where-i-was-before-a-search

## Enetring special characters

http://vim.wikia.com/wiki/Entering_special_characters

## unsplit windows

Close every window with `:q` or `ZZ` or `ctrl-w q`.

If you want to have only one window:

`cltr-w o` or `:on`

http://stackoverflow.com/questions/4809729/cancel-split-window-in-vim

## delete buffer without closing window

`:BW`

- https://github.com/qpkorr/vim-bufkill
- https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window/1446352#1446352
