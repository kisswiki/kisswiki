- If all you want to do is to wait for a process to finish, you should probably not use sleep-for at all. Instead call the process synchronously, not asynchronously https://stackoverflow.com/questions/6578373/sleep-in-emacs-lisp/6580546#6580546
- https://emacs.stackexchange.com/questions/28228/how-to-show-a-message-in-the-echo-area-not-immediately-but-after-a-certain-delay

```lisp
          (while (not (file-directory-p parent-directory))
              (sleep-for 1)))
```

https://stackoverflow.com/questions/20746231/sleep-for-within-while-loop-is-ignored