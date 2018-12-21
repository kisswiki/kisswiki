## Config

`~/.tmux.conf`

Reload config

`tmux source-file ~/.tmux.conf`

## Mouse support

For copy/paste with selection, changing panes.

In config:

`set -g mouse on`

## keybindings

Here is a list of a few basic tmux commands:

```
    Ctrl+b " — split pane horizontally.
    Ctrl+b % — split pane vertically.
    Ctrl+b arrow key — switch pane.
    Hold Ctrl+b, don’t release it and hold one of the arrow keys — resize pane.
    Ctrl+b c — (c)reate a new window.
    Ctrl+b n — move to the (n)ext window.
    Ctrl+b p — move to the (p)revious window.
```

Other thing worth knowing is that scrolling is enabled by pressing `Ctrl+b PgUp/PgDown`. In fact, it enables the copy mode, which can also be done by pressing `Ctrl+b [`. When in copy mode, you can use `PgUp/PgDown` and arrow keys to scroll through the terminal contents. To (q)uit the copy mode, simply press the `q` key.

https://lukaszwrobel.pl/blog/tmux-tutorial-split-terminal-windows-easily/
