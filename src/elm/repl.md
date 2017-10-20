Trying to recreate `|:` from `Json.Decode.Extra` in `elm repl`:

```
> import Json.Decode as Json
> andMap = Json.map2 (|>)
<function>
    : Json.Decode.Decoder a
      -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
> (|:) = flip andMap
-- SYNTAX PROBLEM -------------------------------------------- repl-temp-000.elm

I ran into something unexpected when parsing your code!

5|   |:
     ^
I am looking for one of the following things:

    an expression
    whitespace
```

Found isssue: repl simply is restricted https://github.com/elm-lang/elm-repl/issues/110
