all Emacs commands are functions, but not all functions are Emacs commands. You can make an arbitrary elisp function a command accessible via `M-x` using `(interactive)`:

```lisp
(defun my-command ()
 "This is the docstring"
 (interactive)
 (do-foo)
 (do-bar))
```

Now that you've defined my-command as interactive, you can immediately access it with `M-x my-command`.

all Emacs commands are just functions defined with `(interactive)`. (Actually, there are also some primitive functions from Emacs's C core, but that isn't super important.)

https://stackoverflow.com/questions/12585670/relationship-between-emacs-functions-and-commands