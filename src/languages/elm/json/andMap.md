```elm
andMap : Decoder a -> Decoder (a -> b) -> Decoder b
andMap =
    flip (map2 (<|))
```

Why not `andMap` from https://github.com/elm-community/json-extra/blob/2.7.0/src/Json/Decode/Extra.elm#L84?

```elm
andMap = map2 (|>)
```

or better this sorter form

```elm
(|:) = map2 (<|)
```

Let's first analyze andMap using flip.


```elm
(<|) : (a -> b) -> a -> b
```

`flip (map2 (\func val -> func val) funcDecoder valDecoder)`

`valDecoder -> funcDecoder`

http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#%3C


```elm
map2
    :  (a -> b -> value)
    -> Decoder a
    -> Decoder b
    -> Decoder value
```

http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#map2

in elm-repl:

```
> import Json.Decode exposing (..)
> map2 (<|)
<function>
    : Json.Decode.Decoder (a -> b)
      -> Json.Decode.Decoder a -> Json.Decode.Decoder b
```

So this gives us this function:

```elm
andMapL
    :  Decoder (a -> b)
    -> Decoder a
    -> Decoder b
```

Now andMap from json-extra:

```elm
(|>) : a -> (a -> b) -> b
```

```
> import Json.Decode exposing (..)
> map2 (|>)
<function>
    : Json.Decode.Decoder a
      -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
```

```elm
map2
    :  (a -> b -> value)
    -> Decoder a
    -> Decoder b
    -> Decoder value
```

```elm
andMap
    :  Decoder a
    -> Decoder (a -> b)
    -> Decoder b
```

And usage:

```elm
optionsDecoder : Decoder { options : String }
optionsDecoder =
    andMap (succeed (\options -> { options = options })) (field "options" string)
```

```
> import Json.Decode exposing (..)
> andMapL = flip (map2 (<|))
<function>
    : Json.Decode.Decoder a
      -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
> andMap = map2 (|>)
<function>
    : Json.Decode.Decoder a
      -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
> decodeString (andMapL (field "options" string) (succeed (\options -> { options = options })) ) """ { "options": "someoption" } """
Ok { options = "someoption" } : Result.Result String { options : String }
> decodeString (andMap (field "options" string) (succeed (\options -> { options = options })) ) """ { "options": "someoption" } """
Ok { options = "someoption" } : Result.Result String { options : String }
```

The order doesn't matter:

>Try two decoders and then combine the result http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#map2


ilias
It shouldn't matter for decoders

There are cases where it does - for example a parser that consumes part of the input - but decoders don't work that way.
so I'd go for `map2 (\val func -> func val) valDecoder funcDecoder` - which is the same thing as `map2 (|>)`


so this:

```elm
a -> (a -> b) -> b
```

instead of

```elm
a -> (a -> b) -> b
```