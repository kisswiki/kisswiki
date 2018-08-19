Emacs 25 will include the seq.el library, which will provide default functions to manipulate sequences. Right now you can download it from GNU ELPA for Emacs 24. The functions you are looking for are:

```elisp
(seq-filter (lambda (x) (/= 0 (% x 2))) '(1 2 3 4 5)) ; => (1 3 5)
(seq-remove (lambda (x) (/= 0 (% x 2))) '(1 2 3 4 5)) ; => (2 4)
```

https://emacs.stackexchange.com/a/24352/19475
