https://stackoverflow.com/questions/234963/re-open-scratch-buffer-in-emacs

## pound/sharp quote #'

- https://emacs.stackexchange.com/questions/10510/smart-minor-mode-toggle-depending-on-major-mode

The compiler throws a warning whenever it notices you've used an undefined function, say (not-defined "oops"), but it can't do the same for something like (mapcar 'not-defined some-list) because it doesn't know that symbol is the name of a function. The sharp quote is a way of conveying that information to the compiler, so if it runs into (mapcar #'not-defined some-list), it can throw a warning accordingly.

- http://endlessparentheses.com/get-in-the-habit-of-using-sharp-quote.html