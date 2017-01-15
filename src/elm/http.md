- http://stackoverflow.com/questions/39967330/elm-http-request-on-init
- http://package.elm-lang.org/packages/lukewestby/elm-http-builder

## can Http.get utilize a CSV decoder

https://elmlang.slack.com/archives/general/p1484330643014143

@bleuropa:

If I am fetching CSV data from a link, can Http.get utilize a CSV decoder from a package like http://package.elm-lang.org/packages/periodic/elm-csv/1.0.1/Csv, instead of the JSON decoder it expects.

Is there a way with Repl to inspect how the data is arriving from the url, so I can figure out how to decode it?

@joelq:

The type signature of `Http.get` is

```elm
get : String -> Json.Decode.Decoder a -> Request a
```
 
looks like it has to be a JSON decoder

so basically create a `getCsv : String -> Csv.Decoder a -> Request a` function?

@krisajenkins:

You’ll have to drop down to using `Http.send` and a `Request` with a custom `expect`.

I’d look at http://package.elm-lang.org/packages/elm-lang/http/1.0.0/Http#expectStringResponse

Create a function `expectCsv: Response String -> Result String a` and you’ll be on your way.
