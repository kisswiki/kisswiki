- https://actix.rs/api/actix-web/stable/src/actix_web/extractor.rs.html#73-75
- https://actix.rs/api/actix-web/stable/actix_web/struct.Path.html


```rust
pub struct Path<T> {
    inner: T,
}

impl<T> AsRef<T> for Path<T> {
    fn as_ref(&self) -> &T {
        &self.inner
    }
}

impl<T> Deref for Path<T> {
    type Target = T;

    fn deref(&self) -> &T {
        &self.inner
    }
}

impl<T> DerefMut for Path<T> {
    fn deref_mut(&mut self) -> &mut T {
        &mut self.inner
    }
}

impl<T> Path<T> {
    /// Deconstruct to an inner value
    pub fn into_inner(self) -> T {
        self.inner
    }
}
```

## Multiple values

```rust
let (id, email, key) = actix_web::Path::<(String, String, String)>::extract(req).expect("Path extract failed").into_inner();
```

https://www.slideshare.net/swallez/developing-web-applications-in-rust


## Single value

Use `*`, `&` or `into_inner()`.

### bool

```rust
let ssr = *actix_web::Path::<bool>::extract(req).expect("Path extract failed");
```

### String

```rust
let url = actix_web::Path::<String>::extract(req).expect("Path extract failed");
```

#### Why * does not work for String?

```
error[E0507]: cannot move out of borrowed content
   --> src/api.rs:117:15
    |
117 |     let url = *actix_web::Path::<String>::extract(req).expect("Path extract failed");
    |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |               |
    |               cannot move out of borrowed content
    |               help: consider removing the `*`: `actix_web::Path::<String>::extract(req).expect("Path extract failed")`
```

#### into_inner() works for String

```rust
let url = actix_web::Path::<String>::extract(req).expect("Path extract failed").into_inner();
```
