- https://stackoverflow.com/questions/6368742/how-to-run-hook-depending-on-file-location
- http://ergoemacs.org/emacs/emacs_hooks_list.html
- https://emacs.stackexchange.com/questions/19578/list-hooks-that-will-run-after-command

## local to mode only

```elisp
(add-hook 'org-mode-hook
          (lambda ()
             (add-hook 'after-save-hook 'a-test-save-hook nil 'make-it-local)))
```

https://stackoverflow.com/questions/6138029/how-to-add-a-hook-to-only-run-in-a-particular-mode/6141681#6141681
