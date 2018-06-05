Install:
- elm-mode
- elm-oracle
- company

```lisp
(require 'company)
(add-to-list 'company-backends 'company-elm)
(add-hook 'after-init-hook 'global-company-mode)
```

- https://github.com/jcollard/elm-mode
- http://company-mode.github.io/
- https://melpa.org/#/elm-mode
- https://stable.melpa.org/#/elm-mode