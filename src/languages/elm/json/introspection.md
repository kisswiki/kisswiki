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

or

```elm
decodeData =
    JD.value |> JD.andThen (\value -> JD.succeed <| Debug.log "value" (toString value))
```

## decode map - GeoJSON example

```elm
renderedFeaturesJson =
    """{
  "geometry": {
    "type": "Point",
    "coordinates": [
      0,
      0
    ]
  },
  "type": "Feature",
  "properties": {},
  "id": 1,
  "layer": {
    "id": "point",
    "type": "circle",
    "source": "pointsJson",
    "paint": {
      "circle-radius": 10,
      "circle-color": "rgba(56, 135, 190, 1)"
    }
  },
  "source": "pointsJson",
  "state": {
    "hover": true
  }
}
"""


type alias RenderedFeature =
    { geometry : JD.Value
    , type_ : String
    , properties : JD.Value
    , id : Int
    , layer : JD.Value
    , source : String
    , state : JD.Value
    }


emptyRenderedFeature =
    RenderedFeature
        (Json.Encode.object [])
        ""
        (Json.Encode.object [])
        0
        (Json.Encode.object [])
        ""
        (Json.Encode.object [])


decodeRenderedFeature =
    JD.succeed RenderedFeature
        |> andMap (JD.field "geometry" JD.value)
        |> andMap (JD.field "type" JD.string)
        |> andMap (JD.field "properties" JD.value)
        |> andMap (JD.field "id" JD.int)
        |> andMap (JD.field "layer" JD.value)
        |> andMap (JD.field "source" JD.string)
        |> andMap (JD.field "state" JD.value)


decodedRenderedFeature =
    Result.withDefault emptyRenderedFeature <| JD.decodeString decodeRenderedFeature renderedFeaturesJson

main =
    Html.text <| Debug.toString decodedRenderedFeature
```

## Introspect already used decoder

```elm
            (Json.Decode.value
                |> Json.Decode.andThen
                    (\value ->
                        let
                            _ =
                                Debug.log "value"
                        in
                        Json.Decode.field "data" (Json.Decode.list idDecoder)
                    )
            )
        --(Json.Decode.field "data" (Json.Decode.list idDecoder))
```
