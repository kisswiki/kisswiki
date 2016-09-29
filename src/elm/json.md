- https://egghead.io/lessons/elm-decode-a-list-of-numbers-from-a-json-string-in-elm
- https://github.com/lambdatoast/elm-json
- https://guide.elm-lang.org/interop/json.html
- http://zkessin.github.io/elm-examples-blog//examples/2016/01/11/parsing-json.html
- https://elmseeds.thaterikperson.com/json-decode-extra
- http://package.elm-lang.org/packages/elm-community/json-extra/latest/Json-Decode-Extra

> In other languages often there is a way to convert a Json string into an untyped Map/dictionary however, Elm does not support untyped values.
As far as why is there no way for Elm to automatically provide typed decoders for custom types like you get with say Gson in Java that is probably because there is no reflection mechanism in Elm at the moment. All value creation for custom types must be done by functions that you provide (and that is where Decoders come in).
