@jarredredditaccount

- TypeScript-like interfaces, Go-like interfaces, Rust-like traits — something that loosely describes the type without strictly typing it. anytype makes code hard to understand. Comptime wrapper types would sort of work if you could define functions at comptime like @Type but you cannot
- async/await isn’t back yet

@jnordwick

> interfaces

I don't understand the absolute reluctance of the ENTIRE core team to interfaces. I have never seen a single one voice a disagreement with Kelley on this. (complete agreement and easy decision making are two signs of a dysfunctional environment).

90% plus of the zig community want something like this, and they won't even add enough information to do this in a generic way in comptime. Declarations reflection information on give you a name, nothing else, and all methods to look them up require a string constant, so you can't do it dynamically at comptime. This is intentional to prevent people from implementing interfaces Kelley is so against them - this is mindblowing to me. You can't even do `*anytype` or something to show it takes a pointer. comptime is severely hobbled because of some of these crazy restrictions.

@Gauntlet4933

Yeah I completely agree. I’ve been looking for a way to narrow types in the signature of a function (not to a single type, but rather all types that would fit a specific restriction I want) and all the core team’s replies to relevant issues have just been “do it in comptime in the body of the function” and “this is a syntax sugar for something that is already possible with any type”

This is extremely annoying from a caller perspective because unless the function provides good compile error reporting, or has a separate function for type level validation (both of which are not perfect substitutes for what we really want), then the caller literally has to read through the code to figure out what functions they need, and what the signatures of those functions might be. Most of the time, using any type feels like writing JavaScript or Python without any type annotations, which sucks.

For a language that is supposed to be a safer C, I feel like a robust type system is a necessity because it gives you a logical validation mechanism that doesn’t involve writing a lot more code as it is built into the language. Anytype is the antithesis of that, and it should be replaced with inferrable generic types (like how generic functions work in other languages).

@jnordwick

This is one of my fav examples when people say that thinks like return type inference make code unreadable. I thought this was literally a big on the docgen code the first time I saw it:

```zig
pub fn fieldInfo(comptime T: type, comptime field: FieldEnum(T)) switch (@typeInfo(T)) { .Struct => Type.StructField, .Union => Type.UnionField, .ErrorSet => Type.Error, .Enum => Type.EnumField, else => @compileError("Expected struct, union, error set or enum type, found '" ++ @typeName(T) ++ "'"), }
```

The return type is that ugly ass switch statement.

You hear the "that can just be done by writing (usually 50+ lines of) comptime code (that's never generalizes to other cases", but did you know StringHashMap and AutoHashMap are literally just hashmap with a different comparison function. Here they are:

```zig
pub fn AutoHashMap(comptime K: type, comptime V: type) type {
    return HashMap(K, V, AutoContext(K), default_max_load_percentage);
}
pub fn StringHashMap(comptime V: type) type {
    return HashMap([]const u8, V, StringContext, default_max_load_percentage);
}
```

We can't have a String type because it is too similar to []u8 (there are plenty of distinction), but those two hashmaps that only different in comparison and/or hash function are different enough from HashMap?

How crazy is it that String isn't different enough from a byte slice, but somehow a StringHashMap exist and is different enough than HashMap!? That is such a huge contradiction.

Some of these decisions just look straight personal and based on their merits.

https://www.reddit.com/r/Zig/comments/1csv0it/what_features_is_zig_missing/

## composability

@shockputs

Zig has a major weakness in the area of composability. It's why C++ became so popular with enterprise, and then Java.

Being able to break up a program into multiple teams, and then re-compose the separate code-bases to make a greater whole is a big deal. This is done via class/object encapsulation and Inheritance in OOP, interfaces in Golang, traits in Rust, what does Zig have?

Zig just uses fat pointers to achieve something like composability, however, that starts to get heavy and slow as users of those patterns start to layer too many abstractions...

C always had a weakness in the area of composability. Specifically with the "handshake" piece, when reusing functions between teams. This is why Golang and Rust are becoming so popular. They're all about forcing people into a "our way or highway" approach to everything.

Also, languages that lean too heavily on "patterns" to solve user needs, tend to become a bit of a mess and end up having books written about them like "Zig: the good parts".

@Deezl-Vegas

> This is done via class/object encapsulation and Inheritance in OOP, interfaces in Golang, traits in Rust, what does Zig have?

I think you may have misunderstood something. Zig potentially handles this stuff more cleanly than other languages. You can pass the type into the function as a comptime argument in Zig, which is actually more permissive and at the same time, more explicit than an interface.

You can also comptime inspect, disassemble, and reassemble your data structures on the fly using builtins and functions that are written in regular Zig. Zig is more powerful in this regard, not less, and just as type safe.

@shockputs

Your describing a generic type situation. Im talking about defining an arg that says "you must meet bla spec in order to fit this function". You are correct that you can absolutely define this inside the function via comptime inspection, but that isn't communicated to the consumer of your library as clearly as an interface/trait. Zig definitely outshines Classes...

https://www.reddit.com/r/Zig/comments/1cuz9hp/zig_is_the_real_mindblower/
