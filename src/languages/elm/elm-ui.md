- Problem with current elm compiler and elm-ui https://github.com/elm/compiler/pull/1850
- ["Building a Toolkit for Design" by Matthew Griffith - YouTube](https://www.youtube.com/watch?v=Ie-gqwSHQr0)
- https://mdgriffith.gitbooks.io/style-elements
- [elm-ui - rock paper scissors (lizard spock) - YouTube](https://www.youtube.com/watch?v=fhMLEOr8C4U)
- https://dev.to/stevensonmt/-working-with-menus-in-elm-ui-292b
- https://discourse.elm-lang.org/t/learning-elm-elm-ui
- https://korban.net/posts/elm/2019-11-17-elm-ui-introduction/
  - https://github.com/Chefclub/elm-ui-tutorial

## Examples

- https://github.com/kenhkan/mbta
- An experimental library for easier UI elements creation. Not for production use. https://github.com/QiTASC/hatchinq

## UI explorer like Storybook

- in Elm-0.18 http://package.elm-lang.org/packages/kalutheo/elm-ui-explorer/latest
  - https://www.reddit.com/r/elm/comments/7867xh/elm_ui_explorer_react_storybook_like_ui_explorer/

## Form

- https://github.com/mdgriffith/elm-ui/blob/master/examples/Form.elm
- https://discourse.elm-lang.org/t/learning-elm-elm-ui/2282
  - https://github.com/Hasimir0/myElmGuide/blob/master/form.elm
- https://discourse.elm-lang.org/t/input-select-not-available-in-elm-ui/2874/5

##

<pre>
sios [8:21 PM]
Quick question because I can’t find it in the docs, how do I do a `title="Some tooltip"`?
mgriffith [8:23 PM]
@sios `Element.htmlAttribute (Html.Attributes.title "some tooltip")` for now
</pre>

## Element.focused

```elm
Element.focused [ Element.Border.glow (Element.rgb 1 0 0) 2 ]
```

## problem with wrappedRow

https://github.com/mdgriffith/elm-ui/issues/57
