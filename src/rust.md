- Rust is a new, practical, community-developed systems programming language that "runs blazingly fast, prevents almost all crashes, and eliminates data races." Rust derives from a rich history of languages to create a multi-paradigm (imperative/functional), low-level language that focuses on high-performance, zero-cost safety guarantees in concurrent programs. It began to gain traction in industry even before its official 1.0 release in May 2015, showing a recognized need for a new low-level systems language. http://cis198-2016s.github.io/
- http://softwaremaniacs.org/blog/2016/02/12/ownership-borrowing-hard/en/

## Limitations, drawbacks

- https://www.reddit.com/r/rust/comments/4b5rfi/what_in_your_opinion_is_the_worst_thing_about_rust/
- https://www.reddit.com/r/rust/comments/4b723c/what_are_the_disadvantages_of_rust/
- https://www.quora.com/What-is-the-disadvantages-of-Rust-Programming-Language

## Specialization

>> New users of Rust have a very hard time understanding the relationship between the different string types, what each of them is and what each of them is for. The different string types all carry their weight, but its really unfortunate for new users that String::new() and "Hello, world!" don't produce values of the same type. "foobar".to_string() just looks absurd, and to make matters worse people will then let you know that this is the wrong way to convert the string (even though the performance difference is probably not critical to this user), and even worse than that, three people will then tell you three different functions you should use instead
> At least the "wrong way" issue should disappear once specialization lands
> - https://www.reddit.com/r/rust/comments/4b5rfi/what_in_your_opinion_is_the_worst_thing_about_rust/

- Tracking issue for specialization (RFC 1210) https://github.com/rust-lang/rust/issues/31844
- https://github.com/rust-lang/rfcs/blob/master/text/1210-impl-specialization.md
- https://www.reddit.com/r/rust/comments/3d6ivg/rfc_impl_specialization/

## Return `impl Trait`

> It allows for consistent return type declarations. For example if you have a function that calls filter().map() and returns the result, it will actually return a Filter<Map<>> (Map, Filter). This can get arbitrarily complex - i.e. chain several map calls and your type will be a Map<Map<Map<>>>. As a caller you do not care though - you just care that it behaves like a Iterator.
To get your function return types consistent to be Iterator<> right now you actually have to use dynamic dispatch and return a Box<Iterator<>> - and you pay the price for dynamic dispatch. With this you just declare your function to return impl Iterator<> and the compiler will fill in the arbitrarily complex data type for you.
> https://www.reddit.com/r/rust/comments/4xdghn/merged_implement_impl_trait_in_return_type/d6eowx6
