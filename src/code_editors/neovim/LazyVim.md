## Start

1. Go to https://github.com/LazyVim/starter and click "Use thie template" button. You may need to decrease font size to see this button.
2. To update starter to use newer LazyVim you need to `:Lazy update`.

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
