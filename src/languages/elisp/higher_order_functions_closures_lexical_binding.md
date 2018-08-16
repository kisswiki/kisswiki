```elisp
(setq lexical-binding t)
```

or

```elisp
;; -*- lexical-binding: t -*-
```

and then this

```elisp
(defun func (val)
  (lambda ()
    val))

(fset 'f (func "abc"))

(f)
```

Should return `"abc"`.

In scratch buffer after `C-j` on every sexp:

```
(defun func (val)
  (lambda ()
    val))
func

(fset 'f (func "abc"))

(closure ((val . "abc") t) nil val)
;; you will get this if lexical binding is not enabled
;;(lambda nil val)

(f)
"abc"
```

- https://www.emacswiki.org/emacs/LexicalBinding
- https://emacs.stackexchange.com/questions/32544/function-that-takes-a-function-as-argument-and-returns-a-new-function#comment50322_32546
