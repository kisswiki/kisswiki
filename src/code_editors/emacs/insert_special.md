`C-x 8 RET` which runs `insert-char`

Or `quoted-insert` which will work in places where `insert-char` won't, like minibuffer:

`C-q` then octal code and `RET`

Or change base with `(setq read-quoted-char-radix 10)` and enter in base 10.

- https://superuser.com/questions/394405/how-to-type-a-unicode-character-by-its-number-in-emacs
- https://www.emacswiki.org/emacs/QuotedInsert
