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
> -- https://www.reddit.com/r/elm/comments/5c1i14/elm_enterprise_adoption/d9t0qg8/
