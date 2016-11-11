- https://www.quora.com/What-do-you-think-is-the-future-of-the-Elm-programming-language
- https://news.ycombinator.com/item?id=10081955
- cons
  - Regardless of the technical merits of any alternative solution offers, and we are not just talking about Clojurescript, Elm offers a similar set of advantages, the herding effect is powerful. Your investment in Javascript is far more likely to pay off that putting time into one of the alternatives, none of which have momentum. http://rrees.me/2014/01/16/clojurescript-is-it-any-better-yet/
  - it's hard to interface with JavaScript, making libraries such as three.js and pixi.js unavailable https://www.reddit.com/r/elm/comments/3vxxyt/is_elm_lacking_an_assetgame_framework/cxrrier
  - Right now, making use of browser api's isn't as easy as it should be, and interop with external js libraries almost too much work to be worth it (I'm my experience). https://www.reddit.com/r/elm/comments/3y9un5/any_idea_about_how_to_make_mobile_html_apps/cyc6r33
  - SIGNAL HELL. This is the same situation as callback hell. The only difference is that callbacks separate your code at boundaries determined by asynchronous calls, while these signal display functions do it at boundaries determined by the type system. http://langnostic.blogspot.com/2013/06/elm-in-practice.html
  - not-expressive-enough static type systems, because it means that polymorphic code that we're used to easily express in JS, becomes a type error in Elm, due to lack of e.g. rank-2 types http://stackoverflow.com/questions/15490053/what-are-the-advantages-and-disadvantages-of-angular-js-vs-elm/15531171#15531171
  - Elm architecture is nice and clean, but it gets complicated when you add effects https://github.com/mgold/elm-sandbox/tree/master/src/Change
  - https://news.ycombinator.com/item?id=10837278
- pros
  - https://prezi.com/qaklogolc1qz/why-prezi-is-investing-in-frp-elm/
  - http://forwardjs.com/university/why-prezi-is-betting-on-frp
  - http://futurice.com/blog/elm-in-the-real-world
  - https://pragmaticstudio.com/blog/2015/10/22/is-learning-elm-worth-your-time

> Every problem I ever had with it was decoding malformed data coming from the API, and learning how to manage complexity in a functional way instead of OOP, and the unfortunate lack of complicated "widgets" in Elm, such as a datepicker (there is one now that is pretty good, but it will never be as configurable as simply dropping in the jQuery one).
> The neat thing about Elm for enterprise is you don't have to build the entire app in it (and I would recommend that you do not), instead you can implement small portions of the app that can really benefit from the safety and runtime guarantees. If you don't like the view layer (and I wouldn't blame you atm; it is good enough for my purposes, but there are some rough edges), you can probably implement it in React and just use Elm to mutate the state.
> I did find myself writing and re-writing similar boilerplate code over and over for each app and that the initial implementations of complicated features were like solving long, arduous math problems. Some of my older code for manipulating complicated models is incomprehensible. The results are absolutely killer, Elm delivers on reliability in a huge way, but it is difficult to move quickly and add features until you have written a LOT of imports, type definitions, and JSON decoders or encoders. There is a dire need for a way to generate these automatically.
> -- https://www.reddit.com/r/elm/comments/5c1i14/elm_enterprise_adoption/d9t0qg8/

<br>

> my biggest complaint about Elm which is that it will throw a runtime exception for function comparison — an operation that would be safe in just about any other language, particularly JavaScript. The defense of this is that value equality for functions is undecidable but then there really ought to be an equatable typeclass that would go along with comparable — more compiler smells and won't we be surprised when lots of things turn out not to be equatable. Personally, I prefer the compromise of just saying that functions that can't readily be proven equal are considered unequal.)
> -- https://groups.google.com/forum/#!msg/elm-discuss/NKFxMyPHBoY/FtMfD2Z5AwAJ


## Select

> help define an agreed-upon way to do select boxes
> or the record, I do code generation to make sure I am not forgetting anything in lists of options, and this sucks
> there is no built-in/good way to write a select box
you can add a new element to the sum type, and forget to add it to timeRangeOptions
> I'm curious what alternative solutions people are suggesting to having to manually create a list of options.
Reflection seems like a bad solution because you suddenly couple the arbitrary order of constructors in a union type to the order they are presented in a view. It is also brittle because it falls apart the moment you want to exclude one or more options. Also, how do we handle a type which has constructors of different types?
Are there alternate solutions out there which address these problems?
>> All those things are trivially handled in a system with reflection
> How is this trivially handled? The order of the items in the view shouldn't be coupled with some order that makes sense in the source file. How do you decouple these things without declaring the arbitrary order of elements like making a list?
> -- https://www.reddit.com/r/elm/comments/5c3yx2/a_reaction_to_the_article_a_small_dive_into_and/

<br>

> Just add a way to get to the data the compiler has when it tells you a case isn't exhaustive?
> -- https://www.reddit.com/r/elm/comments/5bt8f4/elm_is_wrong_reasonably_polymorphic_xpost_from/d9ssj83/

<br>

> PureScript doesn't support tuples out of the box. Instead, they just use records, which is a far superior way of using product types and avoids complecting the fields.
> https://www.youtube.com/watch?v=rI8tNMsozo0&t=24m10s
> -- https://www.reddit.com/r/programming/comments/5bsanc/elm_is_wrong_reasonably_polymorphic/d9r5lji/

<br>

> In an imparative language you would probably just use a list right? That would work in Elm too. The id could be generated using List.indexedMap and you could even ensure that every element is unique by converting it to a Set.
http://elm-ui.info/reference/chooser https://github.com/gdotdesign/elm-ui/blob/master/source/Ui/Chooser.elm
> Sure. But if I can’t use type safe features, what’s the point of elm?
> When you update your union type you don’t get a runtime error because you’re forced to handle the *unknown* cases in the parser, what you *not* get is a compile error so you would have to run your app to test it right? That’s not desired but it’s better than an unexpected error at runtime imo.
> https://hackernoon.com/a-small-dive-into-and-rejection-of-elm-8217fd5da235

<br>

> maybe the attraction to use tuples instead of records sometimes has to do with the fact that tuples are comparable while records are not. And then, of course, after 6-tuples that stops to be true, because even tuples are not comparable anymore from 7 onwards.
> -- https://groups.google.com/forum/#!msg/elm-discuss/NKFxMyPHBoY/FtMfD2Z5AwAJ

## Dictionary

> you can’t use any custom data-types as the key of a dictionary in Elm.
> Did you hear that? That was the sound of type-safety dying.
> -- http://reasonablypolymorphic.com/blog/elm-is-wrong

## Map

> Elm gets around all of this complexity by ignoring it and making us do everything the hard way. There is no map function, but there are List.map, Dict.map, Array.map among others, and none of them are related to one another. This is not only annoying, but also breaks the abstract data-type guarantee: our call-sites are now tightly coupled to our implementation details. If I decide to change from a List a to an Array a for efficiency reasons, my whole codebase needs to know about it.
> -- http://reasonablypolymorphic.com/blog/elm-is-wrong

## vtable

> An aside, where he mentions 'If you don’t want to read the essay, SYTC essentially says “hey, why don’t we pass around an object that describes the implementation of the contract that we care about, rather than having the compiler infer it for us?”. If you’re familiar with Scala, this is how they implement typeclasses in terms of implicit parameters. If you’re not, SYTC is equivalent to passing around a vtable whenever you want to invoke code on a dynamic target.', that is just what OCaml is doing in a soon-coming version with its implicit modules.
> -- https://news.ycombinator.com/item?id=12915227

<br>

> In an OOP language, objects have a hidden field: a struct containing function pointers for each member function the object's type hierarchy defines.
Another way of doing things is to pass the array of function references along with your data structures. This is done in C, such as with the GObject type system -- the first member of any GObject is its "virtual function table" (vtable). And since humans have to reference the functions by name, they use structs with named fields instead of arrays, but it's the same thing.
In Elm and Haskell, you can duplicate that pattern.
But what if there are two different sets of functionality that this type has? Like if in C# you wanted to implement a custom comparison, that's using the vtable from IComparable, and if you also wanted to implement IDisposable, that's a different vtable. That gets cumbersome when you have to pass vtables around explicitly.
Haskell has an interesting feature, though. You can make one vtable struct containing everything related to your type, and the complier can ensure that it matches both the vtable for IDisposable and the one for IComparable.
Elm doesn't have it, but they still recommend this vtable struct pattern.
The other way of working is type classes, which are kind of like Go's interfaces. A thing implements an interface if it happens to implement the right functions. In Haskell, though type classes exist, many people recommend using the vtable pattern instead.
In Elm, there are no type classes. This is because Haskell people recommend against using them. But in Haskell, they could only work with vtables in place of typeclasses effectively because of a feature that Haskell has and Elm lacks.
> -- https://www.reddit.com/r/programming/comments/5bsanc/elm_is_wrong_reasonably_polymorphic/
