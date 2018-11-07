## Run specific test file

`rustc --test unit_test.rs`

- https://doc.rust-lang.org/rust-by-example/testing.html
- https://github.com/llogiq/mutagen

## run single test with cargo

`cargo test one_hundred`

https://doc.rust-lang.org/book/2018-edition/ch11-02-running-tests.html

## use super::*

`use super::*;`

The tests module is a regular module that follows the usual visibility rules we covered in Chapter 7 in the “Privacy Rules” section. Because the tests module is an inner module, we need to bring the code under test in the outer module into the scope of the inner module. We use a glob here so anything we define in the outer module is available to this tests module.

https://doc.rust-lang.org/book/2018-edition/ch11-01-writing-tests.html

## unit tests vs integration tests

One difference between integration tests and unit tests is that integration tests is supposed to test the "public API" of your crate only. Tests for internal functions is fine to keep together with the functions themselves in the src tree.

https://stackoverflow.com/questions/47698194/can-i-make-an-object-public-for-integration-tests-and-or-benchmarks-only
