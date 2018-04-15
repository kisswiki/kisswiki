```elm
audienceFoldersDecoder : Decoder Value
audienceFoldersDecoder =
    value
```

```elm
audienceFoldersDecoder : Decoder Value
audienceFoldersDecoder =
    field "data" value |> andThen (\value -> succeed <| Debug.log "value" value)
```

or

```elm
audienceFoldersDecoder : Decoder (List Value)
audienceFoldersDecoder =
    field "data" (list value) |> andThen (\list -> succeed <| Debug.log "list" list)
```