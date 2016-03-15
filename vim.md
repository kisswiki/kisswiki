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

## edit in binary

```
:set bin
:set noeol
```

You need `noeol` because vim adds trailing new line http://stackoverflow.com/questions/1050640/vim-disable-automatic-newline-at-end-of-file/16114535#16114535

http://superuser.com/questions/745111/why-is-vim-adding-a-newline-is-this-a-convention


convert to hex `:%!xxd`

You can edit hex and then convert buffer back to normal `:%!xxd -r`
