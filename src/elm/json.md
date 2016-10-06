- https://egghead.io/lessons/elm-decode-a-list-of-numbers-from-a-json-string-in-elm
- https://www.brianthicks.com/post/2016/08/22/decoding-large-json-objects-a-summary/
- Importance of type annotations when decoding json https://www.reddit.com/r/elm/comments/55nozn/decode_json_to_record_got_ok_function/
- http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode
- http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Encode
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

> In other languages often there is a way to convert a Json string into an untyped Map/dictionary however, Elm does not support untyped values.
As far as why is there no way for Elm to automatically provide typed decoders for custom types like you get with say Gson in Java that is probably because there is no reflection mechanism in Elm at the moment. All value creation for custom types must be done by functions that you provide (and that is where Decoders come in).
> -- https://www.reddit.com/r/elm/comments/4nsany/stupid_question_why_is_it_not_possible_to/

<br>

> so decoding can result in runtime errors, for example when you forget to use a Maybe to decode nullable json.
> -- https://www.reddit.com/r/elm/comments/54fk9k/easiest_json_decode/

## Use type annotations

```
decodeString decodeLocationRecordBad """{ "name": "Name1", "latlon": "12341234" }""" ]
decodeString decodeLocationRecord """{ "name": "Name1", "latlon": "12341234" }""" ]
```

https://www.reddit.com/r/elm/comments/55nozn/decode_json_to_record_got_ok_function/
