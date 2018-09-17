## https://news.ycombinator.com/item?id=17993594	

kibwen 5 hours ago [-]

I think there's mental mismatch between groups of people who talk about "turning off the borrow checker". The borrow checker is a tool to validate references. Sometimes people using references in Rust might feel like the borrow checker makes using references too cumbersome in a certain situation, so they switch to using a tool other than references (Rc, indexes into a Vec, etc). But this isn't bypassing the borrow checker; it's bypassing references themselves. The same phenomenon happens in C++; if references start to be a pain, you might switch to using something else (shared_ptr, indexes into a vector, etc.).
When this happens in C++, we don't call this "bypassing the borrow checker". You don't need a borrow checker to know that references aren't always the right tool for a given job. It's the same in Rust.
	
steveklabnik 4 hours ago [-]

Yup. Part of why I wrote this post is for exactly this reason. This phrase is used colloquially, but I think it misleads a lot of people on how Rust actually works.
reply

	
kbwt 6 hours ago [-]

I thought this was going to be a response to Jonathan Blow's video about how doing your own memory management is effectively turning off the borrow checker: https://www.youtube.com/watch?v=4t1K66dMhWk
The takeaway being that the borrow checker doesn't magically prevent the use-after-free class of bugs. Although you will never experience a segmentation fault in safe Rust, the bug is still there and your program keeps running in an invalid state. The symptoms are changed, but no less dangerous.

To make the problem even more obvious, think of allocating a large array to be used as a heap and handing out indices to implement your own malloc. You have bounds checking to prevent indexing outside the bounds of the heap, but it doesn't really help when the elements have logically different lifetimes and occupy different parts of the array. I don't think this is a contrived example either. A less obvious version of this can easily creep into large or complex systems, as evidenced by the Entity Component System in Rust example.

steveklabnik 4 hours ago [-]

So, I had been thinking about this post for a while, and Blow's video caused some more discussion that made me post it. But it's not a direct response, I still haven't watched the video, and so I don't know what he actually said. If I wanted it to be a response, I would have linked to it.
> The symptoms are changed, but no less dangerous.

I would take issue with this sentiment. There's a world of difference between "logic error and/or panic" and "undefined behavior".

Yes, Rust doesn't fix all bugs. But it's still an improvement here.

nemothekid 3 hours ago [-]

>There's a world of difference between "logic error and/or panic" and "undefined behavior".
I recently started using Rust daily as a break from $dayjob because I've never really liked C++. I took the time to watch Blow's full rant because I think we made an interesting point, that would take issue with your retort.

The naive version of West's "memory allocator" (without the generational index), in the context of her game, would have also had undefined behavior (in the game world). The naive system still defeats the borrow checker, but you can still end up in a situation where you try to deference something that no longer exists, and worse still since the object that lives there was the same type as before, your state corruption is even more silent. This necessitates the need for a generational index, however West only knew to use a generational index because she is an experienced game dev, not because the borrow checker told her to.

For Blow (who hasn't written rust), believes the borrow checker (and/or language) should prevent these kinds of logical bugs in his game code and bypassing it in this way effectively turns it off ("entity safety"), while the Rust borrow checker only really guarantees memory safety.

His final argument is then, since the borrow checker doesn't provide "entity safety", it impedes on games development because Blow (and any other modern game developer) would have been smart enough to start with a proper ECS system anyways and the borrow checker wouldn't have bought him anything. This final argument is where I disagree with Blow, but 1.) I don't think any programmer is smart enough 100% of the time however I will concede he comes from a different world (Game Dev) which has stricter deadlines than most other industries so he may be more sensitive to tools like the Borrow checker. 2.) Something I've noticed with Go as well is when the language developers tend to say something like "you can't use this toy because you will shoot yourself", it becomes a personal attack on developer ego rather than a nuanced trade off on system stability.


kibwen 3 hours ago [-]

> His final argument is then, since the borrow checker doesn't provide "entity safety", it impedes on games development because Blow (and any other modern game developer) would have been smart enough to start with a proper ECS system anyways and the borrow checker wouldn't have bought him anything.
But even in C++ gamedev using a proper ECS, one is still using plenty of plain-old references all over the place for things unrelated to the world state, no? If so, then saying "the borrow checker doesn't help manage world state" doesn't imply that the borrow checker doesn't benefit the codebase in other places, especially considering that use of an ECS circumvents the places where we have determined that references (and hence the borrow checker) are already poorly suited to model.

CUViper 2 hours ago [-]

Use-after-free and other memory errors won't necessarily segfault anywhere near the source of the problem. It could also limp along, corrupting memory in weird places, until something totally unrelated segfaults instead.
ECS might let you continue with an outdated index, but that problem is contained.


unrealhoang 2 hours ago [-]

Logic bugs with undefined system state are much easier to debug than UB, that is why people use memory-safe programming language.
