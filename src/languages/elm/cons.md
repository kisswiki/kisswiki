- My post https://www.reddit.com/r/elm/comments/6scicd/what_are_elm_pitfalls/

##

>>The logic of every Elm program will break up into three cleanly separated parts: model, update, view
>
>That assertion is erroneous. You would be missing a couple of important parts:
- the logic that decides which state you are in so you can properly compute the view and enable the actions associated to the state 
- the next action predicate
>
>One can achieve a much better decoupling between the view and the model by introducing the concept of State to hold that kind of logic, otherwise you would have to fit it either in the view or in the model. The concept of "State" is critical to achieve that decoupling. The view then becomes a pure state representation, and hence a pure function of the model.
>
>I didn't make up these semantics, they are coming directly from TLA+. TLA+ is used at Amazon to correct the most complex defects in AWS. 
>
>As a side note, some people like to call "control state" what I call state and they prefer using the word "state" to describe the content of the model. For me a model is just a set of property values with rules that decides whether some values are acceptable or not. The Model does not know anything about actions and state. Above the model, there are the (control) State and the Actions. Below is the usual CRUD to data stores. Above the (control) State and the Actions is/are the State Representation(s) (say in the REST sense, but not from a Resource-Oriented point of view).
>
>-- https://www.infoq.com/articles/no-more-mvc-frameworks

##

If you don't require the use of native browser APIs that aren't supported via an official package, it should be a good fit. It can still be well-suited even if you need to drop into ports or write native code, but the former comes at the cost of ergonomics and the latter is not documented at all

https://www.reddit.com/r/elm/comments/770cfp/is_elm_suitable_for_my_project/doi5wkq/

##

1. Interop. `Reinvent the wheel or die integrating react component` attitude makes Elm almost impractical in day-to-day tasks. I might be wrong, but Elm should push it's benefits like guaranties on business logic and data handling, but provide a sane way to interoperate with the **huge** JS ecosystem.

2. Haskell-influenced docs, libs. `You don't understand what's going on here and need examples? Are you stupid?` Well, yeah, I guess I am.

```elm
merge : (comparable -> a -> result -> result) -> (comparable -> a -> b -> result -> result) -> (comparable -> b -> result -> result) -> Dict comparable a -> Dict comparable b -> result -> result
```

https://www.reddit.com/r/elm/comments/5vh1fi/where_do_you_suffer_most_while_programming_in_elm/
