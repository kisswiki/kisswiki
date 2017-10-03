all mapping

`bind -P` or `-p` which can be read by inputrc:

`bind -p > ~/.inputrc`

reload

`bind -f  ~/.inputrc`

Ctrl+Alt+p to delete param:

`"\e\C-p": shell-backward-kill-word`

to read key pres `Ctrl+v` and the key

- https://unix.stackexchange.com/questions/153357/inputrc-file-not-sourcing-correctly/246422#246422
- https://unix.stackexchange.com/questions/71350/delete-whole-argument-in-current-bash-command-line
- https://askubuntu.com/questions/279254/bash-delete-word-ahead-of-cursor
- https://wiki.archlinux.org/index.php/readline
