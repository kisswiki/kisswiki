Pattern matching, however, due to its ability to unpack values into their constituent parts, is a destructive operation. Anything we apply match (or similar construct) to will be moved into the block by default.

http://xion.io/post/code/rust-patterns-ref.html