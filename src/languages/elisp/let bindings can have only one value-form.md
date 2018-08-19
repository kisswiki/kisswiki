You're missing a necessary set of parentheses around the VARLIST. Your code should look like this:

```elisp
(let ((lineStr (thing-at-point 'line t)))
   (body-form......))
```

https://emacs.stackexchange.com/questions/9474/let-statement-throws-error-on-assigning-a-form-to-a-variable/9477#9477
