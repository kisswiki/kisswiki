- https://github.com/neovim/neovim/wiki/FAQ

## vim-plug
- https://github.com/junegunn/vim-plug
- https://github.com/junegunn/vim-plug/wiki/faq
- https://www.reddit.com/r/neovim/comments/3z6c2i/how_does_one_install_vimplug_for_neovim/

### install over ssh

~/.gitconfig

```
[url "ssh://git@github.com/"]                                                   
    insteadOf = https://github.com/
```

https://github.com/junegunn/vim-plug/issues/472

## Completion

- https://github.com/Valloric/YouCompleteMe

### deoplete

> If you're on neovim, I'd put my vote in for deoplete + vim-racer. deoplete in my experience is much faster and much easier to configure.
> https://www.reddit.com/r/rust/comments/4y6teu/how_do_i_use_rust_on_vim/d6ln6je

- https://github.com/Shougo/deoplete.nvim

1. install with vim-plug: `Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }`
2. `deoplete#enable()` in init.vim
3. `pip3 install neovim`
