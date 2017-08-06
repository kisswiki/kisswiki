After struggling to understand inner mutability, I finally solved this problem by wrapping both fields into a RefCell and using struct.field.borrow() and struct.field.borrow_mut(). This way you can technically mutate one field while not having a mutable reference to the whole struct.

https://www.reddit.com/r/rust/comments/6riwp2/learning_rust/dl5ipp9/
