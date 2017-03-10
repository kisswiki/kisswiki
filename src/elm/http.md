- http://stackoverflow.com/questions/39967330/elm-http-request-on-init
- http://package.elm-lang.org/packages/lukewestby/elm-http-builder
- http://stackoverflow.com/questions/39392469/how-to-perform-multiple-http-requests-tasks-in-bulk-in-elm-lang
- https://spin.atomicobject.com/2016/10/11/elm-chain-http-requests/

## Post

- https://auth0.com/blog/creating-your-first-elm-app-part-2/
- https://github.com/simonh1000/file-reader/blob/master/examples/Ex4-filepart.elm#L151

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

```elm
Http.send FetchDepartures <| expectCsv departuresUrl

expectCsv : ResponseString -> ResultString a
expectCsv url =
    { method = "GET"
    , headers = []
    , url = url
    , body = Http.emptyBody
    , expect = expectStringResponse (\_ -> Ok ())
    }
```

## append a header

https://github.com/simonh1000/elm-jwt/blob/2.0.0/Jwt.elm#L127

```elm
{-| send is a replacement for Http.send that includes a Jwt token
-}
send : String -> Token -> Json.Decoder a -> String -> Http.Body -> Task Http.Error a
send verb token dec url body =
    let
        sendtask =
            Http.send Http.defaultSettings
                { verb = verb
                , headers =
                    [ ("Content-type", "application/json")
                    , ("Authorization", "Bearer " ++ token)
                    ]
                , url = url
                , body = body
                }
            |> Http.fromJson dec
    in
    sendtask
```


## duplicate header

Using automatically puts on the request header. If you also manually set that header there is Http.jsonBody Content-type: application/json.

now a duplicate header that some servers, such as json-server, are unable to handle.

Duplicate headers should be an "impossible state". It'd be nice if the Elm runtime conditionally added the content-type header only if it's not already present, if not a more elegant solution.

https://www.reddit.com/r/elm/comments/5o5p63/experiences_with_elm_on_a_small_production/

## cache

https://elmlang.slack.com/archives/general/p1484574815015170

@sky:

the data I'm request _can_  change, although probably not often enough to retrieve it from the server every time

@szabba

You'd have functions with signatures like `HttpCache.Config -> HttpCache.State a -> Request a -> Cmd a` or something close to that

You'll store the state in the "cache object".

With `Task.succeed` + `Task.perform` you'll be able to construct `Cmd`s that don't actually perform the requests.

The cache will have to keep track of time passing, you'll use subscriptions for that.

You will need to decide whether to look a response up or make the request.

You can either write it specialized to your use case (with the decision and response type hardcoded) or generalized (so you'd provide a config value telling when to use the cache).

## getString - helpfull source

https://github.com/elm-lang/http/blob/master/src/Http.elm#L132

```elm
getString : String -> Request String
getString url =
  request
    { method = "GET"
    , headers = []
    , url = url
    , body = emptyBody
    , expect = expectString
    , timeout = Nothing
    , withCredentials = False
    }
```

## readAsBinaryString

HTTP.getString resolves to javascript readAsText whereas what you need is something that resolves to readAsBinaryString.  This got lost when elm-lang/http replaced evancz/elm-http.

- https://github.com/elm-lang/http/issues/11
- https://groups.google.com/forum/#!msg/elm-discuss/6F6IzGyzHmo/mn0ZQc1wBgAJ
