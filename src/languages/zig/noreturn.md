## What is this noreturn?

rofrol

I can use like this:

`const no_error = maybe_error catch return;` and the value of `no_error` would be `noreturn`.

But where is it useful?

How `while(true) {}` can be used as `noreturn`? I don't understand it. What's the use of it?

I've encountered it while reading https://ziglearn.org/chapter-1/.

Also this https://ziglang.org/documentation/master/#noreturn

InKryption

the type of `no_error` won't be `noreturn`

the type of `no_error` is the payload of `maybe_error` (the `T` in `E!T`)

`noreturn` is simply a type that represents what is known in many languages as the type system's "bottom" type, that is to say, the complete "lack" of a value

a return expression is of type `noreturn` because the expression it evaluates doesn't "give" anything.

compare it to something like `3 + 2`: it's an expression that evaluates to `comptime_int`, and can be assigned to a variable

but for `return`, it never gets a chance to be assigned to anything, because when it's evaluated, it changes the control flow

this is useful, because it allows us to use control flow statements as expressions, which is what allows you to do `catch return` in the first place

if control flow statements couldn't be evaluated as expressions, then you'd always have to do stuff like

```zig
if (maybe_error) |payload| {
    // -- snip --
} else |err| {
    return err;
}
```

rofrol

What about void?

How is it related?

Also what does it mean that noreturn is the type of `while (true) {}`?

Ok, so when `noreturn` is evaluated it changes control flow, so we don't bother with expression value here?

I also saw that it is used as return type of function:

```zig
pub fn exit(code: u8) noreturn {
    Output.flush();
    std.os.exit(code);
}
```

https://github.com/oven-sh/bun/blob/e7cd45d0fa3f381238ea2ebfbba2d9e738376fcc/src/__global.zig#L64

InKryption

yes, that means the function will never return - or well, that it should never return

`std.os.exit` basically uses a target-dependent mechanism to end the program with that exit code

the compiler uses also noreturn expressions as optimisation/safety hints

rofrol

What about `while(true) {}`? When does it happens that it is `noreturn`?

I can't imagine it yet 🙂

InKryption

in safe modes, if a `noreturn` expression returns, it will try to panic about it

in unsafe modes, the compiler assumes it can never return, and thus optimises using that assumption

that happens when the control flow of the `while` loop doesn't loop over any statements/expressions that could make it stop

`while(true) {}` is `noreturn`

`while(true) { break; }` is `void`

`while(true) { if (cond) break; }` is `void`

`while(true) { if (comptime cond) break; }` is `void` if `cond = true`, and `noreturn` if `cond = false`

should also be noted, `while(true) { if (cond) return; }` is `noreturn`, because even though `return;` technically breaks out of the `while` loop, it doesn't actually break the `while` loop - you can think of it like `return` being the "resulting" expression of the `while` loop, which would thusly make it of type `noreturn`

this is also useful because `while` loops can also be expressions. e.g.

```
const value: u32 = while (true) {
if (cond) break;
if (cond2) continue;
break 3; // returns `3` from the while loop
} else return;
```

essentially, most of this comes down to utility

codifying `noreturn` as a type instead of as some confabulation of illegal control flow like in C, makes a lot of code way more flexible

rofrol

Oh, that was the missing piece. I didn't know I can use while as an expression 😄

InKryption

you can also use `for` as an expression

I recommend skimming over the docs starting here: https://ziglang.org/documentation/master/#Blocks

https://discord.com/channels/605571803288698900/1075832468634091691

## while, for and capture error

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
