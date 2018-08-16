Enable with `;; -*- lexical-binding: t -*-`.

>The general rule is: never ever do `(setq lexical-binding t)` because it probably doesn't do what you think. https://stackoverflow.com/questions/35585121/lexical-binding-not-being-enabled-when-evaluating-emacs

Though I need to enable lexical binding for scratch buffer with `(setq lexical-binding t)`.

```elisp
(defun func (val)
  (lambda ()
    val))
(fset 'f (func "abc"))
(f)
```

You should get `"abc"`.

- https://emacs.stackexchange.com/questions/32544/function-that-takes-a-function-as-argument-and-returns-a-new-function#comment50322_32546
- https://www.emacswiki.org/emacs/LexicalBinding
