## enum type 

- Defining your own error type [In depth treatment of error handling, with no external crates](https://blog.burntsushi.net/rust-error-handling/)
  - https://www.reddit.com/r/rust/comments/8owac8/is_there_something_like_stdioerror_but_without/e06mm8s/

Use an enum type that implements From<> for all error types. [The first edition of the rust book has a chapter on error handling](https://doc.rust-lang.org/book/first-edition/error-handling.html) which describes this the topic in detail. It is a bit older, so it uses the try! macro, which has the same effect as today's ? operator.

To add on to this, the [derive_more](https://docs.rs/derive_more/0.9.0/derive_more/) crate adds a `derive(From)` impl that does what you want for enums:

```rust
#[derive(From)]
enum MyAppError {
    MyIoError(std::io::Error)
}

fn abject() -> Result<(), MyAppError> {
    // Amazing, automatic conversion!
    std::fs::File::open("/something-nonexistent")?
}
```

https://www.reddit.com/r/rust/comments/85ebwk/any_tips_on_handling_multiple_error_types_in_rust/dvwss55/

The 2018 edition does not cover this https://doc.rust-lang.org/stable/book/2018-edition/ch09-00-error-handling.html.

Neither this good introduction https://stevedonovan.github.io/rust-gentle-intro/6-error-handling.html.

##

- https://doc.rust-lang.org/book/second-edition/ch09-00-error-handling.html
- https://github.com/brson/error-chain
- https://doc.rust-lang.org/book/error-handling.html
- https://www.reddit.com/r/rust/comments/8lt8k6/do_i_really_need_failureerrorchain/
- https://www.reddit.com/r/rust/comments/8dvldm/why_rusts_error_handling_is_awesome/

##

Looks like backtrace support is making it's way into std... :) https://github.com/rust-lang/rfcs/blob/master/text/2504-fix-error.md

How I tend to do it is to define a custom error enum specific to each function call, with all the possible reasons why that function might fail that the user of the library (not the implementer) would care about and perhaps match on. The size of your enum should be small (in number of bytes, not necessarily number of variants). Use Box to accomplish that if your errors contain a lot of data.

I much prefer exhaustive enums over inexhaustive enums or trait objects (I don't like std::io::Error at all). Yes, that makes adding an enum variant a breaking change but that's a feature, not a drawback. If a user cares enough to match on your error enum without a fallback case then they will want their code to break if an error variant is added, representing a new way in which the function could fail.

I tend to use .map_err(...)? a lot too to convert from error enums of my dependencies to my own error enums.

- https://www.reddit.com/r/rust/comments/9m5w9a/current_state_of_error_handling_in_rust/
  
## failure and error-chain are bad

Besides the concerns about exposing an unstable crate in your API, people have also complained that the backtraces stored by failure slow down their apps. I don't think that's such a big concern, but I've been bothered about the increased build times; while a larger app might already be using e.g. syn (the same version, hopefully), for a small CLI app or crate, it might be too much.

There's also some vague notion that failure's API is not ideal, so it might change in the future. But it looks like there can't be any breaking changes to it, because at this point failure is too big to fail (pardon the pun).

Also, I've seen people (including myself) getting confused by the failure documentation wrt. the ErrorKind pattern and the Context API. If you go for an Error enum, you still need to implement the conversion functions by hand.

failure gives you backtraces, the context thing, and the macro for Displaying the error messages. Not everyone wants backtraces, and IMHO that macro should be another crate, with proper maintenance (it has some limitations right now).

So, while it's not unreasonable to use it, failure today is probably not how Rust error handling will end up looking in a year or two. I'm sure that the compromises will be the same (wrt. backtraces, memory allocation and so on), but I think the details will be different. And if you use it today, you're writing more code that depends on a "too big to fail (or change)" crate.

https://www.reddit.com/r/rust/comments/9nu6o0/reflections_on_implementing_the_ndarraycsv_crate/e7qndd1/

If your failure case is "small", you should probably return Result<_, YourFail> instead of Result<_, failure::Error>. This avoids the downcast, as you know your exact failure modes, and can be easily boxed up by the user if desired.

failure::Error is mostly intended as a failure where the best course of action is to print out the error, abort, and maybe try again. For library failure modes, returning your own concrete Fail implementation is ideal, as users can easily consume the error.

A "small" error is one that doesn't greatly increase the size of your result.

https://www.reddit.com/r/rust/comments/9nu6o0/reflections_on_implementing_the_ndarraycsv_crate/e7pmkae/

###

Here is the fraction of crates.io that depends on each of the three big error libraries: [graph](https://user-images.githubusercontent.com/1940490/47620947-c428b680-daad-11e8-9c5e-3e6193074814.png) 

Check out [cargo tally](https://github.com/dtolnay/cargo-tally) if you want to explore your own graphs like this.

https://www.reddit.com/r/rust/comments/9ru6ay/improving_ndarraycsv_goodbye_failure_hello/e8mbpj9/

- https://www.reddit.com/r/rust/comments/9ru6ay/improving_ndarraycsv_goodbye_failure_hello/

On the graph from cargo tally above, quickerror usage is diminishing.

What about auto_from? Though they talk that it should use derive. Also that you can use quickerror. https://www.reddit.com/r/rust/comments/9sip20/tired_of_writing_from_impls_for_your_error_enums/

##

Some people have started to avoid failure, such as the author of ndarray-csv, and you can see the reasons he outlined very clearly: https://paulkernfeld.com/2018/10/27/improving-ndarray-csv.html. I tend to agree, since what I thought I wanted was easier error handling, but just adding a .map_err(|e| MyError::NotFoundErr(e)), for example, was really not that difficult. I prefer just writing an Error enum myself and avoiding from implementations.

That's what I've always done. In fact, I believe it's even shorter than what you wrote: .map_err(MyError::NotFoundErr).

I'm fairly dependency-phobic, so unless it's really going to help a lot, I avoid deps.

And Failure doesn't even seem to help avoid that very much, from a quick skim of the code in the blog post.

https://www.reddit.com/r/rust/comments/9sb7ej/finding_and_fixing_memory_leaks_in_a_hyper/e8nup2x/
