## https://news.ycombinator.com/item?id=17993594	

kibwen 5 hours ago [-]

I think there's mental mismatch between groups of people who talk about "turning off the borrow checker". The borrow checker is a tool to validate references. Sometimes people using references in Rust might feel like the borrow checker makes using references too cumbersome in a certain situation, so they switch to using a tool other than references (Rc, indexes into a Vec, etc). But this isn't bypassing the borrow checker; it's bypassing references themselves. The same phenomenon happens in C++; if references start to be a pain, you might switch to using something else (shared_ptr, indexes into a vector, etc.).
When this happens in C++, we don't call this "bypassing the borrow checker". You don't need a borrow checker to know that references aren't always the right tool for a given job. It's the same in Rust.
	
steveklabnik 4 hours ago [-]

Yup. Part of why I wrote this post is for exactly this reason. This phrase is used colloquially, but I think it misleads a lot of people on how Rust actually works.
reply
