- https://stackoverflow.com/questions/32553158/detect-click-outside-react-component
- https://stackoverflow.com/questions/44142273/react-ul-with-onblur-event-is-preventing-onclick-from-firing-on-li

A click event is one mousedown followed by one mouseup, without leaving or changing the element.

If the element moves before the mouseup, or you put something over the button before the mouseup, or the mouse moves before the mouseup, or you manually reset input.focus() before the mouseup, or...

...anything else...

Then there's no click.

https://stackoverflow.com/questions/35784671/why-does-a-react-components-onclick-event-handler-not-fire-when-the-display-a