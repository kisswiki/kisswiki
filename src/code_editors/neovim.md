
- https://github.com/neovim/neovim/wiki/FAQ

## Install on Ubuntu

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

To remove package:

1. remove package line from config
2. `:PlugClean`

### on Windows

in file ~/AppData/Local/nvim/init.vim:

```
call plug#begin('~/AppData/Local/nvim/autoload')
Plug 'elmcast/elm-vim'
call plug#end()
```

Then `:PlugStatus` or `:PlugInstall` to install plugins.

#### Ubuntu WSL

Update 2019-08-02: Now it does not work. Maybe because of WSL2?

copy and paste to work

`sudo ln -s /mnt/d/Neovim/bin/win32yank.exe /usr/bin/win32yank`

https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl

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
- [Discussion/Tracking] Defaults https://github.com/neovim/neovim/issues/2676
- https://github.com/spf13/spf13-vim/blob/master/.vimrc
- https://github.com/carlhuda/janus

## auto set paste

Testing in Ubuntu on Windows 10

- http://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim/36512548#36512548
  - doesn't work https://github.com/ConradIrwin/vim-bracketed-paste
  - doesn't work `set clipboard=unnamed`
  - doesn't work `:r !cat`
  - doesn't work, inserts 'Q' `set pastetoggle=<F2>`
  - works http://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim/31998340#31998340
- http://superuser.com/questions/437730/always-use-set-paste-is-it-a-good-idea
- doesn't work  https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
- http://stackoverflow.com/questions/2555559/pasting-from-clipboard-and-automatically-toggling-set-paste
- http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste

## editorconfig

```
apt-get install editorconfig
```

in ~/.config/nvim/init.vim

```
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
let g:EditorConfig_core_mode = 'external_command'
```

## paste

```
" paste {{{
" https://raw.githubusercontent.com/tpope/vim-unimpaired/master/plugin/unimpaired.vim
" http://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim/31998340#31998340
" need to set noai, even though paste should disable ai.
function! s:setup_paste() abort
  let s:paste = &paste
  let s:mouse = &mouse
  let s:ai = &ai
  set paste
  set mouse=
  set noai
  augroup unimpaired_paste
    autocmd!
    autocmd InsertLeave *
          \ if exists('s:paste') |
          \   let &paste = s:paste |
          \   let &mouse = s:mouse |
          \   let &ai = s:ai |
          \   unlet s:paste |
          \   unlet s:mouse |
          \   unlet s:ai |
          \ endif |
          \ autocmd! unimpaired_paste
  augroup END
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>

nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
" }}}
```

## mapleader

`:echo mapleader`

http://stackoverflow.com/questions/10389205/show-current-leader-key-setting

## incsearch for the replace command

`set inccommand=nosplit`

https://vi.stackexchange.com/questions/11221/is-there-an-incsearch-for-the-replace-command

## nvim-qt.exe --maximized

Start maximized with `--maximized` parameter

## Run kissw.sh

`:!.\kissw.sh`

## vs vim

- https://www.reddit.com/r/vim/comments/8v8rcp/should_i_be_using_neovim_instead_of_vim8/e1obb3h/

## fzf

`Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'`

`:Files` or `:Files <path> and `Ctrl+t` to open in tab.

https://github.com/smudge/dotfiles/blob/3b9e9474150131458c3846ad2d3a4ab0c342dabb/vimrc#L42

## lua

- https://github.com/neovim/neovim/issues/7895
- https://www.reddit.com/r/neovim/comments/6bfn33/any_documentation_on_how_to_use_native_lua/
- https://neovim.io/roadmap/
  - https://www.reddit.com/r/neovim/comments/e7tm1y/i_see_neovim_050_was_released_yesterday_where_do/fa56a3u/
- https://www.reddit.com/r/neovim/comments/7fkjbi/docs_for_developing_a_plugin_in_lua_especially/
- https://www.reddit.com/r/neovim/comments/df0szy/dependencies_for_plugins_in_lua/

## .nvim_session.vim

Example with using `--`. I needed to run `call` after opening `main.rs`.

```
e src/main.rs
16sp | term
vs | term
call jobsend(b:terminal_job_id, "cargo watch -x 'test tests::test_almostIncreasingSequence -- --nocapture --color always --exact'\n")
wincmd k
stopinsert
```
