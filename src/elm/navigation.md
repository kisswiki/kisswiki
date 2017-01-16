- https://github.com/sporto/hop
- https://chriswellswood.github.io/#blog/elm-static-site-p1
- https://groups.google.com/forum/#!topic/elm-discuss/yYYNzUao9aw

## elm-lang/navigation

- https://github.com/rofrol/elm-navigation-example
- https://github.com/sircharleswatson/elm-navigation-example
- https://www.elm-tutorial.org/en/07-routing/cover.html
- http://elmseeds.thaterikperson.com/navigation

>There are now 2 different update functions, one that deals with regular messages and one that deals with "Navigation" messages, there is a worry if at some point this might cause duplication in functionality.
>
>-- https://groups.google.com/d/msg/elm-discuss/GqYFPIv-Quc/nZzA-bolAAAJ


## evancz/url-parser

- http://elmseeds.thaterikperson.com/url-parser

```elm
matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map PlayersRoute top
        , map PlayerRoute (s "players" </> string)
        , map PlayersRoute (s "players")
        ]
```

- One for the top route which will resolve to PlayersRoute
- One for /players which will resolve to PlayersRoute as well
- And one for /players/id which will resolve to PlayerRoute id

Note that the order is important!

https://www.elm-tutorial.org/en/07-routing/02-routing.html

## query string

- http://package.elm-lang.org/packages/evancz/url-parser/latest/UrlParser#<?>
- http://package.elm-lang.org/packages/Bogdanp/elm-querystring

## check if something is a specific route, but now one of routes has a param, and the syntax `_` is not allowed

https://elmlang.slack.com/archives/general/p1484514187014883

@amilner42:

I wanna check if something is a specific route, but now one of my routes has a param, and the syntax `_` is not allowed

```elm
    List.member shared.route
        [ Route.HomeComponentCreate
        , Route.HomeComponentCreateBasicName
        , Route.HomeComponentCreateBasicDescription
        , Route.HomeComponentCreateBasicTidbitFrame _
        ]
```

And you can't group `cases` together in a `case of` so if I switch it to a `case of` which it seems I havee to do then I get very repetitive branches.

@megapctr:

what if you first checked the static routes via `List.member`

@amilner42:

Oh I can nest the `List.member` in the `_ ->`

```elm
case route of
    Route.HomeComponentCreateBasicTidbitFrame _ -> ...
case _ ->
    List.member shared.route
        [ Route.HomeComponentCreate
        , Route.HomeComponentCreateBasicName
        , Route.HomeComponentCreateBasicDescription
        ]
```

@winvelt:

```elm
if List.member sharedRoute [ .. staticroutes ] then
    doStuff
else
    case sharedRoute of
        Route.SomeRoute parameter ->
              doStuff

        _ ->
             otherStuff
```

## With Electron

If you're writing an Electron application you will very likely be writing a Single Page App. Our first intuition was to bring in a push state router with and . This was a mistake.

https://www.reddit.com/r/elm/comments/5o5p63/experiences_with_elm_on_a_small_production/
