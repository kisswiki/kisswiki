- http://ergoemacs.org/emacs/elisp_basics.html
- http://ergoemacs.org/emacs/elisp_examples.html
- https://oremacs.com/2015/07/16/callback-quit/
- https://www.emacswiki.org/emacs/EvaluatingExpressions
- http://blog.binchen.org/posts/emacs-is-easy-if-you-read-code.html
- https://github.com/chrisdone/elisp-guide
- https://emacs-doctor.com/learn-emacs-lisp-in-15-minutes.html
- http://emacslife.com/how-to-read-emacs-lisp.html
- https://github.com/hypernumbers/learn_elisp_the_hard_way

## it's also a good convention to hash-quote or sharp-quote function symbols

I use it for one simple purpose: clarity. If an argument is supposed to be a function symbol and not a variable symbol, using #'foo instead of 'foo.

If you are byte-compiling a code containing (something 'foo) expecting a function symbol as argument, and even if foo is not a function, no error will be thrown. But if the same code were (something #'foo) , and if foo were not a function, an error will be thrown.

https://www.reddit.com/r/emacs/comments/6tj8v3/autoformatting_code_on_save/dllm4bo/
