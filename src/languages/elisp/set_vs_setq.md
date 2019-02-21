lisp has “symbol” concept.

in “normal” languages like python php perl java etc, they have “identifiers”.

in lisp, these “identifiers” are “symbols”. The difference is that, the lisp identifier can be evaluated or stay unevaluated.

if symbols are always evaluated, they are just like identifiers in other non-symbol language.

but in lisp, identifier can be held unevaluated. When identifier is held unevaluated, it becomes an inert thing, somewhat like a string.

test it like this:

```lisp
(setq x 1)

(message "%s" x) ; prints "1"

(message "%s" 'x ) ; prints "x"
;; this is printing the symbol itself
;; that is, the identifier x is unevaluated
```

To hold evaluation of a identifier, you “quote” it. Like this:

```lisp
'x

(quote x)
```

these are syntactically equivalent.

now, since a identifier can be held unevaluated. We have a situation, whether function arguments should evaluated. `set` and `setq` are examples.

Normally, you write

```lisp
(set 'x 1)
```

meaning, you set 1 to the identifier `x`. You want to `quote` the symbol, because, otherwise, `x` will be evaluated, but that usually doesn't make sense, unless its value is another symbol.

while

```lisp
(setq x 1)
```

will quote the 1st arg, the `x`, for you automatically.

That's the difference.

This situation of whether to eval the argument, happens with other functions, such as 1st argument for map.

more detail from my tutorial: Elisp: Lisp Symbol http://ergoemacs.org/emacs/elisp_symbol.html


https://www.reddit.com/r/emacs/comments/7jyv0o/whats_the_difference_in_setq_and_set/draapog/
