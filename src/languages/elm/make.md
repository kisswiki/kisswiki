## Clean

> Clean Build Artifacts - You can delete your elm-stuff/build-artifacts
> -- https://github.com/sbrink/vscode-elm

## Map.!: given key is not an element in the map

>Deleting elm-stuff and rebuilding worked for me

https://github.com/elm-lang/elm-make/issues/133

## not enough bytes

```
(
  flock -e 200
  elm $@
) 200>/tmp/elm.lockfile
```

https://discourse.elm-lang.org/t/working-around-not-enough-bytes-problems/3359/3
