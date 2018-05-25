- pros and cons http://bobkonf.de/2016/slides/karg.pdf

##

I'd go a little further and say that while PureScript is closer to JavaScript than Haskell in some dimensions, there are others in which it's even further away. I just don't see a viable path to learning PureScript at all that doesn't start with "first, learn Haskell." There are not enough resources to walk people through the baby steps in PureScript itself; and as far as I can tell, the community is not at all interested in compromising their abstraction towers with any kind of simplified ideas at all!

https://www.reddit.com/r/haskell/comments/79i7h9/why_is_elm_more_popular_than_purescript/dp2hzf0/

##

PureScript's performance is not even close to Elm right now and I don't know of any other alternatives to Elm. Besides, purescript-halogen, the most popular PureScript framework, looks very complicated compared to elm-lang/http.

https://www.reddit.com/r/elm/comments/81bo14/do_we_need_to_move_away_from_elm/dv21uhj/

##

I played with PureScript a little. It has advanced type system that captures a lot of semantics of JS allowing easy interobility with JS ecosystem. But that comes with a huge price. With all those monads and monad transformers interacting with JS it is easy to end up with stateful mess. Surely, it will be typed and functional mess, but still it is hard to maintain with all state pieces spread through code hiding in lambdas.
With Elm the situation is very different. All your code is pure. The runtime hides the state management and the only way to interact with JS is via message passing. The end result is code that is extremely easy to follow, maintain and debug. Moreover, as Elm style and tooling discourages using lambda-style callbacks with opaque state, all state is very explicit and often just by looking at the state data structures, one often can grasp what the code is doing. It is almost like code follows from the data structures.

https://news.ycombinator.com/item?id=17147325