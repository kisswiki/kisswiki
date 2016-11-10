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

## Dictionary

> you can’t use any custom data-types as the key of a dictionary in Elm.
> Did you hear that? That was the sound of type-safety dying.
> -- http://reasonablypolymorphic.com/blog/elm-is-wrong
