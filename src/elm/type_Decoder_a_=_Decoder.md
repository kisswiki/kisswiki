`type Decoder a = Decoder`

>Ignore it. It’s an internal detail, “cheating” the Elm type system inside the core library, because the Decoder type is actually implemented in JavaScript. That strange definition inside Elm is just a placeholder to prevent the compiler from complaining.
>
>-- https://groups.google.com/forum/#!msg/elm-discuss/kfOabaehLNU/_jjm2jkEEwAJ
