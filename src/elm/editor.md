- https://www.reddit.com/r/elm/comments/3sbm3b/best_editor_ide_for_elm_development/
  - https://vimeo.com/132107269

## Vim

- https://github.com/ElmCast/elm-vim
- https://github.com/hoelzro/vim-elm-help
- https://github.com/ElmCast/.vim
- https://github.com/lambdatoast/elm.vim

## Light Table

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
