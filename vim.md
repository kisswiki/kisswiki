## convert file to utf-8

```
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

## spaces to tabs

`set ts? et`

http://stackoverflow.com/questions/9104706/how-can-i-convert-spaces-to-tabs-in-vim-or-linux
