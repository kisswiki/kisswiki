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

https://lobste.rs/s/oicggq/go_s_error_handling_is_perfect_actually#c_h7tzdv
