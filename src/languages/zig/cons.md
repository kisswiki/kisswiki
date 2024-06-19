There are many erroneous claims made regarding Zig allocators. Contrary to what is claimed, the fact that you pass an explicit allocator does not affect:

- That an out-of-memory condition is elegantly handled or not.
- That an out-of-memory condition is properly reported to the caller.
- That is simplifies WebAssembly support; whatver you put in the allocator your could put into malloc.
- That it easily allows arena allocators; you can only use an arena allocator if you intimately know every single uses of the passed in allocator, allo the implementation details of the libraries you call and of _all_ its dependencies. If a dependency, for example, implements a cache, the arena allocator will corrupt it when deallocated.

https://news.ycombinator.com/item?id=27145943

## "A simple language"

That's what it says in big bold letters near the top of the Zig language web page. Zig is a recent experiment in cutting away all this derided complexity which plagues modern programming languages. Closures, function traits, operator overloading - programming is hard enough to begin with, why can't we at least program in a simple language, without all that crap?

Zig honestly seems like a cool language, and I'd like to learn it one day, but I can't say its simplicity is its most attractive quality. Below the header, the website reads:

> Focus on debugging your application rather than debugging your programming language knowledge.

Why would I want that? The entire point of modern language complexity is to reduce the amount of debugging needed for your application, because its complexity is properly managed by the language.

Zig uses manual memory management, and does not have the same compile time guarantees about memory safety as Rust. Meaning of course that sure, compared to writing Rust code, it's probably simpler to write Zig code that compiles, but crashes at runtime, after which you get the joy of focusing "on debugging your application".

To me this is a trick of words: The difficulty in figuring out how to satisfy e.g. ownership rules in Zig is, by mere convention, debugging the "application", whereas the same difficulty in Rust would be debugging the "programming language".

Zig, of course, is not the first language to explicitly seek simplicity. Go did it before Zig, with much of the same motivation: Get the language out of the way. And in some way, they were successful. Go is heralded as an easy language to learn. But on the other hand... well, let me end on the the words of [someone else](https://fasterthanli.me/articles/i-want-off-mr-golangs-wild-ride):

> Over and over, every piece of documentation for the Go language markets it as "simple". This is a lie. Or rather, it's a half-truth that conveniently covers up the fact that, when you make something simple, you move complexity elsewhere.

https://viralinstruction.com/posts/defense/

## No checker for opened file descriptors

veloscillator

Might be helpful to add a sanitizer step to check for this. valgrind can do it but may be slow.

andrewrk

Agreed, I was thinking it might be possible to do something similar to the std lib leak checker, but with file descriptors. Maybe even with arbitrary resources.

https://github.com/ziglang/zig/pull/14703#issuecomment-1439298574

## What features is Zig missing?

@jarredredditaccount

- Contextual error handling. Zig’s error type can rarely be used for anything real. When a file is not found, you want to tell the user where it checked. When a parser error occurs, you want to tell the user where in the file it happened. In Bun, we often use a union(enum) for errors instead of the builtin error type because it’s so hard to provide a good developer experience via completely static error codes with no other metadata (zig’s error type).
- Zig’s lack of any equivalent to lambda functions makes me prefer writing C++ sometimes. The stack-capturing macro proposal is closest.
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

We can't have a String type because it is too similar to []u8 (there are plenty of distinction), but those two hashmaps that only differn in comparison and/or hash function are different enough from HashMap?

How crazy is it that Strign is't differnt enough from a byte slice, but somehow a StringHashMap exist and is different enough than HashMap!? That is such a huge contradiction.

Some of these decisions just look straight personal and based on their merits.

@jnordwick

1. compiler options and optimization information. eg, no way to turn off 512-bit operand instructions (both gcc and llvm have the flags for it, but zig doesn't expose them), no fine grain control over things like code (not data) alignment, loop unrolling, etc. For a high performance system langauge, those are needed. And there is no way to have the compiler spit out the info it is using for optimization decisions. Both gcc and llvm have this already. For a system language I don understand zig's reluctance to giving the programmer all the information it has available.

2. compiler intrinsics for all the simd instructions (asm is a black box to the compiler so doesn't result in very good code gen.

3. interfaces and better dynamic dispatch handling (anytype is suck)

4. documentation

5. better std (too fat, API is terrible, poor implementations)

6. a lot of bug fixes that have been sitting around for years that when hit just destroy performance - eg the large array copies that get made around loops or return values

7. better slice codegen (eg right now slices are turned on the stack and not in). this actually applies to anything larger than a register, and that might include error unions or any tagged union, but i haven't looked at the asm for those. Also calling a function that returns an error has a small performance hit that should be worked around.

8. better contrrol of data layout instead of zig just doing whatever it wants to field order. extern hobbles your ability to use non-extern structs and is completely unnecessary. The zig idea of performance is entirely one-dimensional only caring about struct size, but things like cache line grouping, keeping pointers close to base of struct, false and true sharing, etc... all matter often way more than possibly shaving a few byte off a struct (even reordering often doesn't). I never seen any numeric justification for this.

9. alignment on types, not just bindings. `const unalaigned_u32 = align(1) u32` should be a thing. This would cut some API emsembles (like arraylist ) function count in half: there would be no need for an AlignedArrrayList and ArrayList since the type would carry that alignment info with it. That this is not done is purely core just being recalcitrant.

10. a string type or types.

11. varargs (just sugar it into `.{}` so we can finally write `std.debugprint("`hello, {s} on {s} {d}\n", mystr, month, day)`. The @ builtins have this, why not the programmer then?

12. default args. this would also cut the APIs in half in some places

13. overloading, another way to chop the APIs down to size and make them more manageable. The @ builtins have this too - another case of for me and not for you.

14. make the language virtual function aware to allow for better optimization of dynamic dispatch. The bespoke vtable implementation that everybody needs to write themselve and copy and paste all over the place is not a good long term solution, and it drops some performance on the floor with missed devirtualization and mono- bi- and many- morphic inlining.

@randomguy4q5b3ty

3. Yeah, it would be great if Zig had something like Rust's traits. On the other hand, templates let you do stuff that you just can't (conveniently) do with generics.
10. If you need a higher level API that handles growing and stuff, wouldn't ArrayList suffice?
11. I don't think tuples need additional syntactic sugar.
12. That would be indeed neat. On the other hand, the order dependency of arguments makes it a bit less useful. Unless we could also have order independant named arguments! Well, we kinda have that already too with anonymous structs, whose members can indeed have default arguments.
13. Overloading rules tend to be complicated and bite you in the ass. I also feel that it would go against the goal of explicitness. But I feel you, some APIs feel cluttered. However! It should be possible to use Zig's meta-programming to implement something like Odin's [explicite procedure overloading](https://odin-lang.org/docs/overview/#explicit-procedure-overloading).
14. Isn't that essentially goal 2.?

@jnordwick

3. zig should steel concepts from c++. They would be a very zig-ish way of doing things since you could just use regular zig syntax and semantics.

10. Strings priorities are often a little different that a simple array list since that are byte driven. Eg, I have a small string optimization library that starts in situ and spills to a memory allocation if large than 23 characters. While technically small vector can be done, since you are often talking about 4 or 8 bytes values with possible alignment issues too, instead of getting 23 characters, you have 4 u32s or 2 u64, so not nearly as useful. Zig has AutoHashMap that is literally jiust HashMap with a different comparison function. If that deserves its own type in std, String certainly does.

11. `std.debug.print("hello", .{})` makes me cringe with the unnecessary line noice. I got so tired of print("{}", .{x}) that I wront my own print that checks for a tuple it the trailing argumetn and wraps it in a tuple. It would just be so much easier to read. You don't even have to go all out and have runtime varargs like C and do (hacky but possible). Even C++ has varargs templates now that can be applied to a vararg function. Zig is falling behind. But atleast it saves us from unused variables in debug builds.

12. C++ has them and they work fine. Extending to named arguements (something I don't really like because I think it optimizes for the wrong thing - namely very long argument lists that cause register spill) would seem natural, especially in light of vararge (#11). Varargs would be a tuple with no field names and named parameters would just be a regular struct -- you could even have both at the same time (ugly, but technically doable).

13. Zig already breaks explicitness in a number of places (eg field ordering of structs, non-deterministic coercion of a pass by copy parameter to a const pointer, etc...) C++'s method resolution can be very complex (but also very useful). Zig already constrains coercion rules and doesnt' have class method resolution like stuff so the complexity for zig would be much lower. If you have didn't attempt for coercion for functions that had overload candidates, that would make it much less complex. And people have written method overloading in comptime, but there were a number of corner cases that couldn't be handled and the error messages were just wildly bad. A poor version can be done, but it is some pretty cursed code you wouldn't really want to maintain. With overloading, you would also get specialization of generics -- a poor version can be done with comptime, but not really as fully featured as if the language understood it.

@dom324324

13. I was thinking about this recently. I 100% agree with Zigs intent of no hidden control flow (I saw a codebase where the whole program was hidden inside an increment operator), but I still feel like operator overloading is quite convenient and needed.

I came up with this syntax:

```zig
Vec2 result = A +.Vec2 B *.Vec2 C;
```

I'm not hundred percent satisfied with it, but it avoids hidden control flow and is nicely explicit. Maybe the type could be omitted, and the operators would just be appended with !/?/., to signal that the operator is overloaded?

```zig
Vec2 result = A +! B *! C;
```

@randomguy4q5b3ty

3. The reason I mention Rust traits is that they are ingenious in that they put the user in control whether dispatch will be dynamic or not. But yeah, that would also be a pretty hefty shift from how generics work today, so it's pretty unlikely.

Concepts would be indeed the more seemless solution, for the exact same reason C++ opted for them. But in contrast to C++, Concepts and contracts can be easily done as a library solution in Zig already, and they are already out there. Since they would be completely optional, I don't think a dedicated language solution with special syntax and everything would have any significant advantage. Though, since SFINAE is not a thing in Zig, I'm not sure how useful Concepts would actually be in general. So far I haven't really missed them.

10. Okay, while I agree that a String type could be in the std, it's essentially just a wrapper around a static pre-allocated buffer and an ArrayList. I'm not sure I understand your other reasons.

11. I'm again not entirely sure what you mean. C++ [print](https://en.cppreference.com/w/cpp/io/print) really doesn't look any nicer. Honestly, I would think that `print(.{"Hello, ", name, "! You are ", age, " years old."})` would be a nicer API, though it doesn't handle formatting (yet).

12. Well, there's one problem C++ doesn't solve: wrapping a function with default arguments and exposing the same defaults to the wrapper function's argument list. Though probably C++ allows some black voodoo magic...

But in Zig you could do this if you really want to avoid named arguments:

```zig
fn f(arg_or_null: anytype) i32 {
  const arg = arg_or_default(arg_or_null, 0);
  return arg;
}

fn arg_or_default(arg: anytype, default: anytype) u/TypeOf(default) {
   return if(@typeInfo(@TypeOf(arg)) == .Null) default else arg;
}
```

You can also use [std.builtin.Type.Fn](https://ziglang.org/documentation/0.12.0/std/#std.builtin.Type.Fn) to easily read a function's "named parameters" defaults. Not exactly what you are looking for, but it is a very simple solution, which in my opinion makes it pretty much a non-issue. It's also something you rarely ever use.

13.

> And people have written method overloading in comptime, but there were a number of corner cases that couldn't be handled and the error messages were just wildly bad.

Well, wasn't that the very reason to get rid of overloading to begin with? But sure, I agree that Zig's meta programming capabilities get abused to make unintuitive and complex APIs that have lots of corner cases.

> With overloading, you would also get specialization of generics -- a poor version can be done with comptime, but not really as fully featured as if the language understood it.

I'm again not sure I follow. Yes, you can have specialized versions of a function by means of overloading, or you by using comptime type introspection.

@jnordwick

> Concepts and contracts can be easily done as a library solution an Zig already

Not really. I tried. You don't get enough information on declarations. They aren't symmetric with fields for some reason.

In that attempt you had to make a struct with a bunch of empty methods that it matched against the implementation of that struct. And then you had to match all the function arguments recursively down. There was no way to stop the recursion so it would get caught in loops checking.

It also doesn't show itention very well and relies on a lot of boilerplate.

@ngrilly

I have experienced several APIs in JavaScript and Python that were confusing due to a bad use of default function arguments, and I honestly didn't miss that much in Go.

@jnordwick

totally disagree. having 20 methods instead of 10 with a default arg is far worse I think. Zig specifically has a really bad API problem for its basic collections. eg ArrayList is a HORRIBLE api. Not having default args has hurt it.

We left the realm of theory and entered actual practice wtih the ArrayList ensemble. Its API would be so much better if you got rid of all the methods that took alignment and used an argument that default to alignof the type.

Their theory appears to not hold under Zig.

@whitePestilence

Anonymous functions (not closures), field visibility restrictions and some kind of built in interface mechanism, but Andrew stated that they're missing on purpose and probably will not be included.

Other than that I belive right now they're working mostly on an async implementation and custom (i.e. non-LLVM) compiler backend.

@metaltyphoon

anytype is such “good” idea on the surface, then u realize to abide by an “interface” you have to check every function being called to know what to implement 😂

@Gauntlet4933

For real. My favorite solution for this was passing a comptime function (type) -> bool that does the validation inside the signature of the function, so that someday ZLS can interpret it and make it part of the LSP output.

Typescript has something similar where the return type of a function can be “value is type” and this is different from just returning a Boolean because it hooks into the type system to do narrowing. Zig can do it with bool because of comptime and because types are values and comparable.

@jnordwick

Zig doesn't expose enough to do it in a generic way (eg, check if struct A has at least the same methods as struct B). And if those methods also have interfaces in their signatures, there is no way to stop the recursion in comptime and keep track of which structs you have alraedy checked.

comptime is too limited.

It would be possible if a few more things were added (like more comptime info on declarations -- for some reason you only get their name unlike fields) but having to do that on all function calls with interfaces is just a lot of boiler plate and a lot of comptime work.

@Pay08

> field visibility restrictions

Please for the love of god, no. Taking control away from the programmer is the last thing you want.

@jnordwick

zig already takes tons of control away from programmers (everything from how and which errors you are allowed to handle to unused variables). while I don't particularly care for field visibility modifiers, this isn't a very good argument.

a read-only attribute for struct fields that only allows them to be modified by associated declarations would be nice though.

but that wouldn't play well with how zig has decided to do dynamic dispatch since those function pointers are filled in with functions not associated with the struct (ie, not decls defined inside the struct). zig's way to ignoring dynamic dispatch and having ad hoc implementations affects a lot of things that people don't seem to realize.

Field visibility or access just can't easily be done with zig's current way of doing ad hoc vtables.

@quaderrordemonstand

I mentioned in another comment that I think many languages will develop more comptime, given how useful Zig has demonstrated it to be. However, its doesn't solve the same problem as interfaces, or field visibility or anonymous functions. It doesn't stop the stupid unused variable error.

As for rich type system, that's kind of a bad idea in some ways. Programmers are obsessed with types, so that they spend more of their effort managing types than writing code that actually does anything. There's the strange belief that type safety is essential when a minority of bugs are related to types. If the function requires an int, and you send it a float, the compiler tells you, no bug.

@randomguy4q5b3ty

Vale has some wild features, especially [Higher RAII](https://verdagon.dev/blog/higher-raii-uses-linear-types) and [generational references](https://verdagon.dev/blog/generational-references). I think Zig should borrow a bit from Vale, though I understand it would make the compiler much more complicated.

What's the difference between RAII and defer?

Go, Zig, and a few other languages have a `defer` statement which will run a statement at the end of the current scope (or function). [11](https://verdagon.dev/blog/higher-raii-uses-linear-types#note11)

In RAII, we would put that code into an object's destructor, and the code will be run when the object goes out of scope.

They sound like two equivalent approaches, but RAII is more flexible: we can return the object to our caller, so the caller can decide when the destructor is run. Or, we put the object into another object, and the parent object can decide when it's run.

In short: defer can make sure something happens at the end of your function, but RAII can make sure that something happens even past the end of your function.

Now that we see the differences between Higher RAII and RAII and defer, let's see some more examples!

https://verdagon.dev/blog/higher-raii-uses-linear-types#whats-the-difference-between-raii-and-defer

@qudat

Go threads would be nice

@ngrilly

Yes, they would, but you can't have them without growing stacks (a stack that starts small for each goroutine and grows/shrinks over time depending on stack depth), which would impact the seamless zero-overhead FFI with C. That's a difficult problem. Rust abandoned green threads for the same reason.

Edit: To be clear, yes, it would be great to have something to make concurrent programming easier. The "colourless" async/await in Zig before 0.11 was interesting. Hopefully it can revived and improved in a future release.

@unservant

1. Runtime type information, doesn't need to be as much as Jai or Odin – see how for example how C3 does it: https://c3-lang.org/references/docs/reflection/ and also https://c3-lang.org/references/docs/anyinterfaces/

2. Built in vtable support to make working with those less error prone.

3. Not expanding the scope of the toolchain all of the time...

@Linguistic-mystic

Traits and static dispatch.

Operator overloading (I mean, it already has it for arithmetic operators, but it’s not extensible). It’s very practical and no, it won’t turn the language into C++

Parametric polymorphism. No, comptime is not a substitute

A non-asshole project lead who would focus on language features

@DooMWhite

Gtfo, wrong language bud.

https://www.reddit.com/r/Zig/comments/1csv0it/what_features_is_zig_missing/
