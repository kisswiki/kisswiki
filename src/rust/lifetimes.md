Trangar@irc.mozilla.org:

You always have lifetimes, but normally the compiler then elide them 
Lifetimes are mostly used when you return a reference, to tell the compiler what the return value is dependant on 

With `fn some_func(val: &str) -> &str;`, the compiler assumes the returning `&str` is dependant on `val`, so it turns it in `fn some_func<'a>(val: &'a str) -> &'a str;`
