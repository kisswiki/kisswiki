- https://gitter.im/LightTable/LightTable
- https://github.com/LightTable/LightTable/wiki/FAQ
- https://github.com/rundis/LightTable-settings
- https://github.com/rundis/lt-user-plugin
- http://stackoverflow.com/questions/tagged/lighttable?sort=votes
- http://stackoverflow.com/questions/21056982/how-do-i-set-vim-mode-in-light-table
- http://stackoverflow.com/questions/22168195/i-cant-find-a-light-table-cheat-sheet
- http://stackoverflow.com/questions/27818505/light-table-parentheses-are-not-auto-closing
- http://stackoverflow.com/questions/25534216/lighttable-set-font-size
- http://stackoverflow.com/questions/28483220/how-to-enable-tag-auto-closing-in-lighttable

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
- http://stackoverflow.com/questions/39588328/how-can-i-install-elm-light-on-windows/39626600#39626600

### Keymaps

`ctrl+space` > user keymap

```clojure
[
 ;; ...
 ;; Autoconnect AST for elm-light
 [:editor.elm "ctrl-s" :save :elm-format :elm.lint]
 ;; Other keymaps
 [:editor "ctrl-e" :editor.linter.details]
 [:editor "ctrl-down" :editor.sublime.duplicateLine]
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

## Disable welcome tab

user.behaviors

```clojure
[:app :-lt.objs.intro/show-intro]
```

## Open workscpae on startup

user.behaviors

```clojure
[:app :lt.objs.sidebar.workspace/workspace.open-on-start]
```

https://groups.google.com/forum/#!topic/light-table-discussion/5yGZmGpV1i4

## Font

user.behaviors

```clojure
[:app :lt.objs.style/font-settings "Roboto Mono Light" "14"]
[:app :lt.objs.style/font-settings "Consolas" "14"]
[:app :lt.objs.style/font-settings "SF Mono" "14"]
```

## Font antialiasing

> This used to be possible through the -webkit-font-smoothing: none or antialiased properties in CSS, but this property was last I heard removed by chrome upstream. There was an effort to standardize a font-smooth property in CSS3, but it was removed from the draft. Unfortunately, I don't believe there's an answer that LT can provide you at this point in time.
> -- https://github.com/LightTable/LightTable/issues/1084#issuecomment-36193623

## Open terminal in current dir

user.keymap

```clojure
[:app "ctrl-`" :lt.plugins.opener/open-terminal-in-active-dir]
```

## Themes

http://worldofgnome.org/changing-themes-in-light-table/
