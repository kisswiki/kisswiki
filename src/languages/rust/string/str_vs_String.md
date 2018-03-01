- https://www.reddit.com/r/rust/comments/5t5zq1/when_to_use_str_over_string_in_a_struct/
- https://stackoverflow.com/questions/24158114/what-are-the-differences-between-rusts-string-and-str/
- http://www.ameyalokare.com/rust/2017/10/12/rust-str-vs-String.html

##

For `String` and `&str` the situation is the same. `String` is for storing string values in the sense that a variable of this type owns that value. `&str` is for borrowing them.

https://stackoverflow.com/questions/28800121/use-of-moved-values

##

`&str` and `String` are both pointers to a string, but &str means “this does not need to be freed” and `String` means “this needs a call to `free()` when you’re done with it” (you don’t call that `free()`, but Rust does it for you).

So if you do `&foo.to_string()` you’re `malloc()`-ing a new `String`, and then trying to return a value that says to never `free()` it, so Rust protests, because you’re about to create a memory leak or use-after-free bug.

If a function allocates a new object, it has to return the object, rather than a reference to it. If function sometimes allocates, sometimes borrows, there’s Cow wrapper that carries a flag that tracks whether it needs to be freed or not.

https://users.rust-lang.org/t/borrowed-value-must-be-valid-for-the-lifetime-wtf/12017/3?u=rofrol

##

String is equivalent to C’s `malloc()`-ed string that needs to be `free()`d, and `&str` is `const char *` that can be anything (on stack, in ROM, etc.)

In C that would be:

```c
/** Do *not* call free() on this pointer */
const char *description(const Self *self);
```

And your question becomes equivalent of “how can I use `malloc()` in description and return it as a pointer that is never `free()`d?”. So the only options are return something that’s already in `self`, or leak memory.

https://users.rust-lang.org/t/solved-how-to-return-str-from-format/12838/3?u=rofrol

##

fn `description(&self) -> &str` returns either a reference that’s tied to the lifetime of `self` or a `'static` reference. So the non-elided signature is `fn description<'a>(&'a self) -> &'a str`. But `'static` is a subtype of `'a` (i.e. a longer lifetime can be substituted for a shorter one), so you can also return `'static` there. Note this subtype relationship is true only for immutable references.

If you had `fn bar() -> &str` then that really is `fn bar() -> &'static str` because there’s no input lifetime to associate with the output one.

https://users.rust-lang.org/t/solved-how-to-return-str-from-format/12838/6?u=rofrol