Byte-compiling so that it produces meaningful errors and warnings is a tricky thing. If you byte-compile and see thousands of warnings about things not being defined, you won't see the ones that are really not defined after the package has loaded.

What use-package does to counter this is that, only when byte-compiling, it injects some eval-when-compile forms that attempt to load your package, no matter what your keyword settings are. This is done to bring all of that package's definitions into scope, for the sake of expanding later macro definitions in the init file, and so we can really see which references are undefined.

Thus, byte-compiling init.el within a running Emacs will cause everything to be loaded again, but this time without doing it the way you've requested. This means that use-package-based init files should only ever be byte-compiled offline, using emacs --batch -f batch-byte-compile-file. There's an example of how I do this here:

https://github.com/jwiegley/dot-emacs/blob/master/Makefile#L65

https://github.com/jwiegley/use-package/issues/574#issuecomment-350349733