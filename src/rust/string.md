> String owns its contents, while &str is only borrowing them.
If you are dynamically creating a string and returning it, you generally need to use a String. If you are returning a slice of some previously-existing string, you may be able to return &str.
&str does not own any storage; it's just a view into some other data, usually a static string literal or some String variable.
> -- https://www.reddit.com/r/rust/comments/2y2bd6/convention_for_returning_strings_str_or_string/
