## Options

1. http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode
  - With apply, you can chain as many decoders as you like and build objectN http://www.troikatech.com/blog/2015/08/17/decoding-larger-json-objects-in-elm
2. https://github.com/NoRedInk/elm-decode-pipeline
3. https://github.com/mpdairy/elm-frontier
4. https://github.com/pinksalmon/elm-online-store/blob/master/api/api.js
  - https://www.reddit.com/r/elm/comments/4ougvs/online_store_example_is_this_a_better_way_to/

## Translate

- translation between JSON and Elm types https://github.com/lambdatoast/elm-json

## pretty print 

- `Json.Encode.encode 4` https://groups.google.com/d/msg/elm-discuss/LmtlxeNqsRw/G-WT9h4yDz8J
- http://stackoverflow.com/questions/40517852/elm-how-to-pretty-print-the-model-in-the-browser

## elm-decode-pipeline

- https://becoming-functional.com/testing-json-decoders-in-elm-39f613a98895
- https://medium.com/@zenitram.oiram/a-beginners-guide-to-json-and-elm-c4a0c7e20002
- https://medium.com/@kkruups/elm-insights-c74047637206

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
- https://www.brianthicks.com/post/2016/10/31/json-schema-changes-a-halloween-horror-story/
- port Maybe field behavior https://groups.google.com/forum/#!msg/elm-discuss/vu2A3vHWUxM/RHScpLHLAwAJ
- To deal with the a) null values and b) missing values, I resorted to passing the Json through the port, and decode in Elm https://groups.google.com/forum/#!msg/elm-discuss/vu2A3vHWUxM/RHScpLHLAwAJ
- http://www.troikatech.com/blog/2015/08/17/decoding-larger-json-objects-in-elm
- customDecoder removed from elm-0.18 https://groups.google.com/forum/#!topic/elm-dev/Ctl_kSKJuYc https://gist.github.com/opsb/70a2477494081a4e2806ce6b244a2cbc

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

## andThen

>Helpful when one field will determine the shape of a bunch of other fields.
>-- http://package.elm-lang.org/packages/elm-lang/core/3.0.0/Json-Decode#andThen

<br>

>Create decoders that depend on previous results
>-- http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode#andThen

```elm
andThen : (a -> Decoder b) -> Decoder a -> Decoder b
```

http://stackoverflow.com/questions/35240365/elm-complex-custom-json-decoder

```elm
import Html as H
import Json.Decode exposing (..)

type User = Anonymous | LoggedIn String

type alias Id = Int

type alias AccessToken = String

type alias Model =
  { email_id : User
  , id : Id
  , status : Int
  , message : String
  , accessToken : AccessToken
  }

modelDecoder : Decoder Model
modelDecoder =
  (field "status" int) |> andThen modelDecoderByStatus

modelDecoderByStatus : Int -> Decoder Model
modelDecoderByStatus status =
  case status of
    0 ->
      map5
        Model
        (succeed Anonymous)
        (succeed 0)
        (succeed status)
        (field "message" string)
        (succeed "")
    1 ->
      map5
        Model
        (map LoggedIn (field "email_id" string))
        (field "id" int)
        (succeed status)
        (succeed "")
        (field "token"string)
    _ ->
      fail <| "Unknown status: " ++ (toString status)

main = H.div []
  [ H.div [] [ decodeString modelDecoder msg1 |> Result.toMaybe |> Maybe.withDefault emptyModel |> toString |> H.text ]
  , H.div [] [ decodeString modelDecoder msg2 |> Result.toMaybe |> Maybe.withDefault emptyModel |> toString |> H.text ]
  ]

emptyModel = Model Anonymous 0 0 "" ""

msg1 = """
{
  "status": 0,
  "message": "Error message explaining what happened in server"
}
"""

msg2 = """
{
  "status": 1,
  "email_id": "asdfa@asdfa.com"
  "token": "asdfaz.adfasggwegwegwe.g4514514ferf"
  "id": 234
}
"""
```

## handle arbitrary json

>Coming from other languages, even back-end languages, decoding JSON just isn't a thing. Even on the back-end, I will setup a reflection-based deserializer with general error handling (e.g. Newtonsoft for .NET) and I'm done. The ongoing work is just maintaining the data types, which I must do anyway. The back-end deserializer does take some initial testing to work out the kinks, but that work has an end after which there is no ongoing maintenance.
>
>I first started using Elm's recommended codec-ing scheme. I found that if I needed to round-trip an entity to an API, I needed 4 representations of the same entity. One on the client and one on server is given. But then 1 encoder representation and 1 decoder representation... both of which spell out the same information in the type alias. So in order to change the entity, I have 4 places that need maintenance. No thanks.
>
>Abusing ports, I arrived at a similar solution to what I explained previously in this thread for decoding. But since encoding is also monkey work, I wanted to abuse ports to launder that too. However, the process to do that was herky-jerky. A port/sub round trip for encoding, then an Elm HTTP call, then a port/sub round trip for decoding. Instead, I abandoned the Elm HTTP library altogether. I added in a fetch polyfill (whatwg-fetch) and run the HTTP call in JS.
>
>Here is a gist. https://gist.github.com/kspeakman/3653ae489c62c4d60c9ba9a9c19fd30b
>
>I did precisely the same style in https://github.com/OvermindDL1/elm-jsphoenix too, to minimize the duplication of work (which also increased by elm removing the ability to extend record types into a new type, and lacking the ability to move Dict's across, so those two things still add some, but it still saved a ton of work but (ab)using ports for the end-user).
>
>-- Is a decoder the right level of abstraction for parsing JSON? https://groups.google.com/forum/#!topic/elm-discuss/XW-SRfbzQ94/discussion

## map2

http://folkertdev.nl/blog/elm-json-object-parsing/

```elm
import Html exposing (..)
import Json.Decode exposing (..)


serverResponse =
    """{"tag": "input", "default": "test"}"""


type alias Response =
    { tag : String, default : String }


decodeResponse : Decoder Response
decodeResponse =
    (field "tag" string)
        |> andThen
            (\tag ->
                (field "default" string)
                    |> andThen
                        (\default ->
                            succeed (Response tag default)
                        )
            )

decodeResponse2 : Decoder Response
decodeResponse2 =
    map2 Response
        (field "tag" string)
        (field "default" string)

main =
    decodeString decodeResponse serverResponse
        |> toString
        |> text
```

