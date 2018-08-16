## autocomplete and eldoc

```elisp
(defun ielm-auto-complete ()
  "Enables `auto-complete' support in \\[ielm]."
  (setq ac-sources '(ac-source-functions
                     ac-source-variables
                     ac-source-features
                     ac-source-symbols
                     ac-source-words-in-same-mode-buffers))
  (add-to-list 'ac-modes 'inferior-emacs-lisp-mode)
  (auto-complete-mode 1)
  (turn-on-eldoc-mode))
(add-hook 'ielm-mode-hook 'ielm-auto-complete)
```

- https://www.masteringemacs.org/article/evaluating-elisp-emacs
- https://www.emacswiki.org/emacs/ElDoc
