## Whats the genius idea?

benlwalker

Imagine you have a piece of software that runs in an event loop (as many things do). On each loop, queue up all system calls you'd like to perform. At the end of the loop, do one syscall to execute the batch. At the start of the loop, check if anything has completed and continue the operation.
If you're processing a set of sockets and on any given loop N are ready, then with epoll you do N+1 syscalls. With io_uring you do 1. It's independent of N.

klabb3

And the potential impact is huge! Not only are individual syscalls expensive on their own, and increasingly so (afaik) with spectre and security issues. You also need a thread to execute the call, which is several KB of memory, compound context switches, and (often overlooked) creating and destroying threads also come with syscall overhead.
Now, we’ve had epoll etc so it’s not novel in that respect. However, what’s truly novel is that it’s universal across syscalls, which makes it almost mechanical to port to a new platform. A lot of intricate questions of high-level API design simply go away and become more simple data layout questions. (I’m sure there are little devils hiding in the details, but still)

https://news.ycombinator.com/item?id=35549053
