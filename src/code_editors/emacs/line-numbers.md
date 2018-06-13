- https://github.com/emacs-mirror/emacs/blob/master/lisp/display-line-numbers.el
- https://www.reddit.com/r/emacs/comments/6p227p/perwindow_native_line_numbers_configuration/

##

```lisp
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
```

```lisp
(when (version<= "26.0.50" emacs-version )
  ;;; enable linum-mode in all programming modes
  (add-hook 'prog-mode-hook 'global-display-line-numbers-mode))
```


- http://ergoemacs.org/emacs/emacs_line_number_mode.html
- https://superuser.com/questions/212193/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line/1328642#1328642
- https://emacs.stackexchange.com/questions/278/how-do-i-display-line-numbers-in-emacs-not-in-the-mode-line

## With width set

```lisp
(when (version<= "26.0.50" emacs-version )
      ;;; enable in all programming modes
      (defun init-line-numbers-mode ()
        (display-line-numbers-mode)
	(setq display-line-numbers-width-start t))
      (add-hook 'prog-mode-hook 'init-line-numbers-mode))
```