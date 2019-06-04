- https://leanpub.com/the-tao-of-tmux/read

## Config

Reload config

`tmux source-file ~/.tmux.conf`

or

`systemctl --user restart tmux.service`

`:show-options -g` to show variables set

- https://gist.github.com/spicycode/1229612

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

- https://lukaszwrobel.pl/blog/tmux-tutorial-split-terminal-windows-easily/
- https://thoughtbot.com/upcase/videos/tmux-navigation
- https://www.linode.com/docs/networking/ssh/persistent-terminal-sessions-with-tmux/#manage-tmux-windows
- http://tangosource.com/blog/a-tmux-crash-course-tips-and-tweaks/
- https://tmuxcheatsheet.com/
- tmux cheat sheet https://gist.github.com/andreyvit/2921703
- tmux cheat sheet https://gist.github.com/karenyyng/5de2823651965361b788
- tmux cheat sheet https://gist.github.com/Bekbolatov/6840069e51382965fdad
- tmux cheat sheet https://gist.github.com/MohamedAlaa/2961058
- https://stackoverflow.com/questions/41343824/difference-between-c-b-d-and-c-b-d-in-tmux

## Quit

`prefix :kill-ses`

https://superuser.com/questions/777269/how-to-close-a-tmux-session

## Detach

Detach from currently attached session

`prefix d` or `prefix :detach`

https://unix.stackexchange.com/questions/174440/exit-tmux-window-without-quitting-the-terminal-program

## Choose session

`prefix s` to choose session.

https://gist.github.com/henrik/1967800

or `:choose-tree`

To list sessions

`tmux ls`

## Plugin manager

Press `prefix + I` (capital I, as in Install) to fetch the plugin.

### run-shell

There is no need to start continuum like this

`run-shell ~/.tmux/plugins/tmux-continuum/continuum.tmux`

when we use tpm.

- https://github.com/tmux-plugins/tpm

## Automatic session restore

- https://github.com/rofrol/stmux
- https://github.com/tmux-plugins/tmux-continuum
- https://github.com/tmuxinator/tmuxinator
- https://github.com/tmux-python/tmuxp
- https://github.com/remiprev/teamocil
- https://github.com/sk1418/retmux
- https://superuser.com/questions/440015/restore-tmux-session-after-reboot
- https://forum.upcase.com/t/save-and-reopen-tmux-session/5224
- https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened
- https://stackoverflow.com/questions/19575195/tmux-how-to-automatically-open-sessions-windows-and-panes
- https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened

## Other

- enhances multi-user terminal multiplexing https://github.com/zolrath/wemux

## tmux-resurrect

### Session restore

`prefix Ctrl+s` to save and `prefix Ctrl+r` to restore.

Default save interval is 15 min https://github.com/tmux-plugins/tmux-continuum/blob/90f4a00c41de094864dd4e29231253bcd80d4409/scripts/variables.sh#L8

https://github.com/tmux-plugins/tmux-resurrect


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

## colors in emacs-26 inside tmux are faded

Solution

add `export TERM=xterm-256color` to `~/.bashrc` and reopen bash or `source ~/.bashrc` to apply changes.

- https://www.reddit.com/r/emacs/comments/86q5my/emacs_playing_nice_with_colors_in_a_tmux_console/dw8cmhw/
- you can see the various terminal capabilities with infocmp -I -r -T xterm-256color and infocmp -I -r -T screen-256color. I did a quick comparison between them and noted that xterm-256color has a significant amount of more capabilities. https://emacs.stackexchange.com/questions/20545/emacs-colors-being-set-differently-when-term-is-screen-256color-and-xterm-256/20548#20548
- https://superuser.com/questions/529655/correct-way-to-get-emacs-16-color-support-inside-tmux
- https://askubuntu.com/questions/925881/tmux-colors-not-working
- https://unix.stackexchange.com/questions/348771/why-do-vim-colors-look-different-inside-and-outside-of-tmux

## colors in nvim are strange

Solution:

In `~/.tmux.conf`:

```
set -g terminal-overrides ',xterm-256color:Tc'
set -g default-terminal "tmux-256color"
set -as terminal-overrides ',xterm*:sitm=\E[3m'
```

https://github.com/neovim/neovim/issues/7764#issuecomment-411995268

## Write scrollback to a file

- https://unix.stackexchange.com/questions/26548/write-all-tmux-scrollback-to-a-file

## Equally baalance split panes

- https://unix.stackexchange.com/questions/32986/how-do-i-equally-balance-tmux1-split-panes

## Different starting directory

- https://stackoverflow.com/questions/44936396/different-starting-directory-per-window
- https://superuser.com/questions/491897/tmux-forgets-the-directory-where-the-session-was-created
- https://unix.stackexchange.com/questions/12032/how-to-create-a-new-window-on-the-current-directory-in-tmux

## Using tmux for everything

- https://kgrz.io/using-tmux-for-everything.html

## run-shell

>run-shell always uses /bin/sh (as defined by _PATH_BSHELL in tmux's source). To run a fish shell, you can use run "fish -c fish_prompt" https://stackoverflow.com/questions/47400291/tmux-run-fish-shell-functions-returns-error-127/47426623#47426623

I was trying to execute non-existent file and was getting error 127

>The high-number exit codes (126 and 127) are given by the shell when there is a problem executing the command. Specifically, (per POSIX.1) 126 usually means that the file was not executable. https://stackoverflow.com/questions/10036772/tmux-run-command-returned-126-what-does-that-mean/10038458#10038458

https://unix.stackexchange.com/questions/14700/how-can-i-bind-multiple-tmux-commands-to-one-keystroke
