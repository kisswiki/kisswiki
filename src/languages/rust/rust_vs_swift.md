In Rust, allocations and deallocations of resources, is managed by, Rust's own unique paradigm, of Ownership and Borrowing, leveraging scopes, in a good way. While in Swift, they are managed by, the Automatic Reference Counting (ARC) memory management technique.

Memory leaks aren't possible in Rust (unless you are cranking things inside unsafe block),

but in case of Swift, a situation called Retain Cycles in ARC can cause memory leaks to happen. A retain cycle happens when two objects have strong references to each other that prevent them from being released and ARC's reference counting fails here.

https://www.quora.com/Programming-Languages-What-are-the-differences-between-Rust-and-Swift