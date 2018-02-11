Since Choices is a trivial enum, you can just `#[derive(Copy, Clone)]`. This means that you are allowed to continue using the old p.choices.

https://stackoverflow.com/questions/30562985/preventing-move-semantics-during-pattern-matching