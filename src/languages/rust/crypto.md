## State of crypto in Rust

one important thing in crypto is making sure a function will take the same amount of time regardless of the final result (to prevent timing attacks). Obviously this goes against the whole point of using an optimising compiler, so you'll often write assembly to be certain the machine does exactly what you want.


I would say that the state of native rust crypto is weak at the moment. The main reason being that it’s currently not possible to implement bignum arithmetic in rust in an efficient way (that might have changed since I last checked).
Some people have replied that assembly is needed for constant time algorithms, that’s not necessarily true. Some primitive are actually pretty easy to implement as constant time/mem/... in rust.


In Rust (and C), there is no way to specify that data is secret and shouldn't remain in a CPU register.
Any confidentiality or constant-time guarantees are implementation-dependant.


It's not just operating systems you have to worry about, but also virtual machines and hypervisors; there was a vulnerability in older versions of Xen which allowed guests to access each other's XMM registers.


Are we not affected by annoying compiler optimisations, where (for example) the optimiser translates a mask operation to a branch?

Primitives such as salsa20 and chacha20 don’t contain any conditional expressions at all (except for constant loop indices in non-unrolled implementations). Thus there are no data dependent CMOVs that can be translated to branches.

Depending on CMOVs to avoid data dependent branches is dangerous if you’re not writing assembly, but I argue that there’s no need to have data dependent branches at all.


A cryptographic primitive is a building block used to create cryptosystems. AES(128/192/256) are cryptographic primitives, chacha20 is a cryptographic primitive and so on. TLS uses a bunch of cryptographic primitives, but isn’t one.


It depends on what you need. If you're implementing a protocol that requires specific crypto primitives, the current state is not very good. Some algorithms can only be found in the OpenSSL bindings, which obviously is not ideal.

I would check out ring and sodiumoxide first; ring is actually quite good but it is still too early for it, a lot of functionality is lacking but expect more in the future. Then sodiumoxide binds to libsodium which has been well reviewed. I can't use libsodium because it is pretty opinionated, but if it can do what you need libsodium is probably the most stable choice right now.

Right now I'm working on getting the tomcrypt crate beefed up (bindings to the venerable LibTomCrypt) for this very reason. Maybe in a month it will be a better choice than OpenSSL if you need a wider range of algorithms.

- https://www.reddit.com/r/rust/comments/7wqs3r/whats_the_state_of_crypto_in_rust/
- 
- RustConf 2017 - Fast, Safe, Pure-Rust Elliptic Curve Cryptography - constant-time https://www.youtube.com/watch?v=tE57KBK_GW4&feature=youtu.be&t=1251

## Ring and problem with dependencies

- https://github.com/briansmith/ring/issues/535#issuecomment-309839961
- I can not add rustls support at the moment. all packages needs to depend on same ring package https://github.com/actix/actix-web/issues/36#issuecomment-357481316