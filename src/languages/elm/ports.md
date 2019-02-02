- http://stackoverflow.com/documentation/elm/2200/ports-js-interop
- http://stackoverflow.com/questions/37999504/how-to-pass-union-types-through-elm-ports
- example http://stackoverflow.com/questions/40929154/cmd-to-simply-go-to-a-new-webpage-in-elm/41511220#41511220
- Request: RPC over ports. t's really easy to send or receive messages to JavaScript via ports. But if you need to make a roundtrip to JavaScript, your life suddenly gets much harder since there is no request/response mechanism. https://groups.google.com/forum/#!msg/elm-dev/kNKilHjUYqo/3mTObqyGAgAJ
- https://www.reddit.com/r/elm/comments/7fx856/seeking_problems_with_ports/
- Elm Town 13 - History of Ports | Elm Town https://www.elmtown.audio/b06499a6
- https://gist.github.com/evancz/e69723b23958e69b63d5b5502b0edf90
  - https://gist.github.com/groteck/e4cc180ac182436f31f1d709466df768
- ellie.md
- generating ports from typescript code https://discourse.elm-lang.org/t/generating-type-safe-ports-from-custom-types/1841

## About

>Ports are extremely awkward for cases that require both a request and a response to that request.
>
>-- https://groups.google.com/d/msg/elm-discuss/Um7WIBTq9xU/UDzs_nhVEgAJ

<br>

>Using the standard ports system in Elm, calling into JavaScript requires that you generate a Cmd to run the JavaScript function, and then separately subscribe to a response as a Sub. This disconnect between the call and return of a function makes some difficulties. For instance, you can't be sure which port response Sub corresponds to which call you made with the port Cmd unless you pass back some id or the original args. Most limiting of all, you can't chain together external javascript functions as Tasks.
>
>-- https://github.com/mpdairy/elm-frontier

##

I have a blog post in the works explaining exactly that - keep ports small and keep the processing of things in the JS side. That's how people who are using Elm for logic (e.g within a larger react application) should be doing things, because they end up frustrated making a million ports - when they should be just making one for data going out, then subscribe to data coming in.

The idea is that you'd write an "interpreter" in JS and have it communicate with Elm via higher-level structured data (This may require using Json.Encode to make things flexible enough on each side. Not ideal, but probably better than tons of ports!)

https://gist.github.com/alpacaaa/13335246234042395813d97af029b10f

##

Maybe so but for something like a datetime manipulation library, ports are not a good fit, because they are not executed in the same event loop tick.

Suggesting to use Ports interop for Moment.js is like suggesting wrapping the same library in promises — this is bound to add a ton of accidental complexity.

https://www.reddit.com/r/elm/comments/7vnikt/i_have_a_proble_porting_a_js_library_to_elm/dttu2g8/

## Examples

- https://github.com/bryanjenningz/25-elm-examples/blob/44f24de1ed02102449d5ae38605815b11539c718/22-localstorage-editable-todos.elm#L208
- https://github.com/halfzebra/elm-examples/tree/master/examples/ports
- https://github.com/clarkware/elm-ports-example
  - https://twitter.com/clarkware/status/830524521262235649
