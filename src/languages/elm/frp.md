Stepen Blackheath felt compelled to make a statement to Elm dropping FRP: http://sodium.nz/t/my-comment-on-elm-dropping-frp/69

one of the two integral parts of FRP is to be "temporal continuous". To achieve this, you need a notion of "values of time". Elm used to have Signals that denoted exactly that (before 0.17). Other FRP systems distinguish between "Cells" and "Streams", which where kind of merged together to Signals in Elm.
Anyway, without having Signals/Streams, i.e. "values over time", you cannot say that Elm has FRP baked in anymore. TEA separates data and logic completely. You have a model, and the Elm runtime allows you to operate (update) and transform (view) it to a representation that can be rendered by a browser.

https://groups.google.com/forum/#!msg/elm-discuss/Mpd5ODg2gss/Y-HgGucpFwAJ
