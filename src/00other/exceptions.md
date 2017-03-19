- exceptions are basically GOTO in disguise https://www.reddit.com/r/programming/comments/5zq1cj/error_handling_exception_or_result/df0c05y/
- Exceptions (in Java and C++) are like non-local goto statements http://wiki.c2.com/?DontUseExceptionsForFlowControl
- http://wiki.c2.com/?GotoConsideredHarmful

## C

The use cases for goto I see are primarily complex/thorough error handling (e.g. unwinding some concurrency control mechanisms) and certain low-level state machine patterns.

And C doesn't have exceptions, which otherwise would cover a lot of where goto's are used.

There is a difference though. Exceptions can result in Stack Unwinding which is costly. Gotos are a jump which costs literally nothing.

In practice you will do the same thing as unwinding the stack. You'll jump to the end of a function where you'll likely free some heap buffers on your way out and you'll return error status to the caller. What will likely happen next is the caller will bubble up the error: free buffers and report error status to their caller. It works out to pretty much the same thing as a modern C++ code base using RAII, just more manual.

https://news.ycombinator.com/item?id=8760733
