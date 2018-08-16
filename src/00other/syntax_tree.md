I strongly suggest using something like Swift's libsytax for representing syntax trees if the end goal here is to create better tooling.

The main advantage is that it naturally preserves the source code in full fidelity: it's simply impossible to loose a comment or a piece of whitespace.

Also I find that fact that both C# and Swift are switching to a similar AST design, and that IntelliJ uses a similar one, a strong evidence that the design actually works in practice.

https://www.reddit.com/r/rust/comments/97haok/rnix_a_nix_parser_written_in_rust/e48wnmd/?context=8&depth=9
