- This is a dictionary based off of core's Dict implementation, except it can support any type, rather than just comparables. A function must be given which will hash the key into a comparable. https://github.com/eeue56/elm-all-dict
- ordered https://github.com/danneu/elm-ordered-dict
- https://github.com/robertjlooby/elm-generic-dict

## case after get

`case Dict.get id model.displayables |> Maybe.map .view of`

https://groups.google.com/forum/#!msg/elm-discuss/Oq0yMxbpbdg/gUWmFea5AQAJ

## update

As an aside, if you don't care about adding or removing values and just want to update ones that are in fact present, you can use Maybe.map to lift a regular function `(v -> v)`:

```
> increment n = n + 1
<function> : number -> number
> d = Dict.singleton "foo" 99
Dict.fromList [("foo",99)] : Dict.Dict String number
> d |> Dict.update "foo" (Maybe.map increment)
Dict.fromList [("foo",100)] : Dict.Dict String number
> d |> Dict.update "bar" (Maybe.map increment)
Dict.fromList [("foo",99)] : Dict.Dict String number
```

https://www.reddit.com/r/elm/comments/6pew9r/dict_update/

###

https://elmlang.slackarchive.io/beginners/page-100/ts-1495049991573640

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

`Dict.insert key value dict = Dict.update key (\_ -> Just value) dict` :slightly_smiling_face: (edited)


new messages
[9:50] 
(and it's actually implemented that way, iirc)
