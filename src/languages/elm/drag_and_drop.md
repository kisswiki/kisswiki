- http://elm-lang.org/examples/drag
- My Tangram program is built with Elm 0.17 and shows drag-and-drop with SVG shape http://fredcy.github.io/
- https://github.com/bevacqua/dragula
- https://github.com/ir4y/elm-dnd
- https://www.reddit.com/r/elm/comments/5d00mp/drag_and_drop_in_elm/
- https://www.reddit.com/r/elm/comments/55nmta/status_of_html5_dragdrop/
- https://www.reddit.com/r/elm/comments/4iu08j/on_0170_is_it_possible_to_detect_where_elements/
- https://github.com/hoelzro/elm-drag
- https://github.com/robertjlooby/elm-html5-drag-and-drop
- https://github.com/norpan/elm-html5-drag-drop
- https://discourse.elm-lang.org/t/drag-and-drop-with-web-components-custom-elements-instead-of-ports/1260
- https://discourse.elm-lang.org/t/grrrr-ondragover/1308/2
- drag and events [Ellie - Untitled](https://ellie-app.com/3nJ3z59nCdQa1)

## problem with fast dragging and dropping

When I add the following style attributes to the drag example, I can no longer reproduce the issue no matter how fast/sloppily I click:

```
,  "user-select" => "none"
, "-moz-user-select" => "none"
```

https://groups.google.com/forum/#!msg/elm-discuss/AMKmMRvTDLs/6fj54xJIAgAJ

## Firefox

@justgage I’m using Dragula.js with elm for drag and drop - I wrote a native wrapper for it. I find Dragula super easy to use. As far as I know there is no cross browser support for html drag and drop in Elm - given that Firefox works by way of the data transfer object which is not accessible in Elm currently

http://elmlang.slackarchive.io/general/page-100/ts-1489475715334327
