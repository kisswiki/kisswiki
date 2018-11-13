- https://www.reddit.com/r/rust/comments/7zsy72/writing_a_doubly_linked_list_in_rust_is_easy/
  - https://www.reddit.com/r/programming/comments/7zbi6s/why_writing_a_doubly_linked_list_in_safe_rust_is/dunjytf/
    - in 50 lines of code https://play.rust-lang.org/?gist=c3db81ec94bf231b721ef483f58deb35

I guess Slab is similar to memory pools used in Java and other GC languages to get around excessive allocation and not creating too much garbage.

Linked lists do not exist because they are easy. They have a very specific performance profile, namely guaranteed O(1) prepend, append and split, also O(1) delete and insert if you have a pointer to the position. What you present is a vector wrapped to look like a linked list, but sharing none of these characteristics. One application of a linked list is to be able to iterate over a potentially HUGE dataset and append desired elements of it to your list fast, which is not generally possible with your implementation. And imagine having to move a 3GB vector because you want to append but malloc put another thing at the end of your block. You don’t run into this with a linked list.

A slab is not the right solution for use cases you mention. Although, if you share a single slab among multiple lists (like how rustc shares arenas) and reserve memory in advance, it could be just fine.

Not saying that slabs are bad, they certainly have their use cases, so in that part we do not disagree. However, something implemented with slabs is not a linked list and should not be called that way either in my opinion. This is one of the situations where it would be better to just admit that yes, Rust cannot check doubly linked lists for correctness, and because it cannot, because you have to use unsafe for a true linked list, it is definitely not easy to write one.
