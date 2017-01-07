- https://developer.mozilla.org/en-US/docs/Web/Events/input
- http://elm-lang.org/examples/field
- http://package.elm-lang.org/packages/abadi199/elm-input-extra/latest/

## Updating input fields without losing the cursor position

- https://groups.google.com/forum/#!topic/elm-discuss/I2JleY8bD7c
- http://stackoverflow.com/questions/14508707/updating-an-inputs-value-without-losing-cursor-position
- https://github.com/evancz/elm-html/pull/81#issuecomment-145676200
  - http://krisajenkins.github.io/elm-signup-form/
- "you do not add a value property on the input. Just let it do its own thing and track it internally. This means you cannot modify the field with value, but it should fix this issue" https://github.com/elm-lang/html/issues/62#issuecomment-234597348
