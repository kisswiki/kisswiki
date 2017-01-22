>IO is extremely well managed. This is part of why Elm is so incredibly pure and safe. There is nothing like liftIO or unsafePerformIO or any such thing in the language. Elm code is almost never Monadic (this should be a good smell nay saying Haskellers), and since we can’t cheat, this means IO is never performed in the middle of code. This makes it trivial to track down side effects.
>
>-- http://mutanatum.com/posts/2017-01-12-Browser-FP-Head-to-Head.html
