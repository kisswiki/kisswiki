- https://docs.rs/actix-web/0.4.10/actix_web/
  - for example JsonBody is in dev module https://docs.rs/actix-web/0.4.10/actix_web/dev/struct.JsonBody.html or `json` method https://docs.rs/actix-web/0.4.10/actix_web/dev/struct.HttpResponseBuilder.html#method.json

## How to read

Context

Learning a new language is not only about its syntax, library, but also its tooling, how to run it, dependency management, how to look up the API document.

As a Java world engineer over a decade, I have been used to the javadoc structure. When I start to learn Rust, everything is different (which is a good thing `^_^`), I don't even know how to find the right API doc.

As a spoiled user in Java world, this skill becomes quite important. So I summarised my exploration experience below, and hope it could help folks who have the same trouble.

Take the following actix-web json example code as an example:

```rust
/// This handler uses `HttpRequest::json()` for loading json object.
fn index(req: HttpRequest) -> Box<Future<Item = HttpResponse, Error = Error>> {
    req.json()
        .from_err()  // convert all errors into `Error`
        .and_then(|val: MyObj| {
            println!("model: {:?}", val);
            Ok(HttpResponse::Ok().json(val))  // <- send response
        })
        .responder()
}
req.json()
```

Go to actix-web doc site, search `HttpRequest`.

There is no `json()` method in the left-top corner Methods area. Then `HttpRequest` must implement some trait which has a `json()` method.

Go check the `Trait Implementations`, there is a `HttpMessage`, which is possible, click it and click the `HttpMessage` link in the right panel to navigate to the `HttpMessage` page. Now, you can find the `json` method in `Provided Methods` panel.

Check the source code of `HttpMessage::json`

```rust
fn json<T: DeserializeOwned>(self) -> JsonBody<Self, T>
where
    Self: Stream<Item = Bytes, Error = PayloadError> + Sized,
{
    JsonBody::new(self)
}
```

And by the way, `JsonBody` implements `Future`, so this `json()` actually returns a `Future` of `Json`.

`.from_err()`

The `json()` method returns a `JsonBody` struct, but it doesn't have a method named `from_err()`, But it implements `Future` trait, which has this method defined.

`.and_then()`

Since `from_err()` returns a `FromErr` which also implements `Future`.

`.responder()`

This one is strange, you can't find it in the `Methods/Provided Methods` areas of `Future`, `HttpMessage` or `JsonBody`.

Search it and we know it's `AsyncResponder` trait that implements it, and check the source code:

```rust
pub trait AsyncResponder<I, E>: Sized {
    fn responder(self) -> Box<Future<Item = I, Error = E>>;
}

impl<F, I, E> AsyncResponder<I, E> for F
where
    F: Future<Item = I, Error = E> + 'static,
    I: Responder + 'static,
    E: Into<Error> + 'static,
{
    fn responder(self) -> Box<Future<Item = I, Error = E>> {
        Box::new(self)
    }
}
```

So, actually, it is implemented for `F: Future` already.

**In summary, the whole code chain actually works under `Future` namespace.**

What If ...

What I hope is actually something like Java(or other strong typed languages) does, given a `struct`:

- we want to know all the `trait`s it implemented.
  You can find them in the left panel, and also a list in the main area.
- we want to know all the methods it has, and the methods implemented for all the traits.
  For each trait in the list in main area, there is a `[+]`, you need to click and unfold it before you can see all the methods, that's the trick.

I love Rust, hope the tooling can get better and better over time.

PS:

It seems I'm not the only one who has this trouble, https://github.com/rust-lang/rust/issues/40116

http://www.smilingleo.net/2018/how-to-read-rust-api-doc/
