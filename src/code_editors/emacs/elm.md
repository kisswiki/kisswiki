GInstall:
- elm-mode
- elm-oracle
- company
- flycheck
- flycheck-elm - only on unstable melpa

```lisp
(require 'company)
(add-to-list 'company-backends 'company-elm)
(add-hook 'after-init-hook 'global-company-mode)
```

- https://github.com/jcollard/elm-mode
- http://company-mode.github.io/
- https://melpa.org/#/elm-mode
- https://stable.melpa.org/#/elm-mode
- https://www.lambdacat.com/post-modern-emacs-setup-for-elm/

## Tags

- universal-ctags https://github.com/jcollard/elm-mode/issues/135
- https://github.com/leoliu/ggtags
- https://emacs.stackexchange.com/questions/3360/emacs-tags-file-in-windows
- https://www.reddit.com/r/emacs/comments/3pni17/ctags_etags_or_gtags/

### Old

elm-mode uses etags with language none `etags --language=none` https://github.com/jcollard/elm-mode/blob/f5c6f4e79209eadd6d534b724dc8f10886bf3833/elm-tags.el#L64

Running this command should create `TAGS` file.

Manually `rg --files -telm | etags --language=none -`

Exuberant Ctags does not support Elm http://ctags.sourceforge.net/languages.html

- Emacs elm-mode TAGS demo https://youtu.be/TSZJBLNCv4Q
- https://www.emacswiki.org/emacs/EmacsTags
- https://www.emacswiki.org/emacs/BuildTags
- https://www.emacswiki.org/emacs/ExuberantCtags
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Create-Tags-Table.html

### Windows

Note: Cannot make it work on Windows. No TAGS file created.

Needs GNU find on PATH before Windows find.

```lisp
(when (eq system-type 'windows-nt)
  (add-to-list 'exec-path "C:/Program Files/Git/usr/bin")
  (setenv "PATH" (mapconcat #'identity exec-path path-separator)))
```

- https://emacs.stackexchange.com/questions/27326/gui-emacs-sets-the-exec-path-only-from-windows-environment-variable-but-not-from

## sepcify main file per directory

in `.dir-locals.el` if `src/App.js.elm`:

```lisp
((nil . ((elm-main-file . "App.js.elm"))))
```

## indent

`electric-newline-and-maybe-indent` is modified because of elm-indent-mode.

Pressing `C-j` and then `Tab` two times, will insert something.

https://github.com/jcollard/elm-mode/issues/73#issuecomment-247365202
