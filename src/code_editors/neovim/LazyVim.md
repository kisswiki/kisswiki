## Start

1. Go to https://github.com/LazyVim/starter and click "Use thie template" button. You may need to decrease font size to see this button.
2. To update starter to use newer LazyVim you need to `:Lazy update`.

- [Zero to IDE with LazyVim - YouTube](https://www.youtube.com/watch?v=N93cTbtLCIM)
- https://www.barbarianmeetscoding.com/notes/neovim-lazyvim/

## Disable plugin

in ~/.config/nvim/lua/plugins/disable.lua or other in lua/plugins/ folder:

```lua
return {
  { "echasnovski/mini.pairs", enabled = false },
}
```

## keymaps

- The leader key is the space in LazyVim.
- `<leader>sk` or `:Telescope keymaps` - see all keymaps
- `<leader>e` - open file explorer.
- `gc` or `gcc` - comment current line (uses https://github.com/echasnovski/mini.comment)
- `<leader>bd` - delete buffer without chaning layout
- LSP [keymaps.lua](https://github.com/LazyVim/LazyVim/blob/f51719a12d86e557e2c38cd386ad68dc87a5c68f/lua/lazyvim/plugins/lsp/keymaps.lua#L17)
  - `{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition", has = "definition" },`
  - `{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },`
  - `{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },`
  - `{ "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },`
  - `{ "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto T[y]pe Definition" },`
  - { "]]", desc = "Next Reference" }, -- RRethy/vim-illuminate
  - { "[[", desc = "Prev Reference" }, -- RRethy/vim-illuminate
  - `<leader>cr` - rename
  - `<leader>gI` - go to implementation
  - `<leader>cd` - show line diagnostics when text too long
- `<leader>fr` to find recent files
- H to jump to the left buffer and L to jump to the right buffer (uses [bufferline.nvim](https://github.com/akinsho/bufferline.nvim))
- `<leader>,` - fuzzy search over open buffers
- `<leader><space>` or `<leader>ff` - fuzzy search over any file
- `C-w q` or `:close` - close split
- `gx` - open link [so](https://stackoverflow.com/questions/26919972/follow-link-in-vim-with-markdown-syntax/26920014#26920014)
- `gf` - open file [so](https://stackoverflow.com/questions/26919972/follow-link-in-vim-with-markdown-syntax/26920014#comment42389405_26920014)
- `10j` - [move ten lines down](https://stackoverflow.com/questions/4917030/move-cursor-x-lines-from-current-position-in-vi-vim)
- `<leader>bp` - pin tab - pin icon should show up in tab - thanks to bufferline
- `<leader>bP` - close not-pinned tabs

- https://www.lazyvim.org/keymaps
- https://stackoverflow.com/questions/4809729/cancel-split-window-in-vim/4809736#4809736

### Telescope

- `Esc` - switch to normal mode
- `C-x` - Go to file selection as a split
- `C-v` - Go to file selection as a vsplit
- `C-t` - Go to a file in a new tab
- `C-n` and `C-p` to navigate file list

https://github.com/nvim-telescope/telescope.nvim

## commands

- `:noa w` - [save without autoformat](https://stackoverflow.com/questions/41070645/prevent-vims-autocmd-from-running-on-write-just-once/41070678#41070678)

## File explorer

- `<leader>e` - open file explorer.
- `k` and `j` to navigate up and down
- `/` filter, `C-p` and `C-n` to navigate up and down explorer

## Lazygit

Started working after I have installed with tap https://github.com/jesseduffield/lazygit#homebrew

- `p` - pull
- `P` - push
- `c` - commit changes, `Enter` to add all changed https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_en.md#files

- https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_en.md

## Terminal

- `c-\` - toggle
- `c-h`, `c-j`, `c-k`, `c-l` - movement
- `c-w` - window mappings
- `c-ws` - split horizontally
- `c-wv` - split vertically
  etc.

https://github.com/LazyVim/LazyVim/discussions/193#discussioncomment-6088989

## Nvim-tree: How do you copy/duplicate files?

c to copy a file and p to paste it

https://www.reddit.com/r/neovim/comments/sews3r/comment/humd3me/

## update plugins without from command line

`nvim --headless "+Lazy! sync" "+TSUpdateSync" +qa`

https://github.com/LazyVim/LazyVim/pull/944

## save as in the same directory

`:sav %:h/new-file-name`

`:echo expand("%:h")`

`:echo expand("%:p:h")`

- https://blog.tomontheinternet.com/posts/vim-new-file-same-directory/
  - https://www.reddit.com/r/vim/comments/k9k2it/make_a_new_file_in_the_current_directory/
- https://vi.stackexchange.com/questions/2071/how-can-i-copy-the-current-file-and-start-editing-the-copy-instead-of-the-curren#comment76266_34474

to open just use `:e %:h/filename`

- https://stackoverflow.com/questions/13239464/create-a-new-file-in-the-directory-of-the-open-file-in-vim/13239757#13239757
- more key mappings https://stackoverflow.com/questions/1708623/opening-files-in-the-same-folder-as-the-current-file-in-vim

or this

```vim
"" Save as
nnoremap <expr> <space>S printf(":saveas %s%s",
            \ expand("%:p"),
            \ empty(expand("%:e")) ? '' : repeat('<Left>', strchars(expand("%:e")) + 1))
```

- https://www.reddit.com/r/vim/comments/k9k2it/comment/gf57cvh/

`:help cmdline-special`

% Is replaced with the current file name

- https://www.reddit.com/r/vim/comments/k8lsfy/comment/geyro17/
