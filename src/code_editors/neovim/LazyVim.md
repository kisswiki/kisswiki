## Start

1. Go to https://github.com/LazyVim/starter and click "Use thie template" button. You may need to decrease font size to see this button.
2. To update starter to use newer LazyVim you need to `:Lazy update`.

- [Zero to IDE with LazyVim - YouTube](https://www.youtube.com/watch?v=N93cTbtLCIM)

## Leader

The leader key is the space in LazyVim.

## File explorer

- `<leader> + fe` to open file explorer.

## Disable plugin

in ~/.config/nvim/lua/plugins/disable.lua or other in lua/plugins/ folder:

```lua
return {
  { "echasnovski/mini.pairs", enabled = false },
}
```

## Comment code

`gc` or `gcc` to comment current line

https://github.com/echasnovski/mini.comment

# Delete buffer without chaning layout

`<leader> + bd`

## LSP

- https://github.com/LazyVim/LazyVim/blob/f51719a12d86e557e2c38cd386ad68dc87a5c68f/lua/lazyvim/plugins/lsp/keymaps.lua#L17
