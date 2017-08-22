>You can obtain similar quality in a C modern code-base, using tools like static and dynamic analyzers. In fact, today the hardest issues came from multi-threading. I won't even dare to write multi-threading apps without helgrind/TSAN.
And Rust doesn't help in this regard. From: https://doc.rust-lang.org/nomicon/races.html 'So it's perfectly "fine" for a Safe Rust program to get deadlocked or do something incredibly stupid with incorrect synchronization.'
>
>-- https://news.ycombinator.com/item?id=13317147

##

I cannot say the same due to lack of support for GUI toolkits, the way the borrow checker handles callbacks, or mixed debugging support.

What specifically do you mean by "the way the borrow checker handles callbacks"?

It is described in the Non-lexical lifetimes RFC under "Closure desugaring".

https://github.com/nikomatsakis/nll-rfc/blob/master/0000-nonlexical-lifetimes.md

Basically if you have a struct to represent, lets say a Window, and inside of it try to reference instance variables on a closure that would handle a button click for example, self will be moved.
There are a few workarounds, but all of them are less ergonomic than any mainstream GUI toolkit.

https://news.ycombinator.com/item?id=15051940
