```
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'
call plug#end()
```

https://gist.github.com/plredmond/8cc4ba065a1137c6ac633c81b675df44
