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
