
- https://github.com/neovim/neovim/wiki/FAQ

## Install on Ubunut

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
```
https://github.com/neovim/neovim/wiki/Installing-Neovim

## vim-plug

- https://github.com/junegunn/vim-plug
- https://github.com/junegunn/vim-plug/wiki/faq
- https://www.reddit.com/r/neovim/comments/3z6c2i/how_does_one_install_vimplug_for_neovim/
- https://github.com/Shougo/dein.vim

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


1. install with vim-plug: `Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }`
2. `deoplete#enable()` in init.vim
3. `sudo -E pip3 install neovim`

- https://github.com/Shougo/deoplete.nvim
- https://www.gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/
- https://github.com/Shougo/deoplete.nvim/issues/169#issuecomment-183765517
- https://www.reddit.com/r/neovim/comments/3x3vdy/can_make_work_deoplete/
- http://stackoverflow.com/questions/37034969/cant-get-deoplete-to-start-in-neovim

## Config

- https://github.com/kristijanhusak/neovim-config/blob/master/init.vim
- https://github.com/ladislas/nvim/blob/master/vimrc

## auto set paste

Testing in Ubuntu on Windows 10

- http://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim/36512548#36512548
  - doesn't work https://github.com/ConradIrwin/vim-bracketed-paste
  - doesn't work `set clipboard=unnamed `
- http://superuser.com/questions/437730/always-use-set-paste-is-it-a-good-idea
- doesn't work  https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
- http://stackoverflow.com/questions/2555559/pasting-from-clipboard-and-automatically-toggling-set-paste
- http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
