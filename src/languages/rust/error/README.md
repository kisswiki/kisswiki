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

Here is the fraction of crates.io that depends on each of the three big error libraries: [graph](https://user-images.githubusercontent.com/1940490/47620947-c428b680-daad-11e8-9c5e-3e6193074814.png) 

Check out [cargo tally](https://github.com/dtolnay/cargo-tally) if you want to explore your own graphs like this.

https://www.reddit.com/r/rust/comments/9ru6ay/improving_ndarraycsv_goodbye_failure_hello/e8mbpj9/

- https://www.reddit.com/r/rust/comments/9ru6ay/improving_ndarraycsv_goodbye_failure_hello/

On the graph from cargo tally above, quickerror usage is diminishing.

What about auto_from? Though they talk that it should use derive. Also that you can use quickerror. https://www.reddit.com/r/rust/comments/9sip20/tired_of_writing_from_impls_for_your_error_enums/
