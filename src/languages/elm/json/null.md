## provide default value

`oneOf [player, null nullPlayer]`

- https://robots.thoughtbot.com/decoding-json-structures-with-elm
- http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode#oneOf

## decode to Nothing

http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode#nullable

## nullable

```elm
nullable bool
```

```elm
oneOf [ null Nothing, map Just bool ]
```