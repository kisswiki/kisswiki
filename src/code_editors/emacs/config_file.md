## Location

It should be stored in the variable `user-init-file`. Use `C-H v user-init-file RET` to check.

- https://stackoverflow.com/questions/189490/where-can-i-find-my-emacs-file-for-emacs-running-on-windows
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html

`sudo strace -o /tmp/emacs.txt -e open emacs`

https://stackoverflow.com/questions/864892/how-do-i-find-which-emacs-file-has-been-loaded/864939#864939

## Open file

```lisp
(defun open-user-init-file ()
  (interactive)
  (find-file user-init-file))
```

Open it directly by using `M-x eval-expression RET (find-file user-init-file) RET`.

https://stackoverflow.com/questions/189490/where-can-i-find-my-emacs-file-for-emacs-running-on-windows

## Reload currently edited config

You can use the command load-file (`M-x load-file`, then press return twice to accept the default filename, which is the current file being edited).

Or

Define it in your init file and call by` M-x reload-user-init-file`

```lisp
(defun reload-user-init-file()
  (interactive)
  (load-file user-init-file))
```

https://stackoverflow.com/questions/2580650/how-can-i-reload-emacs-after-changing-it

## .emacs vs .emacs.d/init.el

- https://emacs.stackexchange.com/questions/1/are-there-any-advantages-to-using-emacs-d-init-el-instead-of-emacs

## customize

- http://ergoemacs.org/emacs/emacs_custom_system.html
- https://www.emacswiki.org/emacs/CustomizingAndSaving
- https://emacs.stackexchange.com/questions/102/advantages-of-setting-variables-with-setq-instead-of-custom-el