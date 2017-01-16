- https://github.com/mpizenberg/elm_api_test

## headers

https://elmlang.slack.com/archives/general/p1484372683014355

@iteloo:

I’d like to append a header to an `Http.Request`, but it’s an opaque type (the record structure is hidden in the module internals) :disappointed:


I would use a request builder https://github.com/lukewestby/elm-http-builder  but my request objects are auto-generated using server-side Haskell types, so it’s hard to change them. I want to append an jwt token before they are actually sent to the server.

@rofrol:

>Once the token is available, you can use it with the GET replacement function provided in the library, Jwt.get, which creates a custom GET request that attaches the token to the Http headers before sending

http://simonh1000.github.io/2016/05/phoenix-elm-json-web-tokens/
