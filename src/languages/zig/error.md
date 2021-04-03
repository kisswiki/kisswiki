Because Zig treats error types specially, when using errors you get a bunch of nice features, such as ! error-set inference, try/catch, and errdefer; you currently lose these features if you want to return extra diagnostic information since that information is no longer an error type.

I'm currently writing code with a very many number of exit points which throw an error and are required to also set a message, and being diligent to always do both is dragging on me.

In addition, this is already kind of a problem -- if two independently maintained error sets both coincidentally (i.e., without coordinating with each other) choose the same error name, a caller of a function which propagates both error sets can't distinguish between the two error cases (I am assuming that since they were chosen without coordination, they don't [necessarily] indicate the same kind of recovery must be done), which can result in incorrect error recovery.

- [Allow returning a value with an error · Issue #2647 · ziglang/zig](https://github.com/ziglang/zig/issues/2647#issuecomment-678553855)
- [Error messages should use a mutex · Issue #7859 · ziglang/zig](https://github.com/ziglang/zig/issues/7859)

## Using normal union instead of error union

happyalu
—
31.03.2021
is there an example somewhere for option 1 (using actual union instead of error union)?

sorry; Still figuring out how to do errors correctly/idiomatically in zig. also looking at the context struct approach.

Lia
—
31.03.2021
e.g. declare a type like this:

```zig
const ThingResult = union(enum) {
    Success: u32, // whatever the success value is
    Error: ThingError,
};
```

happyalu
—
31.03.2021
Would this still work with the concept errorsets, e.g. exhaustive switch ?
jumpnbrownweasel
—
31.03.2021
I believe it's just a regular union(enum) and not treated as an error WRT the language. For example, errdefer will not apply to returning this as an error.
happyalu
—
31.03.2021
thanks for the example. i was wondering if this would work with try, errdefer, etc.
fengb
—
31.03.2021
It will not
