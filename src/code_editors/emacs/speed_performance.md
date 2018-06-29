`M-: (emacs-init-time)`


- http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
- benchmark and garbage collection https://github.com/lewang/flx#gc-optimization
- https://www.emacswiki.org/emacs/OptimizingEmacsStartup
- Emacs in RAM http://blog.binchen.org/posts/emacs-speed-up-1000.html
- Maybe this https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag

## Byte compilation

- https://www.reddit.com/r/emacs/comments/583ipe/speeding_up_emacs/
- https://www.gnu.org/software/emacs/manual/html_node/elisp/Speed-of-Byte_002dCode.html

## Garbage Collection

`(setq gc-cons-threshold most-positive-fixnum)`

`(setq gc-cons-threshold 20000000000)`

- https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/

### Disable GC for certain modes

```lisp
(defvar helm-ido-like-user-gc-setting nil)

(defun helm-ido-like-higher-gc ()
  (setq helm-ido-like-user-gc-setting gc-cons-threshold)
  (setq gc-cons-threshold most-positive-fixnum))

(defun helm-ido-like-lower-gc ()
  (setq gc-cons-threshold helm-ido-like-user-gc-setting))

(defun helm-ido-like-load-fuzzy-enhancements ()
  (add-hook 'minibuffer-setup-hook #'helm-ido-like-higher-gc)
  (add-hook 'minibuffer-exit-hook #'helm-ido-like-lower-gc))
```

https://www.reddit.com/r/emacs/comments/583ipe/speeding_up_emacs/d8x49jp/

## Unresponsive

- https://emacs.stackexchange.com/questions/5410/how-to-kill-a-buffer-when-it-causes-emacs-to-stop-responding
- https://emacs.stackexchange.com/questions/5545/how-to-prevent-slow-down-when-an-inferior-processes-generates-long-lines

## Troubleshoot / Investigation

- https://emacs.stackexchange.com/questions/5359/how-can-i-troubleshoot-a-very-slow-emacs
- https://www.spacjer.com/blog/2018/03/02/why-is-my-emacs-slow/

```lisp
profile:
    emacs -Q -l git/profile-dotemacs/profile-dotemacs.el \
    --eval "(setq profile-dotemacs-file \
        (setq load-file-name \"$(abspath init.el)\"))" \
    -f profile-dotemacs
```

https://oremacs.com/2015/02/24/emacs-speed-test/

## Profiling

I suggest you try M-x profiler-start RET RET, then reproduce the slow behavior (maybe even a few times, since this is a sampling-based profiler), then M-x profiler-report RET. Then C-u RET on the first entry should hopefully show you where time is spent.

As for the crash: any crash is a very likely sign of a bug in Emacs, so M-x report-emacs-bug.


Do M-x toggle-debug-on-quit, and then hit C-g during the next lag. You'll get a backtrace that includes the command/function being evaluated at this time, and typically there's some suspicious function whose name gives the plugin away, which causes the lags.

- https://stackoverflow.com/questions/25318722/emacs-slow-and-lags-often-how-to-debug
