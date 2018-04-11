rofrol
How can I make json decoder fail, when there is new field in json object that I haven’t handled with `field`?

jessta
You can use http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Json-Decode#keyValuePairs to get a list of the keys and their values and check the list of keys against some expected list
generally people don't want their decoders to fail when fields are added because it makes it difficult to add fields

rofrol
@jessta  values can be of different types so that `keyValuePairs` won’t work here. Also I want it to fail, cause I have a huge json for which to make a decoder and I don’t want to miss some field.

jessta
@rofrol `keyValuePairs` gives you a `List (String, Json.Decode.Value)` so you can access the field names directly as strings, but need to decode the the values with a decoder, so it works with any type of json values

```elm
keyValuePairs : Decoder a -> Decoder (List (String, a))
keyValuePairs =
  Native.Json.decodeKeyValuePairs
```

```elm
decodeString (keyValuePairs int) """{ "alice": 42, "bob": 99 }""" == Ok [("bob",99),("alice",42)]
```

```elm-repl
> decodeString (map (\i -> Debug.log "i" i) ( keyValuePairs value )) """{ "alice": "someString", "bob": 99 }"""
i: [("bob",99),("alice","someString")]
Ok [("bob",99),("alice","someString")]
    : Result.Result String (List ( String, Json.Decode.Value ))
```

This is the answer http://folkertdev.nl/blog/elm-messy-json-value/ ahttps://ellie-app.com/dSzh4QL3fa1/0nd updated to elm-0.18

----

ilias
http://package.elm-lang.org/packages/zwilias/json-decode-exploration/5.0.0/Json-Decode-Exploration can generate warning for unused information in the json
and http://package.elm-lang.org/packages/zwilias/json-decode-exploration/5.0.0/Json-Decode-Exploration#strict can be used to make that into a `strict` result - warnings become errors

rofrol 
explorations look nice though still experiment?

ilias
@rofrol I know folks are using it in production so I'm rather careful with that repo