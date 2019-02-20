- https://www.reddit.com/r/rust/comments/7zsy72/writing_a_doubly_linked_list_in_rust_is_easy/
  - https://www.reddit.com/r/programming/comments/7zbi6s/why_writing_a_doubly_linked_list_in_safe_rust_is/dunjytf/
    - in 50 lines of code https://play.rust-lang.org/?gist=c3db81ec94bf231b721ef483f58deb35

I guess Slab is similar to memory pools used in Java and other GC languages to get around excessive allocation and not creating too much garbage.

Linked lists do not exist because they are easy. They have a very specific performance profile, namely guaranteed O(1) prepend, append and split, also O(1) delete and insert if you have a pointer to the position. What you present is a vector wrapped to look like a linked list, but sharing none of these characteristics. One application of a linked list is to be able to iterate over a potentially HUGE dataset and append desired elements of it to your list fast, which is not generally possible with your implementation. And imagine having to move a 3GB vector because you want to append but malloc put another thing at the end of your block. You don’t run into this with a linked list.

A slab is not the right solution for use cases you mention. Although, if you share a single slab among multiple lists (like how rustc shares arenas) and reserve memory in advance, it could be just fine.

Not saying that slabs are bad, they certainly have their use cases, so in that part we do not disagree. However, something implemented with slabs is not a linked list and should not be called that way either in my opinion. This is one of the situations where it would be better to just admit that yes, Rust cannot check doubly linked lists for correctness, and because it cannot, because you have to use unsafe for a true linked list, it is definitely not easy to write one.


Not to mention that you might be chasing that O(1) for splicing only for your iteration performance to be destroyed by cache misses, which wouldn't happen with a contiguous-memory data structure.

##

@hniksic

The trouble is that Rust makes it hard to implement some data structures that are very common in teaching, such as linked list or tree, not to mention graphs. And then there are concepts like iterators that are trivially implemented in garbage-collected languages (Python, Java) or unchecked ones (C++), but made very hard in Rust by the borrow checker.

You could use Rust to teach the basics, but you'd have to carefully think through how to present algorithms and data structures, e.g. by introducing Rc and arena-crates early enough, and by avoiding the known pitfalls. These are all solvable problems - after all, C++ has its own share of issues, and universities teach it just fine - but you'd need a generation of TAs who are committed to Rust and understand it in some depth.


@internet_eq_epic

>Frankly, it doesn't make it hard, it just makes it different.

I agree with this mostly. It makes it hard to implement the same way you are taught normally.

But rust teaches that there are some very large problems (potentially) in the way you use a linked list. I've always thought a linked list was a simple data structure, and it is if it is immutable, but beyond that I've realized that a linked list is actually a deceptively simple data structure.


@RetraRoyale

>we had to do linked lists in c and memory leaks were treated as incorrectness, so ownership was still a thing. it just wasn't enforced by the compiler.

Which basically means it wasn't enforced at all, unless you've implemented a borrow-checker too. It is common practice in C to return a pointer to an item in a linked list, but I've never seen an implementation that didn't just say "if you assume the pointer is valid, that's your fault."

https://www.reddit.com/r/rust/comments/arhuv8/i_feel_like_rust_should_be_taken_seriously_as_a/

## Links

>Rust std::collections::LinkedList is garbage for my usecase. It has no C++-like iterators, you cannot insert an element in the middle and the only meaningful operation, splitting, is O(n).
>
>Before delving in the bottomless pit that is singly/doubly linked lists in Rust, I urge you to read the book called “Learning Rust With Entirely Too Many Linked Lists”. This book has a very nice property; if you finish it, you understand Rust. No, seriously. This book is the certain way to understanding the borrow semantics of Rust. In order to understand my post you don’t have to read the full book thoroughly, but I will try my best to not repeat what has already been said. So, I won’t argue why linked lists are bad (in contrast to my talk), but just try to implement one. Therefore, since I won’t repeat most of what my slides say, maybe this is a good time to actually read them :)

- [Designing a Safe Doubly Linked List with C++-like Iterators in Rust (Parts 1 and 2](https://softsilverwind.github.io/rust/2019/01/11/Rust-Linked-Lists.html)

>Mutable doubly linked lists arenota solved problem. A datatypethatcannotexpose a safe interface isnota solution toanyproblem
>https://softsilverwind.github.io/assets/01/linked-list.pdf

When are doubly linked lists needed?

You want a dynamic datatype that has the magic property that itcan grow on runtime.

Ugh, just no. Please.

- Choose a vector.
- You’ve seen the talk from Bjarne Stroustup [1], right?

You are writing a queue, therefore you cannot use a vector.

I could tell you my opinion myself, or I could show you whichdatatype the STL uses for a queue...

- You want to delete from/insert to the middle of the list. Watch theBjarne Stroustrup talk [1], as that is `O(n)`
- The same as above, but you already have an iterator there. If youdon’t care about the order of elements, swap with the last elementand then `pop_back`.
- The same as above, but you actually care about order. Well,congrats! You actuallyneedto use a doubly linked list!
- There are other somewhat valid cases. The Rust standard librarystates frequent splitting / merging as another reason to use linkedlists. Another somewhat valid case is iterator invalidation rules.

What to remember:
1. Use a doubly linked list if you need to delete from/insert to themiddle of a container, while already having an iterator there, andorder matters.
2. Always benchmark the datatypes you choose.
3. Doubly linked lists are niche datatypes and it is questionablewhether they should be in a standard library.

## Links

- [Learning Rust With Entirely Too Many Linked Lists](https://cglab.ca/~abeinges/blah/too-many-lists/book/)
- linked_list - Intrusive doubly-linked list https://docs.rs/intrusive-collections/0.7.8/intrusive_collections/
- Safe, intrusive doubly-linked lists for Rust https://github.com/pcwalton/multilist
- https://stackoverflow.com/questions/22268861/how-would-you-implement-a-bi-directional-linked-list-in-rust
- https://users.rust-lang.org/t/drying-out-a-doubly-linked-list-implementation/2856
- https://subscription.packtpub.com/book/application_development/9781788995528/4/ch04lvl1sec29/doubly-linked-list
- https://rcoh.me/posts/rust-linked-list-basically-impossible/
  - https://news.ycombinator.com/item?id=16442743
