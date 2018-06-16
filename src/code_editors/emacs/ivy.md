## What and why

- for completion in contexts: code, menus, commands, variables, functions, etc.
- listing, sorting, filtering, previewing, and applying actions on selected items
- completes the selection process by narrowing available choices while previewing in the minibuffer
- simple keyboard character inputs or through powerful regular expressions
- Ivy is for quick and easy selection from a list. When Emacs prompts for a string from a list of several possible choices, Ivy springs into action to assist in narrowing and picking the right string from a vast number of choices.
- Ivy shows the completion defaults, the number of matches, and 10 candidate matches below the input line.

http://oremacs.com/swiper/

## ivy, swiper and counsel

They are all in swiper repository.

## Counsel

It is for configuring specific modes, like for projectile with counsel-projectile.

```lisp
;; Currently available:
;; - Symbol completion for Elisp, Common Lisp, Python, Clojure, C, C++.
;; - Describe fuctions for Elisp: function, variable, library, command,
;;   bindings, theme.
;; - Navigation functions: imenu, ace-line, semantic, outline.
;; - Git utilities: git-files, git-grep, git-log, git-stash, git-checkout.
;; - Grep utitilies: grep, ag, pt, recoll, ack, rg.
;; - System utilities: process list, rhythmbox, linux-app.
;; - Many more.
```

https://github.com/abo-abo/swiper/blob/master/counsel.el

## ivy-minibuffer-map

Use it to specifiy keyboard mapping for minibuffer.

## find file down in directories

`counsel-file-jump` lists all files below parent directory. But first use `counsel-find-file` to select a parent directory.

`counsel-locate` lists all matching directory and file names from Linux root.

- https://emacs.stackexchange.com/questions/33745/how-to-find-file-name-a-few-levels-down-in-directory
- https://oremacs.com/2015/07/02/counsel-locate/

Looks like projectile-find-file and counsel-git should work the same.


I used to work with neovim and fzf before switching to emacs. I tried to implement a global fzf setup throug counsel-rg but I feel like using projectile-switch-project and projectile-find-file just works better. Having to switch projects before finding a file may seem constraining at first but I actually like it better, it makes more sense in terms of context switching imo.

https://www.reddit.com/r/emacs/comments/8grv2q/emacs_and_fuzzy_file_finder_fzf/dyeozb1/

### fzf

Ripgrep || Silver search > Fzf

https://www.reddit.com/r/emacs/comments/8grv2q/emacs_and_fuzzy_file_finder_fzf/dygid3m/

### fiplr

fuzzy match find file, looks through all the parent directories of the file you're editing until it finds a .git, .hg, .bzr or .svn directory

https://github.com/grizzl/fiplr

I wish it fiplr did work as well as ctrlp or fzf, but my first impression was that it took 5-10 minutes to index the database (86k files), and completion was so slow that I gave up when it didn't return any results after ~ 1 minute.

https://www.reddit.com/r/emacs/comments/8grv2q/emacs_and_fuzzy_file_finder_fzf/dyeno3p/

## fuzzy matching

- https://oremacs.com/2016/01/06/ivy-flx/

## Change type of matching

- https://emacs.stackexchange.com/questions/33921/how-to-switch-between-ivy-completion-styles
- https://emacs.stackexchange.com/questions/36745/enable-ivy-fuzzy-matching-everywhere-except-in-swiper

## Multi-exit with hydra - kill selected buffer withou switching to it

requires ivy-hydra

When you enable ivy-mode, besides doing all your completion, it will also remap switch-to-buffer to ivy-switch-buffer. That command also has a multi-exit: pressing C-o sd instead of C-m will kill the selected buffer instead of switching to it. It's a very minor optimization: instead of C-m C-x k you press C-o sd, however you could e.g. use C-o scjjjj to kill five buffers at once.

https://oremacs.com/2015/07/02/counsel-locate/

## Enable

When `(ivy-mode 1)`, `("M-x" . counsel-M-x)`.

When:

```lisp
(use-package counsel
   :defer t
   :straight t)
```

other keyboard mapping will be activated, like `("C-x C-f" . counsel-find-file)` or `("C-h v" . counsel-describe-variable)`.

## Config

```lisp
(use-package ivy
  :straight t
  :delight
  ;; why defer ivy-mode in :commands, when it's not loaded if not done in :init?
  ;;:commands (ivy-mode)
                ;; ivy-read
  ;;            ;; ivy--switch-buffer-matcher
  ;;            ;; ivy--switch-buffer-action
  ;;            ;; ivy-call
  ;;            ;; swiper)
  ;; 	     )
  :init
  (ivy-mode 1)
  ;; Buffer switching with preview.
  ;; :bind (:map ivy-mode-map
  ;;             ("M-x" . counsel-M-x)
  ;;             ("C-x C-f" . counsel-find-file)
  ;;             ("<f1> f" . counsel-describe-function)
  ;;             ("<f1> v" . counsel-describe-variable)
  ;;             ("<f1> l" . counsel-load-library)
  ;;             ("<f2> i" . counsel-info-lookup-symbol)
  ;;             ("<f2> u" . counsel-unicode-char)
  ;;             ("C-c g" . counsel-git)
  ;;             ("C-c a" . counsel-ag)
  ;;             :map ivy-minibuffer-map
  ;;             ("S-<return>" . ivy-immediate-done)
  ;;             ;; Like isearch.
  ;;             ("C-w" . ivy-yank-word)
  ;;             ;; Like isearch, repeating the key uses the last item
  ;;             ;; from the history and goes on from there.
  ;;             ("C-<tab>" . ivy-next-line-or-history)
  ;;             ;; For symmetry.
  ;;             ("C-<iso-lefttab>" . ivy-previous-line-or-history)))
              )
```

- https://github.com/xendk/dotemacs/blob/master/init.el
- https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-ivy.el
- https://www.reddit.com/r/emacs/comments/5453d4/what_does_your_ivyswiper_configuration_look_like/