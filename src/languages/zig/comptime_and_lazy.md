That's the nice part, it can eliminate switch cases, for loops, while loops, and, or, and all forms of conditional control flow if it's comptime-known without changing the behaviour of the code. This also plays well with inline for, inline while, and switch (x) { inline else => |c| {} } which generate code where the captured value is comptime known; if comptime branching wasn't dealt with as such then you'd end up with code bloat when using the inline forms.
If it's a comptime constant by "mistake" then it would have resulted in the same wrong behaviour at runtime.

https://news.ycombinator.com/item?id=34750884
