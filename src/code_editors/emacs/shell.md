## About

- http://ergoemacs.org/emacs/emacs_shell_vs_term_vs_ansi-term_vs_eshell.html
- https://www.masteringemacs.org/article/complete-guide-mastering-eshell
- http://ergoemacs.org/emacs/eshell.html
- https://www.masteringemacs.org/article/running-shells-in-emacs-overview
- https://www.emacswiki.org/emacs/UsingMultipleShells

## Misc

- https://github.com/szermatt/emacs-bash-completion
- https://github.com/akermu/emacs-libvterm
- http://ergoemacs.org/emacs/emacs_unix.html
- https://www.emacswiki.org/emacs/ExecuteExternalCommand
- https://www.reddit.com/r/emacs/comments/4z8gpe/using_bash_on_windows_for_mx_shell/
- https://www.masteringemacs.org/article/complete-guide-mastering-eshell
- https://www.emacswiki.org/emacs/CategoryEshell
- https://emacs.stackexchange.com/questions/22049/git-bash-in-emacs-on-windows/22057
- https://github.com/purcell/exec-path-from-shell
- https://stackoverflow.com/questions/8606954/path-and-exec-path-set-but-emacs-does-not-find-executable
- https://www.reddit.com/r/emacs/comments/6y3q4k/yes_eshell_is_my_main_shell/

## May be useful

- http://ergoemacs.org/emacs/emacs_env_var_paths.html
- https://emacs.stackexchange.com/questions/34137/utf-8-characters-with-eshell-eshell-visual-subcommands-and-git
- https://emacs.stackexchange.com/questions/14167/shell-command-with-bash-script-and-arguements/33843
- https://emacs.stackexchange.com/questions/36790/using-emacsclient-as-git-config-core-editor-and-invoking-git-commit-as-sh
- https://emacs.stackexchange.com/questions/6104/reload-environment-variables
- https://emacs.stackexchange.com/questions/18672/how-to-define-a-function-that-calls-a-console-process-using-ansi-term
- https://emacs.stackexchange.com/questions/2883/any-way-to-make-prompts-and-previous-output-uneditable-in-shell-term-mode
- https://emacs.stackexchange.com/questions/17482/append-shell-command-output-to-named-buffer
- https://emacs.stackexchange.com/questions/5664/shell-bash-completion-window
- https://emacs.stackexchange.com/questions/19610/how-to-start-term-in-a-separate-window-at-launch
- https://emacs.stackexchange.com/questions/33525/how-to-open-systems-command-line-at-the-directory-of-the-current-buffer
- https://emacs.stackexchange.com/questions/14159/why-emacs-overrides-my-path-when-it-runs-bash

##

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

## bash - problems

```
bash: cannot set terminal process group (-1): Inappropriate ioctl for device
bash: no job control in this shell
]0;MINGW64:/c/Users/rofrol/personal_projects/kisswiki
rofrol@DESKTOP-NBALJ88 MINGW64 ~/personal_projects/kisswiki (master)
```

