- https://doc.rust-lang.org/book/ch11-00-testing.html
- https://doc.rust-lang.org/cargo/guide/tests.html
- https://doc.rust-lang.org/cargo/commands/cargo-test.html
- `rustup doc --test`
- `cargo test --help`

```bash
$ cargo test -- -h | rg -i exact
        --exact         Exactly match filters rather than by substring
```

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

## show println!

```bash
$ cargo test -- --nocapture
```

https://stackoverflow.com/questions/25106554/why-doesnt-println-work-in-rust-unit-tests


## assert diff

`cargo add pretty_assertions --dev`

It needs a lot of RAM I think. It crashed on my machine.

```bash
$ cargo test
...
test tests::deserialize_questions_all_response ... test tests::deserialize_questions_all_response has been running for over 60 seconds
memory allocation of 11154753128508992 bytes failederror: test failed, to rerun pass '--bin campaigns_server
```

>I have the same problem. I use this crate to help with comparing my generated code to the expected one in my configure_me crate. I already hit the 60 second limit Rust imposes. [Unbearably slow for big texts · Issue #19 · colin-kiegel/rust-pretty-assertions](https://github.com/colin-kiegel/rust-pretty-assertions/issues/19#issuecomment-435836447)

- https://users.rust-lang.org/t/mega-assert-eq-with-colorful-diff-drop-in-replacement/10101/31
- https://github.com/rust-lang/rust/issues/41615

## assert-json-diff

`cargo add assert-json-diff --dev`

in root crate:

```rust
#[cfg(test)] // <-- not needed in examples + integration tests, `cargo run` would complain otherwise because installed as dev dep
#[macro_use]
extern crate assert_json_diff;

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn deserialize_request() -> Result<(), Box<std::error::Error>> {
        extern crate serde;
        use std::fs;

        let j = fs::read_to_string("request_q.json")?;

        let expected = serde_json::from_str::<serde_json::Value>(&j)?;
        let de = serde_json::from_str::<RequestObj>(&j)?;
        let se = serde_json::to_string_pretty(&de)?;
        let actual = serde_json::from_str::<serde_json::Value>(&se)?;

        assert_json_eq!(actual, expected);

        Ok(())
    }
}
```

https://github.com/davidpdrsn/assert-json-diff

## skip test

```rust
#test #[ignore]
```

Run ignored tests

`cargo test -- --ignored`

https://www.reddit.com/r/rust/comments/3i1nki/how_to_skip_expensive_tests_with_cargo_test/
https://www.reddit.com/r/rust/comments/3i1nki/how_to_skip_expensive_tests_with_cargo_test/

## --exact

When name prefix the same I need to run it with `--exact`:

`cargo test test_almostIncreasingSequence -- --exact`

```bash
$ cargo test -- -h | rg -i exact
        --exact         Exactly match filters rather than by substring
```

If your test is not in any mod you can simply execute like this:

`cargo test test_fn_name -- --exact`

Otherwise you need to provide test with full namespace:

`cargo test tests::test_fn_name -- --exact`

Source https://github.com/rust-lang/rust/blob/master/src/libtest/lib.rs#L357

```rust
        match opts.filter_exact {
            true => test_name == filter,
            false => test_name.contains(filter),
        }
```

- https://stackoverflow.com/questions/54585804/how-to-run-a-specific-unit-test-in-rust/54586148#54586148
- https://stackoverflow.com/questions/25106554/why-doesnt-println-work-in-rust-unit-tests#comment104686069_25107081
- https://github.com/rust-lang/cargo/issues/2941#issuecomment-272707484
- [Can't use `cargo test` to run tests in the "tests" directory if the Cargo project is named "test" · Issue #2432 · rust-lang/cargo](https://github.com/rust-lang/cargo/issues/2432#issuecomment-191874390)

## run multiple exact names from command line

```bash
while read t; do cargo +nightly test "$t"; done < <(echo 'fix::fix_overlapping
    fix::local_paths
    fix::prepare_for_2018
    fix::specify_rustflags')
```

or from file:

```bash
while read t; do cargo +nightly test "$t"; if [ $? != 0 ]; then echo "$t" >> still_failing.txt; fi; done < failures.txt
```

https://github.com/rust-lang/rust/issues/30422#issuecomment-417106951

## println only during test run

```rust
fn do_thing() -> i32 {
    #[cfg(test)]
    println!("planning to return 5");
    5
}
```

https://users.rust-lang.org/t/solved-println-during-tests-only/17704/2

##

- [`cargo test` doesn't capture print from threads · Issue #42474 · rust-lang/rust](https://github.com/rust-lang/rust/issues/42474)

## compare arrays

```rust
let mut t1: [u8; 48] = [0; 48];
let t2: [u8; 48] = [0; 48];
assert!(t1.iter().eq(t2.iter()));
```

https://stackoverflow.com/questions/48013278/using-assert-eq-or-printing-large-fixed-sized-arrays-doesnt-work/49336581#49336581

## Group tests and run groups

- https://stackoverflow.com/questions/48583049/run-additional-tests-by-using-a-feature-flag-to-cargo-test

## Cannot run tests in parallel

[`cargo test --all` should run tests in parallel · Issue #5609 · rust-lang/cargo](https://github.com/rust-lang/cargo/issues/5609)
