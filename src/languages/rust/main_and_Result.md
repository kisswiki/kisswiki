`try!` is a macro that returns `Err`s automatically; `?` is syntax that does the same thing. Both can only be used in functions that return a Result (until RFC 1859 is implemented). main doesn't return any value (until RFC 1937 is implemented).

- https://stackoverflow.com/questions/30555477/why-do-try-and-not-compile-when-used-in-main
- https://github.com/rust-lang/rfcs/blob/master/text/1859-try-trait.md
- https://github.com/rust-lang/rfcs/blob/master/text/1937-ques-in-main.md