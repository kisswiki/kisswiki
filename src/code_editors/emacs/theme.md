- https://peach-melpa.org/
  - https://www.reddit.com/r/emacs/comments/8l4r02/announcing_peachmelpaorg/
- https://emacsthemes.com/
- https://pawelbx.github.io/emacs-theme-gallery/
- https://github.com/fniessen/emacs-leuven-theme
- https://emacsthemes.com/themes/base16-monokai-theme.html
- https://github.com/oneKelvinSmith/monokai-emacs

##

`(load-theme 'theme-name t)` should load the theme without prompts. In case you want to do this interactively, you can create a function that gets the theme name and uses this function call internally.


```lisp
(use-package solarized-theme
  :straight t
  :config
  (load-theme 'solarized-dark t))
```

https://www.reddit.com/r/emacs/comments/5udtw1/usepackageel_about_to_be_moved_to_emacs_core