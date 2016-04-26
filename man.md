# man

## On Windows

1. install Groff and put it in path http://gnuwin32.sourceforge.net/packages/groff.htm
2. You can check if groff works with this command `groff -Tascii -pet -mandoc -P-c <manpage-file> | less -irs` http://mingw.org/wiki/FAQ#toc10
3. Install ManScript in path http://mingw.org/wiki/ManScript http://superuser.com/a/634889
4. Test it with i.e. `man git-config`
