## Start

1. Go to https://github.com/LazyVim/starter and click "Use thie template" button. You may need to decrease font size to see this button.
2. To update starter to use newer LazyVim you need to `:Lazy update`.

- [Zero to IDE with LazyVim - YouTube](https://www.youtube.com/watch?v=N93cTbtLCIM)
- https://www.barbarianmeetscoding.com/notes/neovim-lazyvim/

## Config

By default in ~/.config/nvim

You can see what is included in LazVim locally at ~/.local/share/nvim/lazy/LazyVim

For example ~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/editor/harpoon2.lua

Or ~/.local/share/nvim/lazy/flash.nvim/

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
- `<leader>uc` - toggle conceal level, hide/show \* markup for bold and italic

- https://www.lazyvim.org/keymaps
- https://stackoverflow.com/questions/4809729/cancel-split-window-in-vim/4809736#4809736

### Telescope

- `Esc` - switch to normal mode
- `C-x` - Go to file selection as a split
- `C-v` - Go to file selection as a vsplit
- `C-t` - Go to a file in a new tab
- `C-n` and `C-p` to navigate file list
- `Tab` or `S-Tab` to select multiple files, `<CR>` to to open them in harpoon. It uses custom function `select_one_or_multi` in telescope.lua.
- `<C-u>` - Scroll up in preview window
- `<C-d>` - Scroll down in preview window

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

## iterm2 command-r empties screen

`iterm2 > Keys > command-r > Ignore`

ad-hoc: C-z to suspend and fg to resume

https://superuser.com/questions/800088/why-does-cmd-r-mess-up-vim-on-the-mac-what-is-it-actually-trying-to-do/1169889#1169889

## Why LazyVim

@avi7278

LazyVim is by FAR the best distro. I've built upwards of 10 of my own configs, tried Lunar, Evo, Chad (almost all of them). Lazy first of all is the only one that had keymappings that were a) expected and b) very close to my own personal config. Further TJ mentioned it but the problem with most distros is that they feel very "proprietary" in terms of how they extended / customized. It's like learning a whole other thing than nvim. LazyVim on the other hand feels very much the same approach I would take just building my own configuration and extending nvim. I don't think I will ever maintain my own base config again. LazyVim is what I would have done anyway if I was more versed in neovim. It's very good. Only small neg is the documentation is sparse in places.

@antoineleduc7611

There is like 2 file in LazyVim (util/init.lua, and core/lazy.lua) which kinda seems like magic -> We know what they do mostly but lots of small details i wouldnt be able to implement on my own setup

Apart from that i agree it reads very well, and the import of plugins to overwrite the one in lazyvim/plugins + the keymaps make absolute sense

But i keep having stuff that break even on fresh install (notify.nvim is basically red everytime i telescope anything or try to use leap.nvim..) so i think ill just end up dropping it and make like my own config heavily inspired by lazyvim plugin configs, one plugin a day, little by little rebuilding the wheel for the most part
debugging issues right after you clone and expect everything to work out the box is painful

https://www.youtube.com/watch?v=oy_-hQdkoXg&lc=Ugw8BXGw7-hwq8OIRBN4AaABAg

## opts vs setup

opts is just a table that gets merged across all plugin specs of the same plugin. If config is not set then a default Implementation that calls setup with the opts table is used. If you define config then setup doesn't get called, the config function takes opts as the second parameter so you can still use opts but you have to call opts yourself.

https://matrix.to/#/!cylwlNXSwagQmZSkzs:matrix.org/$N8m7EyuhH0P_KWrO1ptLIfw3UaMqLFsEwX_Qm22_chk

## Which event to use?

folke

for ui stuff you need to load as quicklly as possible, ue VimEnter. For all the rest VeryLazy

any lazy handler triggers lazy loading. That's the whole point (my comment: i.e. setting keymaps triggers lazy loading)

https://matrix.to/#/!cylwlNXSwagQmZSkzs:matrix.org/$mEj6Nu0KFRcdLHubttjf-Y0N7eVrHllmmvVym5sVy2U

## disable autoformat termporarily

`<Leader>uF` - current buffer

`<Leader>uf` - globally

https://www.lazyvim.org/configuration/tips#disable-autoformat-for-some-buffers

## disable autoformat for some file type

```lua
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.b.autoformat = false
  end,
})
```

- https://www.lazyvim.org/configuration/tips#disable-autoformat-for-some-buffers
- [LazyVim: Linting and Formatting - YouTube](https://www.youtube.com/watch?v=a_ZpTPaSn38)
- this does not work https://vi.stackexchange.com/questions/42597/how-to-disable-autoformating-on-save-on-lazyvim/42598#42598
  - https://github.com/LazyVim/LazyVim/blob/566049aa4a26a86219dd1ad1624f9a1bf18831b6/lua/lazyvim/plugins/lsp/init.lua#L43

## Spell check

`:set spell!` to toggle

switch between languages

```lua
map('n', '<leader>sp', ':setlocal spell spelllang=pl<CR>:setlocal spellfile=$HOME/.config/nvim/spell/pl.utf-8.add<CR>:echo "Spelling set to Polish"<CR>', { noremap = true, silent = true })
map('n', '<leader>se', ':setlocal spell spelllang=en_us<CR>:setlocal spellfile=$HOME/.config/nvim/spell/en.utf-8.add<CR>:echo "Spelling set to English (US)"<CR>', { noremap = true, silent = true })
```

`]S` - next misspelled word

`[S` - previous misspelled word

`zg` - add word to dictionary

`z=` - suggest spelling

`map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })`

`:mkspell! %` - regenerate spell file binary after manually editing list

- https://neovim.io/doc/user/spell.html
- https://github.com/LazyVim/LazyVim/blob/eddd3af3512133f22eb26dda81c3c6f871453276/lua/lazyvim/config/autocmds.lua#L79C19-L79C24
- https://github.com/LazyVim/LazyVim/blob/eddd3af3512133f22eb26dda81c3c6f871453276/lua/lazyvim/config/keymaps.lua#L105

## Fennel

- hotpot
  - https://github.com/avegancafe/VimStudio
    - uses macro `pack` for mixed pluginsbut
      - but maybe no need and do like https://github.com/rafaeldelboni/cajus-nfnl/blob/main/.config/nvim/fnl/plugins/cmp.fnl
      - https://github.com/bakpakin/Fennel/issues/353#issuecomment-840015752
  - might be slow https://github.com/rktjmp/hotpot.nvim/issues/125
  - https://github.com/datwaft/nvim.conf/tree/6308a95f07f4d9c5cae4fffd49ed91e6b51d0427
    - author reverted to lua https://github.com/datwaft/nvim.conf/commit/0002d8cffe0c4b08c07f14b2082792325ca16695
    - https://github.com/rktjmp/hotpot.nvim/issues/97
- nfnl

  - https://github.com/rafaeldelboni/cajus-nfnl

  ## neo-tree

  ### disable mapping

  ```lua
        filesystem = {
        window = {
          mappings = {
            -- disable fuzzy finder
            ["/"] = "noop"
          }
        }
      }
  ```

  https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/1242

## move windows

- CTRL-W SHIFT-H: Move window to the far left
- CTRL-W SHIFT-J: Move window to the very bottom
- CTRL-W SHIFT-K: Move window to the very top
- CTRL-W SHIFT-L: Move window to the far right

These are the same keys used for navigation, without SHIFT (lowercase navigation letters):

- CTRL-W H: Move focus to the left window
- CTRL-W J: Move focus to the bottom window
- CTRL-W K: Move focus to the top window
- CTRL-W L: Move focus to the right window

- https://stackoverflow.com/questions/15583346/how-can-i-temporarily-make-the-window-im-working-on-to-be-fullscreen-in-vim/69650669#69650669
- https://neovim.io/doc/user/windows.html#window-moving

## surround with character

`gsaiw'` to surround word with single quotes

select visually and then `gsa'` to surround with single quotes

- [link](https://github.com/LazyVim/LazyVim/blob/530e94a9fa19577401e968a9673282c3d79f01e3/lua/lazyvim/plugins/coding.lua#L191)
- https://github.com/echasnovski/mini.surround?tab=readme-ov-file#demo

## previous and next edit positions

`g;` - previous edit

`g,` - next edit

https://vi.stackexchange.com/questions/6749/after-copying-a-visual-selection-return-to-original-location/6755#6755

## move to first or last character of the selection

built-in marks holding the positions of the first and last characters of the last visual selection in the current buffer

`` `< `` and `` `> ``

https://stackoverflow.com/questions/11176159/how-to-jump-to-the-start-or-the-end-of-visual-selection-in-vim/11176286#11176286
