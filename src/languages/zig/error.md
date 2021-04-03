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
Lia
—
31.03.2021
hm, yeah. my first pass would be just to throw the specific information away (return error.InvalidByte). once it became clear i'd really need that info, i'd then move to returning a union like above with const DecodeError = union(enum) { InvalidByte: u8, ... };.
if the error has enough information it needs an allocator, i'd pass it to the decode function -- whatever calls it can then free the error return if it is an error return
(i'd probably add a fn deinit to the DecodeError union enum so the information on how to clean it up is kept in one place)
ideally we'd get away without any allocating for the error case, but of course if you want very rich error reporting sometimes you'll need to
you could also consider just taking a error_msg: []u8 buffer if you don't care about semantics and just want a nice message
so it could be like this:
hmm, it gets awkward because we can't return the length of the error message.

const DecodeError = error{InvalidByte};
fn decode(data: []const u8, error_buf: []u8) DecodeError!Data {
// ... do decoding work ...
if (!badSomehow(b)) {
std.fmt.bufPrint(error_buf, "invalid byte {} in data", .{b});
return error.InvalidByte;
}
// ...
}

// later:
fn something() {
var error: [64]u8 = undefined;
const decoded = decode(data, &error) catch |err| {
std.debug.print("got error {}: {s}\n", .{err, error});
return;
};
}

i was thinking like this
but we don't know how many bytes in error are valid. you might have to bufPrint a sentinel at the end!
this is also missing a fair few bits and pieces to actually compile, but you might get the general idea
happyalu
—
31.03.2021
:slight_smile: thanks this is very useful.
Lia
—
31.03.2021
you could even use a static global buffer instead, if it's single-threaded, and then have the signature of decode be fn decode(data: []const u8, error_msg: _[]const u8) DecodeError!Data instead. then you could write back the result of std.fmt.bufPrint to error_msg._ in case of corresponding error.
you're welcome
jumpnbrownweasel
—
31.03.2021
Rust returns can errors as simple structs (no allocation needed), but these structs can have a method for formatting the error message using the info in the struct. This works out really well, and maybe Zig will have something like this in the future (who knows). But even for now, you can return info in a struct or union and format it when needed to avoid allocation.
Lia
—
31.03.2021
indeed. the problem is we give up errdefer when we do it that way, which is a shame.
jumpnbrownweasel
—
31.03.2021
Yes, that's why I hope Zig eventually has error "data".
Lia
—
31.03.2021
i sometimes feel that way, but i do like the simplicity of the current way.
jumpnbrownweasel
—
31.03.2021
Yes, and Zig doesn't have this right now which is the main thing. If a global buffer or context struct works out, that's a solution that still allows using Zig errors as they are.
Lia
—
31.03.2021
ya :)
happyalu
—
31.03.2021
if writing a library, the singlethread assumption might be hard;
Lia
—
31.03.2021
indeed. i suppose you could use a thread local but probably better to take the error buf as input somehow (or allocator).
jumpnbrownweasel
—
31.03.2021
However you do it, avoiding allocation is still very desirable. So using the approach where the error struct has a method for formatting the message could be used.
happyalu
—
31.03.2021
a way to implement error data would be nice too :slight_smile: that would allow wrapping errors more easily, i suppose.

"encode failed: write error: out of space"
jumpnbrownweasel
—
31.03.2021
If they can be static strings, that makes it a lot easier. You can just use the built-in errors, and then use a switch or maybe a lookup array to get the message from the error code.
happyalu
—
31.03.2021
perror-like :slight_smile:
but i think from an end-user's perspective dynamic errors could sometimes be more helpful,
Lia
—
31.03.2021
the nice thing about using a format function on a user-defined error type is that you can give dynamic errors without necessitating the use of an allocator
if the user just has a buffer on the stack they can format into that, no problems
jumpnbrownweasel
—
31.03.2021
Sometimes the reason for wanting dynamic error messages is mainly for debugging, so yet another option is to log a detailed message and return the error code. This isn't always ideal, but may be an option to consider.
happyalu
—
31.03.2021
also found this https://github.com/ziglang/zig/issues/2647
GitHub
Allow returning a value with an error · Issue #2647 · ziglang/zig
Sometimes when a function fails, there is extra information that you have on hand that may help the caller respond to the problem or produce a diagnostic. For example, in the parseU64 example by an...
jumpnbrownweasel
—
31.03.2021
Note that it is a "proposal" but not "accepted" , so we shouldn't count on it.
Lia
—
31.03.2021
hah, i finished reading the re-stated proposal halfway down, thought of a problem, and then eleanor immediately sets it out right after
jumpnbrownweasel
—
31.03.2021
seems like the bottom line is that it will be difficult to do and keep the simplicity of the current approach. good one to watch...
