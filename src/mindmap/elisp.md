- setf
  - https://www.gnu.org/software/emacs/manual/html_node/elisp/Setting-Generalized-Variables.html
- alist-get and setf
  ```
  (setf (alist-get 'prettier apheleia-formatters)
  ;;      '("yarn" "prettier"
  ;;         ;; "--trailing-comma"  "es5"
  ;;         ;; "--bracket-spacing" "true"
  ;;         ;; "--single-quote"    "true"
  ;;         ;; "--semi"            "false"
  ;;         ;; "--print-width"     "100"
  ;;         filepath))
  ```
  - https://www.gnu.org/software/emacs/manual/html_node/elisp/Association-Lists.html#index-alist_002dget
- setq vs let
  - setq pollutes global scope, when variable does not exist, it's up to implementation if variable will be created
    - https://stackoverflow.com/questions/19067632/difference-between-let-and-setq
    - https://emacs.stackexchange.com/questions/24678/kill-the-current-line-and-preserving-cursor-position/49060#comment76072_49060
