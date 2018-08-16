`Wrong type argument` is elisp's way of telling you, "I expected an `x` but got a `y`. `stringp, nil` means, "I expected something that satisfies the `stringp` predicate, but I received `nil`." You can get more information about where the error is happening by calling `M-x toggle-debug-on-error`, but "I'm handing a `nil` to something that needs a string` might be enough of a hint.

https://emacs.stackexchange.com/questions/41315/wrong-type-argument-stringp-nil
