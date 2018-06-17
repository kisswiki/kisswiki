can check that by looking at the environment variable HOME. In emacs, try:

```lisp
`M-:` then `(getenv "HOME")`
```

In your .emacs file, you could then put:

```lisp
(setq default-directory "~/")
```

https://stackoverflow.com/questions/21059833/how-to-set-default-working-directory-in-emacs-troubleshooting/21066034#21066034