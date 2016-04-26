# man

## On Windows

1. Install Groff and ensure it's in $PATH http://gnuwin32.sourceforge.net/packages/groff.htm
2. You can check if groff works with this command `groff -Tascii -pet -mandoc -P-c <manpage-file> | less -irs` http://mingw.org/wiki/FAQ#toc10
3. Install ManScript and ensure it's in $PATH http://mingw.org/wiki/ManScript http://superuser.com/a/634889
4. Add to `~/.bashrc`: `export MANPATH=":$HOME/man"` http://askubuntu.com/questions/197461/how-to-set-manpath-without-overriding-defaults
4. Test it with i.e. `man git-config`

http://stackoverflow.com/questions/5517564/how-do-i-get-git-to-show-command-line-help-in-windows
