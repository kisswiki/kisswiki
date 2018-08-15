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

## long lines

setting

`(setq-default bidi-display-reordering nil)`

improved my emacs setup performance greatly (for the very long lines situation)

https://www.reddit.com/r/emacs/comments/6ztnj9/what_are_the_things_that_you_do_not_like_in_emacs/dn08s4e/

## threads

concurrency support/threading is coming in the 26 release.


It is, but it's the only-one-thread-runs-at-the-same-time type of concurrency, so it won't help you keep emacs responsive by outsourcing work to background threads.


I don't know why exactly this approach was chosen, but you can find those kind of discussions on emacs-devel.

The new threads still have some benefits - they'll always yield control when waiting on input, so it's very easy to use them to implement IO heavy work, like communicating with a language server, or downloading packages, when most of the time is spent waiting on the download.


Existing elisp is written with the assumption that only one piece of code can be running at a time. Adding true concurrency is pretty much guaranteed to break a lot of existing code in very subtle and difficult-to-debug ways if that invariant were to no longer hold. Cooperative multitasking gets you some of the benefits without the nightmare compatibility issues.


From my POV (I did a lot of the work on this feature), the issue with true concurrency isn't the elisp, but rather the core. None of the basic data structures in Emacs are thread-safe. It's not even completely clear that the basics of the Lisp interpreter are.


>It's worth noting that threads don't introduce any problems in Elisp that were not already present with process filters.

In theory this is hard to argue with; preemption already exists. But in practice the code running inside a process filter is very limited; you don't see people writing process filters that do anything but the bare minimum I/O tasks. If we had general-purpose preemptive threads and people only used them for the same tasks as they currently use process filters for it would be unlikely to cause much trouble. But that seems unrealistic.

Anyway if we do get OS threads IMO it would make way more sense to keep distinct elisp environments that communicate over queues; this approach has allowed the love2d game engine to add true concurrency to Lua even tho the Lua VM can't support it on its own.


So you can perform CPU-intensive computation in Emacs? A good FFI system is a much better solution. Writing code that uses mutable data structures in an environment where anyone can modify anything at any time is a nightmare, and I'll be glad if it never happens in Emacs.

However, the hangs you see when talking to an external tool are only caused by people misunderstanding how to write network code in Emacs. I believe adding OS-level threads to elisp would make mistakes more common, not less. It's already possible to do what you want with the APIs that are in Emacs today.

For instance, mu4e and gnus both talk to external processes to get mail, but mu4e is built from an async-first perspective, and gnus isn't, and there's a huge difference in the responsiveness you feel between the two programs as a user.

https://www.reddit.com/r/emacs/comments/6ztnj9/what_are_the_things_that_you_do_not_like_in_emacs/

## profiling

If your Emacs is slow, you should find the package(s) which slow it down, e.g., with profiler.el, and report that as bugs to the respective developers.

- https://www.reddit.com/r/emacs/comments/6ztnj9/what_are_the_things_that_you_do_not_like_in_emacs/dmy16j7/
- https://stackoverflow.com/questions/568150/tips-for-profiling-misbehaving-emacs-lisp
- https://www.gnu.org/software/emacs/manual/html_node/elisp/Profiling.html
- https://www.emacswiki.org/emacs/ProfileDotEmacs
- https://www.emacswiki.org/emacs/EmacsLispProfiler
- https://emacs.stackexchange.com/questions/806/profile-a-command-by-wall-time
- https://oremacs.com/2015/02/24/emacs-speed-test/
- https://blog.d46.us/advanced-emacs-startup/
- https://stackoverflow.com/questions/6724471/git-slows-down-emacs-to-death-how-to-fix-this

## flyspell-lazy

- https://github.com/rolandwalker/flyspell-lazy
