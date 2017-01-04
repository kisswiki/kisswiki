>You can obtain similar quality in a C modern code-base, using tools like static and dynamic analyzers. In fact, today the hardest issues came from multi-threading. I won't even dare to write multi-threading apps without helgrind/TSAN.
And Rust doesn't help in this regard. From: https://doc.rust-lang.org/nomicon/races.html 'So it's perfectly "fine" for a Safe Rust program to get deadlocked or do something incredibly stupid with incorrect synchronization.'
>
>-- https://news.ycombinator.com/item?id=13317147
