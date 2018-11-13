Ident in expression context ends up resolving to this function (which is not callable because the argument is a never-type, as you noticed).

I designed it this way to cut down the immense amount of noise from turbofish in the ways that peek is typically invoked. Compare:

`if input.peek::<Ident>() || input.peek::<Brace>() || input.peek::<Token![where]>() {`

vs

`if input.peek(Ident) || input.peek(Brace) || input.peek(Token![where]) {`

https://www.reddit.com/r/rust/comments/9dk6cv/announcing_syn_015_new_parsing_api_with_errors/e5ibwa2/
