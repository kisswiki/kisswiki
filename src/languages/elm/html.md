- can't take List (Html Action) https://github.com/elm-lang/html/issues/84
- offsetTop, boundingClientRect etc. https://github.com/mpizenberg/elm-image-annotation

## unregister event

https://elmlang.slack.com/archives/general/p1484525820015002

@aion:

it is possible to unregister an event in elm? we register one with onClick for example - but can we remove it form the element at some latter point in time?

@opsb:

You would just change the output of your view function to not include the onClick. The vdom will take care of unregistering it.

## conditional attributes

https://elmlang.slack.com/archives/general/p1484556438015075

@opsb:

```elm
conditionalAttributes : List ( Attribute msg, Bool ) -> List (Attribute msg)
conditionalAttributes =
    List.filter Tuple.second >> List.map Tuple.first


view model =
    let
        attributes =
            conditionalAttributes
                [ ( onClick GoHome, model.flag )
                , ( onMouseOver HoverHome, True )
                , ( onMouseOut UnHoverHome, True )
                ]
    in
        a attributes [ text "Home" ]
```

## in Html you can have only 1 listener per event per element

https://elmlang.slack.com/archives/general/p1484565907015111

@wintvelt:

AFAIK in elm and in Html you can have only 1 listener per event per element, so 1 for mousedown, 1 for touchstart etc.

What I do to make elm play nice with touch, is to use the same Msg constructor, like `MoveStart`, to have both events handled in the same branch of my update tree.

## append with List.singleton

```elm
text "something"
|> List.singleton
|> div []
```

https://stackoverflow.com/questions/45598512/append-maybe-to-list-in-elm