# Web components

- http://stackoverflow.com/questions/42671917/embedadable-code-editor-with-live-autocomplete-for-elm-like-code-mirror-ace-e
- https://www.reddit.com/r/elm/comments/5ls1jd/discussion_web_components_in_elm/

## Polymer

- https://github.com/edvail/elm-polymer
- https://github.com/ohanhi/polymer-in-elm
- https://github.com/quephird/polymer-with-elm
- https://www.polymer-project.org/1.0/docs/browsers
- https://en.wikipedia.org/wiki/Comparison_of_Material_Design_implementations
- https://groups.google.com/forum/#!topic/elm-discuss/8Q2xwRh6UYc
  - https://github.com/Polymer/vulcanize
  - https://gist.github.com/pdamoc/48c6f7dd2f7fec44bdd3262f269f635c
  - https://github.com/fredcy/elm-polymer-calendar
  - https://beta.webcomponents.org/element/PolymerElements/paper-listbox
  - https://aerotwist.com/blog/polymer-for-the-performance-obsessed/
  - very tiny example of how to use polymer element in Elm https://github.com/edvail/double-event-issue
  - https://github.com/kevinlebrun/elm-polymer
  - https://github.com/pdamoc/polymer-exploration
  - https://github.com/rupertlssmith/polymer-elm-listbox
  - "My view is that we don't need Polymer, just the web components standards."
  - https://customelements.io/
  - https://github.com/rupertlssmith/elm-polymer
  - a first pass at making a listbox component https://github.com/rupertlssmith/wood-polymer
  - https://github.com/rtfeldman/elm-google-maps

>I needed to add some global config to polymer like this:

```javascripot
<script src="bower_components/webcomponentsjs/webcomponents-lite.js"></script>
<script>
    window.Polymer = {
        dom: 'shadow',
        lazyRegister: true
    };
</script>
```

As described here https://www.polymer-project.org/1.0/docs/devguide/settings


## Browser support

- https://github.com/WebComponents/webcomponentsjs#browser-support
- document.importNode bug on firefox https://github.com/webcomponents/webcomponentsjs/issues/436
