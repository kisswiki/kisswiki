- https://gitter.im/LightTable/LightTable
- https://github.com/rundis/LightTable-settings
- https://github.com/rundis/lt-user-plugin
- Got error `ENOENT: no such file or directory,  LightTable\ltcache\default.clj` on first run, no error on subsequent https://github.com/LightTable/LightTable/issues/2150


## Elm

- https://rundis.gitbooks.io/elm-light-guide/content/reference.html
- Elm Light V0.4 https://youtu.be/pmMhCRvU9R0

### Autoconnect AST for elm-light

`ctrl+space` > user keymap

```clojure
[
 ;; ...
 [:editor.elm "ctrl-s" :save :elm-format :elm.lint]
 [:app "ctrl-shift-b" :add-browser-tab]
]
```

### Autoadd brackets for elm-light so that AST doesn't have errors

`ctrl+space` > user behaviors

```clojure
[
  ;;...
  ;; Auto-close characters e.g. '{[("'
  [:editor :lt.objs.editor/autoclose-brackets]
]
```
