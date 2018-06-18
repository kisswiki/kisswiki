C-h v (describe-variable)

Try

`M-x apropos` do search all list symbols

or

`C-h d` to search in all doc-strings

https://stackoverflow.com/questions/40618516/where-is-locate-dominating-file-documented

- https://www.gnu.org/software/emacs/manual/html_node/emacs/Examining.html
- https://stackoverflow.com/questions/3366972/how-to-check-if-a-variable-is-set-to-what-in-elisp-emacs

```lisp
(defun describe-variable-short (var)
  (interactive "vVariable: ")
  (message (format "%s: %s" (symbol-name var) (symbol-value var))) )
(global-set-key "\C-hV" 'describe-variable-short)
```

https://stackoverflow.com/questions/3366972/how-to-check-if-a-variable-is-set-to-what-in-elisp-emacs/20255760#20255760