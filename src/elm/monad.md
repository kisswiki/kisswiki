Evan Czaplicki about teaching:

I really don't want to call things the ___ monad! (e.g. the IO monad, the state monad, etc.)

Haskell people (including me) always say things like, "To print things out you need to use the IO monad." This is like saying, "To add numbers you need to use the Addition Group."

It's just really weird to describe the algebraic properties of the thing in it's name. It also focuses on characteristics you don't need to fully appreciate to be able to use and understand the particular instance. You don't need to understand group theory or field theory to do addition and multiplication, and this is a good thing! Group theory deepens that understanding, but it is non-essential to being able to do basic math.

In both these cases, we made something simple sound magical and complex. I want Elm people to say "To print things out, use the IO library" and to make it parallel "To add numbers, use addition."

Precise language: "___ is a group" vs. "the ___ group"

This is really about speaking precisely. To say "addition forms a group" is just a fact about addition. There are certain algebraic properties that are true about addition. This is cool if you'd like to parallelize something, so in the particular context of a general parallelization algorithm, it makes sense to bring up this algebraic property. You can write a better library if you account not just for addition, but for multiplication and whatever else. In that context, when we need a general solution, it is valuable to talk about the general algebraic property and its instances.

But to say "the addition group" is really really odd. It's implying there's an addition field? And an addition semi-group? People can usefully say the "additive group on integers" or the "multiplicative group on integers" but in those cases we are actually distinguishing between two specific groups that both apply to integers.

When to be general:

In the context of explaining addition, the fact that it is a group is not helpful. This only becomes interesting when we'd like to talk in a general way. Once you have 3-5 examples that you want to use interchangeably in a particular API, then it starts making sense to talk about things in a generic way. To understand a library for Result, State, IO, or Http, the shared patterns do not matter to a casual user. These are separate use cases. Put another way, to understand addition and multiplication, the shared patterns do not matter to the casual user.

So talking in a generic way is useful when you actually want to create something generic! A parallelization library for example.

I am going to make the claim that a monad is an algebraic pattern that is useful for reifying effects. That is, I want to say that it only makes sense to talk about monads if you are interested in talking about reified effects (i.e. explicit effects) in a general way. In my experience this applies only to do-notation, which Elm does not have.

I personally find that there is a very small amount of code that I write that really needs to be generic on effects in any other sense. Now that I think of it, I do get utility out of monad transformers, but I'd argue that that is a ridiculous name that we should avoid. Something like "Nested Effects" would be waaaay clearer. In that context, when we want to be general about which effects can be nested, it makes sense to talk about effects in a general way. Any effect can be nested inside this one, an effect has these algebraic properties, oh hey, State, IO, and Http can all be nested effects!

Summary:

Basically I am saying that we should be precise. If you have the urge to talk about monads, first ask yourself if this is a case in which being general is important. For any particular instance (addition, multiplication, state, io, http, etc.) I think being generic is adding unnecessary complexity and teaching in a bad way. But when it comes to a library for parallelization or nested effects, one must talk in a general way to create a good library.

Talking about algebra for library design:

I find that thinking about applicative vs monad is really helpful for a certain kind of library design. Specifically if you are designing ways to handle effects like FRP or pipes. In this context, it helps you get a nice API and carefully choose how much expressiveness you want. Library design is all about being meticulous about how to minimally express something and algebras are really helpful in this context, so that's fine. When you can't explain what you've done without the algebra you used to design it, then you have more work to do! The fact that something is a group does not mean you are a good teacher for just saying that and walking off.

OXO made it big in kitchenware because they thought hard about their design. They thought about ergonomics and usability. But if they said, you need to understand ergonomics to be able to use our kitchenware, they would fail. The genius of these products is that you don't have to know anything about ergonomics to know that this knife just feels really nice to use.

As a concrete example of library designers having a hard time because they did not know about monads, the clearest example is the Promises stuff that happened recently in JS. If you know about monads, designing that API is trivial. If not, you are reinventing a lot of stuff, probably in a messy way.

I think the big take away is, designing a library and presenting a library are very different things.

https://groups.google.com/forum/#!topic/elm-discuss/1acyOfxvasA
