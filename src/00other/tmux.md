## Config

Reload config

`tmux source-file ~/.tmux.conf`

`:show-options -g` to show variables set

## Mouse support

For copy/paste with selection, changing panes.

In config:

`set -g mouse on`

More about copy/paste http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting/

## Keybindings

Here is a list of a few basic tmux commands:

`prefix` is `Ctrl+b` by default.

```
    prefix " — split pane horizontally.
    prefix % — split pane vertically.
    prefix arrow key — switch pane.
    Hold prefix, don’t release it and hold one of the arrow keys — resize pane.
    prefix c — (c)reate a new window.
    prefix n — move to the (n)ext window.
    prefix p — move to the (p)revious window.
    prefix d — close pane
    prefix z - maximize/unmaximize pane
```

Other thing worth knowing is that scrolling is enabled by pressing `Ctrl+b PgUp/PgDown`. In fact, it enables the copy mode, which can also be done by pressing `Ctrl+b [`. When in copy mode, you can use `PgUp/PgDown` and arrow keys to scroll through the terminal contents. To (q)uit the copy mode, simply press the `q` key.

https://lukaszwrobel.pl/blog/tmux-tutorial-split-terminal-windows-easily/

## Quit

`prefix :kill-session`

https://superuser.com/questions/777269/how-to-close-a-tmux-session

## Detach

Detach from currently attached session

`prefix d` or `prefix :detach`

https://unix.stackexchange.com/questions/174440/exit-tmux-window-without-quitting-the-terminal-program

## Choose session

`prefix s` to choose session.

https://gist.github.com/henrik/1967800

## Session restore

`prefix Ctrl+s` to save and `prefix Ctrl+r` to restore.

Default save interval is 15 min https://github.com/tmux-plugins/tmux-continuum/blob/90f4a00c41de094864dd4e29231253bcd80d4409/scripts/variables.sh#L8

https://github.com/tmux-plugins/tmux-resurrect

## Plugin manager

There is no need to start continuum like this

`run-shell ~/.tmux/plugins/tmux-continuum/continuum.tmux`

when we use tpm.

- https://github.com/tmux-plugins/tpm

## Automatic session restore

- https://github.com/tmux-plugins/tmux-continuum
- https://github.com/tmuxinator/tmuxinator
- https://superuser.com/questions/440015/restore-tmux-session-after-reboot
- https://forum.upcase.com/t/save-and-reopen-tmux-session/5224
- https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened
- https://stackoverflow.com/questions/19575195/tmux-how-to-automatically-open-sessions-windows-and-panes
- https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened

## tmux-continuum

### problem with automatic starting

I needed to patch tmux-continuum to make it restore in `~/.tmux/plugins/tmux-continuum/continuum.tmux`:

```bash
just_started_tmux_server() {
        #[ "$(number_of_sessions)" -eq 1 ]
        # https://github.com/tmux-plugins/tmux-continuum/issues/52#issuecomment-445070459     
        [ "$(tmux ls -F '#{start_time}')" -gt "$(($(date +%s)-10))" ]
}
```

`:kill-session` and starting tmux will not make continuum start.

I was restarting server for debug purposes with `systemctl --user restart tmux.service` and saw in `journalctl --user -xe` that default tmux session is started.

We can also display continuum status https://github.com/tmux-plugins/tmux-continuum/blob/master/docs/continuum_status.md

### problem that when I have some file opened in nvim, continuum will try to open it in vim but from parent folder

```
set -g @resurrect-processes 'false'
```

- [$CWD is taken from vim rather than shell](https://github.com/tmux-plugins/tmux-resurrect/issues/277)

## Automatic tmux start on os boot

- https://github.com/tmux-plugins/tmux-continuum/blob/master/docs/automatic_start.md
  - https://github.com/tmux-plugins/tmux-continuum/blob/master/docs/systemd_details.md
- https://wiki.archlinux.org/index.php/tmux#Autostart_with_systemd

## vim vs nvim

vim works strange. Redrawing etc. Use nvim.

## lost server

Kill all tmux processes

```bash
$ ps aux | grep tmux
$ kill -9 <pid>
```

https://github.com/tmux/tmux/issues/498#issuecomment-238529932
