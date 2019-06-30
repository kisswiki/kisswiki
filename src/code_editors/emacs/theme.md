- https://github.com/myTerminal/theme-looper
- I use default "angry fruit salad" defined in font-lock.el line starting with `;;; Color etc. support.`
  - https://emacs.stackexchange.com/questions/7491/where-is-the-default-color-custom-theme-defined
  - https://github.com/emacs-mirror/emacs/blob/master/lisp/font-lock.el#L1933
  - http://david.rothlis.net/emacs/customize_colors.html
  - https://www.emacswiki.org/emacs/AngryFruitSalad
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

## ritchie

```lisp
;; https://github.com/whatyouhide/emacs.d/blob/master/init.el
(use-package sublime-themes
  :straight t
  :init (progn
	  (load-theme 'ritchie t)))
```
