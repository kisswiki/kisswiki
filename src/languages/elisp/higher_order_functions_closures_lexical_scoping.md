Enable with `;; -*- lexical-binding: t -*-`.

>The general rule is: never ever do `(setq lexical-binding t)` because it probably doesn't do what you think. https://stackoverflow.com/questions/35585121/lexical-binding-not-being-enabled-when-evaluating-emacs

Though I need to enable lexical binding for scratch buffer with `(setq lexical-binding t)` or enable it on strart up like in `scratch_buffer.md`.

```elisp
(progn
  (defun func (val)
  (lambda ()
    val))
(fset 'f (func "abc"))
(f))
```

`C-j` in scrtach buffer and you should get `"abc"`.

- https://emacs.stackexchange.com/questions/32544/function-that-takes-a-function-as-argument-and-returns-a-new-function#comment50322_32546
- https://www.emacswiki.org/emacs/LexicalBinding
- https://www.reddit.com/r/emacs/comments/7y000a/how_to_add_lexicalbinding_t_to_every_new_elisp/
