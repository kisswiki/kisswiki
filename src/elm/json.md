## elm-decode-pipeline

- https://becoming-functional.com/testing-json-decoders-in-elm-39f613a98895
- https://medium.com/@zenitram.oiram/a-beginners-guide-to-json-and-elm-c4a0c7e20002

> Evan: checking out this project https://github.com/NoRedInk/elm-decode-pipeline. That is a nice approach for when things get big.
> -- https://www.reddit.com/r/elm/comments/4ulle5/needing_to_decode_large_json_structures/

<br>

> Always use Json.Decode.Pipeline instead of objectN
> -- https://github.com/NoRedInk/elm-style-guide

<br>

> Normally we would prefer the pipeline style but here objectN makes a lot of sense!
> -- https://www.brianthicks.com/post/2016/10/31/json-schema-changes-a-halloween-horror-story/

<br>

> The decoder maps the JSON names and types into the Elm record type we are decoding into.
> -- https://becoming-functional.com/testing-json-decoders-in-elm-39f613a98895

<br>

> If you run out of map functions, take a look at elm-decode-pipeline which makes it easier to handle large objects, but produces lower quality type errors
> -- http://package.elm-lang.org/packages/elm-lang/core/5.0.0/Json-Decode

## Other

- https://egghead.io/lessons/elm-decode-a-list-of-numbers-from-a-json-string-in-elm
- https://www.brianthicks.com/post/2016/08/22/decoding-large-json-objects-a-summary/
- https://www.brianthicks.com/post/2016/10/17/composing-decoders-like-lego/
- https://www.brianthicks.com/post/2016/10/10/debugging-json/
- http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode
- https://guide.elm-lang.org/interop/json.html
- https://robots.thoughtbot.com/decoding-json-structures-with-elm
- http://zkessin.github.io/elm-examples-blog//examples/2016/01/11/parsing-json.html
- https://elmseeds.thaterikperson.com/json-decode-extra
- http://package.elm-lang.org/packages/elm-community/json-extra/latest/Json-Decode-Extra
- https://groups.google.com/forum/#!msg/elm-discuss/XW-SRfbzQ94/aKufhX0LBgAJ
- Some parts only for Elm-0.16 https://csmith111.gitbooks.io/functional-reactive-programming-with-elm/content/Data.html
- https://www.reddit.com/r/elm/comments/4omnt5/how_do_i_turn_a_record_into_a_json_string/
- https://www.elm-tutorial.org/en/06-fetching-resources/04-players-cmds.html
- http://faq.elm-community.org/#how-can-i-parse-json-into-elm-data
- http://simonh1000.github.io/decoder/
- Elm Json.Decode tutorial and cheatsheet - some parts only for Elm-0.16 https://gist.github.com/yang-wei/0a1cea1194a244aa9be6
- With apply, you can chain as many decoders as you like and build objectN http://www.troikatech.com/blog/2015/08/17/decoding-larger-json-objects-in-elm
- https://www.brianthicks.com/post/2016/10/31/json-schema-changes-a-halloween-horror-story/
- port Maybe field behavior https://groups.google.com/forum/#!msg/elm-discuss/vu2A3vHWUxM/RHScpLHLAwAJ
- To deal with the a) null values and b) missing values, I resorted to passing the Json through the port, and decode in Elm https://groups.google.com/forum/#!msg/elm-discuss/vu2A3vHWUxM/RHScpLHLAwAJ
- http://www.troikatech.com/blog/2015/08/17/decoding-larger-json-objects-in-elm
- customDecoder removed from elm-0.18 https://groups.google.com/forum/#!topic/elm-dev/Ctl_kSKJuYc

> In other languages often there is a way to convert a Json string into an untyped Map/dictionary however, Elm does not support untyped values.
As far as why is there no way for Elm to automatically provide typed decoders for custom types like you get with say Gson in Java that is probably because there is no reflection mechanism in Elm at the moment. All value creation for custom types must be done by functions that you provide (and that is where Decoders come in).
> -- https://www.reddit.com/r/elm/comments/4nsany/stupid_question_why_is_it_not_possible_to/

<br>

> so decoding can result in runtime errors, for example when you forget to use a Maybe to decode nullable json.
> -- https://www.reddit.com/r/elm/comments/54fk9k/easiest_json_decode/

<br>

> decoding will fail silently if you accidentally spell one of the property names incorrectly. (Silent failures are especially bad in Elm, because you never expect them to happen.) I disagree that elm-decode-pipeline makes it any better - it just makes it less worse.
> -- https://www.reddit.com/r/elm/comments/5cmrsz/decoding_json_in_elm/d9yg0cm/

## Use type annotations

```
import Html exposing (text, div)
import Json.Decode exposing (..)

type alias LocationRecordBad =
    { name : String
    , latlon : String
    , watchers_count : Int
    }

-- Uncomment below type annotation
-- decodeLocationRecordBad : Decoder LocationRecordBad
decodeLocationRecordBad =
    object2 LocationRecordBad ("name" := string) ("latlon" := string)

type alias LocationRecord =
    { name : String
    , latlon : String
    }

decodeLocationRecord =
    object2 LocationRecord ("name" := string) ("latlon" := string)

main =
    div []
        -- Ok <function>
        [ div [] [ text <| toString <| decodeString decodeLocationRecordBad """{ "name": "Name1", "latlon": "12341234" }""" ]
        -- Ok { name = "Name1", latlon = "12341234" }
        , div [] [ text <| toString <| decodeString decodeLocationRecord """{ "name": "Name1", "latlon": "12341234" }""" ]
        ]
```

https://www.reddit.com/r/elm/comments/55nozn/decode_json_to_record_got_ok_function/
