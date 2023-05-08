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

# keymaps

- The leader key is the space in LazyVim.
- `<leader>sk` or `:Telescope keymaps` to see all keymaps
- `<leader>fe` - open file explorer.
- `gc` or `gcc` - comment current line (uses https://github.com/echasnovski/mini.comment)
- `<leader>bd` - delete buffer without chaning layout
- LSP https://github.com/LazyVim/LazyVim/blob/f51719a12d86e557e2c38cd386ad68dc87a5c68f/lua/lazyvim/plugins/lsp/keymaps.lua#L17
  - `{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition", has = "definition" },`
  - `{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },`
  - `{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },`
  - `{ "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },`
  - `{ "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto T[y]pe Definition" },`
- `<leader>fr` to find recent files
- H to jump to the left buffer and L to jump to the right buffer (uses https://github.com/akinsho/bufferline.nvim)
- `<leader>,` - fuzzy search over open buffers
- `<leader><space>` - fuzzy search over any file

- https://www.lazyvim.org/keymaps

## commands

- `:close` close split
