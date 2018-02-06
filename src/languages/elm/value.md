https://dev.to/rtfeldman/i-am-the-author-of-elm-in-action-ask-me-anything/comments

`value` doesn't Just Work the way it does in React. This is kind of inside baseball, but it can Just Work in React because `setState` updates synchronously, whereas Elm does `requestAnimationFrame` batching to improve performance. The alternative of `defaultValue` works fine for most use cases, but when it doesn't it's a big pain. I can conceive of a way to make `value` Just Work, but it would be a pretty invasive change for `elm-lang/virtual-dom`.
