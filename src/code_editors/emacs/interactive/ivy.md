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

Here's the default setting:

```lisp
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))
```

The default matcher will use a .* regex wild card in place of each single space in the input. If you want to use the fuzzy matcher, which instead uses a .* regex wild card between each input letter, write this in your config:

```lisp
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))
```

You can also mix the two regex builders, for example:

```lisp
(setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy)))
```

The t key is used for all fall-through cases, otherwise the key is the command or collection name.

The fuzzy matcher often results in substantially more matching candidates than the regular one for similar input. That's why some kind of sorting is important to bring the more relevant matching candidates to the start of the list. Luckily, that's already been figured out in flx, so to have it working just make sure that the flx package is installed.

>The sorting algorithm is a balance between word beginnings (abbreviation) and contiguous matches (substring).
>The longer the substring match, the higher it scores. This maps well to how we think about matching.
>In general, it's better form queries with only lowercase characters so the sorting algorithm can do something smart.
>Flx uses a complex matching heuristics which can be slow for large collections
>Customize flx-ido-threshold to change the collection size above which flx will revert to flex matching.
>As soon as the collection is narrowed below flx-ido-threshold, flx will kick in again.
>As a point of reference for a 2.3 GHz quad-core i7 processor, a value of 10000 still provides a reasonable completion experience.
>flx can benefit significantly from garbage collection tuning
>(setq gc-cons-threshold 20000000)
>https://github.com/lewang/flx

https://oremacs.com/2016/01/06/ivy-flx/

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
- https://github.com/jacktasia/beautiful-emacs/blob/master/init.org
- https://github.com/SkySkimmer/.emacs.d
- https://github.com/purcell/emacs.d/blob/master/lisp/init-ivy.el
- https://www.reddit.com/r/emacs/comments/5453d4/what_does_your_ivyswiper_configuration_look_like/