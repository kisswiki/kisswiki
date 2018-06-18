- https://github.com/szermatt/emacs-bash-completion
- https://github.com/akermu/emacs-libvterm
- http://ergoemacs.org/emacs/emacs_unix.html
- https://www.emacswiki.org/emacs/ExecuteExternalCommand
- https://www.reddit.com/r/emacs/comments/4z8gpe/using_bash_on_windows_for_mx_shell/
- https://www.masteringemacs.org/article/complete-guide-mastering-eshell
- http://ergoemacs.org/emacs/eshell.html
- https://www.emacswiki.org/emacs/CategoryEshell
- https://emacs.stackexchange.com/questions/22049/git-bash-in-emacs-on-windows/22057
- https://github.com/purcell/exec-path-from-shell
- https://stackoverflow.com/questions/8606954/path-and-exec-path-set-but-emacs-does-not-find-executable
- https://www.reddit.com/r/emacs/comments/6y3q4k/yes_eshell_is_my_main_shell/
- http://ergoemacs.org/emacs/emacs_env_var_paths.html


Another method is to put

```bash
#!/bin/sh 
TERM=emacs exec zsh
```

into a file ~/bin/eshell, then chmod +x ~/bin/eshell, and tell emacs to use that as the shell by adding

```lisp
(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
```

to ~/.emacs.

https://stackoverflow.com/questions/1568987/getting-emacs-to-respect-my-default-shell-options