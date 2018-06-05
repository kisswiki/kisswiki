Install:
- elm-mode
- elm-oracle
- company

```lisp
(require 'company)
(add-to-list 'company-backends 'company-elm)
(add-hook 'after-init-hook 'global-company-mode)
```