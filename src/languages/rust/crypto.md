I would say that the state of native rust crypto is weak at the moment. The main reason being that it’s currently not possible to implement bignum arithmetic in rust in an efficient way (that might have changed since I last checked).
Some people have replied that assembly is needed for constant time algorithms, that’s not necessarily true. Some primitive are actually pretty easy to implement as constant time/mem/... in rust.


In Rust (and C), there is no way to specify that data is secret and shouldn't remain in a CPU register.
Any confidentiality or constant-time guarantees are implementation-dependant.


It's not just operating systems you have to worry about, but also virtual machines and hypervisors; there was a vulnerability in older versions of Xen which allowed guests to access each other's XMM registers.

- https://www.reddit.com/r/rust/comments/7wqs3r/whats_the_state_of_crypto_in_rust/