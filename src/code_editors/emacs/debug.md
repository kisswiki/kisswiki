- https://emacs.stackexchange.com/questions/19703/how-to-debug-elisp-code-when-it-is-running
- http://emacslife.com/read-lisp-tweak-emacs/beginner-4-add-more-and-deal-with-errors.html

I don't have much experience with the debugger. I use only edebug, which is said to be better, and works by redefining functions that it instruments, so it's aware of the whole call stack.

https://oremacs.com/2015/07/16/callback-quit/