- State of CSS in Elm https://groups.google.com/forum/#!topic/elm-discuss/AC6cqdeKDOs
- https://github.com/rtfeldman/elm-css
  - define custome property in elm-css http://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Css#property
- https://github.com/rtfeldman/elm-css-helpers
- http://package.elm-lang.org/packages/mdgriffith/style-elements/ has pretty much "solved" CSS, in the same way that Elm solved JavaScript.
  - https://groups.google.com/forum/#!msg/elm-discuss/D7mu7NqHPuA/n4p_ohaJAwAJ

## elm-css

### Example

sabine:

```elm
styles =
    Css.asPairs >> Html.Attributes.style

button [ styles [ position absolute, left (px 5) ] ]
    [ text "Whee!" ]
```

https://elmlang.slack.com/archives/general/p1484139837013133

## default attribute

https://elmlang.slack.com/archives/general/p1484308450013948

@folkertdev:

is there a standard name/constructor for a "has a default"  (if not, any suggestions?)

something like `type HasDefault a = UseDefault | Use a`  (where the default is known/calculated later)

i'm working on some svg stuff, where not specifying an attribute will use the (svg spec's) default

@ohanhi:

So @folkertdev, what are you trying to communicate with "has a default"? How does it differ from `Maybe.withDefault` in semantics?

@folkertdev:
 
so I want to communicate "you can set this value, but if you dont the default will be used"

well with how elm-css and elm-html's style work, omitting a value will use the browser default

but I'm working on svg filter helpers, where I have a record of attributes specific to a filter for safety

and the default is a function of another argument, not just a value

for instance, https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/targetX  depends on the `order` attribute, which in turn should depend (but doesn't in svg) on the `kernelMatrix` attribute

strictly for cases where the default is not a value, but some function of the arguments

the alternate option is to actually put the default, as a function, into my records

@sabine:

using functions as part of your `Model` is usually not a good idea, so sounds like what you're doing is good.

@folkertdev:

yea that's my motivation here (even though svg filters should live in the view, not in the model)

## hover

https://elmlang.slack.com/archives/general/p1484185181013557

montanonic: what is the Elm solution to something like on-hover effects? Should we stick to CSS hover or handle that animation within the update loop?

rtfeldman: personally I just use CSS if I can; it's generally the highest-performance way to do it, and I haven't really found any maintainability downsides

## External CSS

- https://github.com/tomekwi/elm-live
- https://github.com/elm-lang/elm-reactor/issues/138#issuecomment-240940888

## flex-flow shorthand doesn't work

https://elmlang.slack.com/archives/general/p1484250961013787

@chet.harrison:

How do you do multiple attr values in an Elm style function ie ...

```elm
style
            [ ( "display", "flex" )
            , ( "flex-flow", "row wrap" )
            ]
```

the "row wrap" does not appear to be effective

@ohanhi:

I think you need to say `flex-direction: row` and `flex-wrap: wrap` separately,no?

## classes

https://elmlang.slack.com/archives/general/p1484595150015300

coreyhaines:

```elm
classes : List String -> Html.Attribute msg
classes =
    String.join " " >> Html.Attributes.class
```

## classes bool

```elm
module Main exposing (main)

import Html exposing (Html, text)
import String exposing (join)

tupleToMaybe : (String, Bool) -> Maybe String
tupleToMaybe (string, bool) =
    if bool then
        Just string
    else
        Nothing
              
classes : List (String, Bool) -> String
classes list =
    list |> List.filterMap tupleToMaybe |> join " "
                
                            
msg = { seen = True }
mailbox = { selected = Just msg }

viewHeader mailbox msg =
    classes
        [ ("mailbox-entry", True)
        , ("selected", mailbox.selected == Just msg)
        , ("unseen", msg.seen)
        ]



main : Html msg
main =
    text <| viewHeader mailbox msg
```

James Hillyerd

https://ellie-app.com/ccrRxjPd3a1/0