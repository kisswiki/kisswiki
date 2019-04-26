## Does not detects nested rename of model

```elm
        MenuMsg msg_ ->
            case model_.component of
                Routable flags router (MenuComponent model) ->
                    Menu.update flags menuConfig router model_.store msg_ model
                        |> Tuple.mapFirst (Routable flags router << MenuComponent)
                        |> lift
```

## Configuration

elm-analyse.json

```json
{
    "checks" : {
        "MapNothingToNothing": false,
        "UnnecessaryListConcat": false
    },
    "TriggerWords" : {
        "words": []
    }
}
```

## Quick usage

in `~/.bashrc`

```bash
alias elm-an="elm-analyse | tee $HOME/elm-analyse.txt"
```

```bash
$ source ~/.bashrc`
$ elm-an
## -A 16 means show after 16 lines
$ rg "\- src/Mapdid/App/Account/" ~/elm-analyse.txt -A 16
```
