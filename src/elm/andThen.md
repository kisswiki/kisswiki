- https://medium.com/@dailydrip/monads-haskell-and-elm-a-socratic-dialogue-c0a1b4f6acb2
## why andThen can't be used as infix operator anymore

I think one of the motives is that a function inside ticks has precedence over (|>). Therefore, with Maybe.andThen as it is, piping with multiple functions where only some of which return a Maybe pretty annoying in Elm 0.17.
For example, this works:
value |> f1 |> flip Maybe.andThen f2 |> Maybe.map f3 |> Maybe.map f4 |> flip Maybe.andThen f5
This doesn't:
value |> f1 `Maybe.andThen` f2 |> Maybe.map f3 |> Maybe.map f4 `Maybe.andThen` f5
Even if it would, it would be ugly.
In Elm 0.18, I won't need those flips.

- https://www.reddit.com/r/elm/comments/5b33wl/elm_018_and_andthen/d9o6nnh/
- https://github.com/elm-lang/elm-platform/blob/master/upgrade-docs/0.18.md#backticks-and-andthen
