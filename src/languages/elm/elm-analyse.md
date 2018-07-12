## Does not detects nested rename of model

```elm
        MenuMsg msg_ ->
            case model_.component of
                Routable flags router (MenuComponent model) ->
                    Menu.update flags menuConfig router model_.store msg_ model
                        |> Tuple.mapFirst (Routable flags router << MenuComponent)
                        |> lift
```
