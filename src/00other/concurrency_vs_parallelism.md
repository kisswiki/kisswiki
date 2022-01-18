Concurrency is "these tasks do not necessarily have to be completed in the order in which they were written." Parallelism is "these tasks could be run at the same time."

You can imagine that if the order of completion doesn't matter then you can run the tasks at the same time, but this isn't a requirement of concurrency; just a nice bonus.

"Asynchronous" does not mean the same thing as "simultaneous". Concurrency = asynchronous tasks, parallelism = simultaneous tasks. It is often easy to run asynchronous tasks simultaneously, but that's an intersection of concurrency and parallelism and does not constitute concurrency on its own.

https://www.reddit.com/r/swift/comments/nzmky6/comment/h1qmxa4/
