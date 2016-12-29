>Ports are extremely awkward for cases that require both a request and a response to that request.
>
>-- https://groups.google.com/d/msg/elm-discuss/Um7WIBTq9xU/UDzs_nhVEgAJ

<br>

>Using the standard ports system in Elm, calling into JavaScript requires that you generate a Cmd to run the JavaScript function, and then separately subscribe to a response as a Sub. This disconnect between the call and return of a function makes some difficulties. For instance, you can't be sure which port response Sub corresponds to which call you made with the port Cmd unless you pass back some id or the original args. Most limiting of all, you can't chain together external javascript functions as Tasks.
>
>-- https://github.com/mpdairy/elm-frontier
