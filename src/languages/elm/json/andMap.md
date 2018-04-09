```elm
andMap : Decoder a -> Decoder (a -> b) -> Decoder b
andMap =
    flip (Decode.map2 (<|))
```

Why not `andMap` from https://github.com/elm-community/json-extra/blob/2.7.0/src/Json/Decode/Extra.elm#L84?

```elm
andMap = map2 (|>)
```


```elm
(<|) : (a -> b) -> a -> b
```

http://package.elm-lang.org/packages/elm-lang/core/latest/Basics#%3C


```elm
map2
    :  (a -> b -> value)
    -> Decoder a
    -> Decoder b
    -> Decoder value
```

http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#map2

```
> import Json.Decode exposing (..)
> map2 (<|)
<function>
    : Json.Decode.Decoder (a -> b)
      -> Json.Decode.Decoder a -> Json.Decode.Decoder b
```

```elm
map2
    :  (a -> b -> value)
    -> Decoder (a -> b)
    -> Decoder a
    -> Decoder b
```