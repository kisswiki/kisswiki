```
call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
let g:rustfmt_command = 'rustup run nightly rustfmt'
call plug#end()
```

https://gist.github.com/plredmond/8cc4ba065a1137c6ac633c81b675df44

## With Autoformat

```
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
```

Now you can call `:Autoformat` to automatically format your Rust code. Optionally you can map it to something more convenient, I use `<Leader>f`.

```
nmap <Leader>f :Autoformat<CR>
```

Or you can instruct Vim to automatically format on save, which is only convenient if the formatter is fast enough. (rustfmt is blazing fast)

```
au BufWrite * :Autoformat
```

- http://johannh.me/blog/rustfmt-vim.html
- https://github.com/Chiel92/vim-autoformat

##

- https://www.reddit.com/r/rust/comments/f1th7i/rust_completion_in_vimneovim/
  - https://gitlab.com/SanchayanMaity/dotfiles/-/blob/master/nvim/.config/nvim/init.vim
