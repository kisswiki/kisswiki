- https://github.com/MaximAbramchuck/awesome-interview-questions#rust
  - https://www.bestinterviewquestion.com/rust-programming-language-interview-questions
  - https://github.com/jean553/rust-exam
- https://github.com/brndnmtthws/cracking-the-coding-interview-rust

##

najamelan

some low hanging fruit as to what are challenging topics:
- intricacies of the Pin api, like "This code has a pin projected field and it has a getter to it which returns a &mut to that field, is that ok, why (not)?" <= if you are hiring for an async networking position.
- explain unwind safety
- variance
- all the stuff that can go wrong in unsafe code
- maybe a bit easier, but ask to explain the reasoning behind object safety or orphan rules, like "Why did they decide that a trait with generic methods is not OS?"

BurntSushi

I've been writing Rust ~daily since 2014 and have pretty intensely followed its development since then. I would easily fail this interview.

https://users.rust-lang.org/t/rust-interview-questions/12670/4
