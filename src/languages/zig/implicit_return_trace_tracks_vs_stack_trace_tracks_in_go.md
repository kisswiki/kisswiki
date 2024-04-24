mk12 avatar

IMO the killer feature of Zig’s error handling that no other language has is error return traces. You get a stack trace and a trace of how the error propagated to that spot, for free. In Go you would have to do fmt.Errorf("function foo: %w", err) every single time you return an error to get similar information.

https://ziglang.org/documentation/master/#Error-Return-Traces

gf0

How is it different than a standard exception stacktrace?

StevenAndrewCoffman

Where a stack trace tracks the code path that led to an error, a return trace tracks the code path that the error took to get to the user. Often these are the same path, but in Go they can diverge, since errors are values that can be transported across goroutines (e.g. with channels). When that happens, a return trace can be more useful than a stack trace.

With stack traces, caller information for the goroutine is captured once when the error is created.

In constrast, errtrace records the caller information incrementally, following the return path the error takes to get to the user. This approach works even if the error isn’t propagated directly through function returns, and across goroutines.

Since it only captures a frame at a time, it performs much better than stacktrace (entire stack) per wrapped error.

byroot

Ruby handle that no problem

gf0

But the claimed error trace is not different from an exception stacktrace in, say, java.

You don’t add it to every function, most functions don’t handle error cases, exceptions just bubble through them. You only have to do any form of “bookkeeping” when you explicitly catch an exception (that is, stop it in its track), and you throw another exception from there. Then it most often makes sense to attach the exception responsible for getting there in the first place. But this is mostly an API boundary task, not at all common code to worry about it being a nuisance.

https://lobste.rs/s/oicggq/go_s_error_handling_is_perfect_actually#c_h7tzdv

gf0

Go’s error handling is only marginally better than C’s, and both of them are far below any other mainstream language’s, both exceptions and sum typed ones.

It’s literally checking for errno, I thought we were well past that phase. It makes the business logic hard to follow, while trains the eyes to disregard the actual error handling logic (you learn to skip the if err part). Plus, makes it easy to “handle” the error cases with useless, lazy attempts, like printing some error message you have to grep for in the code base.. a stacktrace is million times more useful.

https://lobste.rs/s/oicggq/go_s_error_handling_is_perfect_actually#c_9t94ei
