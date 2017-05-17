- This is a dictionary based off of core's Dict implementation, except it can support any type, rather than just comparables. A function must be given which will hash the key into a comparable. https://github.com/eeue56/elm-all-dict
- ordered https://github.com/danneu/elm-ordered-dict
- https://github.com/robertjlooby/elm-generic-dict

## case after get

`case Dict.get id model.displayables |> Maybe.map .view of`

https://groups.google.com/forum/#!msg/elm-discuss/Oq0yMxbpbdg/gUWmFea5AQAJ

## update

nwjlyons [9:39 PM]

Hi, I'm confused about

```Dict.update
    :  comparable
    -> (Maybe v -> Maybe v)
    -> Dict comparable v
    -> Dict comparable v```

Why is the second argument a function?

joelq [9:42 PM]

So you get access to the old value

[9:42]

if you just want to replace the old value, you can use `Dict.insert`

nwjlyons

[9:43 PM]

ah ha. starting to make sense

[9:43]

thanks

ilias [9:49 PM]

note of interest: `Dict.insert key value dict = Dict.update key (always value) dict` :slightly_smiling_face:

https://elmlang.slackarchive.io/beginners/page-100/ts-1495049991573640
