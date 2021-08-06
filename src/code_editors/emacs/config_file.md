Start in safe mode `emacs -Q`

## TODO: Read

- https://github.com/bbatsov/crux
  - http://emacsredux.com/blog/2016/01/30/crux/
- https://github.com/technomancy/better-defaults
- https://jamiecollinson.com/blog/my-emacs-config/
- http://danzig.jct.ac.il/unix_class/emacs-vi-Commands.html
- https://sites.google.com/site/steveyegge2/effective-emacs
- https://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs

## distributions/starter kits

- https://github.com/redguardtoo/emacs.d
  - he is maintaining https://github.com/technomancy/find-file-in-project
  - is using https://github.com/noctuid/general.el
  - created this https://github.com/redguardtoo/mastering-emacs-in-one-year-guide
  - he prevers flymake over flycheck https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/guide-en.org#my-favorite-emacs-addons
- https://github.com/bbatsov/emacs.d
- https://github.com/emacs-tw/awesome-emacs#starter-kit
- https://writequit.org/eos/eos.html
- https://github.com/raxod502/radian
- http://spacemacs.org/
- https://github.com/bbatsov/prelude
- author of use-package https://github.com/jwiegley/dot-emacs
- https://github.com/purcell/emacs.d
- https://github.com/technomancy/emacs-starter-kit
  - https://github.com/technomancy/better-defaults
- https://github.com/rdallasgray/graphene
- https://github.com/magnars/.emacs.d/
- https://www.emacswiki.org/emacs/StarterKits
- http://ergoemacs.org/misc/list_of_emacs_starter_kits.html
- http://wikemacs.org/wiki/Starter_Kits
- generate for different programming languages http://emacs-bootstrap.com/
- https://www.reddit.com/r/emacs/comments/4zrfin/emacs_for_starters_which_to_use_spacemacs_prelude/
- https://www.reddit.com/r/emacs/comments/1udtd1/starting_emacs_with_preludestarter_kits_scares_me/
- https://www.emacswiki.org/emacs/CategoryDotEmacs
- https://github.com/search?o=desc&q=Emacs&s=stars&type=Repositories
- https://jamiecollinson.com/blog/my-emacs-config/
- https://www.emacswiki.org/emacs/EmacsNiftyTricks
- https://www.christopherbiscardi.com/post/emacs-command-frequency-2017/
- http://coldnew.github.io/coldnew-emacs/
- http://pages.sachachua.com/.emacs.d/Sacha.html
- http://www.wilfred.me.uk/.emacs.d/init.html
- https://github.com/wasamasa/dotemacs/blob/master/TODO.org#learn-from-other-peoples-emacs-configurations
- https://github.com/Alexander-Miller/dotfiles/blob/master/.config/spacemacs/user-config.org
- https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org#22-point
- http://www.bartuka.com/emacs/2018/02/02/bartuka's-emacs-config.html
- Cool And Useful Things for your Init File https://www.emacswiki.org/emacs/DotEmacsChallenge
- http://home.thep.lu.se/~karlf/emacs.html
- https://github.com/bodil/ohai-emacs
- https://github.com/seagle0128/.emacs.d

## Location

It should be stored in the variable `user-init-file`. Use `C-H v user-init-file RET` to check.

- https://stackoverflow.com/questions/189490/where-can-i-find-my-emacs-file-for-emacs-running-on-windows
- https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html

`sudo strace -o /tmp/emacs.txt -e open emacs`

https://stackoverflow.com/questions/864892/how-do-i-find-which-emacs-file-has-been-loaded/864939#864939

## multiple config directories

- https://emacs.stackexchange.com/questions/4253/how-to-start-emacs-with-a-custom-user-emacs-directory/4258
- https://emacs.stackexchange.com/questions/19936/running-spacemacs-alongside-regular-emacs-how-to-keep-a-separate-emacs-d/20508#20508

## Open file

```lisp
(defun open-user-init-file ()
  (interactive)
  (find-file user-init-file))
```

Open it directly by using `M-x eval-expression RET (find-file user-init-file) RET`.

https://stackoverflow.com/questions/189490/where-can-i-find-my-emacs-file-for-emacs-running-on-windows

## Reload currently edited config

You can use the command load-file (`M-x load-file`, then press return twice to accept the default filename, which is the current file being edited).

Or

Define it in your init file and call by` M-x reload-user-init-file`

```lisp
(defun reload-user-init-file()
  (interactive)
  (load-file user-init-file))
```

https://stackoverflow.com/questions/2580650/how-can-i-reload-emacs-after-changing-it

## .emacs vs .emacs.d/init.el

- https://emacs.stackexchange.com/questions/1/are-there-any-advantages-to-using-emacs-d-init-el-instead-of-emacs

## customize

- http://ergoemacs.org/emacs/emacs_custom_system.html
- https://www.emacswiki.org/emacs/CustomizingAndSaving

If you use custom-set-variables or customize-set-variable instead of setq, or if you use the Customize user interface (e.g. M-x customize-option), then you are sure that any intended initialization or updating code that is needed for the option value will be automatically triggered and run as needed. If you use setq, this will not be done.

https://emacs.stackexchange.com/questions/102/advantages-of-setting-variables-with-setq-instead-of-custom-el

The odds of this working are higher when the options are customized using a custom-set-variables form, but this has to be implemented explicitly for each and every option. And so far we have only talked about major modes and their options...

https://emacs.stackexchange.com/questions/635/whats-the-fastest-way-to-reload-my-emacs-file-when-i-make-changes-so-all-my-af

### Disable customize

```lisp
(setq custom-file (concat user-emacs-directory "/dev/null"))
(load custom-file t)
```

or maybe better:

```lisp
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
```

- https://stackoverflow.com/questions/5052088/what-is-custom-set-variables-and-faces-in-my-emacs/5058752#5058752
- https://www.reddit.com/r/emacs/comments/5udtw1/usepackageel_about_to_be_moved_to_emacs_core/ddto9mh/

## Errors/Debug

If it seems like your init file is not being read, type ‘C-h e’ to see if there is a chance there was a problem with it loading. See [DebugFileLoading](https://www.emacswiki.org/emacs/DebugFileLoading) for more troubleshooting tips.

https://www.emacswiki.org/emacs/InitFile

### TOREAD

- https://swsnr.de/posts/emacs-script-pitfalls/
- https://stackoverflow.com/questions/2087532/troubleshooting-techniques-for-emacs-and-emacs-lisp
- https://emacs.stackexchange.com/questions/19578/list-hooks-that-will-run-after-command
- https://stackoverflow.com/questions/25512527/emacs-symbols-value-as-variable-is-void
- https://stackoverflow.com/questions/14067524/how-to-show-backtrace-for-emacs
- https://stackoverflow.com/questions/26597467/elisp-possible-to-automatically-open-emacs-init-file-if-error-at-start-up/26611347#26611347
- https://emacs.stackexchange.com/questions/35841/debug-an-elisp-error-show-call-stack-when-an-error-occurs
- https://emacs.stackexchange.com/questions/7852/show-line-number-on-error
- https://emacs.stackexchange.com/questions/21280/break-on-all-errors-in-edebug
- https://emacs.stackexchange.com/questions/36433/obtaining-a-backtrace-on-batch-invocation-of-emacs

### Tracking variable modification

in Emacs 26.1 do `M-x debug-watch <variable> RET`

https://emacs.stackexchange.com/questions/27962/tracking-down-a-write-to-a-variable

## The first line should be of the form

```lisp
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
```

https://emacs.stackexchange.com/questions/21664/how-to-prevent-flycheck-from-treating-my-init-el-as-a-package-file

## Use with-eval-after-load instead of eval-after-load

https://stackoverflow.com/questions/21880139/what-is-with-eval-after-load-in-emacs-lisp

## user-emacs-directory

```bash
$ emacs -Q --batch --eval="(princ user-emacs-directory)"
~/.emacs.d/
```

https://stackoverflow.com/questions/36754044/how-to-get-value-of-user-emacs-directory-from-shell

## add-hook

- http://ergoemacs.org/emacs/emacs_avoid_lambda_in_hook.html

## Modularization

To load the file only if it hasn’t been loaded already, use ‘require’.

```
(require 'foo)
```

Using ‘require’ adds a dependency: Not only must a file with the same name (plus “.el” or “.elc” extension) exist, but in that file, Emacs wants to see a statement such as this:

```lisp
(provide 'foo)
```

Note that when you start using files in the LoadPath, you may end up having to deal with ConflictingLibraries.

- https://www.emacswiki.org/emacs/LoadingLispFiles
- http://ergoemacs.org/emacs/elisp_library_system.html
- https://www.gnu.org/software/emacs/manual/html_node/elisp/Named-Features.html
- using `load` instead of `require` https://github.com/ramimassoud/emacs-cask/blob/master/init.el
- https://github.com/tonini/emacs.d
- https://www.reddit.com/r/emacs/comments/3q50do/best_way_organization_config_files_in_the_emacs/
- https://lonelycoding.com/how-to-modularize-an-emacs-configuration/
- https://www.reddit.com/r/emacs/comments/7guxri/i_declare_emacs_bankruptcy_suggestions_for/dqmhrj4/
- https://www.emacswiki.org/emacs/DotEmacsStructuring
- https://www.reddit.com/r/emacs/comments/7nn55s/creating_an_organized_emacs_configuration/
- https://www.reddit.com/r/emacs/comments/6l4xob/managing_your_init_files/

## Debug and stack trace

`--debug-init`

https://github.com/jwiegley/use-package/issues/190#issuecomment-348243571

## Profile and benchmark

This is to easily profile your Emacs init file (or any other
script-like Emacs Lisp file, for that matter).

It will go over all sexp's (balanced expressions) in the file and
run them through `benchmark-run'. It will then show the file with
overlays applied in a way that let you easily find out which sexp's
take the most time. Since time is relative, it's not the absolute
value that counts but the percentage of the total running time.

https://github.com/raxod502/profile-dotemacs/blob/master/profile-dotemacs.el

## org-mode

- https://github.com/vidjuheffex/dotemacs/blob/master/emacs.org
- for straight.el you need special configuration https://github.com/raxod502/straight.el/issues/9#issuecomment-337700460
- https://emacs.stackexchange.com/questions/3143/can-i-use-org-mode-to-structure-my-emacs-or-other-el-configuration-file

## sharp quote or pound quote `#'`

```lisp
(eq 'my-add #'my-add)
```

yields `t`.

Other than trying to support Emacs versions from two decades ago, there's never a reason to sharp quote a lambda.

- https://stackoverflow.com/questions/2701698/emacs-elisp-what-is-the-hash-pound-number-sign-octothorp-symbol-used-for
- https://emacs.stackexchange.com/questions/3595/when-to-sharp-quote-a-lambda-expression

## quote `'`

https://stackoverflow.com/questions/134887/when-to-use-or-quote-in-lisp

## setq-local

- https://emacs.stackexchange.com/questions/24940/what-does-setq-local-do-and-when-should-i-use-it

## Run hook after some hook

- https://emacs.stackexchange.com/questions/39035/how-to-run-a-prog-mode-hook-after-more-specific-hooks

## progn

- https://www.gnu.org/software/emacs/manual/html_node/eintr/progn.html

## how to check if on windows

https://emacs.stackexchange.com/questions/28772/manage-same-init-file-for-linux-and-windows
