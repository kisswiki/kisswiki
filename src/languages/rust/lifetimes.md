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

- http://stackoverflow.com/questions/42637911/how-can-this-instance-seemingly-outlive-its-own-parameter-lifetime
- http://stackoverflow.com/questions/31609137/why-are-explicit-lifetimes-needed-in-rust

##

If you don't care about performance too much, you could just put everything behind Arc<T>

https://www.reddit.com/r/rust/comments/6ymrn5/why_i_use_rust_as_a_webdeveloper/dmpcygo/

##


For sure! I’ve been patiently awaiting NLL for as long as I’ve been working with Rust. It should make a lot of common/unusual problems go away, which is very promising.

I think to be clear, the concept of borrowing itself is very simple; it’s defined perfectly with just 3 short rules 38. The real learning curve is not with borrowing (or these rules), the problem is with complex lifetimes. Complex lifetimes come into play anywhere that the lifetimes cannot be elided.

I’ve mentioned this elsewhere, but since it is relevant … I had a really hard time coming to terms with lifetimes as I was learning Rust. In fact, it is still my biggest pain point with the language. But I taught myself to get around it by writing a non-trivial project without using a single lifetime parameter. I also didn’t need Box, Rc, RefCell, or friends. But that’s because most of the code is stateless (which explains why it doesn’t need explicit lifetimes).

IMHO, this is the best way to learn Rust. Doing things that require explicit lifetimes (like global state management or FFI) should come way, way, way later in the book.


Lifetimes are part of the interface contract of a type or function, because they determine what data can be passed in to a function or inserted into objects of a certain type. In this sense they should be exposed by the language’s syntax. Otherwise, a modification of a type’s or function’s implementation could silently break code that uses it, a subtle compatibility bug which the design of Rust has taken great steps to avoid.

If you do not want to expose the lifetime information in the interface, you need to use abstractions which hide lifetimes from the user and manage them at run time, such as reference-counted pointers. But these abstractions come at a performance cost, which is why they should not be used at the most fundamental layer of a system programming language.


Can we maybe have a book or booklet exclusively covering lifetimes? I don’t think the first level of instruction material on lifetimes which is found in the rust book and others which talks about the syntax and the aliasing rules and elision is enough. It leads to an incomplete model which only frustrates when you discover its incompleteness. Rust nominoc does go further. For example it shows with detailed examples how lifetimes start with a let binding and how they interact with other lifetimes in the same scope. This is fundamental stuff and absolutely essential to understanding. But there are still aspects not covered there. For instance I realized that lifetimes can be shrunk as needed by the compiler only from this forum (thanks @vitalyd) which invalidated my previous model. And I’m sure there are other aspects I don’t know about. I think we just need one place where one can learn everything about lifetimes and be done with it.

The nomicon covers this (to some degree) under the [variance/subtyping section](https://doc.rust-lang.org/nomicon/subtyping.html) but I agree that there’s no single place to get “all lifetime related things” in one place.


Just the general “viral” nature of lifetime annotations when attempting to store a reference in a struct. Any method that accesses those fields also need the same annotations. (I read recently that this may have changed? Lifetime elision is really nice when it can be used!)


Vast majority of cases will not require repeating the lifetime parameter of a field in a method of a struct holding that reference.

The sdl2 stuff I’ve seen on this forum as well - they all boil down to self referential structs, which is a known pain point. I suspect some domains (like graphics) tend to rub up against this much more so than others.

Lifetimes are contagious, no different than generic type parameters though. The notable difference is generic types can be erased in some cases (ie trait objects) whereas you can’t erase lifetimes. So that part is true. I suppose the closest analog to erasing lifetimes is to use owned objects instead, either passing things by value or putting them behind a pointer.

https://users.rust-lang.org/t/isnt-rust-too-difficult-to-be-widely-adopted/6173/38
