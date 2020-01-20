Author of Jack:

Paul Davis
December 31, 2019 at 19:23

There’s some potentially misleading information here. Background: I’ve spent the last 20+ years writing low-latency realtime audio applications, technically cross-platform but focused on Linux.

If you care about low latency on any general purpose OS, you need to use a realtime scheduling policy. The default scheduling on these OS’s is intended to maximise some combination of bandwidth and/or fairness. Low latency requires ditching both of those in favor of limiting the maximum scheduling delay of a thread that is otherwise ready to run.

Measuring how long synchronization primitives take without SCHED_FIFO is illustrative, but only of why, if you care about scheduling latency, you need SCHED_FIFO. There are several alternative schedulers for Linux – none of them remove the need for SCHED_FIFO if latency is important.

It is absolutely not the case that using SCHED_FIFO automatically starves non-SCHED_FIFO threads. Scheduling policy is set per-thread, and SCHED_FIFO will only cause issues if the threads that use it really do “burn the CPU” (e.g. by using spinlocks). If you combine SCHED_FIFO with spinlocks you need to be absolutely certain that the locks have low contention and/or are held for extremely short periods (preferably just a few instructions). If you use mutexes (which ultimately devolve to futexes at the kernel level), the kernel will take care of you a little better, unless your SCHED_FIFO thread doesn’t block – if it doesn’t do that, that’s entirely on you. Blocking means making some sort of system call that will cause the scheduler to put the thread to sleep – could be a wait on a futex, waiting for data, or an explicit sleep.

In particular, this: “This was known for a while simply because audio can stutter on Linux when all cores are busy (which doesn’t happen on Windows)” is NOT true. Linux actually has better audio performance than Windows or macOS, but only if the app developer understands a few basic principles. One of them is using SCHED_FIFO appropriately.

Pro-audio/music creation scheduling is MUCH more demanding that video, and a bit more demanding than games. Linux handles this stuff just fine – it just gives you enough rope to shoot yourself in the foot if you don’t fully understand what you’re doing.

The default on Windows is better than the default on J. Random Linux Distribution. But the default on Windows is worse than the default on (e.g.) AVLinux, a distribution specifically tweaked for audio/media creation workflows. Linux doesn’t wear one hat, but instead is highly customizable for specific sorts of work. If you go read up on the steps necessary to “tune” a Window system for use as a digital audio workstation platform, you’ll find all the same stuff. macOS s better in this regard but almost entirely because apples fully controls the hardware (and they’ve been getting worse at this in recent years too – some recent versions couldn’t play audio without stuttering unless manually reconfigured)

- https://probablydance.com/2019/12/30/measuring-mutexes-spinlocks-and-how-bad-the-linux-scheduler-really-is/
- https://www.reddit.com/r/programming/comments/ekgx69/linus_reply_on_spinlocks_vs_mutexes/
