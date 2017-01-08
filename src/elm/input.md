- https://developer.mozilla.org/en-US/docs/Web/Events/input
- http://elm-lang.org/examples/field
- http://package.elm-lang.org/packages/abadi199/elm-input-extra/latest/

## Updating input fields without losing the cursor position

- "Virtual DOM is a great foundation, but some DOM interactions - for example, setting and clearing focus - don't play well with Virtual DOM" https://groups.google.com/forum/#!msg/elm-dev/ThkWudq7SF0/yU3431UmCwAJ
- https://groups.google.com/forum/#!topic/elm-discuss/I2JleY8bD7c
- http://stackoverflow.com/questions/14508707/updating-an-inputs-value-without-losing-cursor-position/14508837#14508837
- https://github.com/evancz/elm-html/pull/81#issuecomment-145676200
  - http://krisajenkins.github.io/elm-signup-form/
- "you do not add a value property on the input. Just let it do its own thing and track it internally. This means you cannot modify the field with value, but it should fix this issue" https://github.com/elm-lang/html/issues/62#issuecomment-234597348
- Fix race condition in textfields https://github.com/debois/elm-mdl/issues/161
- https://gist.github.com/rtfeldman/5f015adbdfbba541c7e7e1409b6efeef#gistcomment-1831492
- https://gist.github.com/rtfeldman/5f015adbdfbba541c7e7e1409b6efeef#gistcomment-1832260

>Our production experience with value has been that it's irreparably broken. It has such nasty and unfixable race condition problems, our best practice has become to never use it and instead only to ever use defaultValue.
>
>I later talked about it with a bunch of people and concluded that defaultValue was the least bad alternative that actually solved the problem
>
>In my experience (limited to the single browser engine) issue is not actually related to the race conditions and specifically blamed animation frames. But rather issue is related to imperfect modeling of the state and than unintentional mutation of DOM state. More specifically most of the code I've seen dealing with input fields does not model selection range and by consequence cursor position. It may not be apparent but when you do not model selection what you end up doing is actually modeling selection as being empty at the end of the input.value. So every time input.value is set selection state get's mutated and in a way that messes up input. In my experience tracking selection and modeling it in the state and then updating selection along with value resolved all the issues that seemed like race conditions. Better yet unlike react we kept animation frame based render loop which is not the issue. If your model state matches actual DOM state then later delayed DOM patches are NoOp and there for don't interfere with input value changes at all. I am happy to share more details in a different thread if there is an interest.
>
>-- https://gist.github.com/rtfeldman/5f015adbdfbba541c7e7e1409b6efeef

<br>

>I believe the problem observed in the examples is with a selection instead as when you modify the input.value it changes input.selectionStart and input.selectionEnd to the end of the value. So what you you observe is when you change cursor position your model and actual DOM state gets out of sync as a side effect of actually not keeping track of selection ranges.
>
>In the project I work we resolved similar issues with input.value by starting to model selection in the input along with value. That way when you update a value you also update cursor position back to it's original and there for avoid getting out of sync with actual DOM. Please note that there are many crucial details on when to update selection and not to update it when it already matches the selection in the input to avoid other races, but given the interest I'm happy to share more details.
>
>-- https://github.com/evancz/elm-html/pull/81#issuecomment-236994878
