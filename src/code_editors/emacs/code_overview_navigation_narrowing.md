- https://www.reddit.com/r/emacs/comments/746cd0/which_code_folding_package_do_you_use/
- https://www.reddit.com/r/spacemacs/comments/5nvsty/how_do_you_fold_your_code/
- https://github.com/gregsexton/origami.el
- https://github.com/mrkkrp/vimish-fold
- https://github.com/magnars/fold-this.el
- https://github.com/zenozeng/yafolding.el
- http://wikemacs.org/wiki/Folding
- https://myriadicity.net/software-and-systems/craft/emacs-allout
- https://stackoverflow.com/questions/1208622/code-folding-in-emacs
- https://github.com/alphapapa/navi

## Emacs Outline

- Add new language with `outline-regexp` and `outline-level` http://blog.bezirg.net/posts/2013-08-01-outlining-haskell-code-with-emacs.html
  - https://stackoverflow.com/questions/33375294/folding-haskell-code-in-emacs
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Outline-Mode.html
- http://ergoemacs.org/emacs/emacs_outline.html
- http://wikemacs.org/wiki/Outline
- https://emacs.stackexchange.com/questions/40629/outline-minor-mode-folding-enhancements-wanted
- https://github.com/alphapapa/outshine
  - outline-magic has been superseded by outshine https://stackoverflow.com/questions/4079648/combine-python-mode-with-org-mode-for-emacs/29057808#29057808
- https://github.com/tj64/outline-magic
  - https://www.emacswiki.org/emacs/OutlineMagic
- https://emacs.stackexchange.com/questions/40629/outline-minor-mode-folding-enhancements-wanted
- https://superuser.com/questions/892443/how-to-set-outline-minor-mode-heading-levels-in-outline-regexp
- Automatic outline-minor-mode settings for GNU Emacs https://gist.github.com/dove-young/5547778
- Emacs: outline-mode folding for Python, elisp, and shell https://gist.github.com/alphapapa/0f76ffe9792fffecb017
- https://stackoverflow.com/questions/17173148/local-keymap-for-emacs-outline-minor-mode
- https://stackoverflow.com/questions/14188540/emacs-modes-for-editing-files-where-indentation-implies-structure
- >The default value matches asterisks and page breaks: `"[*\f]+"` https://stackoverflow.com/questions/17170793/what-does-regex-f-mean

## Hideshow

- https://superuser.com/questions/576447/enable-hideshow-for-more-modes-e-g-ruby

## Occur

`M-x occur` or `M-s o`

- https://www.masteringemacs.org/article/searching-buffers-occur-mode
- https://ignaciopp.wordpress.com/2009/06/10/customizing-emacs-occur/
- https://oremacs.com/2015/01/26/occur-dwim/
- https://emacs.stackexchange.com/questions/7270/include-original-position-from-searched-buffer-in-occur-buffer

### Regexp

`^[^ ]` does not select only lines which does not start with space.

I need to use this for Elm:

`^[a-z].*\(:.+$\|=$\)`

`C-c C-f` to to enable follow mode

Use arrows or `M-n` and `M-p` to navigate.

See context of 3 lines: `C-u 3 M-s o`

`r` Add file name to Occur window title

### defun

```elisp
(defun toc ()
  "Show a 'Table of Contents' for the current file using occur"
  (interactive)
  (let (regexp
        (case-fold-search nil))
    (if (derived-mode-p 'cperl-mode)  ;; for perl
        (setq regexp "^\\(sub\\|has\\|=head1\\|requires\\) ")
      (setq regexp "^function "))     ;; for everything else
    (occur regexp)))
```

- https://emacs.stackexchange.com/questions/35105/how-can-i-make-occurs-regexp-matching-case-sensitive

### Workflow

A common workflow is:

1. start isearch with `C-s`, then
2. search for the next word with `C-w`, then
3. run occur with the current search string with `M-s o`.
4. You can also use `isearch-forward-symbol-at-point` for the first two steps, so the whole sequence would be: `M-s-.` and `M-s-o`.

https://emacs.stackexchange.com/questions/42264/does-occur-at-point-already-exist/42266#42266
