## Got jsonValue: <internal>

```elm
Debug.log "jsonValue" jsonValue
```

Solution:

```elm
Debug.log "jsonValue" (Json.Encode.encode 2 jsonValue)
```

https://discourse.elm-lang.org/t/json-payload-now-traces-out-as-internals/1896/2
