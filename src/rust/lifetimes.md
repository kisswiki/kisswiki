Trangar@irc.mozilla.org


With `fn some_func(val: &str) -> &str;`, the compiler assumes the returning &str is dependant on val, so it turns it in `fn some_func<'a>(val: &'a str) -> &'a str;`
