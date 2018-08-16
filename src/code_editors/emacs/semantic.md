Semantic was a great idea, and was implemented quite well by the author. Unfortunately, he has lost interest for it, and there's no one willing to pick up the effort.

I've read a bit about language-server-protocol which seems like a promising solution. Just found [emacs-lsp](https://github.com/emacs-lsp/lsp-mode), which seems to work for Rust and Go. Hopefully, something comes up for C++ as well.

For example, I used Semantic to create a little refactoring tool for C++ and a code formatter for Lisp: https://github.com/tuhdo/semantic-refactor.

I tried to use it some time ago but it was unstable and slow. This goes for the rest of CEDET too, I've wasted quite a bit of time trying to make it work in my environment but I always come away extremely disappointed (if not angry due to time wasted).

In hindsight, and knowing all that, I would say that merging CEDET into Emacs was a terrible idea. It's a lot of code, monstrously complicated and hard to understand holistically and used to be a nightmare to configure and customize. It also comes across as very different compared to other good-quality Emacs libraries.

I don't even use EIEIO, preferring defstruct instead.

- https://www.reddit.com/r/emacs/comments/5yxxrl/what_is_that_status_of_semantic/
- https://writequit.org/denver-emacs/presentations/2017-02-21-semantic-mode.html
