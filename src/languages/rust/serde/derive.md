Now it looks like I cannot macro_use:

```rust
#[macro_use]
extern crate serde_derive;
```

##

https://www.reddit.com/r/rust/comments/a8ykj8/til_you_dont_need_serde_derive_when_using_the/

Without specifing serder_derive crate:

```diff
diff --git a/Cargo.lock b/Cargo.lock
index 00bb85d..052fa97 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -1092,7 +1092,6 @@ dependencies = [
  "env_logger 0.6.1 (registry+https://github.com/rust-lang/crates.io-index)",
  "futures 0.1.27 (registry+https://github.com/rust-lang/crates.io-index)",
  "serde 1.0.91 (registry+https://github.com/rust-lang/crates.io-index)",
- "serde_derive 1.0.91 (registry+https://github.com/rust-lang/crates.io-index)",
  "serde_json 1.0.39 (registry+https://github.com/rust-lang/crates.io-index)",
 ]

diff --git a/Cargo.toml b/Cargo.toml
index a4a11f8..d5b8fee 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -6,8 +6,7 @@ authors = ["Roman Frołow <rofrol@gmail.com>"]
 [dependencies]
 actix-web = "1.0.0-beta.5"
 env_logger = "0.6.1"
-serde = "1.0.80"
-serde_derive = "1.0.80"
+serde = { version = "1.0.80", features = ["derive"] }
 serde_json = "1.0.32"
 bytes = "0.4.12"
 futures = "0.1.27"
diff --git a/src/main.rs b/src/main.rs
index be14071..bbc1713 100644
--- a/src/main.rs
+++ b/src/main.rs
@@ -2,9 +2,8 @@ extern crate actix_web;
 extern crate env_logger;
 use std::env;

-#[macro_use]
-extern crate serde_derive;
 extern crate serde;
+use serde::{Deserialize, Serialize};
```

https://users.rust-lang.org/t/solved-the-trait-serde-deserialize-is-not-implemented-for-type/26772/3
