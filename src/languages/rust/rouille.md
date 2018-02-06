> While the advantage of using middlewares is that people coming from dynamic languages are going to be more or less familiar with them, I think that this is really an unidiomatic design in Rust. You have to put things in static objects that are referred by their name and handle lifetime issues, while in my opinion it’s not better than simply using regular variables.
> -- https://medium.com/@tomaka/my-adventures-in-rust-webdev-850c67be6c40

> I built a site in iron and also found it to be a bit awkward. Went searching for another framework and found rouille.
> -- https://www.reddit.com/r/rust/comments/53yoxz/my_adventures_in_rust_webdev/d7xjkof
