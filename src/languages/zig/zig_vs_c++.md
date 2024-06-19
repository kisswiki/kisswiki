
## smart pointers

@todo_code

Quite simply, safety. C++ has a lot of tools which prevent use after free, they have smart pointers, etc. Zig does not have those, but it has all the low level goodness of C without all the foot guns.

I was working on a zig project and got a segfault. I forget the exact details, but I really needed a reference counted pointer, or something of the like. I want too say it was copying an item onto an array list, and then used the pointer after from the original. Not sure! Either way. Something like that in Rust and safer cpp just aren't possible. Zig gives you nice testing which caught this for me, but that's why zig is a c "replacement" and not a cpp one

@swe_solo_engineer

One of the things that Zig doesn't is smart pointers. Interesting, could you share more things like this from your experience that Zig cannot do that makes it bad to replace C++ and just Rust could do it

@geon

No. Reference counting shouldn’t be a problem to implement in Zig. In cpp too, it isn’t part of the language, but the std.

I wouldn’t say cpp is any safer than zig. Rust is safer, because the compiler can guarantee it. Zig + static analysis might become safer than cpp in the future, since the language is simpler and might be easier to reason about.

@TheoPomies

Sorry but that’s just plain wrong, Reference counting and smart pointers make use of RAII (basically the fact you do not need to manually call destructors) to make them safe and “sound”. Zig will not support RAII, hence it would require manual deferred destructors, so that doesn’t qualify as a “smart” pointer and you could still shoot yourself in the foot.

@geon

Zig just uses defer instead of raii. There is nothing that demands smart pointers to use destructors.

@TheoPomies

Well actually there is, it’s in the name: they’re “smart”, that means that they self-manage the underlying resource, which means they are responsible for taking ownership and running the destructor, if you use a defer statement to use it, it means YOU manage it, hence it isn’t a smart pointer… I’m sorry but this isn’t even a controversial statement I’m making, I love the defer pattern, but the lack of RAII prevents actual smart pointers

If you need to think about running defer destructors to decrement the RC, you are effectively MANUALLY decrementing and managing the not-so-smart-pointer.

@bnolsen

I consider that to be good enough for smart pointers as it matches the alloc/defer patern that zig uses.

https://www.reddit.com/r/Zig/comments/1ddn59m/can_zig_truly_replace_c_like_rust_does/
