Implementing Fail for NoneError would be an orphan rules violation because of the blanket impls for type that implement std::error::Error (this is also why Fail is not implemented for String, for example). There's no progress that can be made on this issue in failure, only in std.

- [impl Fail for NoneError? · Issue #59 · rust-lang-nursery/failure](https://github.com/rust-lang-nursery/failure/issues/59)
- https://internals.rust-lang.org/t/should-noneerror-implement-the-error-trait/6312/7
- [Tracking issue for `ops::Try` (`try_trait` feature) · Issue #42327 · rust-lang/rust](https://github.com/rust-lang/rust/issues/42327#issuecomment-366840247)

