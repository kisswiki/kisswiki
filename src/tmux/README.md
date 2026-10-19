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

`prefix` is `Ctrl+b` (`C-b`): press it, release it, then the key. `prefix ?` lists every binding
that is active in the running server, which always beats a cheat sheet.

### Sessions

| key | does |
|---|---|
| `prefix d` | detach: the session and its programs keep running |
| `prefix s` | pick a session from a list (also `:choose-tree`) |
| `prefix $` | rename the session |
| `prefix :kill-session` | kill the current session (and everything in it) |

### Windows (tabs)

| key | does |
|---|---|
| `prefix c` | new window |
| `prefix 1` … `prefix 9` | jump to that window (this machine numbers from 1) |
| `prefix n` / `prefix p` | next / previous window |
| `prefix ,` | rename the window |
| `prefix w` | pick a window from a list |
| `prefix &` | kill the window (asks first) |

### Panes

| key | does |
|---|---|
| `prefix %` | split vertically (side by side) |
| `prefix "` | split horizontally (stacked) |
| `prefix ←/→/↑/↓` | move to that pane |
| `prefix o` | move to the next pane |
| `prefix z` | zoom the pane to the whole window, again to undo |
| `prefix x` | kill the pane (asks first) |
| `prefix {` / `prefix }` | move the pane left / right in the layout |
| `prefix space` | cycle the pane layouts |
| hold `prefix` and an arrow, or drag the border with the mouse | resize the pane |

### Copy mode (vi keys here)

| key | does |
|---|---|
| `prefix [` or the mouse wheel | enter copy mode |
| `/` then a pattern | search inside copy mode |
| `hjkl`, `v`, `y`, `q` | move, select, copy, leave copy mode |
| `prefix ]` | paste the tmux buffer |

### From outside: controlling a session

```bash
tmux ls                                          # what is running
tmux attach -t NAME                              # enter (leave with prefix d)
tmux capture-pane -p -t NAME | tail -30          # read the pane without entering
tmux send-keys -t NAME 'command' Enter           # type into the pane
tmux kill-session -t NAME                        # kill it (and its programs)
```

### This machine's own bindings (`~/.tmux.conf`)

- `mouse on`: a click selects a pane, dragging a border resizes, the wheel scrolls (and enters copy
  mode).
- `mode-keys vi`, `base-index 1`, `pane-base-index 1`, `renumber-windows on`.
- `Shift+←/→/↑/↓` (no prefix) run `~/scripts/tmux_navigate.sh`, which moves between panes and is
  aware of neovim and emacs splits.
- `C-\` (no prefix) sends `C-\` to neovim or emacs when one of them owns the pane, and otherwise
  jumps to the last pane.
- Copying with a mouse drag runs `xsel`, which is a Linux tool; on macOS use `y` in copy mode or
  the terminal's own selection.

### Fixed 2026-10-19

- `bind -n C-\ run "…"` failed with `unknown key: C- run`: tmux reads a backslash as an escape, so
  `\ ` glued the key and the command into one word. Doubling it (`C-\\`) makes it the
  `C-backslash` key again.
- `run -b '~/.tmux/plugins/tpm/tpm'` printed `returned 127` on a machine where
  `~/.tmux/plugins/` does not exist. The line now runs only when that file is executable:
  `run -b '[ -x "$HOME/.tmux/plugins/tpm/tpm" ] && "$HOME/.tmux/plugins/tpm/tpm"'`.

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

> run-shell always uses /bin/sh (as defined by \_PATH_BSHELL in tmux's source). To run a fish shell, you can use run "fish -c fish_prompt" https://stackoverflow.com/questions/47400291/tmux-run-fish-shell-functions-returns-error-127/47426623#47426623

I was trying to execute non-existent file and was getting error 127

> The high-number exit codes (126 and 127) are given by the shell when there is a problem executing the command. Specifically, (per POSIX.1) 126 usually means that the file was not executable. https://stackoverflow.com/questions/10036772/tmux-run-command-returned-126-what-does-that-mean/10038458#10038458

https://unix.stackexchange.com/questions/14700/how-can-i-bind-multiple-tmux-commands-to-one-keystroke

## on resize hook move pane

- https://unix.stackexchange.com/questions/186390/tmux-get-number-of-panes-in-the-current-window-in-bash-variable
- https://superuser.com/questions/586835/how-do-i-shove-a-pane-to-the-left-in-tmux/707083#707083
- https://stackoverflow.com/questions/35016458/how-to-write-if-statement-in-tmux-conf-to-set-different-options-for-different-t/36953319#36953319
- https://devel.tech/tips/n/tMuXrSz9/resize-tmux-main-panes-by-percentage/
  - https://news.ycombinator.com/item?id=15804302

```bash
#!/bin/bash
#run it like this: tmux set-hook -g client-resized 'run-shell "bash ~/bin/tmux_toggle.sh"'
highest=$(tmux display-message -p '#{window_panes}')
highest_left=$(tmux display -p -t :1.${highest} '#{pane_left}')
highest_width=$(tmux display -p -t :1.${highest} '#{pane_width}')
previous_width=$(tmux display -p -t :1.$((highest-1)) '#{pane_width}')
both_width=$((highest_width + previous_width))

if [[ $highest_left -gt 0 && $both_width -lt 160 ]] ; then
    tmux move-pane -v -s ${highest} -t $((highest-1))
    tmux resize-pane -t $((highest-2)) -U 10
    tmux resize-pane -t ${highest} -y 3
elif [[ $highest_left -eq 0 && $previous_width -gt 160 ]] ; then
    tmux move-pane -h -s ${highest} -t $((highest-1))
    tmux resize-pane -t ${highest} -y 10
fi
```
