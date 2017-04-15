Trangar@irc.mozilla.org:

You always have lifetimes, but normally the compiler then elide them.

Lifetimes are mostly used when you return a reference, to tell the compiler what the return value is dependant on.

With `fn some_func(val: &str) -> &str;`, the compiler assumes the returning `&str` is dependant on `val`, so it turns it in `fn some_func<'a>(val: &'a str) -> &'a str;`

But if you have `fn some_func(val1: &str, val2: &str) -> &str;` it doesn't know what the return value is dependant on 
So it just assumes the return value is dependant on both, or it has the same lifetime as both: `fn some_func<'a>(val1: &'a str, val2: &'a str) -> &'a str;` 
And sometimes that assumption is wrong and you want to correct it 

And you hardly ever have to specify lifetimes 
There's almost always another way 
But references are usually faster, but then you also have to prove that your reference stays valid for the entire time 

##

the whole point of lifetimes in Rust is to ensure that you don't access objects beyond their actual lifetime

http://stackoverflow.com/questions/42637911/how-can-this-instance-seemingly-outlive-its-own-parameter-lifetime
