Without the else there would be no way to capture the err value, which is the main reason that loops have the else clause.

For loops don't capture error values. But the control flow is the same with `else` on all 7 of these:

```
if bool
if optional
if error union
while bool
while optional
while error union
for
```

my point is that the "while error union" example is the reasoning for `else` existing on loops at all. everything else is for consistency.

https://github.com/ziglang/zig/issues/2614
