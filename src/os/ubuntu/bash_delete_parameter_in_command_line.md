## read key

to read key pres `Ctrl+v` and the key.

>You can prove it by using Readline's quoted-insert function, which you should find bound to Control-V. quoted-insert means put the following character into the line instead of executing any function that might be assigned to it. You need this to keep Readline from trying to interpret that Escape character. So at a Bash prompt, type Control-V followed by F1.

http://www.tldp.org/LDP/LG/issue55/henderson.html

## bind and inputrc

all mapping

`bind -P` or `-p` which can be read by inputrc:

`bind -p > ~/.inputrc`

reload

`bind -f  ~/.inputrc`

Ctrl+Alt+p to delete param:

`"\e\C-p": shell-backward-kill-word`

- https://unix.stackexchange.com/questions/153357/inputrc-file-not-sourcing-correctly/246422#246422
- https://unix.stackexchange.com/questions/71350/delete-whole-argument-in-current-bash-command-line
- https://askubuntu.com/questions/279254/bash-delete-word-ahead-of-cursor
- https://wiki.archlinux.org/index.php/readline
- http://www.softpanorama.org/Scripting/Shellorama/Bash_as_command_interpreter/inputrc.shtml
- XTerm Control Sequences - Edward Moy http://invisible-island.net/xterm/ctlseqs/ctlseqs.pdf
- https://stackoverflow.com/questions/28818731/how-to-get-bash-version-in-inputrc
