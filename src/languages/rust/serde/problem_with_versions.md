cargo tree is highly useful to verify this is your problem. It shows all of your dependencies and their versions. It even has a -d flag to show duplicate dependencies! That mode isn't shown here, but is highly useful.

The general solution is to manually restrict your version of Serde in your Cargo.toml to match the rest of the dependencies:

- https://stackoverflow.com/questions/44437123/why-is-a-trait-not-implemented-for-a-type-that-clearly-has-it-implemented
