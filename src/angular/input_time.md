In on of projects on IE when input made without colon, validation stopped working. So I needed to change it to `type="text"`. On Chrome you can even enter time without colon.

Input time isn't supported on IE https://developer.mozilla.org/pl/docs/Web/HTML/Element/Input.

> Input with time validation and transformation. In browsers that do not yet support the HTML5 time input, a text element will be used. In that case, the text must be entered in a valid ISO-8601 local time format (HH:mm:ss), for example: 14:57:00. Model must be a Date object. This binding will always output a Date object to the model of January 1, 1970, or local date new Date(1970, 0, 1, HH, mm, ss).
>
> The model must always be a Date object, otherwise Angular will throw an error. Invalid Date objects (dates whose getTime() is NaN) will be rendered as an empty string.
>
> The timezone to be used to read/write the Date instance in the model can be defined using ngModelOptions. By default, this is the timezone of the browser.
> -- https://docs.angularjs.org/api/ng/input/input%5Btime%5D
