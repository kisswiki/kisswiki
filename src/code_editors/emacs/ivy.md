## What and why

- for completion in contexts: code, menus, commands, variables, functions, etc.
- listing, sorting, filtering, previewing, and applying actions on selected items
- completes the selection process by narrowing available choices while previewing in the minibuffer
- simple keyboard character inputs or through powerful regular expressions
- Ivy is for quick and easy selection from a list. When Emacs prompts for a string from a list of several possible choices, Ivy springs into action to assist in narrowing and picking the right string from a vast number of choices.
- Ivy shows the completion defaults, the number of matches, and 10 candidate matches below the input line.

http://oremacs.com/swiper/

## Counsel

It is for configuring specific modes, like for projectile.

## ivy-minibuffer-map

Use it to specifiy keyboard mapping for minibuffer.

## find file down in directories

`counsel-file-jump` lists all files below parent directory. But first use `counsel-find-file` to select a parent directory.

`counsel-locate` lists all matching directory and file names from Linux root.

- https://emacs.stackexchange.com/questions/33745/how-to-find-file-name-a-few-levels-down-in-directory
- https://oremacs.com/2015/07/02/counsel-locate/

Looks like projectile-find-file and counsel-git should work the same.

## Config

When `(ivy-mode 1)`, `("M-x" . counsel-M-x)`.

When:

```lisp
(use-package counsel
   :defer t
   :straight t)
```

other keyboard mapping will be activated, like `("C-x C-f" . counsel-find-file)` or `("C-h v" . counsel-describe-variable)`.

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