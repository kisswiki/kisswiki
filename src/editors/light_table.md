- https://gitter.im/LightTable/LightTable
- https://github.com/LightTable/LightTable/wiki/FAQ
- https://github.com/rundis/LightTable-settings
- https://github.com/rundis/lt-user-plugin
- http://stackoverflow.com/questions/tagged/lighttable?sort=votes
- http://stackoverflow.com/questions/21056982/how-do-i-set-vim-mode-in-light-table

## Errors

- Got error `ENOENT: no such file or directory,  LightTable\ltcache\default.clj` on first run, no error on subsequent https://github.com/LightTable/LightTable/issues/2150

## Automate

My workflow is this:

1. elm-live
2. add new tabset
3. open browser in new set
4. open http://localhost:8000

How can I automate it?

rundis: The "simplest" way to automate that would be to add a command to your user plugin (ref http://docs.lighttable.com/#user-plugin). We are currently in the process of revamping the docs, so currently it might be as easy as one would like. Especially if you are new to ClojureScript and/or Light Table.

- https://github.com/priyatam/lighttable-plugin-guide
- http://codewader.blogspot.com/2014/02/getting-my-feet-wet-with-clojure-using.html

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
