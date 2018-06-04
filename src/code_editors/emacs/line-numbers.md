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